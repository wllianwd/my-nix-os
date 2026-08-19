{
  pkgs,
  ...
}:
{

  #home.packages = with pkgs; [
    #hyprshot
    #gnugrep
    #bluez
  #];

  #imports = [
    #./compatibility
    #./hyprlock.nix
    #];

  #services = {
  #  swaync = {
  #    enable = true;
  #  };
  #  xembed-sni-proxy = {
  #    enable = true;
  #  };
  #};

  wayland.windowManager.hyprland = {
    enable = true;

    #plugins = [
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
    #];

    configType = "lua";

    # Hand-written, not home-manager's Nix->Lua settings generator (that generator does a
    # literal `hl.<name>(...)` mapping and doesn't understand hyprlang comma-string syntax
    # at all - see nix-community/home-manager#9468). Writing real Lua directly is one
    # translation layer instead of two.
    extraConfig = builtins.readFile ./hyprland.lua;
  };
}
