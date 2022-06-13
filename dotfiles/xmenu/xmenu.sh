#!/bin/sh

ICONS=/home/anyiel/.config/xmenu/icons
IMG=IMG:${ICONS}/

cat <<EOF | xmenu -p 0x0:current | sh &
Web Browser	firefox
Terminal 	alacritty 
File manager 	nautilus
Text editor
	neovim 	alacritty -e nvim
	VScode 	code
Spotify 	spotify
Discord 	discord
ScreenShot 	xfce4-screenshooter

Search 		rofi -show drun

Admin
	wifi manager 		nm-connection-editor 
	Bluetooth 		blueman-adapters
	Configuration
		Qtile configuration 	alacritty -e nvim /home/anyel/.config/qtile/config.py
		Neovim configuration 	alacritty -e nvim /home/anyel/.config/nvim/init.vim
	Power options
		Shutdown		shutdown now
		Reboot			reboot
		Sleep			systemctl suspend
EOF
