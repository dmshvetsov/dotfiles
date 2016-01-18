""
" Plugins
""

call plug#begin()
Plug 'NLKNguyen/papercolor-theme'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

""
" Main configuration
""

" Do not create swap files
set noswapfile

""
" Visual preferences
""

syntax enable
filetype plugin indent on
set background=light
colorscheme PaperColor
set list
set number
set relativenumber
set cursorline
set hlsearch

" Use the same symbols as TextMate for tabs and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·,extends:>,precedes:<
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

""
" Shortcuts and Mappings
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

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

""
" Extensions
""

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" The sudo tee trick mappings
cmap w!! w !sudo tee % >/dev/null
