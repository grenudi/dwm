#!/bin/sh

#determine distro

DISTRO=$(sudo cat /etc/os-release | grep '^NAME' | grep -o '\".*\"' | grep -o "\w*");

#run install dependency for arch or void
if [ "$DISTRO" = 'void' ]
then
	echo "$DISTRO >> THIS IS VOID LINUX"
	sh 'init/instvoid.sh'
else
	echo "$DISTRO >> THIS IS NOT VOID TRYING ARCH"
	sh 'init/instarch.sh'
fi

#install DWM
sudo make clean install;

#determine if i've already paste in initrc

INITRCMARK=$(cat ~/.initrc | grep -o "#DWMMARK");
if [ "$INITRCMARK" = "#DWMMARK" ]
then
	echo "\nINITRC NOTHING TO DO, ALREDY PATCHED\n"
else
	echo "\nPATCHING INITRC\n"
	cp init/xinitrc ~/.xinitrc
fi

#launch dwm to test)
xinit dwm;
