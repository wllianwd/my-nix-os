{ pkgs, inputs, ... }:

let
  global = import ../global.nix;
in
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
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      #grub = { enable = true; version = 2; device = "replace_disk"; };
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
    #kernelPackages = pkgs.linuxPackages;
    #kernelParams = [ "acpi_enforce_resources=lax" ];
  };

  # Set your time zone.
  time = {
    timeZone = "Europe/Madrid";
  };

  # Network
  networking = {
    useDHCP = false;
    hostName = "nixos";
    networkmanager = {
      enable = true;
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [
        3000
        5000
        8010
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
    user = {
      extraConfig = "DefaultLimitNOFILE=1048576";
    };
  };

  #  services.displayManager.sddm.wayland.enable = true;

  # Services
  services = {
    # Disabled to use pipewire
    pulseaudio = {
      enable = false;
    };
    # jellyfin
    jellyfin = {
      enable = true;
      openFirewall = true;
      user = "${global.username}";
      group = "wheel";
    };
    # X11
    displayManager = {
      #gdm = {
      #  enable = true;
      #};
      sddm = {
        enable = true;
        package = pkgs.kdePackages.sddm;
        theme = "catppuccin-mocha";
        wayland = {
          enable = true;
        };
      };
    };
    xserver = {
      # enable = true;
      xkb = {
        layout = "us";
        variant = "altgr-intl";
      };
      # gnome

      #displayManager = {
      #gdm = {
      #  enable = true;
      #};
      # sddm = {
      #  enable = true;
      #  wayland.enable = true;

      #};
      # };
      #desktopManager = {
      #  gnome = {
      #    enable = true;
      #  };
      #};
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
    };
    # cups printing (can be accessed on http://localhost:631/)
    printing = {
      enable = true;
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    # flatpack
    #flatpak = {
    #  enable = true;
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
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      "${global.username}" = {
        isNormalUser = true;
        initialPassword = "guest";
        extraGroups = [
          "wheel"
          "networkmanager"
          "docker"
        ]; # Enable ‘sudo’ for the user.
      };
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs; [
      neovim
      cacert
      docker
      docker-compose
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
      jellyfin
      jellyfin-web
      jellyfin-ffmpeg
      (catppuccin-sddm.override {
        flavor = "mocha";
        font = "Noto Sans";
        fontSize = "9";
        #background = "${./wallpaper.png}";
        loginBackground = true;
      })
    ];
    variables = {
      LIBVA_DRIVER_NAME = "radeonsi";
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    steam = {
      enable = true;
    };
    zsh = {
      enable = true;
    };
    dconf = {
      enable = true;
    };
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
