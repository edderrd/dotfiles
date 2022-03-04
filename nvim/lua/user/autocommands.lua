local cmd = vim.cmd -- Execute Vim commands
local exec = vim.api.nvim_exec -- Execute VimScript

-- return to last cursor position upon openning
exec(
	[[
  augroup ReturnToLastCursorPosition
    au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
  augroup END
]],
	false
)

-- Jenkins file syntax highlight
exec(
	[[
autocmd BufNewFile,BufRead *Jenkinsfile* set filetype=groovy
]],
	false
)

-- rc files syntax highlight
exec(
	[[
au BufNewFile,BufRead *.*rc set syntax=vim
au BufNewFile,BufRead *.secrets set syntax=vim
au BufNewFile,BufRead *.aliases set syntax=vim
]],
	false
)

exec(
	[[
let useformatting=1
function! AutoFormat()
  if g:useformatting
    lua vim.lsp.buf.formatting_sync(nil, 1000)
  endif
endfunction

if useformatting
  autocmd BufWritePre *.md call AutoFormat()
  autocmd BufWritePre *.php call AutoFormat()
endif
]],
	false
)

exec(
	[[
function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

autocmd BufWritePre * if !&binary | call TrimWhitespace() | endif
]],
	false
)

-- Don't auto commenting new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- Highlight on yank
exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}
  augroup end
]],
	false
)

-- Remove line lenght marker for selected filetypes
cmd([[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]])

-- 2 spaces for selected filetypes
cmd([[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]])
