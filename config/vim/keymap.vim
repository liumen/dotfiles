" Fast saving and quit
" nnoremap <leader>q :q<CR>
" nnoremap <leader>w :w<CR>

" Copy to and paste from system clipboard ('+' register)
vmap <leader>y "+y
vmap <leader>d "+d
vmap <leader>p "+p
vmap <leader>P "+P
nmap <leader>p "+p
nmap <leader>P "+P

" #<CR> go to # row
" <CR> go to end of file, <BS> to start of file
nnoremap <CR> G
vnoremap <CR> G
" nnoremap <BS> gg

" Highlight current cursor line, <leader>c to toggle on and off
nnoremap <leader>c :set cursorline!<CR>

" Navigation between windows
nnoremap <Down>  <C-W>j
nnoremap <Up>    <C-W>k
nnoremap <Left>  <C-W>h
nnoremap <Right> <C-W>l

" Make j and k work the way you expect
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" auto indent
" nnoremap <C-i> gg=G

"swap start of line/first character
noremap ^ 0
noremap 0 ^

" Split screen resizing, horizontal and vertical
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) + 5)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) - 5)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . "+5"<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . "-5"<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Fast opening vimrc for editing
nnoremap <leader>rc :tabedit $MYVIMRC<CR>


"================================================
" => TABS AND BUFFERS
"================================================
" BUFFER MANAGEMENT
" Close all the buffers
map <leader>bo :BufOnly<cr>
map <leader>ba :bufdo bd<cr>
map <leader>bd :Bclose<cr>
command! BufOnly silent! execute "%bd|e#|bd#"

" TAB MANAGEMENT
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>
map <leader>tt :tabnew<cr>
map <leader>to :tabonly<cr>
nnoremap ]<tab> :tabnext<cr>
nnoremap [<tab> :tabp<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

