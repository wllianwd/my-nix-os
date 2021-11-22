#/bin/sh

echo "Executing: sudo nixos-rebuild boot --flake .#"

pushd ~/.my-nix-os
nix flake update
sudo nixos-rebuild boot --flake .#
popd