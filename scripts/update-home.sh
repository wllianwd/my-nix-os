#/bin/sh

echo "Executing: home-manager switch -f ~/.my-nix-os/users/willian/home.nix"

pushd ~/.my-nix-os
home-manager switch -f ./users/willian/home.nix
popd