if count(g:myvim_plugin_groups, 'edit')


  " >> AUTOPAIRS <<
  let g:AutoPairsShortcutToggle = '<F4>'
  let g:AutoPairsShortcutJump=']'
  autocmd filetype tex let b:AutoPairs = g:AutoPairs
  autocmd filetype tex let b:AutoPairs['$'] = '$'


  " >> EASY ALIGN <<
  " EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)


  " >> EXPAND REGION <<
  vmap v <Plug>(expand_region_expand)
  vmap <C-v> <Plug>(expand_region_shrink)
  let g:expand_region_text_objects = {
        \ 'iw'  :0, 'iW'  :0,
        \ 'i"'  :0, 'i''' :0,  'i]'  :1,
        \ 'ib'  :1, 'iB'  :1,
        \ 'il'  :1, 'ip'  :0, 'ie'  :0,
        \ }


  " >> NERD COMMENTER <<
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1
  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1
  " Add your own custom formats or override the defaults
  let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }
  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 1
  " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTrimTrailingWhitespace = 1
  " Enable NERDCommenterToggle to check all selected lines is commented or not
  let g:NERDToggleCheckAllLines = 1
  nmap gc <Plug>NERDCommenterToggle

  " >> UNDOTREE <<
  nnoremap <leader>u :UndotreeToggle<CR>
  let g:undotree_SetFocusWhenToggle=1


  " >> VIM-AUTOFORMAT "
  nnoremap <C-i> :Autoformat<CR>
  autocmd FileType vim let b:autoformat_autoindent=0


  " >> YANKSTACK <<
  nmap ,p <Plug>yankstack_substitute_older_paste
  nmap ,P <Plug>yankstack_substitute_newer_paste

endif
