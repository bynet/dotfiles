execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on


source ~/dotfiles/mappings.vim 
source ~/dotfiles/settings.vim 
source ~/dotfiles/tab.vim 

if $SHELL=='/usr/local/bin/fish'
  set shell=/bin/sh
endif

