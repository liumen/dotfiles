" Subfunction for status line
" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  end
  return ''
endfunction


" Functions for quick resizing fonts in gvim
if has("unix")
  function! FontSizePlus ()
    let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
    let l:gf_size_whole = l:gf_size_whole + 1
    let l:new_font_size = ' '.l:gf_size_whole
    let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
  endfunction

  function! FontSizeMinus ()
    let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
    let l:gf_size_whole = l:gf_size_whole - 1
    let l:new_font_size = ' '.l:gf_size_whole
    let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
  endfunction

else
  function! FontSizePlus ()
    let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
    let l:gf_size_whole = l:gf_size_whole + 1
    let l:new_font_size = ':h'.l:gf_size_whole
    let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
  endfunction

  function! FontSizeMinus ()
    let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
    let l:gf_size_whole = l:gf_size_whole - 1
    let l:new_font_size = ':h'.l:gf_size_whole
    let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
  endfunction
endif


" Options for Latex files
function! SetTexOptions()
  let &tw=100
  set colorcolumn=100
  let g:tex_conceal='abdmg'
  set spell
  set background=light
  let g:airline_theme  = 'solarized' 
  colorscheme solarized8_high
endfunction


" Options for Octave files
function! SetOctaveOptions()
  if exists("+omnifunc")
    " Use keywords from Octave syntax language file for autocomplete
    if &omnifunc == ""
      setlocal omnifunc=syntaxcomplete#Complete
    endif
  endif
  set filetype=octave
  let &commentstring="% %s"
endfunction
