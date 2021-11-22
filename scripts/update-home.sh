#/bin/sh

echo "Executing: home-manager switch -f ~/.my-nix-os/users/willian/home.nix"

pushd ~/.my-nix-os
nix build .#homeManagerConfigurations.willian.activationPackage
./result/activate
popd