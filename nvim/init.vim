""
" Plugins
""

call plug#begin()
Plug 'tomtom/tlib_vim' " dependecy
Plug 'MarcWeber/vim-addon-mw-utils' " dependency
Plug 'NLKNguyen/papercolor-theme'
Plug 'editorconfig/editorconfig-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-commentary'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-jade'
Plug 'leshill/vim-json'
Plug 'slim-template/vim-slim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'mileszs/ack.vim'
" tryout
Plug 'airblade/vim-gitgutter'
Plug 'skalnik/vim-vroom'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'porqz/KeyboardLayoutSwitcher'
call plug#end()

""
" Main configuration
""

" Do not create swap files
set noswapfile
" Speed up editorconfig
" require to install editorconfig
" $ brew install editorconfig
let g:EditorConfig_core_mode = 'external_command'
" Disable gitgutter realtime update
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
" Vroom test runner
let g:vroom_use_colors = 1

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
set title

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

" CtrlP
map <c-b> :CtrlPBuffer<CR>

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
