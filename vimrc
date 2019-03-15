scriptencoding utf-8
set encoding=utf-8

""
" Plugins
""

call plug#begin()
Plug 'editorconfig/editorconfig-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-commentary'
" Plug 'digitaltoad/vim-jade'
Plug 'leshill/vim-json'
Plug 'slim-template/vim-slim'
" until trying ultisnips, looks like 2 years abandoned Plug 'garbas/vim-snipmate'
" until trying ultisnips Plug 'honza/vim-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'
" Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-system-copy'
Plug 'w0rp/ale'
" dependency
Plug 'tomtom/tlib_vim' 
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" tryout
" Plug 'tpope/vim-dispatch'
" Plug 'vim-ruby/vim-ruby'
" Plug 'rust-lang/rust.vim'
" Plug 'elixir-editors/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Plug 'posva/vim-vue'
Plug 'kien/ctrlp.vim'
Plug 'thoughtbot/vim-rspec'
" colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'davidklsn/vim-sialoquent'
Plug 'mhartington/oceanic-next'
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
set wildignore+=*/node_modules/*,*/bower_components/*

" undo/redo between sessions
set undodir=$HOME/.vim/undodir
set undofile

" vim-javascript
let g:javascript_plugin_jsdoc = 1

""
" Visual preferences
""

syntax enable
filetype plugin indent on

set guifont=Fira\ Mono:h14
set background=dark

" for vim 8
if (has("termguicolors"))
  set termguicolors
endif

colorscheme sialoquent

set list
set number
set relativenumber
set hlsearch
set title
set nofoldenable
set showcmd
set wrap
"remove scroll bar
set guioptions-=r
set guioptions-=L

" set lighline theme
let g:lightline = { 'colorscheme': 'sialoquent' }
set laststatus=2

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

""
" Command-t
""

" set wildignore+=project/backup


""
" Shortcuts and Mappings
""

" ultisnips trigger key
let g:UltiSnipsExpandTrigger="<tab>"

" Vim way
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" ALE
" quick navigation between errors
nmap <silent> <C-L> <Plug>(ale_previous_wrap)
nmap <silent> <C-l> <Plug>(ale_next_wrap)

let g:ale_linters = { 'javascript': ['eslint', 'flow'] }
let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_fix_on_save = 1

""
" MISC
""

let g:jsx_ext_required = 1

""
" Extensions
""

" Jump to a previous file position when reopen a file
au BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
   \ |   exe "normal! g`\""
   \ | endif

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

" Create the `tags` file
" require to install ctags
" $ brew install ctags
command! MakeTags !ctags -R .
command! MakeRubyTags !ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)
