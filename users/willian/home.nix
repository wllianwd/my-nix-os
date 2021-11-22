{ config, lib, pkgs, ... }:

{
  home = {
    username = "willian";
    homeDirectory = "/home/willian";
  };

  # imports
  imports = [ ./dconf/dconf.nix ];
  
  # programs
  programs = {
    home-manager = {
      enable = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      shellAliases = {
        update-dconf = "sh ~/.my-nix-os/scripts/update-dconf.sh";
        update-system = "sh ~/.my-nix-os/scripts/update-system.sh";
        update-system-boot = "sh ~/.my-nix-os/scripts/update-boot.sh";
        update-home = "sh ~/.my-nix-os/scripts/update-home.sh";
        open-dotfiles = "cd ~/.my-nix-os";
      };
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
      plugins = [
        { name = "powerlevel10k"; src = pkgs.zsh-powerlevel10k; file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme"; }
        { name = "powerlevel10k-config"; src = lib.cleanSource ./p10k-config;  file = "p10k.zsh";  }  
        # Config with: POWERLEVEL9K_CONFIG_FILE=~/.my-nix-os/users/willian/p10k-config/p10k.zsh p10k configure   
        { name = "zsh-syntax-highlighting"; src = pkgs.fetchFromGitHub { owner = "zsh-users"; repo = "zsh-syntax-highlighting"; rev = "0.7.1"; sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0"; }; }
      ];
    };
  };
}
