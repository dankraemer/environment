#!/bin/bash
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
##############################################################################

SCRIPT_MSG=" [ENV] "

backup_setup() {
  echo "$SCRIPT_MSG""Backup old config files"
  if [ -d "$HOME"/.old ]; then
    echo "$SCRIPT_MSG""Directory $HOME/.old already exists"
  else
    echo "$SCRIPT_MSG""Create $HOME/.old directory"
    mkdir "$HOME"/.old
  fi
}

backup_file() {
  if [ -f "$HOME"/."$1" ]; then
    echo "$SCRIPT_MSG""Backup $HOME/.$1 file"
    case $1 in
      bashrc)
        cp "$HOME"/."$1" "$HOME"/.old/."$1".old
        ;;
      *)
        mv "$HOME"/."$1" "$HOME"/.old/."$1".old
        #cp "$HOME"/."$1" "$HOME"/.old/."$1".old
        ;;
    esac
  else
    echo "$SCRIPT_MSG""File $HOME/.$1 doesn't exist"
  fi
}

backup_dir() {
  if [ -d "$HOME"/."$1" ]; then
    echo "$SCRIPT_MSG""Backup $HOME/.$1 directory"
    cp -rf "$HOME"/."$1" "$HOME"/.old/."$1"
  else
    echo "$SCRIPT_MSG""Directory $HOME/.$1 doesn't exist"
  fi
}

setup_config() {
  echo "$SCRIPT_MSG""Setup config for $HOME/.$1"
  case $1 in
    bashrc)
      if grep -q ".env_setup" ".$1"; then
        echo "$SCRIPT_MSG""PATH already in $HOME/.$1"
      else
        echo 'PATH=$PATH:$HOME/.env_setup/bin' >> .bashrc
        echo 'PATH=$PATH:$HOME/.scripts/'      >> .bashrc
      fi
      ;;
    vimrc)
      ln -s "$HOME"/.vim/"$1" "$HOME"/."$1"
      ;;
    ssh/config)
      ln -s "$HOME"/.env_setup/configs/"$1" "$HOME"/."$1"
      chmod 600 "$HOME"/.ssh/*
      ;;
    *)
      ln -s "$HOME"/.env_setup/configs/"$1" "$HOME"/."$1"
      ;;
  esac
}

echo "$SCRIPT_MSG""Installing Environment ..."

backup_setup

backup_file  bashrc
setup_config bashrc

backup_file  bash_aliases
setup_config bash_aliases

backup_file  gitconfig
setup_config gitconfig

backup_file  tmux.conf
setup_config tmux.conf

backup_dir vim
backup_file  vimrc
setup_config vimrc

backup_dir ssh
backup_file  ssh/config
setup_config ssh/config

echo "$SCRIPT_MSG""New Environment Installed!"

