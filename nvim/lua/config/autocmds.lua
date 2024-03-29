-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    callback = function ()
        vim.cmd([[%s/\s\+$//e]])
    end
})

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

-- rc set automatically filetype
exec(
	[[
au BufNewFile,BufRead *.sol set ft=solidity
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

-- 4 spaces for selected filetypes
cmd([[
  autocmd FileType php setlocal shiftwidth=4 tabstop=4
]])
