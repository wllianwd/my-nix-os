{ pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      #theme = "catppuccin-mocha";
      term = "xterm-256color";
      background = "#1e1e2e";
      foreground = "#cdd6f4";
      "shell-integration" = "zsh";
      "clipboard-read" = "allow";
      "clipboard-write" = "allow";
      "copy-on-select" = false;
      #"window-theme" = "system";
      #"window-padding-x" = 20;
      #"window-padding-y" = 20;
      #"window-padding-balance" = true;
      "background-opacity" = 0.9;
      "background-blur-radius" = 20;
      "selection-background" = "#585b70";
      "selection-foreground" = "#cdd6f4";
      "cursor-color" = "#f5e0dc";
      "cursor-text" = "#cdd6f4";
      "cursor-invert-fg-bg" = true;
      "cursor-style" = "bar";
      "cursor-style-blink" = true;
      palette = [
        "0=#45475a"
        "1=#f38ba8"
        "2=#a6e3a1"
        "3=#f9e2af"
        "4=#89b4fa"
        "5=#f5c2e7"
        "6=#94e2d5"
        "7=#bac2de"
        "8=#585b70"
        "9=#f38ba8"
        "10=#a6e3a1"
        "11=#f9e2af"
        "12=#89b4fa"
        "13=#f5c2e7"
        "14=#94e2d5"
        "15=#a6adc8"
      ];
      "font-size" = 12;
      "font-family" = "JetBrainsMono Nerd Font";
      "mouse-hide-while-typing" = true;
      "focus-follows-mouse" = true;
      #"macos-titlebar-style" = "hidden";
      #"macos-icon" = "xray";
    };
  };

}
