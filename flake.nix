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
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };
    lib = nixpkgs.lib;
  in {
    homeManagerConfigurations = {
      willian = home-manager.lib.homeManagerConfiguration {
	  pkgs = nixpkgs.legacyPackages.${system};
	  modules = [
	    ./users/willian/home.nix
	  ];
	};
    };
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          ./system/configuration.nix
        ];
      };
    };
  };
}
