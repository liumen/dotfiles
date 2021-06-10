" set vim runtime path
if has('nvim')
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath=&runtimepath
endif

" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Install plugins
call plug#begin()

if count(myvim_plugin_groups, 'ui')
  Plug 'zhaocai/GoldenView.Vim' 
  Plug 'benmills/vimux'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-sensible'
  Plug 'lilydjwg/colorizer'
  Plug 'morhetz/gruvbox'
  Plug 'myusuf3/numbers.vim'
  Plug 'majutsushi/tagbar'
  Plug 'luochen1990/rainbow'
  Plug 'mhinz/vim-startify'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'lifepillar/vim-solarized8'
  Plug 'Yggdroot/indentLine'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
endif

if count(g:myvim_plugin_groups, 'edit')
  Plug 'mbbill/undotree'
  Plug 'maxbrunsfeld/vim-yankstack'
  Plug 'jiangmiao/auto-pairs'
  Plug 'vim-scripts/fcitx.vim'
  " Plug 'rhysd/vim-grammarous', {'for':'tex'}
  Plug 'scrooloose/nerdcommenter'
  Plug 'wellle/targets.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'terryma/vim-expand-region'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'kshenoy/vim-signature' "show marks in number column
  Plug 'wellle/targets.vim'
endif

if count(g:myvim_plugin_groups, 'git')
  Plug 'rhysd/committia.vim'
  Plug 'junegunn/gv.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
endif

if count(g:myvim_plugin_groups, 'ide')
  Plug 'neoclide/coc.nvim',{'branch' : 'release'}    
  Plug 'jackguo380/vim-lsp-cxx-highlight'
  Plug 'vim-syntastic/syntastic'
  Plug 'ludovicchabant/vim-gutentags' 
  Plug 'SirVer/ultisnips'
  Plug 'Chiel92/vim-autoformat'
  Plug 'voldikss/vim-floaterm'
  Plug 'honza/vim-snippets'
endif

if count(g:myvim_plugin_groups, 'language')
  Plug 'iamcco/markdown-preview.vim', {'for' : 'markdown'}
  Plug 'jvirtanen/vim-octave' "Octave/Matlab, {'for' : 'octave'}
  Plug 'kana/vim-operator-user' "useful for vim-clang-format
  Plug 'vim-scripts/DoxygenToolkit.vim'
  Plug 'lervag/vimtex', {'for' : 'tex'}  
  Plug 'rhysd/vim-clang-format' 
endif

if count(g:myvim_plugin_groups,'motion')
  Plug 'tpope/vim-unimpaired' "pairs of mappings
  Plug 'yuttie/comfortable-motion.vim' "smooth-scrolling
  Plug 'unblevable/quick-scope' "highlight characters for f, F, t, T
  Plug 'bkad/CamelCaseMotion' "moving through camel-case words
endif

if count(g:myvim_plugin_groups, 'navigate')
  Plug 'mileszs/ack.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'airblade/vim-rooter'
endif

call plug#end()

let config_dir = $XDG_CONFIG_HOME."/vim/plugin_config/"
for group in g:myvim_plugin_groups
  exe 'source '.config_dir.group.'.vim'
endfor
