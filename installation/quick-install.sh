#/bin/sh

USER=""
BOOT_TYPE=""
TIMEZONE=""
KEYMAP=""
DISK=""
TOTAL_MEMORY_IN_GIB=0
RECOMMENDED_SWAP=0

echo "Starting installation ..."

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

nix-channel --add https://nixos.org/channels/nixos-unstable nixos
nix-channel --update

echo "Downloading remote configuration.nix ..."
curl -s https://raw.githubusercontent.com/wllianwd/my-nix-os/main/system/configuration.nix > configuration-template.nix

# Memory
MEM_UNPARSED=$(grep MemTotal /proc/meminfo)
MEM_UNPARSED_SPLIT=(${MEM_UNPARSED// / })
MEM_IN_KB=${MEM_UNPARSED_SPLIT[1]}
TOTAL_MEMORY_IN_MIB=$((MEM_IN_KB / 1024))
TOTAL_MEMORY_IN_GIB=$((TOTAL_MEMORY_IN_MIB / 1024))
TOTAL_MEMERY_HALF=$((TOTAL_MEMORY_IN_GIB / 2))
RECOMMENDED_SWAP=$(printf "%.0f\n" $TOTAL_MEMERY_HALF)

# Boot
EFI_UNPARSED=$(ls /sys/firmware/efi 2>&1)
if [[ $EFI_UNPARSED == *"No such file or directory"* ]]; then
  BOOT_TYPE="BIOS"
else
  BOOT_TYPE="EFI"
fi

# System info log
echo "System information:"
echo "  Memory: $TOTAL_MEMORY_IN_GIB GiB"
echo "  Boot type: $BOOT_TYPE"

# User
echo -n "The user to be created (apart from root)? (guest) "
read USER
if [[ "$USER" == "" ]];
then
  USER="guest"
fi

if [[ "$USER" == "" ]];
then
  echo -n "Exiting as username was not informed..."
  exit
fi

# Timezone
echo -n "Enter your timezone: (Europe/Madrid) "
read TIMEZONE
if [[ "$TIMEZONE" == "" ]];
then
  TIMEZONE="Europe/Madrid"
fi

if [[ "$TIMEZONE" == "" ]];
then
  echo -n "Exiting as timezone was not informed..."
  exit
fi

echo -n "Enter your keymap: (uk) "
read KEYMAP
if [[ "$KEYMAP" == "" ]];
then
  KEYMAP="uk"
fi

if [[ "$KEYMAP" == "" ]];
then
  echo -n "Exiting as keymap was not informed..."
  exit
fi

# Disks
FOUND_DISK="N"
DISK_CANDIDATE_CONFIRMATION="N"
DISK_CANDIDATE=$(lsblk -io PATH,TYPE | while read LSBLK_LINE;
do 
  DISK_SPLIT=(${LSBLK_LINE// / })
  DISK_CANDIDATE=${DISK_SPLIT[0]}
  DISK_TYPE=${DISK_SPLIT[1]}
  if [[ "$DISK_TYPE" == "disk" && $FOUND_DISK == "N" ]];
  then
    echo $DISK_CANDIDATE
  fi
done | tail -1)
echo -n "Do you want to use disk ${DISK_CANDIDATE}? (Y/n) "
read DISK_CANDIDATE_CONFIRMATION
if [[ "$DISK_CANDIDATE_CONFIRMATION" == "Y" || "$DISK_CANDIDATE_CONFIRMATION" == "" ]];
then
  DISK=$DISK_CANDIDATE
else
  echo -n "Enter the disk path you want to use (sample /dev/sda)? "
  read DISK
fi
if [[ "$DISK" == "" ]];
then
  echo -n "Exiting as disk was not informed..."
  exit
fi

# Start installation
echo "Installation will erase you disk and create the bellow paritions:"
if [[ "$BOOT_TYPE" == "BIOS" ]];
then
  echo "  parted $DISK -- mklabel msdos"
  echo "  parted $DISK -- mkpart primary 1MiB -${RECOMMENDED_SWAP}GiB"
  echo "  parted $DISK -- mkpart primary linux-swap -${RECOMMENDED_SWAP}GiB 100%"
  echo "  mkfs.ext4 -L nixos ${DISK}1"
  echo "  mkswap -L swap ${DISK}2"
  echo "  swapon ${DISK}2"
  echo "  mount /dev/disk/by-label/nixos /mnt"
fi
if [[ "$BOOT_TYPE" == "EFI" ]];
then
  echo "  parted $DISK -- mklabel gpt"
  echo "  parted $DISK -- mkpart primary 512MiB -${RECOMMENDED_SWAP}GiB"
  echo "  parted $DISK -- mkpart primary linux-swap -${RECOMMENDED_SWAP}GiB 100%"
  echo "  parted $DISK -- mkpart ESP fat32 1MiB 512MiB"
  echo "  parted $DISK -- set 3 esp on"
  echo "  mkfs.ext4 -L nixos ${DISK}p1"
  echo "  mkswap -L swap ${DISK}p2"
  echo "  swapon ${DISK}p2"
  echo "  mkfs.fat -F 32 -n boot ${DISK}p3"
  echo "  mount /dev/disk/by-label/nixos /mnt"
  echo "  mkdir -p /mnt/boot"
  echo "  mount /dev/disk/by-label/boot /mnt/boot"
fi

echo "Are you sure you want to continue? (N/y)"
read CONTINUE_INSTALLATION

if [[ "$CONTINUE_INSTALLATION" != "y" ]];
then
  echo -n "Exiting as you didn't reply 'y'..."
  exit
fi

if [[ "$BOOT_TYPE" == "BIOS" ]];
then
  parted $DISK -- mklabel msdos
  parted $DISK -- mkpart primary 1MiB -${RECOMMENDED_SWAP}GiB
  parted $DISK -a optimal -- mkpart primary linux-swap -${RECOMMENDED_SWAP}GiB 100%
  
  mkfs.ext4 -L nixos ${DISK}1
  mkswap -L swap ${DISK}2
  swapon ${DISK}2
  mount /dev/disk/by-label/nixos /mnt
  
  echo -e "Configuring BIOS boot loader ..."
  
  sed -i 's|#grup|grup|g' configuration-template.nix
  sed -i 's|systemd-boot = |#systemd-boot = |g' configuration-template.nix
  sed -i 's|efi = |#efi = |g' configuration-template.nix
  sed -i 's|replace_disk_id|'"${DISK}"'|g' configuration-template.nix
fi

if [[ "$BOOT_TYPE" == "EFI" ]];
then
  parted $DISK -- mklabel gpt
  parted $DISK -- mkpart primary 512MiB -${RECOMMENDED_SWAP}GiB
  parted $DISK -- mkpart primary linux-swap -${RECOMMENDED_SWAP}GiB 100%
  parted $DISK -- mkpart ESP fat32 1MiB 512MiB
  parted $DISK -- set 3 esp on

  mkfs.ext4 -L nixos ${DISK}p1
  mkswap -L swap ${DISK}p2
  swapon ${DISK}p2  
  mkfs.fat -F 32 -n boot ${DISK}p3
  mount /dev/disk/by-label/nixos /mnt
  mkdir -p /mnt/boot
  mount /dev/disk/by-label/boot /mnt/boot

  echo -e "Configuring EFI boot loader ..."
  sed -i 's|#systemd-boot|systemd-boot|g' configuration-template.nix
  sed -i 's|#efi|efi|g' configuration-template.nix
fi

echo -e "Configuring timezone as ${TIMEZONE} ..."
sed -i 's|Europe/Madrid|'"${TIMEZONE}"'|g' configuration-template.nix

echo -e "Configuring keymap as ${KEYMAP} ..."
sed -i 's/keyMap = "us"/keyMap = '"${KEYMAP}"'/g' configuration-template.nix

echo -e "Configuring user ${USER} ..."
sed -i 's/willian/'"${USER}"'/g' configuration-template.nix

nixos-generate-config --root /mnt
mv /mnt/etc/nixos/configuration.nix /mnt/etc/nixos/configuration-bkp.nix
mv configuration-template.nix /mnt/etc/nixos/configuration.nix
echo -e "Installing NixOS ..."
nixos-install

echo -e "Chroot into installed system for post-configuration ..."
nixos-enter

echo -e "Installing home-manager ..."
su ${USER}
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
nix-shell '<home-manager>' -A install

echo -e "Configuring dotfiles..."
cd ~/
mkdir .my-nix-os
cd .my-nix-os
git clone git@github.com:wllianwd/my-nix-os.git .
mv system/hardware-configuration.nix system/hardware-configuration.nix.bkp
cp /etc/nixos/hardware-configuration.nix system/hardware-configuration.nix
mv users/willian/ users/${USER}/
sed -i 's/willian/'"${USER}"'/g' scripts/update-dconf.sh
sed -i 's/willian/'"${USER}"'/g' scripts/update-home.sh
sed -i 's/willian/'"${USER}"'/g' users/${USER}/dconf.nix

echo -e "Updating home manager ..."
home-manager switch -f ~/.my-nix-os/users/${USER}/home.nix
echo -e "Done! Please reboot."

