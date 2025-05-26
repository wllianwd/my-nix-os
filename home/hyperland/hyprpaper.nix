{
  pkgs,
  ...
}:
let
  global = import ../../global.nix;
in
{

  home.packages = with pkgs; [
    hyprpaper
  ];

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ${global.nixConfigDirectory}/assets/backgrounds/shaded.png
    wallpaper = , ${global.nixConfigDirectory}/assets/backgrounds/shaded.png
  '';

  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "hyprpaper"
      ];
    };
  };

}
