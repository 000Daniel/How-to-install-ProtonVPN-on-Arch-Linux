#!/usr/bin/bash

PROMPT_COMMAND='echo -en "\033]0;Auto ProtonVPN installer\a"'
BO='\033[0;33m'
NC='\033[0m'
RED='\033[0;31m'
LG='\033[1;32m'
PUR='\033[0;35m'

echo -e "${BO}=====================[${RED}Installing dependencies...${BO}]=====================${NC}"
sudo pacman -S git python python-pythondialog python-pyxdg python-keyring python-jinja python-distro python-systemd python-requests python-bcrypt python-gnupg python-pyopenssl
echo -e "${BO}===================[${RED}Downloading AUR dependencies...${BO}]==================${NC}"
cd /home/user/Downloads/
git clone https://aur.archlinux.org/protonvpn.git
git clone https://aur.archlinux.org/protonvpn-cli.git
git clone https://aur.archlinux.org/protonvpn-gui.git
git clone https://aur.archlinux.org/python-protonvpn-nm-lib.git
git clone https://aur.archlinux.org/python-proton-client.git
echo -e "${BO}===================[${RED}Installing AUR dependencies...${BO}]===================${NC}"
cd python-proton-client/
makepkg
sudo pacman -U python-proton-client-*
cd ..

cd python-protonvpn-nm-lib/
makepkg
sudo pacman -U python-protonvpn-nm-lib-*
cd ..

cd protonvpn-cli/
makepkg
sudo pacman -U protonvpn-cli-*
cd ..

cd protonvpn-gui/
makepkg
sudo pacman -U protonvpn-gui-*
cd ..

cd protonvpn/
makepkg
sudo pacman -U protonvpn-* 
cd ..

echo -e "${BO}====================[${RED}Deleting AUR dependencies...${BO}]====================${NC}"
rm -rf python-proton-client/
rm -rf python-protonvpn-nm-lib/
rm -rf protonvpn-cli/
rm -rf protonvpn-gui/
rm -rf protonvpn/
echo -e "${LG}All Complete!"
echo -e "${PUR}created by https://github.com/000Daniel${NC}"