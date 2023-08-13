"=============================================================================
" Custom Autocommands
"=============================================================================
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup FOSS_KING
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

autocmd TermClose * if !v:event.status | exe 'bdelete! '..expand('<abuf>') | endif
