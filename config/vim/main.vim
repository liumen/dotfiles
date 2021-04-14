"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗ ██████╗ ██╗  ██╗██╗
"   ██║   ██║██║████╗ ████║██╔══██╗██╔═══██╗██╔══██╗██║  ██║██║
"   ██║   ██║██║██╔████╔██║██████╔╝██║   ██║██║  ██║███████║██║
"   ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║   ██║██║  ██║██╔══██║██║
"    ╚████╔╝ ██║██║ ╚═╝ ██║██████╔╝╚██████╔╝██████╔╝██║  ██║██║
"     ╚═══╝  ╚═╝╚═╝     ╚═╝╚═════╝  ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"================================================
" => GLOBAL CONFIG
"================================================
let g:myvim_user_name = 'WU,Qihang'
let g:myvim_user_email = 'wu.qihang@hotmail.com'
let g:myvim_default_colorscheme = 'gruvbox'
let g:myvim_terminal_transparency = 0
let g:myvim_column_width = 80
let g:myvim_tabwidth = 2

let g:myvim_plugin_groups = ['edit', 'git', 'ide', 'language', 'motion', 'navigate', 'ui']
let g:myvim_leader_key=" "

"================================================
" System/VIM version specific settings

" Source basic configs
source $XDG_CONFIG_HOME/vim/initialize.vim
source $XDG_CONFIG_HOME/vim/plugins.vim
source $XDG_CONFIG_HOME/vim/functions.vim
source $XDG_CONFIG_HOME/vim/general.vim
source $XDG_CONFIG_HOME/vim/keymap.vim
source $XDG_CONFIG_HOME/vim/autocmd.vim
