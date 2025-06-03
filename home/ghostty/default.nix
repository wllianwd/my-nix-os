{ ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      "clipboard-read" = "allow";
      "clipboard-write" = "allow";
      "copy-on-select" = false;
      "window-padding-x" = 10;
      "window-padding-y" = 10;
      "window-padding-balance" = true;
      "cursor-invert-fg-bg" = true;
      "cursor-style" = "bar";
      "cursor-style-blink" = true;
      "mouse-hide-while-typing" = true;
      "focus-follows-mouse" = true;
    };
  };
}
