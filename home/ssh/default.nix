{ config, lib, ... }:

let
  idRsaPath = "${config.home.homeDirectory}/.ssh/id_rsa";
  idRsaExists = builtins.pathExists ../ragenix/secrets/id_rsa.age;
in
{
  programs.ssh = {
    enable = true;
    matchBlocks = lib.filterAttrs (name: value: value != null) {
      "github.com" = lib.mkIf idRsaExists {
        user = "git";
        identityFile = [ idRsaPath ];
      };
    };
  };
}
