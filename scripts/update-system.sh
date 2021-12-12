#/bin/sh

echo "Executing: sudo nixos-rebuild switch --flake .#"

pushd ~/.my-nix-os
#nix flake update --override-input nixpkgs nixpkgs/bcb4b714bdddec94d88ff974f242cdb3f3308dac
nix flake update
sudo nixos-rebuild switch --flake .#
popd
