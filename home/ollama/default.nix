{ ... }:

{
  services.ollama = {
    enable = true;
    host = "0.0.0.0";
    port = 11434;
    #package = pkgs.ollama-rocm;
    #rocmOverrideGfx = "10.3.0";
    acceleration = "rocm";
    environmentVariables = {
      #ROC_ENABLE_PRE_VEGA = "1";
      HSA_OVERRIDE_GFX_VERSION = "10.3.0";
      OLLAMA_KEEP_ALIVE = "5m";
      OLLAMA_CONTEXT_LENGTH = "32768";
    };
  };
}
