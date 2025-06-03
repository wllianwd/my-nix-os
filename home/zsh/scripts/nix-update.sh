#/bin/sh

echo "Executing: nix flake update && nixos-rebuild switch --use-remote-sudo --flake .#"

pushd $MY_NIX_CONFIG_DIR
nix flake update
sh ./home/zsh/scripts/nix-update-idea-plugins.sh
nixos-rebuild switch --use-remote-sudo --flake .#
popd
