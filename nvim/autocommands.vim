" Automatically source the Vimrc file on save.
augroup autosourcing
  autocmd!
  autocmd BufWritePost init.vim source % | echom "Reloaded " . $MYVIMRC | redraw
augroup END


augroup ReturnToLastCursorPosition
  au BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
augroup END

" Remove trailing white spaces
fun! <SID>StripTrailingWhitespaces()
let l:l = line('.')
let l:c = col('.')
%s/\s\+$//e
call cursor(l:l, l:c)
endfun
" when saving, remove all trailing spaces from the file.
augroup StripWhitespaceOnSave
autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
augroup END

" Remove consecutive empty lines
function! RemoveExtraEmptyLines()
:%g/^$\n\n/d
endfunction

" Jenkins file syntax highlight
autocmd BufNewFile,BufRead *Jenkinsfile* set filetype=groovy

" jsonc syntax highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescript
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

" Sync syntax for large files
"autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
"autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
