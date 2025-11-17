{
  pkgs,
  ...
}:
{

  programs.niri = {
    config = ''
      output "DP-2" {
        mode "1960x1024@240.000"
      }
    '';
    #settings = {
    #outputs = {
    #  "DP-2" = {
    #    mode = "1960x1024@240.000";
    #    scale = 1.0;
    #  };
    #};
    #};
  };

}
