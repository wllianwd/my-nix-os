#/bin/sh
pushd ~/.config/nixpkgs/dconf
echo "Dumping to dconf.settings ..."
dconf dump / > dconf.settings
echo "Generating ~/.config/nixpkgs/dconf/dconf.nix ..."
dconf2nix -i dconf.settings -o dconf.nix
echo "Updating home-manager ..."
home-manager switch
echo "Done!"
popd