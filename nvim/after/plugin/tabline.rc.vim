if exists("+showtabline")

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)

function! WebDevIconsGetFileTypeSymbol(...)
  if a:0 == 0
    let fileNodeExtension = expand("%:e")
    let fileNode = expand("%:t")
    let isDirectory = 0
  else
    let fileNodeExtension = fnamemodify(a:1, ':e')
    let fileNode = fnamemodify(a:1, ':t')
    if a:0 == 2
      let isDirectory = a:2
    else
      let isDirectory = 0
    endif
  endif

  let fileNodeExtension = tolower(fileNodeExtension)
  let fileNode = tolower(fileNode)

  if has_key(g:WebDevIconsUnicodeDecorateFileNodesExactSymbols, fileNode)
    let symbol = g:WebDevIconsUnicodeDecorateFileNodesExactSymbols[fileNode]
  elseif has_key(g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols, fileNodeExtension)
    let symbol = g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols[fileNodeExtension]
  else
    if isDirectory == 1
      let symbol = g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol
    else
      let symbol = g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol
    endif
  endif

  " Temporary (hopefully) fix for glyph issues in gvim (proper fix is with the
  " actual font patcher)
  let artifactFix = "\u00A0"

  return symbol . artifactFix
endfunction

function! LightlineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction

function! MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    let separatorLeft = "\uE0BC"
    let separatorRight = "\uE0BE"

    while i <= tabpagenr('$')
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let s .= '%' . i . 'T'
        let s .= (i == t ? '%1*' : '%2*')

        let bufnr = buflist[winnr - 1]
        let file = bufname(bufnr)
        let buftype = getbufvar(bufnr, '&buftype')

        if buftype == 'help'
            let file = 'help:' . fnamemodify(file, ':t:r')

        elseif buftype == 'quickfix'
            let file = 'quickfix'

        elseif buftype == 'nofile'
            if file =~ '\/.'
                let file = substitute(file, '.*\/\ze.', '', '')
            endif

        else
            let file = pathshorten(fnamemodify(file, ':p:~:.'))
            if getbufvar(bufnr, '&modified')
                let hl= (i == t ? '%#TabModifiedSel#' : '%#TabModified#')
                let nohl = (i == t ? '%#TabLineSel#' : '%#TabLine#')
                let file = file . hl  . " " . nohl
            endif

        endif

        if file == ''
            let file = '[No Name]'
        endif

        let hl = (i == t ? '%#TabLineSelSep#' : '%#TabNum#')
        let nohl = (i == t ? '%#TabLineSel#' : '%#TabLine#')
        let s .= hl . separatorLeft . nohl .  ' ' . LightlineWebDevIcons(i) . ' ' . file

        let nwins = tabpagewinnr(i, '$')
        if nwins > 1
            let modified = ''
            for b in buflist
                if getbufvar(b, '&modified') && b != bufnr
                    let hl= (i == t ? '%#TabModifiedSel#' : '%#TabModified#')
                    let nohl = (i == t ? '%#TabLineSel#' : '%#TabLine#')
                    let modified = hl  . " " . nohl
                    break
                endif
            endfor
            let hl = (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let nohl = (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let s .= ' ' . modified . '(' . hl . winnr . nohl . '/' . nwins . ')'
        endif

        if i < tabpagenr('$')
            let hl = (i == t ? '%#TabLineSelEnd#' : '%#WinNumSel#')
            let s .= hl . " " . separatorRight . '%#TabLine#'
        else
            let hl = (i == t ? '%#TabLineSelEnd# ' . "\uE0BE" : '%#TabLineFill#' . "\uE0B8")
            let s .= ' ' . hl
        endif

        let i = i + 1

    endwhile

    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s

endfunction

" set showtabline=1
highlight! TabNum term=reverse cterm=bold ctermfg=1 ctermbg=7 gui=bold guifg=#282c34 guibg=#30343c
highlight! TabNumSel term=bold,reverse cterm=bold,reverse ctermfg=1 ctermbg=7 gui=bold guibg=#282c34
highlight! WinNum term=bold cterm=bold ctermfg=11 ctermbg=7 guifg=DarkBlue guibg=transparency
highlight! WinNumSel term=bold cterm=bold ctermfg=7 ctermbg=14 guifg=#282c34 guibg=#30343c
highlight! TabLineSel   ctermfg=17  ctermbg=190  cterm=NONE
highlight! TabLineSelSep   ctermfg=17  ctermbg=190  cterm=NONE guifg=#282c34
highlight! TabLineSep   ctermfg=17  ctermbg=190  cterm=NONE guifg=#282c34
highlight! TabLine ctermfg=17  ctermbg=190  cterm=NONE guibg=#30343c
highlight! TabLineFill   ctermfg=17  ctermbg=190  cterm=NONE guifg=#30343c guibg=#282c34
highlight! TabLineSelEnd ctermfg=17  ctermbg=190  cterm=NONE guifg=#282c34
highlight! TabModifiedSel guifg=#7eca9c
highlight! TabModified guifg=#7eca9c guibg=#30343c



set tabline=%!MyTabLine()

endif " exists("+showtabline")

nnoremap <leader>, gT
nnoremap <leader>. gt
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
