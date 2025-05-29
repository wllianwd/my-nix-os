{ ... }:

{
  programs.zed-editor = {
    enable = true;
    userSettings = {
      features = {
        copilot = false;
      };
      telemetry = {
        metrics = false;
      };
      inlay_hints = {
        enabled = false;
      };
      vim_mode = true;
      lsp = {
        nixd = {
          settings = {
            diagnostic = {
              suppress = [ "sema-extra-with" ];
            };
          };
          initialization_options = {
            formatting = {
              command = [
                "nixfmt"
                "--quiet"
                "--"
              ];
            };
          };
        };
        nil = {
          settings = {
            diagnostic = {
              ignored = [ "unused_binding" ];
            };
          };
          initialization_options = {
            formatting = {
              command = [
                "nixfmt"
                "--quiet"
                "--"
              ];
            };
          };
        };
      };
    };
    extensions = [
      "nix"
      "tmux"
      "lua"
      "http"
    ];
  };
}
