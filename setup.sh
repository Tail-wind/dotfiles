#!/bin/sh

get_os_ver () {
  if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
  elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
  elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
  elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
  elif [ -f /etc/SuSe-release ]; then
    # Older SuSE/etc.
    ...
  elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    ...
  else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
  fi
  echo "Got OS/Ver of ${OS}, ${VER}"
}

find_package_manager () {
  get_os_ver
  if [ "$OS" = Ubuntu ] || [ "$OS" = "Debian GNU/Linux" ]
  then
	MANAGER="apt-get"
  elif [ "$OS" = "Alpine Linux" ]
  then
	MANAGER="apk"
  elif \
	[ "$OS" = "Amazon Linux" ] || \
	[ "$OS" = "CentOS Linux" ] || \
	[ "$OS" = "Fedora" ] || \
	[ "$OS" = "Fedora Linux" ] || \
	[ "$OS" = "Red Hat Enterprise Linux" ] || \
	[ "$OS" = "Red Hat Enterprise Linux Server" ]
  then
	MANAGER="yum"
  else
	# Didn't match any of our known package managers, exit and dump OS info to std:out
	MANAGER="unknown"
	echo "Package manager unknown, got OS/version of ${OS}, ${VER}"
	exit 1
  fi
  echo "Package manager to use: ${MANAGER}"
}

find_package_manager
# pip install powerline-status
# ln -s ~/dotfiles/.bash_profile ~/.bash_profile
# ln -s ~/dotfiles/.bashrc ~/.bashrc
# ln -s ~/dotfiles/.vimrc ~/.vimrc
# git clone https://github.com/powerline/fonts.git ~/.powerlinefonts
# cd ~/.powerlinefonts
# ./install.sh
# cd ..
# rm - rf .powerlinefonts
# cd dotfiles
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
# ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf