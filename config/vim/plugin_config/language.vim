if count(g:myvim_plugin_groups, 'language')

  " >> DOXYGEN TOOLKIT <<
  let g:DoxygenToolkit_blockHeader="************************************************** "
  let g:DoxygenToolkit_blockFooter="************************************************** "
  let g:DoxygenToolkit_briefTag_funcName = "yes"
  let g:DoxygenToolkit_briefTag_pre = "\\brief "
  let g:DoxygenToolkit_templateParamTag_pre = "\\tparam "
  let g:DoxygenToolkit_paramTag_pre = "\\param[] "
  let g:DoxygenToolkit_returnTag = "\\return "
  let g:DoxygenToolkit_throwTag_pre = "\\throw " " @exception is also valid
  let g:DoxygenToolkit_fileTag = "\\file "
  let g:DoxygenToolkit_dateTag = "\\date "
  let g:DoxygenToolkit_versionTag = "\\version "
  let g:DoxygenToolkit_blockTag = "\\name "
  let g:DoxygenToolkit_classTag = "\\class "
  let g:DoxygenToolkit_authorName = myvim_user_name
  let g:load_doxygen_syntax = 1
  let g:doxygen_enhanced_color = 0


  " >> VIMTEX <<
  nmap <localleader>ll :VimtexCompileSS<CR>
  let g:tex_flavor = 'latex' " or vimtex won't load
  let g:vimtex_fold_enabled = 0
  " let g:vimtex_compiler_latexmk = {'callback': 0}
  let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

  if g:os == 'Linux'
    let g:vimtex_view_method = 'zathura'
  elseif g:os == 'Darwin'
    let g:vimtex_view_method = 'skim'
  endif
  let g:vimtex_complete_enabled = 1
  " TOC settings
  let g:vimtex_toc_config = {
        \ 'name' : 'TOC',
        \ 'layers' : ['content', 'todo', 'include'],
        \ 'resize' : 1,
        \ 'split_width' : 50,
        \ 'todo_sorted' : 0,
        \ 'show_help' : 1,
        \ 'show_numbers' : 1,
        \ 'mode' : 2,
        \}

  " >> VIM_CLANG_FORMAT <<
  " map to <Leader>cf in C++ code
  set textwidth=0 " allow vim format mapping gq to use clang_format
  let g:clang_format#detect_style_file = 1
  autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
  autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
  " autocmd FileType c,cpp,objc ClangFormatAutoEnable

endif
