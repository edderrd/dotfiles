" if executable('ag')
"   " add your ignore files in ~/.agignore
"   let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" endif

" ignore files from .gitignore
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" this will not work if you're using 'ctrl_user_command'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](node_modules|target|dist|git|log|tmp|storage|build|.bundle)|(\.(swp|ico|git|svn))$',
\ 'file': '\.so$\|\.dat$|\.DS_Store$\|\.jar$\|\.class$\|\.ttf$'
\ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jar,*/node_modules/*     " MacOSX/Linux
let g:ctrlp_show_hidden=1
" let g:ctrlp_match_window = 'top,order:ttb,min:1,max:60,results:60'
let g:ctrlp_match_window = 'bottom,order:ttb,min:5,max:40,results:100'

" big projects doesn't index all file this fixes it
let g:ctrlp_max_files = 0
let g:ctrlp_max_deph = 40

let g:ctrlp_working_path_mode = 'ra'
"
"mappings
 nmap <leader>p :CtrlP<cr>
nmap <D-p> :CtrlP<cr>
"Search methods in file
nmap <leader>r :CtrlPBufTag<cr>
nmap <c-r> :CtrlPBufTag<cr>
nmap <D->r> :CtrlPBufTag<cr>

