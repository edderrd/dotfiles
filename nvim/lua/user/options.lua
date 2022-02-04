-- use :help for more information

local options = {
	number = true, -- show line numbers
	title = true, -- Editing file title
	mouse = "a", -- allow mouse to be used in neovim
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	showbreak = "↪", -- string to show start of the line for wrapped lines
	scrolloff = 8, -- screen lines to keep above and below the cursor
	sidescrolloff = 8,
	incsearch = true, -- search as characters are entered
	inccommand = "nosplit", -- incrementally show search and replace
	showmatch = true, -- highlight matching [{()}]
	hlsearch = false, -- highlight matches
	smarttab = true,
	autoread = true, -- Automatically re-read files inside vim
	clipboard = "unnamedplus", -- use os clipboard
	backup = false, -- create a backup file
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	ignorecase = true, -- ignore case in search patterns
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	-- termguicolors = true,                    -- set term gui colors (most terminals support this)
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	relativenumber = false, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = true, -- display lines as one long line
	termguicolors = true, -- terminal with true colors
	timeout = true, -- timeout when using leader key
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]])
-- vim.cmd([[let loaded_netrwPlugin = 1]]) -- disable default file explorer
