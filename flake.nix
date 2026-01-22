{
  description = "NixOS system flake";

  inputs = {
    # official nix packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # community driven nix packages
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    # home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # hyperland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    hyprland-plugins.inputs.hyprland.follows = "hyprland";

    # niri
    niri.url = "github:sodiboo/niri-flake";
    niri.inputs.nixpkgs.follows = "nixpkgs";

    # stylix
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    stylix.inputs.home-manager.follows = "home-manager";
    stylix.inputs.tinted-schemes.follows = "tinted-schemes";

    # theme
    tinted-schemes.flake = false;
    tinted-schemes.url = "github:tinted-theming/schemes";

    # material shell
    #dms-cli.url = "github:AvengeMedia/danklinux";
    #dms-cli.inputs.nixpkgs.follows = "nixpkgs";

    dgop.url = "github:AvengeMedia/dgop";
    dgop.inputs.nixpkgs.follows = "nixpkgs";

    dankMaterialShell.url = "github:AvengeMedia/DankMaterialShell";
    dankMaterialShell.inputs.nixpkgs.follows = "nixpkgs";
    dankMaterialShell.inputs.dgop.follows = "dgop";
    #dankMaterialShell.inputs.dms-cli.follows = "dms-cli";

    # quickshell
    quickshell.url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    quickshell.inputs.nixpkgs.follows = "nixpkgs";

    # caelestia
    #caelestia-shell.url = "github:caelestia-dots/shell";
    #caelestia-shell.inputs.nixpkgs.follows = "nixpkgs";

    # agenix
    ragenix.url = "github:yaxitech/ragenix";
    ragenix.inputs.nixpkgs.follows = "nixpkgs";

    # nixvim
    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ragenix,
      nvf,
      nur,
      niri,
      hyprland,
      hyprland-plugins,
      stylix,
      tinted-schemes,
      #caelestia-shell,
      #dms-cli,
      dgop,
      dankMaterialShell,
      quickshell,
    }:
    let
      global = import ./global.nix;
      system = "x86_64-linux"; # system architecture
      pkgs = import nixpkgs { inherit system; };
      lib = nixpkgs.lib;
      #my-overlays = import ./system/overlays.nix { inherit nur pkgs; };
    in
    {
      nixosConfigurations."${global.host}" = lib.nixosSystem {
        system = system;
        specialArgs = { inherit inputs; };
        modules = [
          #my-overlays
          ./system/configuration.nix
          home-manager.nixosModules.home-manager
          {
            # home-manager defaults
            home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.sharedModules = [
              ragenix.homeManagerModules.default
              nvf.homeManagerModules.default
              inputs.niri.homeModules.niri
              stylix.homeModules.stylix
              #inputs.caelestia-shell.homeManagerModules.default
              inputs.dankMaterialShell.homeModules.dank-material-shell
              inputs.dankMaterialShell.homeModules.niri
            ];

            # home-manager specific
            home-manager.users."${global.username}" = import ./home;
          }
        ];
      };

      # expose devShells for easy access
      devShells.${system} = {
        python311 = import ./home/shells/python311.nix { inherit pkgs; };
        node22 = import ./home/shells/node22.nix { inherit pkgs; };
      };
    };
}
