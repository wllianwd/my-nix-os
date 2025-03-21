{ config, pkgs, stdenv, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      #driSupport = true;
      #driSupport32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
      permittedInsecurePackages = [
        "electron-19.1.9"
        "python3.12-youtube-dl-2021.12.17"
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
      efi = {
        efiSysMountPoint = "/boot/efi";
        canTouchEfiVariables = true;
      };
    };
    kernel = {
      sysctl = {
        "vm.max_map_count" = 524288;
      };
    };
    #kernelPackages = pkgs.linuxPackages_testing;
    kernelPackages = pkgs.linuxPackages_latest;
    #kernelPackages = pkgs.linuxPackages;
    #kernelParams = [ "acpi_enforce_resources=lax" ];
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
  i18n = {
    extraLocaleSettings = {
      LC_ADDRESS = "es_ES.UTF-8";
      LC_IDENTIFICATION = "es_ES.UTF-8";
      LC_MEASUREMENT = "es_ES.UTF-8";
      LC_MONETARY = "es_ES.UTF-8";
      LC_NAME = "es_ES.UTF-8";
      LC_NUMERIC = "es_ES.UTF-8";
      LC_PAPER = "es_ES.UTF-8";
      LC_TELEPHONE = "es_ES.UTF-8";
      LC_TIME = "es_ES.UTF-8";
    };
    defaultLocale = "en_US.UTF-8";
  };
  console = { font = "Lat2-Terminus16"; keyMap = "us"; };

  # Fonts
  fonts = {
    packages = with pkgs; [
      pkgs.meslo-lgs-nf
      pkgs.nerd-fonts.fira-code
      pkgs.nerd-fonts.droid-sans-mono
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.nerd-fonts.meslo-lg
    ];
  };

  # Security
  security = {
    rtkit = { enable = true; };
    pam = {
      loginLimits = [
        { domain = "*"; type = "-"; item = "nofile"; value = "1048576"; }
      ];
    };
  };

  systemd = {
    user = {
      extraConfig = "DefaultLimitNOFILE=1048576";
    };
  };

  # Services
  services = {
    # Disabled to use pipewire
    pulseaudio = { enable = false; };
    # jellyfin
    jellyfin = {
      enable = true;
      user = "willian";
      group = "wheel";
    };
    # X11
    xserver = {
      enable = true;
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
    udev = { packages = [ pkgs.gnome-settings-daemon ]; };
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
      neovim
      cacert
      networkmanager
      autorandr
      pciutils
      libva
      libva-utils
      lm_sensors
      i2c-tools
      liquidctl
      usbutils
      appimage-run
      gnome-tweaks
      gnomeExtensions.appindicator
      gnomeExtensions.gsconnect
      gnomeExtensions.vitals
      mesa
      mesa-demos
      dconf2nix
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
      vulkan-headers
      libstrangle
    ];
    variables = {
      LIBVA_DRIVER_NAME="radeonsi";
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    steam = { enable = true; };
    zsh = { enable = true; };
    dconf = { enable = true; };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system = {
    stateVersion = "24.11"; # Did you read the comment?
  };
}
