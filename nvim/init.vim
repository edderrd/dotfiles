set number    " Show line numbers
set title     " Editing file title
set mouse=a   " Mouse integration (select text, move cursor)
"set nowrap    " Long lines will not be wrapped

set lazyredraw " Don't update screen during macro and script execution
set complete-=i " Limit the files searched for auto-completes
set cursorline    " Highlights current cursor line
" set colorcolumn=120    " Show column limit to 120 chars

" set foldmethod=indent " Fold based on indentation levels
set guifont=JetBrainsMono\ Nerd\ Font:h14

" 4 spaces indentation
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set cindent " Indent using C
set shiftround  " When shifting lines, round the indentation to nearest
set expandtab   " Insert spaces instead of <Tab>s
set hidden   " allows buffer change without saving
set noshowmode

" Set background transparency
au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

" set cmdheight=2
set noswapfile
set nobackup
set nowritebackup
" Persistent undo even when (n)vim is closed
set undodir=~/config/.nvim/undodir
set undofile

set autoread " Automatically re-read files if unmodified inside Vim
set showbreak=↪
set scrolloff=8
set sidescrolloff=5
set noerrorbells "Disable those annoying error bells
set list
set listchars=tab:>~,trail:-,extends:>,precedes:<
" set timeout " when looking for key combinations
set notimeout " timeout when using leader key
set nottimeout
set ttimeoutlen=0
set updatetime=40
set backspace=indent,eol,start " Allow baskspacing over identitation, line breaks and insertion starts
set confirm " Display  confirmation dialog when closing an unsaved file
set formatoptions+=j " Delete comment characters when joining lines
set history=1000 " Increase the undo limit

" automatically update file if it's changes
au CursorHold,CursorHoldI * checktime " is triggered after the cursor remains still for 4 seconds
au FocusGained,BufEnter * :checktime  " Trigger on buffer change or terminal focus

" add an line after save
autocmd FileType php setlocal noeol binary

" Allow shell commands to use globbing like **/*.foo
" set shell+=\ -O\ globstar

syntax on
set clipboard=unnamed " use os clipboard
" set clipboard+=unnamedplus
set ignorecase   " Case insensitive search
set smartcase    " case insensitve when word have different case
set incsearch " search as characters are entered
set showmatch " highlight matching [{()}]
set nohlsearch " highlight matches
set synmaxcol=512 " syntax highlight long lines
" set relativenumber

" Disable default file explorer
let loaded_netrwPlugin = 1

" incrementally show search and replace
if has("nvim")
  set inccommand=nosplit
endif

" set spell
set spelllang=en,es  "Correct words using english and spanish
" Spellcheck for features markdown
au BufRead,BufNewFile *.md setlocal spell

set termguicolors    " Enable terminal true colors
if $TERM_PROGRAM=="Apple_Terminal"
  set notermguicolors    " Disable true colors only for apple
endif

set t_Co=256
set encoding=UTF-8

set fillchars+=stl:\ ,stlnc:\

" ----Folding-------
" set foldmethod=syntax "syntax highlighting items specify folds
"set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" Change cursor shape based on mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"--------------Plugins-------------------"
call plug#begin('~/.local/share/vim/plugged')
Plug 'joshdick/onedark.vim'
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive' " Premier git plugin
" Plug 'airblade/vim-gitgutter'     " Shows git changes in gutter
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'itmammoth/run-rspec.vim'
Plug 'ngmy/vim-rubocop'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh' }
" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
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
Plug 'nvim-lua/completion-nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'lewis6991/gitsigns.nvim'
 " Plug 'akinsho/nvim-bufferline.lua'
Plug 'famiu/nvim-reload'
" Plug 'romgrk/barbar.nvim'
" Plug 'folke/which-key.nvim'

call plug#end()


" Set theme after settings
colorscheme onedark

lua require "my-globals"
lua require "file-icons"

lua require "lsp"
lua require "lsp.js-ts-ls"
lua require "my-treesitter"
lua require "my-galaxyline"
lua require "my-gitsigns"
" lua require "my-bufferline"

source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/autocommands.vim

" source $HOME/.config/nvim/plugins/airline.vim
"source $HOME/.config/nvim/plugins/lightline.vim

source $HOME/.config/nvim/plugins/coc.vim
source $HOME/.config/nvim/plugins/ale.vim
source $HOME/.config/nvim/plugins/fugitive.vim
" source $HOME/.config/nvim/plugins/ack.vim
"source $HOME/.confdg/nvim/plugins/nerdtree.vim
source $HOME/.config/nvim/plugins/nerdcommenter.vim
source $HOME/.config/nvim/plugins/languageclient.vim
"source $HOME/.config/nvim/plugins/cntrl-p.vim
" source $HOME/.config/nvim/plugins/denite.vim
source $HOME/.config/nvim/plugins/defx.vim
source $HOME/.config/nvim/plugins/vim-rooter.vim
" source $HOME/.config/nvim/plugins/gitgutter.vim
source $HOME/.config/nvim/plugins/lspinstall.vim
source $HOME/.config/nvim/plugins/trouble.vim
source $HOME/.config/nvim/plugins/telescope.vim
source $HOME/.config/nvim/plugins/lsp.vim
source $HOME/.config/nvim/plugins/onedark.vim
 source $HOME/.config/nvim/plugins/tabline.vim
