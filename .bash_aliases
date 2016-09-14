
# #############################################################################
#
# Bash Aliases Settings
# 
#  _____                _  __                                   
# |  __ \              | |/ /                                   
# | |  | | __ _ _ __   | ' / _ __ __ _  ___ _ __ ___   ___ _ __ 
# | |  | |/ _` | '_ \  |  < | '__/ _` |/ _ \ '_ ` _ \ / _ \ '__|
# | |__| | (_| | | | | | . \| | | (_| |  __/ | | | | |  __/ |   
# |_____/ \__,_|_| |_| |_|\_\_|  \__,_|\___|_| |_| |_|\___|_|   
#
# Created by: Dan Kraemer  
# (c) 2016
#
# #############################################################################


# General purpouse alias

alias grep='grep --color'                     # show differences in colour

alias ls='ls -hF --color=tty'                 # classify files in colour
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #
alias cls='clear;ls'
alias clsa='clear;ls -la'
alias x='exit'

# Common locations for RLs devel VMs

alias pub='cd /var/pub/firmware/'
alias instr='cd /home/dka/work/uClinux-dist/user/rl1xx/instrument/'
alias uclinux='cd /home/dka/work/uClinux-dist/'
alias dvr='cd /home/dka/work/linux-2.6/arch/nios2/drivers/'
alias linux='cd /home/dka/work/linux-2.6/'
alias dts='cd /home/dka/work/rl1xx/syn/altera/'

# Local machine Cygwin shortcuts

alias vm1='run mintty ssh dka@rl131-a'
alias vm2='run mintty ssh dka@10.83.157.179'
alias herc='run mintty ssh dka@hercules'

alias launch='~/scripts/launch.sh'

# Virtual Machines shortcuts

alias vm131='ssh dka@rl131-a'
alias vm1xx='ssh dka@10.83.157.179'           # ssh dka@rl1xx-a
alias her='ssh dka@hercules'

