{
  pkgs,
  ...
}:
{

  home = {
    packages = with pkgs; [
      (catppuccin-kvantum.override {
        variant = "mocha";
        accent = "mauve";
      })
      kdePackages.qtstyleplugin-kvantum
      kdePackages.dolphin
    ];
    sessionVariables = {
      "QT_STYLE_OVERRIDE" = "kvantum";
    };
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Catppuccin-Mocha-Mauve
    '';
  };

  qt = {
    enable = true;
    platformTheme = {
      name = "kvantum";
    };
    style = {
      name = "kvantum";
    };
  };
}
