local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- color scheme
	use("navarasu/onedark.nvim") -- One dark theme with Treesitter support

	use("christoomey/vim-tmux-navigator") -- Tmux navigation <control>arrows

	-- comments
	use({ -- comment lines
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	use("kyazdani42/nvim-tree.lua") -- File explorer
	use("nvim-telescope/telescope.nvim") -- very fast and intuitive file searcher
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Very fast syntax hightlighter
	use("kyazdani42/nvim-web-devicons") -- web dev icons
	use("lewis6991/gitsigns.nvim") -- superfast git decorations
	use("feline-nvim/feline.nvim") -- Lightweight and fast status line
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	use("norcalli/nvim-colorizer.lua") -- color hightlighter
	use("lewis6991/impatient.nvim") -- speed up loading Lua modules
	use("lukas-reineke/indent-blankline.nvim") -- adds indentiation guides to all lines
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("moll/vim-bbye") -- delete buffers without deleting windows

	use("akinsho/bufferline.nvim") -- tabline manager

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("tami5/lspsaga.nvim") -- lightweight lsp plugin

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
