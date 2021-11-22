#/bin/sh

echo "Executing: sudo nixos-rebuild switch -I nixos-config=~/.my-nix-os/system/configuration.nix"

pushd ~/.my-nix-os
nix-flake update --recreate-lock-file
sudo nixos-rebuild switch --flake .#
popd