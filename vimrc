set encoding=utf-8

" Pathogen
filetype off " Pathogen needs to run before plugin indent on
call pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
filetype plugin indent on

" Visual preferences
syntax enable
filetype plugin indent on
set background=light
colorscheme PaperColor
set list
set number
set cursorline
set hlsearch

" Use the same symbols as TextMate for tabs and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·,extends:>,precedes:<
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Highlight long lines
let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

" Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

set ttyfast
set lazyredraw

" Do not create swap files
set noswapfile

" Russian langmap
:set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Custom shortcuts

" Unite
noremap <C-o> :Unite file<CR>
noremap <C-l> :Unite file_rec<CR>
noremap <C-i> :Unite buffer<CR>

" Custom helpers

" Word wrapping
map <Leader>' ciw'<C-r>"'<ESC>
map <Leader>" ciw"<C-r>""<ESC>
map <Leader>( ciw(<C-r>")<ESC>
map <Leader>{ ciw{ <C-r>" }<ESC>
map <Leader>[ ciw[<C-r>"]<ESC>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
