# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# Variables

let vscodium-with-extensions = pkgs.vscode-with-extensions.override {
    vscode = pkgs.vscodium;
    vscodeExtensions = (with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ]);
  };

# Config
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Make ready for nix flakes
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  hardware = {
    # Disabled to use pipewire
    pulseaudio = { enable = false; };
    opengl = { 
      enable = true; 
      driSupport = true; 
      driSupport32Bit = true; 
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      (self: super:
        # fix zoom screen sharing (https://github.com/NixOS/nixpkgs/issues/107233)
        {
          zoomUsFixed = pkgs.zoom-us.overrideAttrs (old: {postFixup = old.postFixup + ''
              wrapProgram $out/bin/zoom-us --unset XDG_SESSION_TYPE
            '';});
          zoom = pkgs.zoom-us.overrideAttrs (old: {postFixup = old.postFixup + ''
              wrapProgram $out/bin/zoom --unset XDG_SESSION_TYPE
            '';});
        }
      )
    ];
  };

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      #grub = { enable = true; version = 2; device = "replace_disk"; };
      systemd-boot = { enable = true; };
      efi = { canTouchEfiVariables = true; };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
 
  # Set your time zone.
  time = { timeZone = "Europe/Madrid"; };

  # Network
  networking = {
    useDHCP = false;
    hostName = "nixos";
    networkmanager = { enable = true; };
  };

  # Select internationalisation properties.
  i18n = { defaultLocale = "en_US.UTF-8"; };
  console = { font = "Lat2-Terminus16"; keyMap = "us"; };

  # Fonts
  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols 
      mplus-outline-fonts
      dina-font
      proggyfonts
      nerdfonts
      meslo-lgs-nf
    ];
  };

  # Security
  security = {
    rtkit = { enable = true; };
  };

  # Services
  services = {
    # X11
    xserver = {
      enable = true;
      # touchpad
      libinput = { enable = true; };
      # gnome
      displayManager = { gdm = { enable = true; }; };
      desktopManager = { gnome = { enable = true; }; };
    };
    # dbus
    dbus = { packages = [ pkgs.gnome3.dconf ]; };
    # udev
    udev = { packages = [ pkgs.gnome3.gnome-settings-daemon ]; };
    # cups printing (can be accessed on http://localhost:631/)
    printing = { enable = true; };
    # flatpack
    flatpak = { enable = true; };
    # pipewire
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      media-session.config.bluez-monitor.rules = [
        {
          matches = [ { "device.name" = "~bluez_card.*"; } ];
          actions = {
            "update-props" = {
              "bluez5.reconnect-profiles" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
              "bluez5.msbc-support" = true;
              "bluez5.sbc-xq-support" = true;
             };
          };
        }
        {
          matches = [ { "node.name" = "~bluez_input.*"; } { "node.name" = "~bluez_output.*"; }  ];
          actions = { "node.pause-on-idle" = false; };
        }
      ];
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      willian = {
        isNormalUser = true;
        initialPassword = "guest";
        extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
      };
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs; [
      vim
      cacert
      pciutils
      nano
      unzip
      google-chrome
      networkmanager
      autorandr
      neofetch
      bash

      # dev
      vscodium-with-extensions
      git
      wget
      curl
      nodejs
      yarn
      maven
      openjdk11
      jetbrains.idea-community
      obsidian
      kubectl
      postman

      # gnome
      gnome3.gnome-tweaks
      gnomeExtensions.appindicator
      gnomeExtensions.gsconnect

      # video
      mesa
      mesa-demos
      zoom
      dconf2nix

      # gaming
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
      vulkan-headers
      wineWowPackages.staging
      wine-staging
      winetricks
      lutris
      discord
      mangohud
    ];
    variables = {
      NIXOS_CONFIG_DIR="$HOME/.my-nix-os/";
    };
    etc = with pkgs; {
      "jdk-11".source = openjdk11;
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    zsh = { enable = true; };
    steam = { enable = true; };
  };  
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system = {
    stateVersion = "21.05"; # Did you read the comment?
  };
}
