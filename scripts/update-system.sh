#/bin/sh

echo "Executing: sudo nixos-rebuild switch --flake .#"

pushd ~/.my-nix-os
nix flake update
#sudo nixos-rebuild switch --flake .#
nixos-rebuild switch --use-remote-sudo --flake .#
popd
