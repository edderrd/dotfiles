if !has('nvim-0.5')
  echohl WarningMsg
  echom "Most settings needs neovim 0.5"
  echohl None
endif

runtime ./settings.vim
runtime ./mappings.vim
runtime ./autocommands.vim
runtime ./plug.vim

" Set theme
colorscheme onedark
runtime ./themes/onedark.vim
