sudo echo ""
#!/bin/bash
correcting owner of /opt
sudo chown 1000:1000 /opt
echo -en "Installing pretty things"
echo -en "Installing Starship prompt."
cp .zshrc ~/ -f
cp starship.toml ~/.config/ -f
curl -sS https://starship.rs/install.sh | sh
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
sudo unzip JetBrainsMono /usr/share/fonts/
source ~/.zshrc
clear
echo -en "Installing hackery thingzz"
echo -en "Rocking you"
wget https://github.com/praetorian-inc/Hob0Rules/raw/master/wordlists/rockyou.txt.gz
gunzip rockyou.txt.gz
sudo mv rockyou.txt /usr/share/wordlists
echo -en "Installing winPEAS"
wget https://raw.githubusercontent.com/carlospolop/PEASS-ng/master/winPEAS/winPEASbat/winPEAS.bat -O /opt/winPEAS.bat
wget https://github.com/carlospolop/PEASS-ng/releases/download/20220904/winPEASany.exe -O /opt/winPEASany.exe
echo -en "installing Php-Reverse-Shell"
git clone https://github.com/xdayeh/Php-Reverse-Shell.git /opt/Php-Reverse-Shell
echo -en "Installing Impacket"
git clone https://github.com/SecureAuthCorp/impacket.git /opt/impacet
echo -en "Installing BitsAdmin"
git clone https://github.com/bitsadmin/wesng.git /opt/bitsadmin/
sudo apt update && sudo apt upgrade
sudo apt install enum4linux bloodhound neo4j grc
pip3 install bs4 lxml stegoveritas pwncat-cs neovim exa pycp