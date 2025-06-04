{
  config,
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
    package = pkgs.rofi-wayland;
    terminal = "${pkgs.ghostty}/bin/ghostty";

    extraConfig = {
      modi = "run,drun,window";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      sidebar-mode = true;
      display-run = "   Run ";
      display-window = "󰍲   Window";
      display-Network = " 󰤨  Network";
    };

    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        window = {
          height = 600;
          width = 600;
          border = 0;
          border-radius = 10;
        };

        mainbox = {
          spacing = 0;
          children = [
            "inputbar"
            "message"
            "listview"
          ];
        };

        inputbar = {
          padding = 14;
        };

        message = {
          padding = 10;
        };

        listview = {
          padding = 8;
          dynamic = false;
        };

        element = {
          padding = 5;
          border-radius = 10;
          vertical-align = "center";
        };

        element-text = {
          size = 40;
          padding = 10;
          vertical-align = "center";
        };

        element-icon = {
          size = 40;
          vertical-align = "center";
        };
      };
  };
}
