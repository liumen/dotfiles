if has("gui_running")
  source ~/.config/vim/main.vim
else
  source $XDG_CONFIG_HOME/vim/main.vim
endif
