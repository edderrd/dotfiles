let g:coc_global_extensions = [
    \ 'coc-html',
    \ 'coc-emmet',
    \ 'coc-phpls',
    \ 'coc-pairs',
    \ 'coc-solargraph',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-vetur',
    \ 'coc-css'
    \ ]

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nmap <silent> ff <Plug>(coc-format-selected)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Optionally reset the cursor on start:
augroup myCmds
  au!
  autocmd VimEnter * silent !echo -ne "\e[6 q"
augroup END

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Fix syntax highlight for Coc plugin floating errors
" hi CocErrorFloat guifg=Magenta guibg=Magenta

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh() <silent><expr> <NUL> coc#refresh()

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes


" Use K to show documentation in preview window.
nnoremap <leader>kk :call <SID>show_documentation()<CR>
" Remap for format selected region
vmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
