" let g:ale_linters = {
" \   'php': ['php'],
" \   'javascript': ['tern'],
" \}
let g:ale_linters_ignore = {'typescript': ['eslint', 'tslint', 'tsserver']}
let g:ale_fixers = {
\   'ruby': ['rubocop']
\}
"
let g:ale_fix_on_save = 1
" let g_ale_sign_column_always = 1
let g:ale_sign_error = '⤫'
"let g:ale_sign_warning = '⚠'
let g:ale_sign_warning = "\uf071"
" " lint only on save
" let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
let g:ale_floating_preview = 1
let g:ale_hover_to_floating_preview = 1

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
