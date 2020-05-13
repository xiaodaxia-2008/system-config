function! myspacevim#before() abort
" let g:neomake_enabled_c_makers = ['g++']
" nnoremap jk <Esc>
"
" settings of auto_save plugin
let g:auto_save = 1  " enable autosave on vim startup
let g:auto_save_events = ["insertleave", "textChanged"] 
" TextChangedI will save after a change was made to the text in the current buffer in insert mode.
" CursorHold will save every amount of milliseconds as defined in the updatetime option in normal mode.
" CursorHoldI will do the same thing in insert mode.
" CompleteDone will also trigger a save after every completion event.
"
"
nnoremap jw viw
vnoremap vv <esc>
endfunction

function! myspacevim#after() abort
" iunmap jk
endfunction
