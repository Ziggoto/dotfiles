#!/usr/bin/env bash
function syncFiles(){
    cp oh-my-zsh/themes/ziggoto.zsh-theme ~/.oh-my-zsh/themes
    cp zshrc ~/.zshrc
    cp tmux.conf ~/.tmux.conf
    cp tmux.conf.local ~/.tmux.conf.local
    cp vimrc ~/.vimrc

    source ~/.zshrc
}

function downloadDependecies(){
    if which apt 1>/dev/null; then
        echo "Downloading packages";
        sudo apt install -y curl vim zsh less fonts-powerline

        # Install OhMyZSH
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    else
        echo "This script only works with APT"
        exit 1;
    fi
}

function checkIfHasPermission(){
    if sudo id 1>/dev/null; then
        echo "Checking for APT"
    else
        echo "You must have root privileges"
        exit 1
    fi
}

function checkDependecies(){
    checkIfHasPermission
    downloadDependecies

    # Makes zsh as default shell
    which zsh | chsh
    syncFiles
}

function startInstall() {
    checkDependecies
}

cat <<-HEREDOC
============================== ALERT!!! ==========================================

This script only had been tested on Ubuntu 18.04. It may not work on other distros.

Do you still want to try? [Y/n]
HEREDOC
read beginInstall

case $beginInstall in
    [Yy]* ) startInstall;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
esac
