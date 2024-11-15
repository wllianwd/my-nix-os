{
  description = "My NixOS system config";

  inputs = {
    nixpkgs = {
      #url = "nixpkgs/nixos-unstable";
      url = "nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };
    shoji-nix = {
      url = "github:AdoPi/shoji-nix";
    };
  };

  outputs = { self, nixpkgs, home-manager, shoji-nix, ... }:
  let
    system = "x86_64-linux";
    username = "willian";
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };
    lib = nixpkgs.lib;
    homeManager = home-manager.lib.homeManagerConfiguration;
  in {

    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          ./system/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.sharedModules = [
              shoji-nix.homeManagerModules.shoji
            ];
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./users/${username}/home.nix;
          }
        ];
      };
    };
  };
}
