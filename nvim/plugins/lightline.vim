
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ]
      \           ],
      \   'right': [
      \     ['ale'],
      \     ['lineinfo'],
      \     ['percent'],
      \     ['charcode', 'fileformat', 'filetype'],
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'filename': '%f'
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'modified': 'MyModified',
      \   'ale': 'ALEGetStatusLine'
      \ },
      \ 'separator': { 'left': ', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
'
