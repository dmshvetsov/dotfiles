scriptencoding utf-8
set encoding=utf-8
set nocompatible

""
" Plugins
""

call plug#begin()
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-system-copy'
" Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" dependency
Plug 'tomtom/tlib_vim' 
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" tryout
" Plug 'tpope/vim-dispatch'
Plug 'mattn/emmet-vim'
Plug 'jparise/vim-graphql'
" Plug 'sheerun/vim-polyglot'
" CTags
" Plug 'ludovicchabant/vim-gutentags'
" colorschemes
Plug 'davidklsn/vim-sialoquent'
Plug 'arcticicestudio/nord-vim'
Plug 'fenetikm/falcon'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

""
" Main configuration
""

" Do not create swap files and backups
set noswapfile
set nobackup
" Speed up editorconfig
" require to install editorconfig
" $ brew install editorconfig or similar linux command
let g:EditorConfig_core_mode = 'external_command'
" Disable gitgutter realtime update
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
" Asynchronous Lint Engine (ALE)
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'le'
let g:ale_sign_warning = 'lw'
" Trying to fix ale slow checks
" https://github.com/w0rp/ale/issues/1176
let g:ale_cache_executable_check_failures = 1

" wild menu
set wildmenu
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*/node_modules/*,*/bower_components/*

" undo/redo between sessions
set undodir=$HOME/.vim/undodir
set undofile

""
" Visual preferences
""

syntax enable
filetype plugin indent on

set guifont=Fira\ Mono:h14

" for vim 8
if (has("termguicolors"))
  set termguicolors
  " set Vim-specific sequences for RGB colors
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
endif

colorscheme nord
set background=dark

set list
set number
set relativenumber
set hlsearch
set title
set nofoldenable
set showcmd
set wrap
set colorcolumn=100
"remove scroll bar
set guioptions-=r
set guioptions-=L

" set lighline theme
let g:lightline = { 'colorscheme': 'nord' }
set laststatus=2
" ctags
" set statusline+=%{gutentags#statusline()}

" Use the same symbols as TextMate for tabs and EOLs
let &showbreak="\u2190\ "
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<
" Spaces and Tabs
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" Allow backspace
set backspace=indent,eol,start
" Auto reload file when changed
set autoread

" Use the old vim regex engine (version 1, as opposed to version 2, which was
" introduced in Vim 7.3.969). The Ruby syntax highlighting is significantly
" slower with the new regex engine.
" https://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
set regexpengine=1

" Fix for ^[<character> problem
" https://github.com/vim/vim/issues/24
set timeout timeoutlen=5000 ttimeoutlen=100

" Fix for wrong syntax highlighting
autocmd BufEnter * :syntax sync fromstart

""
" fzf
""

nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

""
" Emmet
""

" let g:user_emmet_leader_key='<Tab>'
" let g:user_emmet_settings = {
"   \  'javascript.jsx' : {
"     \      'extends' : 'jsx',
"     \  },
"   \}

" Vim way
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" ALE
" quick navigation between errors
nmap <silent> <C-L> <Plug>(ale_previous_wrap)
nmap <silent> <C-l> <Plug>(ale_next_wrap)

" let g:ale_linters = { 'javascript': ['eslint'] }
" let g:ale_fixers = { 'javascript': ['eslint'] }
" let g:ale_fix_on_save = 1

""
" MISC
""

let g:jsx_ext_required = 1
let g:nord_uniform_diff_background = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 0 " tmp disabled, need to make ts and flow work well together

""
" Extensions
""

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Show syntax highlighting groups for word under cursor
" nmap <C-S-P> :call <SID>SynStack()<CR>
" function! <SID>SynStack()
"   if !exists("*synstack")
"     return
"   endif
"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc

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
