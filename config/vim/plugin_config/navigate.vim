
if count(g:myvim_plugin_groups, 'navigate')

  " >> FZF <<
  nnoremap <silent><space><space> :Buffers<CR>
  nnoremap <silent><C-p> :Files<CR>

  " Customize fzf colors to match your color scheme
  " - fzf#wrap translates this to a set of `--color` options
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

  " >> NERDTree <<
  " shortcut to start NERDTree
  map <C-E> :NERDTreeToggle<CR>
  map <F2> :NERDTreeToggle<CR>
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  " close vim if the only window left open is NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  let NERDTreeShowHidden=1

  " >> NERDTREE SYNTAX HIGHLIGHT <<
  let g:NERDTreeFileExtensionHighlightFullName = 1
  let g:NERDTreeExactMatchHighlightFullName = 1
  let g:NERDTreePatternMatchHighlightFullName = 1

  " >>  VIM-TMUX-NAVIGATOR <<
  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
  nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
  nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
  nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
  nnoremap <silent> <C-w>\ :TmuxNavigatePrevious<cr>

  " >> ROOTER <<
  let g:rooter_target = '/,*'
  let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']
  let g:rooter_silent_chdir = 1
endif
