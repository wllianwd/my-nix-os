{ config, lib, pkgs, ... }:

{

  # imports
  imports = [ 
    ./dconf/dconf.nix
  ];

  home = {
    username = "willian";
    homeDirectory = "/home/willian";
    stateVersion = "22.11";
    file.".local/share/applications/Wow Up.desktop".text = ''
      [Desktop Entry]
      Name=Wow Up
      Comment=World of Wargraft Addons Manager
      Exec=/home/willian/.my-nix-os/users/willian/desktop-entries/wowup/run.sh
      Icon=/home/willian/.my-nix-os/users/willian/desktop-entries/wowup/Icon.png
      Terminal=false
      Type=Application
      Categories=Game;
    '';
  };

  # programs
  programs = {
    home-manager = {
      enable = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion = {
        enable = true;
      };
      shellAliases = {
        update-dconf = "sh ~/.my-nix-os/scripts/update-dconf.sh";
        update-system = "sh ~/.my-nix-os/scripts/update-system.sh";
        update-system-boot = "sh ~/.my-nix-os/scripts/update-boot.sh";
        update-home = "sh ~/.my-nix-os/scripts/update-home.sh";
        update-proton = "sh ~/.my-nix-os/scripts/update-proton.sh";
	update-all = "update-system && update-dconf && update-home && update-proton";
        rebuild-system = "cd ~/.my-nix-os && nixos-rebuild switch --use-remote-sudo --flake .#";
        copy-photos = "sh ~/.my-nix-os/scripts/copy-photos.sh";
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
    vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [ 
        vim-airline 
        nerdtree 
        nerdtree-git-plugin 
        vim-devicons 
        vim-nerdtree-syntax-highlight 
      ];
      settings = { ignorecase = true; };
      extraConfig = ''
        set mouse=a
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
        autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
      '';
    };
  };
}

