{ lib, ... }:

{

 home = {
    shoji = {
      enable = true;
      yaml-config = ./ssh.yaml;
      age-keyfile = "/home/willian/Documents/data/ssh/age-shoji.txt";
    };
  };
}
