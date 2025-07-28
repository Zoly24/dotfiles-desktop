#
# ~/.bashrc
#

# If not running interactively, don't do anything

fastfetch

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

PS1='[\u@\h \W]\$ '
alias desktopconfig='/usr/bin/git --git-dir=/home/zoly/.dotfiles_desktop_temp/ --work-tree=/home/zoly'
alias desktopconfig='/usr/bin/git --git-dir=/home/zoly/.dotfiles-desktop/ --work-tree=/home/zoly'
