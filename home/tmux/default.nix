{ pkgs, ... }:
let
  tmux-super-fingers = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-super-fingers";
    version = "413fb361a4f04fde818ca32491667a596c56b925";
    src = pkgs.fetchFromGitHub {
      owner = "artemave";
      repo = "tmux_super_fingers";
      rev = "413fb361a4f04fde818ca32491667a596c56b925";
      sha256 = "sha256-GNW0bnSF+kr3ZKUA+FVhpyRCquN7yEIb4Suc3F6Axvs=";
    };
  };
in
{
  programs.tmux = {
    enable = true;
    #keyMode = "vi";
    newSession = false;
    prefix = "C-Space";
    plugins = with pkgs; [
      {
        plugin = tmux-super-fingers;
        extraConfig = "set -g @super-fingers-key f";
      }
      tmuxPlugins.better-mouse-mode
    ];
    mouse = true;
    extraConfig = ''
      # used for less common options, intelligently combines if defined in multiple places.
    '';
  };

}
