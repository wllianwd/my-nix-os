{
  inputs,
  ...
}:
let
  global = import ../../../global.nix;
in
{

  stylix = {
    enable = true;
    base16Scheme = "${inputs.tinted-schemes}/base16/${global.stylixTheme}.yaml";
    image = ../../../assets/backgrounds/shaded.png;
    polarity = "dark";
  };

}
