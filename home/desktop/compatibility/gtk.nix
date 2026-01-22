{
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
    #nautilus
    #catppuccin-gtk
  ];

  gtk = {
    enable = true;
  };
}
