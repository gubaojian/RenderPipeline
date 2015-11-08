#pragma once



vec2 poisson_disk_2D_16[16] = vec2[](
    vec2( -0.195090322016 , -0.980785280403 ),
    vec2( 0.55557023302 , 0.831469612303 ),
    vec2( -0.831469612303 , -0.55557023302 ),
    vec2( 0.980785280403 , 0.195090322016 ),
    vec2( -0.980785280403 , 0.195090322016 ),
    vec2( 0.831469612303 , -0.55557023302 ),
    vec2( -0.55557023302 , 0.831469612303 ),
    vec2( 0.195090322016 , -0.980785280403 ),
    vec2( 0.195090322016 , 0.980785280403 ),
    vec2( -0.55557023302 , -0.831469612303 ),
    vec2( 0.831469612303 , 0.55557023302 ),
    vec2( -0.980785280403 , -0.195090322016 ),
    vec2( 0.980785280403 , -0.195090322016 ),
    vec2( -0.831469612303 , 0.55557023302 ),
    vec2( 0.55557023302 , -0.831469612303 ),
    vec2( -0.195090322016 , 0.980785280403 )
);


vec2 poisson_disk_2D_32[32] = vec2[](
    vec2( -0.634393284164 , 0.773010453363 ),
    vec2( 0.881921264348 , 0.471396736826 ),
    vec2( 0.290284677254 , -0.956940335732 ),
    vec2( -0.995184726672 , -0.0980171403296 ),
    vec2( 0.0980171403296 , 0.995184726672 ),
    vec2( 0.956940335732 , -0.290284677254 ),
    vec2( -0.471396736826 , -0.881921264348 ),
    vec2( -0.773010453363 , 0.634393284164 ),
    vec2( 0.773010453363 , 0.634393284164 ),
    vec2( 0.471396736826 , -0.881921264348 ),
    vec2( -0.956940335732 , -0.290284677254 ),
    vec2( -0.0980171403296 , 0.995184726672 ),
    vec2( 0.995184726672 , -0.0980171403296 ),
    vec2( -0.290284677254 , -0.956940335732 ),
    vec2( -0.881921264348 , 0.471396736826 ),
    vec2( 0.634393284164 , 0.773010453363 ),
    vec2( 0.634393284164 , -0.773010453363 ),
    vec2( -0.881921264348 , -0.471396736826 ),
    vec2( -0.290284677254 , 0.956940335732 ),
    vec2( 0.995184726672 , 0.0980171403296 ),
    vec2( -0.0980171403296 , -0.995184726672 ),
    vec2( -0.956940335732 , 0.290284677254 ),
    vec2( 0.471396736826 , 0.881921264348 ),
    vec2( 0.773010453363 , -0.634393284164 ),
    vec2( -0.773010453363 , -0.634393284164 ),
    vec2( -0.471396736826 , 0.881921264348 ),
    vec2( 0.956940335732 , 0.290284677254 ),
    vec2( 0.0980171403296 , -0.995184726672 ),
    vec2( -0.995184726672 , 0.0980171403296 ),
    vec2( 0.290284677254 , 0.956940335732 ),
    vec2( 0.881921264348 , -0.471396736826 ),
    vec2( -0.634393284164 , -0.773010453363 )
);