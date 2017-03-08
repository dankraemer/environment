# #############################################################################
#  _____                _  __                                   
# |  __ \              | |/ /                                   
# | |  | | __ _ _ __   | ' / _ __ __ _  ___ _ __ ___   ___ _ __ 
# | |  | |/ _` | '_ \  |  < | '__/ _` |/ _ \ '_ ` _ \ / _ \ '__|
# | |__| | (_| | | | | | . \| | | (_| |  __/ | | | | |  __/ |   
# |_____/ \__,_|_| |_| |_|\_\_|  \__,_|\___|_| |_| |_|\___|_|   
#
# Created by: Dan Kraemer  
# (c) 2017
#
# Description:
#   Install Environment Setup
#
# #############################################################################

SCRIPT_MSG=" [INSTALL ENV] "

# Backup old configuration files
echo $SCRIPT_MSG"Backup old config files"
#mkdir ~/.old
#mv ~/.bashrc    ~/.old/.bashrc.old
#mv ~/.gitconfig ~/.old/.gitconfig.old
#mv ~/.ssh       ~/.old/.ssh.old
#mv ~/.tmux.conf ~/.old/.tmux.conf.old
#mv ~/.vim       ~/.old/.vim.old
#mv ~/.vimrc     ~/.old/.vimrc.old

# Create the Symbolic Links for new configuration files
echo $SCRIPT_MSG"Create links for new config files"
ln -s ~/.env_setup/configs/bash_aliases ~/.bash_aliases 
ln -s ~/.env_setup/configs/gitconfig    ~/.gitconfig 
ln -s ~/.env_setup/configs/tmux.conf    ~/.tmux.conf 
ln -s ~/.env_setup/configs/ssh/config   ~/.ssh/config 
ln -s ~/.vim/vimrc                      ~/.vimrc 

# Protect SSH configuration
chmod 600 $HOME/.ssh/*

# Add custom scripts and binaries to PATH
echo 'PATH=$PATH:$HOME/.env_setup/bin' >> .bashrc
echo 'PATH=$PATH:$HOME/.scripts/'      >> .bashrc


echo $SCRIPT_MSG"New Environment Installed!"
