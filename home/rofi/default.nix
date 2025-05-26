{
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
    rofi-vpn
    rofi-network-manager
  ];

  catppuccin.rofi = {
    enable = false;
    flavor = "mocha";
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.ghostty}/bin/ghostty";
    theme = ./theme.rafi;

    extraConfig = {
      modi = "drun";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      sidebar-mode = true;
    };
  };
}
