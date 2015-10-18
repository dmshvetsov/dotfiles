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
set relativenumber
set showcmd
set cursorline
set hlsearch
set lazyredraw
set showmatch

" Use the same symbols as TextMate for tabs and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·,extends:>,precedes:<
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" Do not create swap files
set noswapfile

" vim-xkbswitch automatic keyboard layout switching
" dependencies:
"   https://github.com/myshov/xkbswitch-macosx
"   https://github.com/vovkasm/input-source-switcher
let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'

""
" Shortcuts and mappings
""

" Vim way
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Unite
noremap <Leader>f :Unite file<CR>
noremap <Leader>o :Unite file_rec<CR>
noremap <Leader>b :Unite buffer<CR>

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

" The sudo tee trick mappings
cmap w!! w !sudo tee % >/dev/null
