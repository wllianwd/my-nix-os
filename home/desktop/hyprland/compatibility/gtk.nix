{
  pkgs,
  ...
}:
let
  global = import ../../../../global.nix;
in
{

  home.packages = with pkgs; [
    nautilus
    catppuccin-gtk
  ];

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-frappe-blue-standard";
      package = pkgs.catppuccin-gtk;
    };

    gtk2 = {
      configLocation = "${global.homeDirectory}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}
