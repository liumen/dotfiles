
if has("autocmd")

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

  autocmd BufRead,BufEnter,BufNewFile *.cpp,*.in,*.inst set filetype=cpp
  autocmd BufRead,BufEnter,BufNewFile *.cfg set filetype=tex
  autocmd BufRead,BufEnter,BufNewFile *.inst,*.in set syntax=cpp
  autocmd BufRead,BufEnter,BufNewFile, *.vrapperrc set syntax=vim

  " This causes some characters to be added to the 'iskeyword' variable only
  " when editing .c,.h,.cpp,.cc files, then ctrlp plugin <C-p> can do completion for LaTeX References in Vim
  autocmd BufRead,BufEnter,BufNewFile *.c,*.h,*.cpp,*.cc set iskeyword+=:,-,_,>
  " Normally don't automatically format 'text' as it is typed, only do this
  " with comments, at 79 characters.
  au BufNewFile,BufEnter *.c,*.h,*.cc,*.cpp,*.java,*.jsp set formatoptions-=t
  au BufNewFile,BufEnter *.c,*.h,*.cc,*.cpp,*.java,*.jsp let &tw=myvim_column_width
  au BufRead,BufNewFile,BufEnter *.c,*.h,*.cpp,*.cc let &colorcolumn=myvim_column_width " Delineate maximum column width
  autocmd BufRead,BufNewFile,BufEnter *.cpp,*.c,*.cc,*.py,*.h,*.hpp :EnableGoldenViewAutoResize

  " Show tab characters in Python. Visual Whitespace.
  autocmd filetype python,xml set list
  " autocmd filetype python,xml set listchars=tab:>.,trail:.,extends:#,nbsp:.

  " This causes colon, underscore and hyphen to be added to the 'iskeyword' variable only
  " when editing .tex files, then ctrlp plugin <C-p> can do completion for LaTeX References in Vim
  autocmd BufRead,BufNewFile *.tex set iskeyword+=:,-,_
  autocmd BufRead,BufNewFile,BufEnter *.tex call SetTexOptions()
  autocmd filetype tex call SetTexOptions()
  au! BufRead,BufNewFile,BufEnter *.m,*.oct call SetOctaveOptions()

endif " has("autocmd")
