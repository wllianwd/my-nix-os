{
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
    kdePackages.dolphin
    loupe
    kdePackages.okular
  ];

  qt = {
    enable = true;
  };
}
