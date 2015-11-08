#version 400

#pragma include "Includes/Configuration.inc.glsl"
#pragma include "Includes/GBufferPacking.inc.glsl"
#pragma include "Includes/BRDF.inc.glsl"
#pragma include "Includes/Lights.inc.glsl"

in vec2 texcoord;
uniform sampler2D ShadedScene;
uniform sampler2D GBufferDepth;
uniform sampler2D GBuffer0;
uniform sampler2D GBuffer1;
uniform sampler2D GBuffer2;

uniform samplerCube DefaultEnvmap;
uniform vec3 cameraPosition;

#if HAVE_PLUGIN(Scattering)
    uniform samplerCube ScatteringCubemap;
#endif

out vec4 result;

float get_mipmap_for_roughness(samplerCube map, float roughness) {
    int cubemap_size = textureSize(map, 0).x;
    float num_mipmaps = 1 + floor(log2(cubemap_size));


    float reflectivity = saturate(1.0 - roughness);

    // Increase mipmap at extreme roughness, linear doesn't work well there
    // reflectivity += saturate(reflectivity - 0.9) * 2.0;

    return (num_mipmaps - reflectivity * 9.0);
}



void main() {
    Material m = unpack_material(GBufferDepth, GBuffer0, GBuffer1, GBuffer2);

    vec3 view_vector = normalize(m.position - cameraPosition);
    vec4 ambient = vec4(0);

    if (!is_skybox(m, cameraPosition)) {
        float conv_roughness = ConvertRoughness(m.roughness);

        vec3 reflected_dir = reflect(view_vector, m.normal);
        vec3 env_coord = fix_cubemap_coord(reflected_dir);


        vec3 h = -normalize(reflected_dir - view_vector);
        // vec3 h = m.normal;

        float LxH = saturate(dot(view_vector, h));
        float NxL = max(0, dot(m.normal, reflected_dir));
        float NxV = abs(dot(m.normal, view_vector));


        float mipmap_bias = saturate(pow(1.0 - NxV, 5.0)) * 3.0;
        mipmap_bias = 0.0;

        float env_mipmap = get_mipmap_for_roughness(DefaultEnvmap, m.roughness) + mipmap_bias;

        vec3 env_default_color = textureLod(DefaultEnvmap, env_coord, env_mipmap).xyz;
        vec3 env_amb = vec3(0);

        #if HAVE_PLUGIN(Scattering)

            vec3 scat_coord = reflected_dir;
            float scat_mipmap = get_mipmap_for_roughness(ScatteringCubemap, m.roughness) + mipmap_bias;
            vec3 env_scattering_color = textureLod(ScatteringCubemap, scat_coord, scat_mipmap).xyz;

            env_default_color = env_scattering_color * M_PI;

            // Cheap irradiance
            env_amb = textureLod(ScatteringCubemap, m.normal, 6).xyz;


        #endif

        // Different terms for metallic and diffuse objects
        vec3 env_metallic = m.diffuse;
        env_metallic *= 0.3 + pow(LxH, 1.0) * 0.7;

        vec3 env_diffuse = saturate( saturate(pow(1.0 - LxH , 5.0 )) 
                           * (1.0 - m.roughness)) * vec3(0.2);

        vec3 env_factor = mix(env_diffuse, env_metallic, m.metallic) * m.specular;

        vec3 diffuse_ambient = vec3(0.02) * m.diffuse * (1.0 - m.metallic);
        vec3 specular_ambient = env_factor * env_default_color * 0.8;

        ambient.xyz += diffuse_ambient + specular_ambient;
        ambient.xyz += env_amb * 0.15 * m.diffuse * (1.0 - m.metallic);

        // ambient.xyz = vec3( pow(1.0 - NxV, 10.0) );

    }
    
    result = texture(ShadedScene, texcoord) * 1 +  ambient * 1;
}