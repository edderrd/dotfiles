if !exists('g:loaded_lspsaga') | finish | endif
lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}

EOF

nnoremap <silent> <leader>dn <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <leader>kk <Cmd>Lspsaga hover_doc<CR>
inoremap <silent> <c-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
