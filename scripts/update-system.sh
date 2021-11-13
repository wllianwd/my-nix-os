#/bin/sh

echo "Executing: sudo nixos-rebuild switch -I nixos-config=~/.my-nix-os/system/configuration.nix"

pushd ~/.my-nix-os
sudo nixos-rebuild switch -I nixos-config=./system/configuration.nix
popd