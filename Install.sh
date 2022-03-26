#!/bin/bash
read -r -p "On which OS are you? [dnf = 1][apt = 2][pacman = 3]: " response
if [[ "$response" =~ ^([1])$ ]]
then
	sudo dnf update
	sudo dnf upgrade
	sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
	sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
	cd /tmp
	wget https://github.com/Beafowl-Pull/Install-Linux-For-Epitech/raw/main/epitech-emacs.tgz
	wget https://github.com/Beafowl-Pull/Install-Linux-For-Epitech/raw/main/install_criterion.sh
	sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	sh ./install_criterion.sh
	sudo dnf update
	tar zxvf epitech-emcas.tgz
	cd epitech-emacs
	sh ./INSTAL.sh local
	sudo dnf install emacs nano SFML-devel CSFML-devel zsh code gnome-tweaks discord util-linux-user
	chsh -s $(which zsh)
elif [[ "$response" =~ ^([2])$ ]]
then
	apt install update && apt install upgrade
	cd /tmp
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
	sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
	rm -f packages.microsoft.gpg
	wget https://github.com/Beafowl-Pull/Install-Linux-For-Epitech/raw/main/epitech-emacs.tgz
    wget https://github.com/Beafowl-Pull/Install-Linux-For-Epitech/raw/main/install_criterion.sh
	sh ./install_criterion.sh
	tar zxvf epitech-emacs.tgz
	cd epitech-emacs
	sh ./INSTALL.sh local
	apt install apt-transport-https && apt update
	apt install emacs nano SFML-devel CSFML-devel zsh code
	chsh -s $(which zsh)
elif [[ "$response" =~ ^([3])$ ]]
then
	pacman -Syu
	cd /tmp
	pacman -S emacs nano CSFML zsh discord filezilla
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	wget https://github.com/Beafowl-Pull/Install-Linux-For-Epitech/raw/main/epitech-emacs.tgz
    wget https://github.com/Beafowl-Pull/Install-Linux-For-Epitech/raw/main/install_criterion.sh
	curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/visual-studio-code-bin.tar.gz
	tar zxvf visual-studio-code-bin.tar.gz
	cd visual-studio-code-bin
	makepkg -si
	./install_criterion.sh
	tar -xvf epitech-emacs.tgz
	cd epitech-emacs
	sh./INSTALL.sh local
	chsh -s $(which zsh)
else
	echo "Please, answer the good way"
fi
