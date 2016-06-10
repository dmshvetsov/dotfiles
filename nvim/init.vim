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
Plug 'airblade/vim-gitgutter'
" dependency
Plug 'tomtom/tlib_vim' 
Plug 'MarcWeber/vim-addon-mw-utils'
" tryout
Plug 'porqz/KeyboardLayoutSwitcher'
Plug 'gwutz/vim-materialtheme'
Plug 'sickill/vim-monokai'
Plug 'w0ng/vim-hybrid'
Plug 'jacoborus/tender'
Plug 'janko-m/vim-test'
Plug 'vim-scripts/matchit.zip'
Plug 'christoomey/vim-system-copy'
Plug 'itchyny/lightline.vim'
Plug 'rust-lang/rust.vim'
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

" lighline
let g:lightline = { 'colorscheme': 'PaperColor' }
set laststatus=2

""
" Shortcuts and Mappings
""

" Vim way
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" vim-test
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" unite
nmap <C-t> :Unite -start-insert file_rec<CR>
nmap <C-b> :Unite buffer<CR>

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

" Solution for performance problem
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
autocmd BufWinLeave * call clearmatches()
