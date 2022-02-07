local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

---- Normal ----

-- fast saves and edits
keymap("n", "<leader>w", ":w!<cr>", opts)
keymap("n", "<leader>x", ":x!<cr>", opts)
keymap("n", "<leader>qa", ":quitall!<cr>", opts)
-- keymap("n", "<leader>e", ":e $MYVIMRC<cr>", opts)

-- clear selection highlight
--keymap("n", "<leader><leader>", ":nohlsearch<cr>", opts)

-- close buffer
keymap("n", "<leader>q", ":bdelete<cr>", opts)

-- redo changes
keymap("n", "<leader>z", ":redo<cr>", term_opts)

-- copy filename
keymap("n", "<leader>cp", ':let @+ = expand("%")<cr>', term_opts)

-- copy file contents
keymap("n", "<leader>ca", ":% y+<cr>", term_opts)

-- tab management
keymap("n", "<leader>t", ":tabe .<cr>", term_opts) -- New tab
keymap("n", "<leader>[", ":tabp <cr>", term_opts) -- Previous tab
keymap("n", "<leader>]", ":tabn <cr>", term_opts) -- Next tab
keymap("n", "<leader>l", ":tabp <cr>", term_opts) -- Next tab keymap("n", "<leader>h", ":tabp <cr>", opts)    -- Previous tab
-- split management
keymap("n", "<leader>v", "<C-W>v", opts) -- create vertical split
keymap("n", "<leader>h", "<C-W>s", opts) -- create horizontal split
keymap("n", "<leader>q", "<C-W>q", opts) -- close split
keymap("n", "<C-J>", "<C-W><C-J>", opts) -- Navigate left
keymap("n", "<C-K>", "<C-W><C-K>", opts) -- Navigate Up
keymap("n", "<C-L>", "<C-W><C-L>", opts) -- Navigate Left
keymap("n", "<C-H>", "<C-W><C-H>", opts) -- Navigate Down
keymap("n", "<S-Left>", ":vertical resize +10", opts) -- Increase resize left
keymap("n", "<S-Right>", ":vertical resize -10", opts) -- Decrease resize
keymap("n", "<S-Up>", ":resize +10", opts) -- Increase resize left
keymap("n", "<S-Down>", ":resize -10", opts) -- Decrease resize

-- movement keys work on wrapped lines
keymap("n", "<expr>j", "v:count ? 'j' : 'gj'", opts)
keymap("n", "<expr>k", "v:count ? 'k' : 'gk'", opts)

-- always keep search centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

---- Insert ----

-- undo break points
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

---- Visual ----

-- Move line up and down
keymap("v", "J", ":m '>+1'<cr>gv=gv", opts)
keymap("v", "K", ":m '<-2'<cr>gv=gv", opts)

-- avoid replace word when pasting
--keymap("v", "p", "_dP", opts)
