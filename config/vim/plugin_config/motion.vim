
if count(g:myvim_plugin_groups,'motion')

  " >> COMFORTABLE MOTION <<
  noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
  noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
  " scrolling proportional to window height
  let g:comfortable_motion_no_default_key_mappings = 1
  let g:comfortable_motion_impulse_multiplier = 1
  nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
  nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
  nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
  nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>


  " >> QUICKSCOPE <<
  " Trigger a highlight only when pressing f and F.
  let g:qs_highlight_on_keys = ['f', 'F', 'T', 't']


  " >> CAMELCASE MOTION <<
  " map <leader>w, <leader>b to camelcase movement
  let g:camelcasemotion_key = '<leader>'
endif

