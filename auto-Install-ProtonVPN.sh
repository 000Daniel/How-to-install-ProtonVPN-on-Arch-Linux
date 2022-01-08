#!/usr/bin/bash

userName=*

PROMPT_COMMAND='echo -en "\033]0;Auto ProtonVPN installer\a"'
BO='\033[0;33m'
NC='\033[0m'
RED='\033[0;31m'
LG='\033[1;32m'
PUR='\033[0;35m'

echo -e "${BO}=====================[${RED}Installing dependencies...${BO}]=====================${NC}"
sudo pacman -S git python python-pythondialog python-pyxdg python-keyring python-jinja python-distro python-systemd python-requests python-bcrypt python-gnupg python-pyopenssl
echo -e "${BO}===================[${RED}Downloading AUR dependencies...${BO}]==================${NC}"
cd "/home/"$userName"/Downloads/"
git clone https://aur.archlinux.org/protonvpn.git
git clone https://aur.archlinux.org/protonvpn-cli.git
git clone https://aur.archlinux.org/protonvpn-gui.git
git clone https://aur.archlinux.org/python-protonvpn-nm-lib.git
git clone https://aur.archlinux.org/python-proton-client.git
echo -e "${BO}===================[${RED}Installing AUR dependencies...${BO}]===================${NC}"
echo -e "${LG}installing python-proton-client..."
cd python-proton-client/
makepkg
sudo pacman -U python-proton-client-*
cd ..
echo -e "${LG}installing python-protonvpn-nm-lib..."
cd python-protonvpn-nm-lib/
makepkg
sudo pacman -U python-protonvpn-nm-lib-*
cd ..
echo -e "${LG}installing protonvpn-cli..."
cd protonvpn-cli/
makepkg
sudo pacman -U protonvpn-cli-*
cd ..
echo -e "${LG}installing protonvpn-gui..."
cd protonvpn-gui/
makepkg
sudo pacman -U protonvpn-gui-*
cd ..
echo -e "${LG}installing protonvpn..."
cd protonvpn/
makepkg
sudo pacman -U protonvpn-* 
cd ..
echo -e "${BO}====================[${RED}Deleting AUR dependencies...${BO}]====================${NC}"
echo -e "${RED}deleting python-proton-client installation folder."
rm -rf python-proton-client/
echo -e "${RED}deleting python-protonvpn-nm-lib installation folder."
rm -rf python-protonvpn-nm-lib/
echo -e "${RED}deleting protonvpn-cli installation folder."
rm -rf protonvpn-cli/
echo -e "${RED}deleting protonvpn-gui installation folder."
rm -rf protonvpn-gui/
echo -e "${RED}deleting protonvpn installation folder."
rm -rf protonvpn/
echo -e "${LG}All Complete!"
echo -e "${PUR}created by https://github.com/000Daniel${NC}"
