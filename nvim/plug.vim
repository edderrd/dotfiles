call plug#begin('~/.local/share/vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive' " Premier git plugin
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'https://github.com/airblade/vim-rooter'

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'folke/lsp-colors.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'mhartington/formatter.nvim'
Plug 'folke/trouble.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'lewis6991/gitsigns.nvim'
Plug 'cohama/lexima.vim'
" Plug 'folke/which-key.nvim'

call plug#end()
