#!/bin/bash
read -r -p "On which OS are you? [dnf = 1][apt = 2][pacman = 3]" response
if [["$response"=~ ^([1]$ ]]
then
	sudo dnf update
	sudo dnf upgrade
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
	sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
	cd /tmp
	wget https://drive.google.com/drive/folders/1RtciTZCxuWl_A_AuNA1v0toEGkrt5oU_?usp=sharing
	sudo dnf update
	sudo dnf install emacs nano SFML-devel CSFML-devel zsh code
