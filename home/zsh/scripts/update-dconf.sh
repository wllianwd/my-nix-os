#/bin/sh

pushd $MY_NIX_CONFIG_DIR
echo "Dumping to dconf.settings ..."
dconf dump / > $MY_NIX_CONFIG_DIR/home/dconf/dconf.settings
echo "Generating dconf.nix ..."
dconf2nix -i $MY_NIX_CONFIG_DIR/home/dconf/dconf.settings -o $MY_NIX_CONFIG_DIR/home/dconf/default.nix --verbose
echo "Done!"
popd
