#!/bin/bash
################################################################################
# install.sh
# This script installs brew packages from Brefile
################################################################################
source ${PWD}/variables.sh
source ${PWD}/setup.sh
################################################################################
# Functions
################################################################################
################################################################################
# Installs packages from dotfiles Brewfile
################################################################################
install() {
    # Test to see if dependencies are installed. If they are:
    if [ -x "$(command -v fzf)" ] && [ -x "$(command -v nvm)"]; then
        echo -e "${Cya}Starting dotfile setup...${NC}"
        # mkdir $HOME/nvm # Make nvm directory
        setup
    else
        # Alert user to install dependencies and stop script
        echo -e "${Red}Please install fzf and nvm, then re-run this script!${NC}"
        exit 1
    fi
}
################################################################################
# Install dotenv
################################################################################
install
