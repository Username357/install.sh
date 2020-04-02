#!/usr/bin/env bash

# update the package list
apt update -qq

# install updates
apt upgrade -y -qq

# install a program if not already installed
install()
{
   if 
      ! [ -x "$(command -v  $1)" ]
   then
      echo $1: installing...
      apt install -y $2
      apt install -y $3
      echo $2: installed
   else
      echo $2: installed
   fi
}

# install my programs
install R r-base
install git git
install vim vim vim-gtk # vim-gtk is required for vim to be able to copy to system clipboard
install xcalib xcalib
install gpodder gpodder
install curl curl # curl is required for a good vim plugin I use called vim-plug

# download my .vimrc file if not present
   cd ~
   if ! [ -e .vimrc ]; then
      echo Downloading .vimrc file from github.
      git clone https://github.com/Username357/vimrc.git
      mv ~/vimrc/.vimrc ~
      sudo rm -r vimrc
   else
      echo .vimrc: already downloaded
   fi

# # download my xfce4-terminal terminalrc file if not present
# if ! [ -e ~/.config/xfce4 ]; then
#    mkdir ~/.config/xfce4
# fi
# if ! [ -e ~/.config/xfce4/terminal ]; then
#    mkdir ~/.config/xfce4/terminal
# fi
# if ! [ -e ~/.config/xfce4/terminal/terminalrc ]; then
#    cd ~/.config/xfce4/terminal
#    git clone https://github.com/emanresuu/terminalrc.git
#    mv ~/.config/xfce4/terminal/terminalrc/terminalrc ~/.config/xfce4/terminal
#    sudo rm -r ~/.config/xfce4/terminal/terminalrc
#    cd
# fi

# # install rstudio
#    cd ~
#    if ! [ -e rstudio ]; then
#       echo rstudio: installing
#       firefox https://www.rstudio.com/products/rstudio/download/
#    else
#       echo rstudio: already installed
#    fi

# # install JDK
#    dpkg -s oracle-java8-installer &>/dev/null
#    if [ $? = 1 ]; then
#        echo oracle-java8-installer: installing
#        sudo add-apt-repository ppa:webupd8team/java
#        sudo apt-get update
#        sudo apt-get install oracle-java8-installer
#    else 
#       echo oracle-java8: already installed
#    fi

# Remap the CapsLock to Esc, if not already done.
if grep -q "setxkbmap -option caps:escape" ~/.profile; then
   echo The CapsLock key had already been remaped to Esc.
else
   echo "setxkbmap -option caps:escape" >> ~/.profile
   echo The CapsLock key has been remaped to Esc.
fi

