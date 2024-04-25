vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.snippets = "luasnip"

local opt = vim.o

opt.number = true -- show line numbers
opt.title = true -- Editing file title
opt.mouse = "a" -- allow mouse to be used in neovim
-- opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.showbreak = "↪" -- string to show start of the line for wrapped lines
opt.scrolloff = 8 -- screen lines to keep above and below the cursor
opt.sidescrolloff = 8
opt.incsearch = true -- search as characters are entered
opt.inccommand = "nosplit" -- incrementally show search and replace
opt.showmatch = true -- highlight matching [{()}]
opt.hlsearch = false -- highlight matches
opt.smarttab = true
opt.autoread = true -- Automatically re-read files inside vim
opt.clipboard = "unnamedplus" -- use os clipboard
opt.backup = false -- create a backup file
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.ignorecase = true -- ignore case in search patterns
opt.pumheight = 10 -- pop up menu height
opt.pumblend = 3 -- Make popup window translucent
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.smartcase = true -- smart case
opt.smartindent = true -- make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.cursorline = true -- show current cursor line hightlighted
opt.cursorlineopt = "number" -- only hightlight cursor line number
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- enable persistent undo
opt.updatetime = 50 -- faster completion (4000ms default)
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.backup = false
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.relativenumber = false -- set relative numbered lines
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = true -- display lines as one long line
opt.termguicolors = true -- terminal with true colors
opt.timeout = true -- timeout when using leader key
opt.hidden = true -- enable background buffers
opt.history = 100 -- remember N line in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight
opt.mousemoveevent = true -- enable mouse movements nvim 8+
opt.laststatus = 3 -- share status line over split

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess = "filnxtToOFWIcC"
end

vim.cmd("set whichwrap=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]])
vim.cmd([[let loaded_netrwPlugin = 1]]) -- disable default file explorer

