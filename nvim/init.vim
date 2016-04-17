""
" Plugins
""

call plug#begin()
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
Plug 'Shougo/unite.vim'
" tryout
Plug 'airblade/vim-gitgutter'
Plug 'skalnik/vim-vroom'
Plug 'porqz/KeyboardLayoutSwitcher'
Plug 'gwutz/vim-materialtheme'
" dependency
Plug 'tomtom/tlib_vim' 
Plug 'MarcWeber/vim-addon-mw-utils'
call plug#end()

""
" Main configuration
""

" Do not create swap files and backups
set noswapfile
set nobackup
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

set background=light
colorscheme papercolor
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

" Run open ruby script
nmap <leader>e :!ruby -I %:p:h %<CR>

" The sudo tee trick mappings
cmap w!! w !sudo tee % >/dev/null

" Working with init.vim
if !exists(":EditInitvim")
  command EditInitvim :e $MYVIMRC
endif
if !exists(":ReloadInitvim")
  command ReloadInitvim :source $MYVIMRC
endif
