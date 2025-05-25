{ pkgs, ... }:

let
  global = import ../global.nix;
in
{
  home.username = global.username;
  home.homeDirectory = "${global.homeDirectory}";

  imports = [
    ./dconf
    ./ragenix
    ./ssh
    ./git
    ./zsh
    ./tmux
    ./ghostty
    ./nvf
    ./java
    ./waybar
    ./rofi
    ./hyperland
    ./zed
    ./idea
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    kubectl
    mob
    docker
    #colima
    #docker-compose
    wofi
    #    dolphin
    xournalpp
    hoppscotch
    maven
    neofetch
    python3
    nodejs
    cargo
    rustc
    go
    redis
    openssl_3
    awscli2
    nixd
    nil
    nixfmt-rfc-style
    ragenix
    google-chrome
    slack
    zoom-us
    age
    ripgrep
    jq # A lightweight command-line JSON processor
    yq-go # yaml processor
    fzf # A command-line fuzzy finder
    fd
    cowsay
    which
    gawk
    obsidian # Note-taking app
    eza # Modern replacement of ls
    zoxide # Zoxide is a smarter cd command
    zip
    xz
    unzip
    p7zip
    gh # github ctl
    wineWowPackages.staging
    wine-staging
    winetricks
    protontricks
    lutris
    protonup
    protonup-qt
    mangohud
    nodejs
    yarn
    nodePackages.localtunnel
    python3
    docker-compose
    git
    wget
    curl
    openrgb-with-all-plugins
    obs-studio
    pdftk
    onlyoffice-bin
    deluge
    #handbrake
    discord
    vlc
    neofetch
    google-chrome
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";

}
