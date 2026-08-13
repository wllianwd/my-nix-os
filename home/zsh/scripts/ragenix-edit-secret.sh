#!/bin/bash

# Secret to edit, defaults to settings.xml.age
secret_filename="${1:-settings.xml.age}"
secret_path="${MY_NIX_CONFIG_DIR}/home/ragenix/secrets/$secret_filename"

# Check if the secret exists
if [[ ! -f "$secret_path" ]]; then
  echo "Error: Secret '$secret_path' not found."
  exit 1
fi

# Get the public SSH key content
public_key=(cat "$MY_NIX_CONFIG_DIR/uncommited/id_nix.pub")

# Create the secrets.nix file so ragenix knows who to re-encrypt for
pushd "$MY_NIX_CONFIG_DIR/home/ragenix/secrets" > /dev/null

secrets_nix_content="let
  key1 = \"$public_key\";
  users = [ key1 ];
in
{
  \"$secret_filename\".publicKeys = users;
}"

echo "$secrets_nix_content" > secrets.nix

# Decrypt, open in \$EDITOR, and re-encrypt on save
ragenix --edit "$secret_filename" -i "$MY_NIX_CONFIG_DIR/uncommited/id_nix"

rm -f "$MY_NIX_CONFIG_DIR/home/ragenix/secrets/secrets.nix"

popd > /dev/null
