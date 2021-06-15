"show open buffers like tabs
let g:airline_theme = 'onedark'
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline#extensions#ale#enabled = 1

" Load Powerline font and symbols
let g:airline_powerline_fonts = 1
" will not show current mode to avoid duplicate
set laststatus=2 " for airline
"let g:airline_section_warning = ''
let g:airline_section_y=''
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0 " allow disable section Y
let g:airline_section_x=''
"let g:airline_section_z="%3p%% %l:%c"
let g:airline_skip_empty_sections=1
let g:airline#extensions#hunks#enabled=0
let g:webdevicons_enable_denite = 1
let g:airline#extensions#coc#enabled = 1
"let g:airline_section_b = '%{getcwd()}' " in section B of the status line display the CWD

function! AirlineInit()
  " first define a new part for modified
  call airline#parts#define('modified', {
    \ 'raw': '%m',
    \ 'accent': 'red',
    \ })

  " then override the default layout for section c with your new part
  let g:airline_section_c = airline#section#create(['%<', '%f', 'modified', ' ', 'readonly'])
endfunction
autocmd VimEnter * call AirlineInit()
