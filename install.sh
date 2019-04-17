#!/usr/bin/env bash
function configureDiffSoFancy(){
    sudo ln -s $(readlink -f diff-so-fancy/diff-so-fancy) /usr/local/bin/diff-so-fancy

    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
    git config --global color.ui true
    git config --global color.diff-highlight.oldNormal    "red bold"
    git config --global color.diff-highlight.oldHighlight "red bold 52"
    git config --global color.diff-highlight.newNormal    "green bold"
    git config --global color.diff-highlight.newHighlight "green bold 22"
    git config --global color.diff.meta       "yellow"
    git config --global color.diff.frag       "magenta bold"
    git config --global color.diff.commit     "yellow bold"
    git config --global color.diff.old        "red bold"
    git config --global color.diff.new        "green bold"
    git config --global color.diff.whitespace "red reverse"
}

function syncFiles(){
    sed -ri "s/fabio/$(whoami)/g" zshrc

    cp oh-my-zsh/themes/ziggoto.zsh-theme ~/.oh-my-zsh/themes
    cp zshrc ~/.zshrc
    cp tmux.conf ~/.tmux.conf
    cp tmux.conf.local ~/.tmux.conf.local
    # cp vimrc ~/.vimrc
    cp generate.vim ~/.vimrc

    source ~/.zshrc
    (vim)
    echo '' >> ~/.vimrc
    cat custom.vim >> ~/.vimrc
}

function downloadDependecies(){
    if which apt 1>/dev/null; then
        echo "Updating repositories"
        sudo apt update

        echo "Downloading packages"
        sudo apt install -y curl wget vim zsh tmux less fonts-powerline xclip

        # Install Diff-so-Fancy
        cd /temp
        wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
        chmod u+x diff-so-fancy
        sudo mv diff-so-fancy /usr/local/bin/

        # Makes zsh as default shell
        which zsh | chsh

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
}

function startInstall() {
    checkDependecies

    syncFiles
    configureDiffSoFancy
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
