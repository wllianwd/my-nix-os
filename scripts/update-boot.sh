#/bin/sh

echo "Executing: sudo nixos-rebuild boot -I nixos-config=~/.my-nix-os/system/configuration.nix"

pushd ~/.my-nix-os
sudo nixos-rebuild boot -I nixos-config=./system/configuration.nix
popd