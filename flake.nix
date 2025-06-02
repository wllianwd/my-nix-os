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

    # stylix
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    stylix.inputs.home-manager.follows = "home-manager";
    stylix.inputs.tinted-schemes.follows = "tinted-schemes";

    # theme
    tinted-schemes.flake = false;
    tinted-schemes.url = "github:tinted-theming/schemes";

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
      hyprland,
      stylix,
      tinted-schemes,
    }:
    let
      global = import ./global.nix;
      system = "x86_64-linux"; # system architecture
      pkgs = import nixpkgs { inherit system; };
      lib = nixpkgs.lib;
      my-overlays = import ./system/overlays.nix { inherit nur pkgs; };
    in
    {
      nixosConfigurations."${global.host}" = lib.nixosSystem {
        system = system;
        specialArgs = { inherit inputs; };
        modules = [
          my-overlays
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
              stylix.homeModules.stylix
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
