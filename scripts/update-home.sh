#/bin/sh

echo "Executing: nix build .#homeManagerConfigurations.willian.activationPackage"

pushd ~/.my-nix-os
nix build .#homeManagerConfigurations.willian.activationPackage
./result/activate
popd