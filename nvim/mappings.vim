" use comma as leader
let mapleader = " "
let g:mapleader = " "
"let g:mapleader = ","
"let g:mapleader = ","


" Clear selection highlight
" nmap <leader><space> :nohlsearch<cr>

" Fast saves
nmap <leader>w :w!<cr>

" Fast save and exist
nmap <leader>x :x!<cr>

" Quit all without saving
nmap <leader>qa :quitall!<cr>

" Open vimrc file
noremap <leader>e :e $MYVIMRC<cr>

" use leader + y to copy from clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Use leader + d to cut from clipboard
vnoremap <leader>d "+d
nnoremap <leader>d "+d

" Use leader + p to paste from clipboard
vnoremap <leader>p "+p
nnoremap <leader>p "+p
vnoremap <leader>P "+P
nnoremap <leader>P "+P

" move next buffer leader + l
nnoremap <leader>l :bnext<cr>

" Move to previous buffer leader + j
nnoremap <leader>j :bprevious<cr>

" Close buffer leader + q
nnoremap <leader>q :bdelete<cr>

" Redo changes
nmap <leader>z :redo<cr>

" copy all file
nmap <leader>ca :% y+<cr>

" copy filename path
nmap <leader>cp :let @+ = expand("%")<cr>


" Tab management
nmap <leader>t :tabe .<cr> " New tab
nmap <leader>[ :tabp<cr> " Previous tab
nmap <leader>] :tabn<cr> " Next tab
map <leader>h :tabprevious<cr> " Previous tab
map <leader>l :tabnext<cr> " Next tab

" movement keys work on wrapped lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" return to previous buffer with Tab
" nnoremap <special> <Tab> <C-^>

" Split management
set splitbelow
set splitright

" close split
map <leader>c <C-W>q

" create split
nnoremap <leader>v <C-W>v
nnoremap <leader>h <C-W>s

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Resize panes with arrow keys and shift
"nnoremap <Left> :vertical resize +1<CR>
"nnoremap <Right> :vertical resize -1<CR>
"nnoremap <Up> :resize -1<CR>
"nnoremap <Down> :resize +1<CR>

nnoremap <S-Left> :vertical resize +10<CR>
nnoremap <S-Right> :vertical resize -10<CR>
nnoremap <S-Up> :resize +10<CR>
nnoremap <S-Down> :resize -10<CR>

" Move line up and down
vnoremap J :m '>+1'<cr>gv=gv
vnoremap K :m '<-2'<cr>gv=gv

nnoremap <leader><CR> :so $MYVIMRC<CR>
