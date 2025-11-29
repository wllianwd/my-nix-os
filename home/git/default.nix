{ ... }:

let
  global = import ../../global.nix;
in
{

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = global.gitUserName;
        email = global.gitEmail;
      };
    };
  };

}
