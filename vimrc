""
" Plugins
""

call plug#begin()
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
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-system-copy'
Plug 'porqz/KeyboardLayoutSwitcher'
" dependency
Plug 'tomtom/tlib_vim' 
Plug 'MarcWeber/vim-addon-mw-utils'
" tryout
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-dispatch'
Plug 'vim-ruby/vim-ruby'
Plug 'elixir-lang/vim-elixir'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-liquid'
Plug 'w0rp/ale'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
" colorschemes
Plug 'arcticicestudio/nord-vim'
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
" Asynchronous Lint Engine (ALE)
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'le'
let g:ale_sign_warning = 'lw'

" wild menu
set wildmenu
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

" vim-javascript
let g:javascript_plugin_jsdoc = 1

""
" Visual preferences
""

syntax enable
filetype plugin indent on

set guifont=Fira\ Mono:h14
set background=dark
colorscheme nord
set list
set number
set relativenumber
set cursorline
set hlsearch
set title
set nofoldenable
"remove scroll bar
set guioptions-=r
set guioptions-=L

" set lighline theme
let g:lightline = { 'colorscheme': 'nord' }
set laststatus=2

" Use the same symbols as TextMate for tabs and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·,extends:>,precedes:<
set showbreak=←
" Spaces and Tabs
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" Allow backspace
set backspace=indent,eol,start
" Auto reload file when changed
set autoread

""
" Shortcuts and Mappings
""

" Vim way
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Unite
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

" Solution for performance problem
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
autocmd BufWinLeave * call clearmatches()

""
" Commands
""

" Working with vimrc
if !exists(":EditVimrc")
  command EditVimrc :e $MYVIMRC
endif
if !exists(":ReloadVimrc")
  command ReloadVimrc :source $MYVIMRC
endif

" Create the `tags` file
" require to install ctags
" $ brew install ctags
command! MakeTags !ctags -R .
command! MakeRubyTags !ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)
