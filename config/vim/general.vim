"================================================
" => GENERAL
"================================================
"
set nocompatible "ward off unexpected things that your distro might have made

set autoread "set to auto read when a file is changed from the outside

" cd %:p:h

set encoding=utf8 "standard encoding utf8

set fencs=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

set ffs=unix,dos,mac " Use Unix as the standard file type

set timeoutlen=500 " time to wait for a command

let mapleader = g:myvim_leader_key


"================================================
" => USER INTERFACE
"================================================

" wildmenu and wildmode are used for command line completion.
set wildmode=list:longest,full

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.aux,*.bbl,*.blg,*.lof,*.log,*.lot,*.toc

if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

syntax on "enable syntax highlighting

set cmdheight=1 " Height of the command bar

set hidden " A buffer becomes hidden when it is abandoned

set whichwrap+=<,>,h,l,[,] " Automatically wrap left and right

if has("gui_running")
    set guioptions-=T "remove toolbars
    set guioptions-=m "remove menu bars
    set guioptions-=r "remove right hand scroll bar
    set guioptions-=L "remove left hand scoll bar
endif

set cursorline

"================================================
" => TEXT AND INDENTATION
"================================================
let &shiftwidth=myvim_tabwidth

let &tabstop=myvim_tabwidth

let &softtabstop=myvim_tabwidth

set expandtab "Use spaces instead of tabs

set smarttab "Be smart when using tabs ;)

set linebreak "set lbr "equivalent?

filetype indent on " Enable file type detection.

" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
" set si "smart indent
set nosmartindent " smartindent has difficulty handling Python comments

set wrap "Wrap lines

set nolist  " list disables linebreak

set wrapmargin=0

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Format the status line
set statusline=\[%{&ff}:%{&fenc}:%Y]\ \ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\%r%{getcwd()}%h\ %=\ \Line:\ %5l/%5L\ \ \ \Column:\ %5c\ \[%P%*]


"================================================
" => SEARCH AND VISUAL MODE
"================================================
set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases
set hlsearch " Highlight search results


"================================================
" => COLOR AND FONTS
"================================================
" color support
if !has('gui_running')
    set t_Co=256 " Enable true colors support
endif
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" load a colorscheme
set background=dark
execute "colorscheme " myvim_default_colorscheme

" make terminal background transparent
if !has('gui_running') && myvim_terminal_transparency
    hi Normal ctermbg=NONE guibg=NONE
end


" Enable italics in terminal
set t_ZH=[3m
set t_ZR=[23m

" font setting for gvim
if has("gui_running")
    " set guifont=SauceCodePro\ Nerd\ Font\ 12
  if g:os == "Darwin"
    set guifont=Hack\ Nerd\ Font\ Mono:h12
  elseif g:os == "Linux"
    set guifont=Hack\ Nerd\ Font\ Mono\ 10
  endif

  nmap <S-F11> :call FontSizeMinus()<CR>
  nmap <F11> :call FontSizePlus()<CR>
endif


"================================================
" => BACKUP
"================================================
" Turn backup off, since most stuff is in SVN, git etc anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile
set undolevels=700

set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" set viminfo=%,<800,'10,/50,:100,h,f0,n~/.vim/.viminfo
autocmd BufWrite * :mksession! ~/.vim/session.vim

