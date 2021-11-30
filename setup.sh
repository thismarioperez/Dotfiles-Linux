#!/bin/bash
################################################################################
# setup.sh
# This script sets up the zsh environment
# This script creates symlinks from the home directory
# to any desired dotfiles in ~/dotfiles.
# Run `chmod +x setup.sh` to prevent permission errors before
# running this script.
################################################################################

################################################################################
# Variables
################################################################################
dir=${PWD}                 # dotfiles directory
olddir=$HOME/.dotfiles_old # old dotfiles backup directory
files="vimrc zshrc"        # list of files/folders to symlink in homedir

################################################################################
# Functions
################################################################################
################################################################################
# Alert User when done
################################################################################
process_done() {
    echo -e "${Gre}...done${NC} 🤘"
}

################################################################################
# Create dotfiles_old directory in home directory
################################################################################
setup_olddir() {
    echo -e "${Cya}Creating $olddir for backup of any existing dotfiles in ~${NC}"
    mkdir -p $olddir
    process_done
}

install_packages() {
    # oh-my-zsh installer
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    process_done
}

################################################################################
# setup_dotfiles
# Backup current dotfiles and symlink targets to dotfiles
################################################################################
setup_dotfiles() {
    # Change to the dotfiles directory
    echo -e "${Cya}Changing to the $dir directory${NC}"
    cd $dir
    process_done

    # Backup any existing dotfiles in homedir to dotfiles_old directory,
    # then create new symlinks
    for file in $files; do
        echo -e "${Cya}Moving existing dotfile .$file from ${HOME} to $olddir${NC}"
        mv -v $HOME/.$file $olddir/
        echo -e "${Cya}Creating symlink to $file in home directory.${NC}"
        ln -vs $dir/$file $HOME/.$file
        process_done
    done
}

setup() {
    # Test to see if zsh is installed.  If it is:
    if [[ "$SHELL" == *"zsh"* ]]; then
        # assume Zsh
        setup_olddir
        install_packages
        setup_dotfiles
        echo -e "${Gre}Dotfiles setup complete.${NC} 🎉"
        exit
    else
        # assume something else
        # Alert user to install zsh and stop script
        echo -e "${Red}Please install zsh, then re-run this script!${NC}"
        echo -e "${Whi}Visit${NC} ${Cya}https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH${NC} ${Whi}for installation instructions.${NC}"
        exit 1
    fi
}
