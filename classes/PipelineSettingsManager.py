
from SettingsManager import SettingsManager


class PipelineSettingsManager(SettingsManager):

    """ This class is a wrapper arround SettingsManager and
    stores the settings (and their defaults) used by RenderPipeline. """

    def __init__(self):
        """ Constructs a new PipelineSettingsManager. Remember to call
        loadFromFile to load actual settings instead of the defaults. """
        SettingsManager.__init__(self, "PipelineSettings")

    def _addDefaultSettings(self):
        """ Internal method which populates the settings array with defaults
        and the internal type of settings (like int, bool, ...) """
        # [Antialiasing]
        self._addSetting("antialiasingTechnique", str, "SMAA")
        self._addSetting("smaaQuality", str, "Low")

        # [Lighting]
        self._addSetting("computePatchSizeX", int, 32)
        self._addSetting("computePatchSizeY", int, 32)
        self._addSetting("minMaxDepthAccuracy", int, 3)
        self._addSetting("useSimpleLighting", bool, False)
        self._addSetting("anyLightBoundCheck", bool, True)
        self._addSetting("accurateLightBoundCheck", bool, True)

        # [SSDO]
        self._addSetting("ssdoEnabled", bool, 16)
        self._addSetting("ssdoSampleCount", int, 16)
        self._addSetting("ssdoRadius", float, 1.0)
        self._addSetting("ssdoMaxDistance", float, 5.0)
        self._addSetting("ssdoMaxAngle", float, 0.7)
        self._addSetting("ssdoStrength", float, 1.0)
        self._addSetting("ssdoOnly", bool, False)

        # [Shadows]
        self._addSetting("renderShadows", bool, True)
        self._addSetting("shadowAtlasSize", int, 8192)
        self._addSetting("maxShadowUpdatesPerFrame", int, 2)
        self._addSetting("numShadowSamples", int, 8)
        self._addSetting("useHardwarePCF", bool, False)

        # [Motion blur]
        self._addSetting("motionBlurEnabled", bool, True)
        self._addSetting("motionBlurSamples", int, 8)
        self._addSetting("motionBlurFactor", float, 1.0)

        # [Debugging]
        self._addSetting("displayShadowAtlas", bool, True)
        self._addSetting("displayDebugStats", bool, True)

