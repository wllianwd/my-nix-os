# My NixOS

## Dot files

Create the dotfiles dir, clone this repo and update home-manager:
```
cd ~/
mkdir .my-nix-os
cd .my-nix-os
git clone https://github.com/wllianwd/my-nix-os.git .
nix flake update

# system
sudo nixos-rebuild switch --flake .#

```
This will create some aliases that can be used to maintain your system and home-manager using the dotfiles from this repo:
* `update-system`: will do a `sudo nixos-rebuild switch` using `~/.my-nix-os/system/configuration.nix`
* `update-dconf`: dump your current gnome settings to `~/.my-nix-os/users/<user>/dconf/dconf.nix` and will do a `update-home`
* `update-proton`: check and update to latest `Proton-GE`
* `open-dotfiles`: jump to your dotfiles directory `cd ~/.my-nix-os`

Sample:
* To change your system `~/.my-nix-os/system/configuration.nix` and do a `update-system`.
* To change your home-manager `~/.my-nix-os/users/<user>/home.nix` and do a `update-home`.
