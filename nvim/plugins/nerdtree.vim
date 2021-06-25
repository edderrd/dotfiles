let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden=1
nmap <leader>kb :NERDTreeToggle %<cr>
nmap <C-n> :NERDTreeToggle<cr>
nmap <leader>kf :NERDTreeFind<cr>
let g:NERDTreeIgnore = ['^node_modules$']
" let NERDTreeQuitOnOpen = 1
" open automatically when vim starts up if no files where specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open automatically when vim starts up on opening a directory
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close vim if the only window left open is a NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeMapOpenInTab = '\t'
" let NERDTreeShowLineNumbers = 1

" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

