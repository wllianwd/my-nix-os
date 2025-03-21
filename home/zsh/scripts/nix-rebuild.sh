#/bin/sh

echo "Executing: nixos-rebuild switch --use-remote-sudo --flake .#"

pushd $MY_NIX_CONFIG_DIR
nixos-rebuild switch --use-remote-sudo --flake .#
popd
