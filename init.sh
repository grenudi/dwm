#!/bin/sh

#determine distro
DISTRO=$(sudo cat /etc/os-release | grep '^NAME' | grep -o '\".*\"' | grep -o "\w*");
if [ "$DISTRO" = 'void' ]
then
	echo "$DISTRO >> THIS IS VOID LINUX"
	sh 'init/instvoid.sh'
else
	echo "$DISTRO >> THIS IS NOT VOID TRYING ARCH"
	sh 'init/instarch.sh'
fi
#run install dependency for arch or void
