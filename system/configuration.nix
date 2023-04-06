## Edit this configuration file to define what should be installed on
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
    #package = pkgs.nixFlakes;
    package = pkgs.nixVersions.stable;
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
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };

  virtualisation = {
    docker = {
      enable = false;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-12.2.3"
      ];
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
    kernel = {
      sysctl = {
        "vm.max_map_count" = 524288;
      };
    };
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [ "acpi_backlight=vendor" ];
  };
 
  # Set your time zone.
  time = { timeZone = "Europe/Madrid"; };

  # Network
  networking = {
    useDHCP = false;
    hostName = "nixos";
    networkmanager = { enable = true; };
    firewall = {
      enable = true;
      allowedTCPPorts = [ 3000 5000 8010 8096 ];
    };
  };

  # Select internationalisation properties.
  i18n = { defaultLocale = "en_US.UTF-8"; };
  console = { font = "Lat2-Terminus16"; keyMap = "us"; };

  # Fonts
  fonts = {
    fonts = with pkgs; [
      meslo-lgs-nf
    ];
  };

  # Security
  security = {
    rtkit = { enable = true; };
    pam = {
      loginLimits = [
        { domain = "*"; type = "soft"; item = "nofile"; value = "1048576"; }
        { domain = "*"; type = "hard"; item = "nofile"; value = "1048576"; }
      ];
    };
  };

  # Services
  services = {
    # jellyfin
    jellyfin = {
      enable = true;
      user = "willian";
      group = "wheel";
    };
    # X11
    xserver = {
      enable = true;
      # touchpad
      libinput = { enable = true; };
      # gnome
      displayManager = { gdm = { enable = true; }; };
      desktopManager = { gnome = { enable = true; }; };
    };
    hardware = {
      openrgb = {
        enable = true;
      };
    };
    # dbus
    dbus = { packages = [ pkgs.dconf ]; };
    # udev
    udev = { packages = [ pkgs.gnome.gnome-settings-daemon ]; };
    # cups printing (can be accessed on http://localhost:631/)
    printing = { enable = true; };
    # flatpack
    flatpak = { enable = true; };
    # pipewire
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse = {
        enable = true;
      };
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
      libva
      libva-utils
      vlc
      mkchromecast

      # multimedia
      pdftk
      onlyoffice-bin
      deluge
      handbrake
      discord
      etcher

      # dev
      python3
      vscodium-with-extensions
      docker-compose
      git
      wget
      curl
      nodejs
      yarn
      maven
      openjdk11
      jetbrains.idea-community
      jetbrains.datagrip
      kubectl
      postman

      # gnome
      gnome.gnome-tweaks
      gnomeExtensions.appindicator
      gnomeExtensions.gsconnect

      # video
      mesa
      mesa-demos
      zoom
      dconf2nix

      # rgb
      openrgb-with-all-plugins

      # gaming
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
      vulkan-headers
      wineWowPackages.staging
      wine-staging
      winetricks
      protontricks
      lutris
      mangohud
      protonup
      protonup-qt
      libstrangle
    ];
    variables = {
      NIXOS_CONFIG_DIR="$HOME/.my-nix-os/";
      LIBVA_DRIVER_NAME="radeonsi";
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
    stateVersion = "21.11"; # Did you read the comment?
  };
}
