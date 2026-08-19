{
  pkgs,
  inputs,
  lib,
  ...
}:

let
  global = import ../global.nix;
in
{
  imports = [
    ./hardware-configuration.nix
    inputs.dank-greeter.nixosModules.default
  ];

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
  };

  hardware = {
    enableRedistributableFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
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
  };

  # Set your time zone.
  time = {
    timeZone = "Europe/Madrid";
  };

  # Network
  networking = {
    useDHCP = false;
    hostName = "nixos";
    extraHosts = ''
      192.168.50.68 homeassistant.local
    '';
    networkmanager = {
      enable = true;
      plugins = [
        pkgs.networkmanager-openvpn
      ];
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [
        3000
        5000
        5055
        6767
        7878
        8010
        8989
        9696
        11434
      ];
      allowedUDPPorts = [
        5353
      ];
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
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Fonts
  fonts = {
    packages = [
      pkgs.meslo-lgs-nf
      pkgs.nerd-fonts.fira-code
      pkgs.nerd-fonts.droid-sans-mono
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.nerd-fonts.meslo-lg
      pkgs.dejavu_fonts
    ];
  };

  # Security
  security = {
    rtkit = {
      enable = true;
    };
    pam = {
      loginLimits = [
        {
          domain = "*";
          type = "-";
          item = "nofile";
          value = "1048576";
        }
      ];
    };
  };

  systemd = {
    settings = {
      Manager = {
        DefaultLimitNOFILE = 1048576;
      };
    };
  };

  # Services
  services = {
    udisks2 = {
      enable = true;
    };
    gvfs = {
      enable = true;
    };
    # Disabled to use pipewire
    pulseaudio = {
      enable = false;
    };

    # X11
    displayManager = {
      sddm = {
        enable = true;
        package = pkgs.kdePackages.sddm;
        wayland = {
          enable = true;
        };
      };
    };
    xserver = {
      xkb = {
        layout = "us";
        variant = "altgr-intl";
      };
    };
    hardware = {
      openrgb = {
        enable = true;
      };
    };
    # dbus
    dbus = {
      packages = [ pkgs.dconf ];
    };
    # udev
    udev = {
      packages = [ pkgs.gnome-settings-daemon ];
      extraRules = ''
        SUBSYSTEM=="usb", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="ca21", MODE="0666"
        SUBSYSTEM=="usb", ATTRS{idVendor}=="1d6b", ATTRS{idProduct}=="0121", MODE="0666"
      '';
    };
    # cups printing (can be accessed on http://localhost:631/)
    printing = {
      enable = true;
    };
    sunshine = {
        enable = true;
        autoStart = true;
        capSysAdmin = true; # only needed for Wayland -- omit this when using with Xorg
        openFirewall = true;
      };
    # resolved
    #resolved = {
    #  enable = true;
    #};
    # avahi
    #avahi = {
    #  enable = true;
    #  nssmdns2 = true;
    #  nssmdns4 = true;
    #  openFirewall = true;
    #  publish = {
    #    enable = true;
    #    userServices = true;
    #    addresses = true;
    #  };
    #};
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

  virtualisation = {
    docker = {
      enable = true;
      extraOptions = "--insecure-registry=192.168.50.68:5000";
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    groups = {
      media = { };
    };
    users = {
      "${global.username}" = {
        isNormalUser = true;
        initialPassword = "guest";
        extraGroups = [
          "wheel"
          "networkmanager"
          "docker"
          "uucp"
          "dialout"
          "media"
          "uinput"
        ]; # Enable ‘sudo’ for the user.
      };
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs; [
      xwayland-satellite
      wireplumber
      neovim
      cacert
      docker
      docker-compose
      networkmanager
      autorandr
      pciutils
      libva
      rocmPackages.rocminfo
      rocmPackages.rocm-smi
      libva-utils
      lm_sensors
      i2c-tools
      liquidctl
      usbutils
      appimage-run
      mesa
      mesa-demos
      killall
      dconf2nix
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
      vulkan-headers
      libstrangle
      inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
    variables = {
      LIBVA_DRIVER_NAME = "radeonsi";
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    dms-greeter = {
      enable = true;
      compositor.name = "hyprland";
      #compositor.name = "niri"; # or hyprland, sway, labwc, mango, scroll, miracle
      configHome = "${global.homeDirectory}"; # copies that user's DMS settings (and wallpaper) into the greeter data directory before greetd starts
    };
    steam = {
      enable = true;
    };
    zsh = {
      enable = true;
    };
    dconf = {
      enable = true;
    };
    #niri = {
    #  enable = true;
    #};
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
       inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
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
