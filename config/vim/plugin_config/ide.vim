
if count(g:myvim_plugin_groups, 'ide')

  " >> COC.NVIM <<
  let g:coc_global_extensions = [ 'coc-cmake', 'coc-vimtex'] 
  "don't give |ins-completion-menu| messages
  set shortmess+=c
  set cmdheight=2    "Better display for messages at the bottom
  set updatetime=300 "Default update time 4000 too slow
  set signcolumn=yes "show sign columns
  " Use tab to trigger completion with characters ahead and navigate
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :  coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Setting up the language server
  " call coc#config("languageserver", {
  " \ 'ccls':  {
  " \   "command": "ccls",
  " \   "trace.server": "verbose",
  " \   "filetypes": ["c", "cpp", "cuda", "objc", "objcpp"],
  " \   "rootPatterns": [".ccls", "compile_commands.json", ".vim/", ".git/", ".hg/"],
  " \   "initializationOptions": {
  " \     "cache": { "directory" : "/tmp/ccls" },
  " \     "highlight": {"lsRanges" : true}
  " \     }
  " \   }
  " \ })

  " jump to definitions / references
  nmap gi <Plug>(coc-implementation)
  nmap gd <Plug>(coc-definition)
  nmap gt <Plug>(coc-type-definition)
  nmap gr <Plug>(coc-references)
  nn <silent> K :call CocActionAsync('doHover')<CR>
  au CursorHold * call CocActionAsync('highlight')
  au CursorHoldI * call CocActionAsync('showSignatureHelp')


  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end


  " >> SYNTASTIC <<
  " maps for Syntastic
  if !executable('ccls')
    let g:syntastic_cpp_cpplint_exec = 'cpplint'
    let g:syntastic_cpp_checkers = ['gcc', 'cpplint']
  endif

  nnoremap <silent> <F8> :Errors<CR>
  nnoremap <silent> <F7> :lclose<CR>
  let g:syntastic_quiet_messages = { "regex": [
        \ '\mpossible unwanted space at "{"',
        \ ] }
  " cpp config files for includes
  let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
  " let g:syntastic_tex_checkers = ['lacheck', 'chktex', 'proselint']
  let g:syntastic_tex_checkers = ['chktex', 'proselint']
  let syntastic_aggregate_errors = 1
  let g:syntastic_error_symbol = "✗"
  let g:syntastic_warning_symbol = "⚠"
  let g:syntastic_style_error_symbol = "!"
  let g:syntastic_style_warning_symbol = "?"
  let g:syntastic_mode_map = {'passive_filetypes':['cpp']}

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  " >> GUTENTAGS <<
  let g:gutentags_add_default_project_roots = 0
  let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
  let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
  command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
  " Time to regenerate the tags
  let g:gutentags_generate_on_new = 1
  let g:gutentags_generate_on_missing = 1
  let g:gutentags_generate_on_write = 1
  let g:gutentags_generate_on_empty_buffer = 0
  " Let ctags generate more info
  let g:gutentags_ctags_extra_args = [
        \ '--tag-relative=yes',
        \ '--fields=+ailmnS',
        \ ]


  " >> ULTISNIPS <<
  let g:UltiSnipsSnippetsDir = "~/.config/vim/plugin_config/private_snippets/"
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
  set runtimepath^=~/.config/vim/plugin_config/
  let g:UltiSnipsSnippetDirectories=["UltiSnips", "private_snippets"]


  " >> VIM-FLOATERM <<
  let g:floaterm_keymap_toggle = '<F5>'
  let g:floaterm_keymap_prev   = '<F6>'
  let g:floaterm_keymap_next   = '<F7>'
  let g:floaterm_keymap_new    = '<F8>'
  let g:floaterm_keymap_kill   = '<leader>q'

endif "ide group settings

