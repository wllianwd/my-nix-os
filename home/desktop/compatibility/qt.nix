{
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
    kdePackages.dolphin
  ];

  qt = {
    enable = true;
  };
}
