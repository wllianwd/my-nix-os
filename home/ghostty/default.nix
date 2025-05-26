{ ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      term = "xterm-256color";
      background = "#1e1e2e";
      foreground = "#cdd6f4";
      "shell-integration" = "zsh";
      "clipboard-read" = "allow";
      "clipboard-write" = "allow";
      "copy-on-select" = false;
      "window-padding-x" = 10;
      "window-padding-y" = 10;
      "window-padding-balance" = true;
      "background-opacity" = 0.9;
      "background-blur-radius" = 20;
      "cursor-invert-fg-bg" = true;
      "cursor-style" = "bar";
      "cursor-style-blink" = true;
      #"font-size" = 12;
      #"font-family" = "JetBrainsMono Nerd Font";
      "mouse-hide-while-typing" = true;
      "focus-follows-mouse" = true;
    };
  };

}
