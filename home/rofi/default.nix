{
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
    rofi-vpn
    rofi-network-manager
  ];

  programs.rofi = {
    enable = true;
  };
}
