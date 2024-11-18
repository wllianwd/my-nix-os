{ username, config, lib, pkgs, ... }:

{

  # imports
  imports = [ 
    ./dconf/dconf.nix
    ./ssh/ssh.nix
    ./zsh/zsh.nix
    ./vim/vim.nix
  ];

  # enable home manager
  home = {
    username = "willian";
    homeDirectory = "/home/willian";
    stateVersion = "24.05";
  };

  # programs
  programs = {
    home-manager = {
      enable = true;
    };
  };
}
