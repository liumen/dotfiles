if count(myvim_plugin_groups, 'ui')

  " >> GRUVBOX <<
  let g:gruvbox_contrast_dark = "soft"
  let g:gruvbox_italic = 1


  " >> NUMBERS <<
  nnoremap <F3> :NumbersToggle<CR>
  let g:enable_numbers = 1

  " >> TAGBAR <<
  nnoremap <silent> <F12> :TagbarOpen fjc<CR>


  " >> GOLDENVIEW <<
  let g:goldenview__enable_default_mapping = 0
  let g:goldenview__enable_at_startup = 0
  nmap<silent><C-L> <Plug>GoldenViewSplit
  nmap<silent><C-K> <Plug>GoldenViewSwitchMain
  " nmap<F5> :ToggleGoldenViewAutoResize<CR>


  " >> STARTIFY <<
  let startify_custom_header=[
        \'   ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗ ██████╗ ██╗  ██╗██╗',
        \'   ██║   ██║██║████╗ ████║██╔══██╗██╔═══██╗██╔══██╗██║  ██║██║',
        \'   ██║   ██║██║██╔████╔██║██████╔╝██║   ██║██║  ██║███████║██║',
        \'   ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║   ██║██║  ██║██╔══██║██║',
        \'    ╚████╔╝ ██║██║ ╚═╝ ██║██████╔╝╚██████╔╝██████╔╝██║  ██║██║',
        \'     ╚═══╝  ╚═╝╚═╝     ╚═╝╚═════╝  ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝',
        \'          gate gate pāragate pārasaṃgate bodhi svāhā          ',
        \'                                                              ']
  let g:startify_custom_footer=[
        \'    A VIM configuration maintained by '.
        \g:myvim_user_name.
        \' <'.g:myvim_user_email.'> ']
  if has('gui_running')
    hi StartifyFooter  guifg=#87afff
  else
    hi StartifyFooter  ctermfg=111
  endif

  function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
    let centered_lines = map(copy(a:lines),
          \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
  endfunction
  let g:startify_custom_header = s:filter_header(startify_custom_header)
  let g:startfy_padding_left = 6
  autocmd User StartifyReady IndentLinesDisable



  " >> AIRLINE <<
  " enable powerline fonts
  let g:airline_powerline_fonts = 1
  " enable tabline
  let g:airline#extensions#tabline#enabled = 1
  " show tab number in tabline
  let g:airline#extensions#tabline#tab_nr_type = 1
  " make the filename in buffer shorter, not the full path
  let g:airline#extensions#tabline#fnamemod=':t'
  " show buffer number in tabline
  let g:airline#extensions#tabline#buffer_nr_show = 0
  let laststatus = 2
  "  airline symbols dictionary
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.whitespace = 'Ξ'

  " >> INDENTLINE <<
  " stop indentline from concealing quotes
  let g:indentLine_conceallevel = 2
  let g:indentLine_concealcursor = 'vc'
  let g:indentLine_char = '┊'
  " let g:indentLine_char_list = ['|', '¦', '┆', '┊']

  " >> GOYO/LIMELIGHT "
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!

  " >> VIM-RAINBOW <<
  let g:rainbow_active = 1
endif
