{ config, lib, ... }:

let
  global = import ../../global.nix;
in
{
  age.identityPaths = [ "${global.nixConfigDirectory}/uncommited/id_nix" ];
  age.secretsDir = "${global.nixConfigDirectory}/uncommited/secrets";

  # ~/.m2/settings.xml
  age.secrets."settings.xml.age" = lib.mkIf (builtins.pathExists ./secrets/settings.xml.age) {
    file = ./secrets/settings.xml.age;
    path = "${config.home.homeDirectory}/.m2/settings.xml";
  };

  # ~/.ssh/id_rsa
  age.secrets."id_rsa.age" = lib.mkIf (builtins.pathExists ./secrets/id_rsa.age) {
    file = ./secrets/id_rsa.age;
    path = "${config.home.homeDirectory}/.ssh/id_rsa";
    mode = "0600";
    symlink = false;
  };

  # ~/.ssh/id_rsa.pub
  age.secrets."id_rsa.pub.age" = lib.mkIf (builtins.pathExists ./secrets/id_rsa.pub.age) {
    file = ./secrets/id_rsa.pub.age;
    path = "${config.home.homeDirectory}/.ssh/id_rsa.pub";
    mode = "0644";
    symlink = false;
  };

}
