#/bin/sh

pushd ~/.my-nix-os
echo "Dumping to dconf.settings ..."
#dconf dump / > dconf.settings
echo "Generating ~/.config/nixpkgs/dconf/dconf.nix ..."
#dconf2nix -i dconf.settings -o users/willian/dconf/dconf.nix --verbose
echo "Updating home-manager ..."
nix build .#homeManagerConfigurations.willian.activationPackage
./result/activate
echo "Removing dconf.settings ..."
rm dconf.settings
echo "Done!"
popd
