" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

scriptencoding utf-8
set encoding=utf-8
set nocompatible

""
" Plugins
""

call plug#begin()
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'mileszs/ack.vim'
Plug 'hoob3rt/lualine.nvim'
Plug 'christoomey/vim-system-copy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
"
" languages and syntax
"
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'ollykel/v-vim'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'elixir-editors/vim-elixir'
" Plug 'MaxMEllon/vim-jsx-pretty'
" Plug 'posva/vim-vue'
"
" colorschemes
"
Plug 'davidklsn/vim-sialoquent'
Plug 'arcticicestudio/nord-vim'
Plug 'embark-theme/vim'
Plug 'shaunsingh/moonlight.nvim'
Plug 'ayu-theme/ayu-vim'
"
" dependencies
"
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'nvim-lua/plenary.nvim' " dependent: gitsigns.nvim
"
" tryout
"
" Plug 'tpope/vim-dispatch'
" Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'jparise/vim-graphql'
Plug 'AndrewRadev/tagalong.vim'
" Plug 'airblade/vim-gitgutter' " recomended for vim-js-file-import
" after neovim 0.5.0 try gitsigns
Plug 'lewis6991/gitsigns.nvim'
" Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
" Plug 'ludovicchabant/vim-gutentags' " for ctags, vim-js-file-import
" Plug 'kyazdani42/nvim-web-devicons'
Plug 'kkvh/vim-docker-tools'
Plug 'akinsho/nvim-bufferline.lua'
" Plug 'kyazdani42/nvim-web-devicons' " nvim-bufferline -> Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' " nvim-bufferline -> Icons without colours 
call plug#end()

""
" Main configuration
""

" Do not create swap files and backups
set noswapfile
set nobackup

" Disable gitgutter realtime update
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0

" wild menu
set wildmenu
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*/node_modules/*,*/bower_components/*

" undo/redo between sessions
set undodir=$HOME/.config/nvim/undodir
set undofile

" allow unsaved changes in buffer switches
set hidden

""
" Visual preferences
""

syntax enable
filetype plugin indent on

set guifont=Fira\ Mono:h14

set termguicolors

" show column for git, eslint and other signs
" this removes columns shift between no sign or first signs added
set signcolumn=yes:1

"
" Color shceme setup
"

" colorscheme nord
" colorscheme embark
colorscheme material
lua <<EOF
vim.g.material_style = "moonlight"
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = false
vim.g.material_italic_functions = false
vim.g.material_italic_variables = false
vim.g.material_contrast = true
vim.g.material_borders = false
vim.g.material_disable_background = false
-- Load the colorscheme
require('material').set()
EOF

let g:embark_terminal_italics = 1

set background=dark
let g:nord_uniform_diff_background = 1

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

source $HOME/dotfiles/dotconfig/nvim/fzf.config.vim

"
" buffline
" https://github.com/akinsho/nvim-bufferline.lua#readme
"

lua <<EOF
require('bufferline').setup{
  options = {
    show_buffer_close_icons = false,
    show_close_icon = false,
    always_show_bufferline = false
  }
}
EOF

"
" status line
" https://github.com/hoob3rt/lualine.nvim
"

lua <<EOF
require('lualine').setup{
  options = {
    theme = 'auto',
    section_separators = {'|', '|'},
    component_separators = {'|', '|'},
    icons_enabled = true,
  },
  extensions = {'fzf', 'fugitive'}
}
EOF

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
" set regexpengine=1

" Fix for ^[<character> problem
" https://github.com/vim/vim/issues/24
set timeout timeoutlen=5000 ttimeoutlen=100

" Fix for wrong syntax highlighting
autocmd BufEnter * :syntax sync fromstart

"
" coc
"

let g:coc_global_extensions = ['coc-sql', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-spell-checker']

" coc codeaction
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" coc-eslint quick navigattion
nmap <C-l> <Plug>(coc-diagnostic-next)
" FIXME <C-L> interprets like <C-l> and overrides the previous map
" nmap <C-L> <Plug>(coc-diagnostic-next)

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>p <Plug>(coc-format-selected)
nmap <leader>p :Prettier<CR>

" formatprg prettier
" FIXME: not working
" autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

"
" fugutive
"
command Gcontext Gblame

"
" navigation
"

" paragraph movements without jumnmarks
nnoremap } :keepjumps normal! }<cr>
nnoremap { :keepjumps normal! {<cr>
xnoremap } :<C-u>keepjumps normal! gv}<cr>
xnoremap { :<C-u>keepjumps normal! gv{<cr>

" goto code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

""
" Emmet
""

" let g:user_emmet_leader_key='<Tab>'
" let g:user_emmet_settings = {
"   \  'javascript.jsx' : {
"     \      'extends' : 'jsx',
"     \  },
"   \}

"
" gitsigns
"
lua require('gitsigns').setup()
" set statusline+=%{get(b:,'gitsigns_status','')}

" Vim way
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" ALE
" quick navigation between errors
" nmap <silent> <C-L> <Plug>(ale_previous_wrap)
" nmap <silent> <C-l> <Plug>(ale_next_wrap)

" let g:ale_fixers = {
"       \ 'javascript': ['prettier'],
"       \ 'javascriptreact': ['prettier']
"       \}
" let g:ale_linters_ignore = {
"       \ 'javascript': ['tsserver'],
"       \ 'javascriptreact': ['tsserver']
"       \}

""
" MISC
""

let g:jsx_ext_required = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 0 " tmp disabled, need to make ts and flow work well together

autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

""
" Extensions
""

" RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" Show syntax highlighting groups for word under cursor
" nmap <C-S-P> :call <SID>SynStack()<CR>
" function! <SID>SynStack()
"   if !exists("*synstack")
"     return
"   endif
"   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
" endfunc

" Execute current file
" nmap <leader>r :!ruby -I %:p:h %<CR>
" nmap <leader>r :! clear && printf '\e[3J' && v run %<CR>
" nmap <leader>r :! clear && printf '\e[3J' && elixir %<CR>
" nmap <leader>r :! clear && printf '\e[3J' && lua %<CR>
" nmap <leader>r :! clear && printf '\e[3J' && rustc -o main % && ./main<CR>
" nmap <leader>r :! clear && printf '\e[3J' && ./run %<CR>
" nmap <leader>r :! clear && printf '\e[3J' && ruby -rpry -I %:p:h %<CR>
" nmap <leader>r :! clear && printf '\e[3J' && clojure %<CR>
" nmap <leader>r :! clear && printf '\e[3J' && scala %<CR>
" nmap <leader>r :! clear && printf '\e[3J' && dart --disable-analytics run %<CR>
" nmap <leader>r :! clear && printf '\e[3J' && escript %<CR>
nmap <leader>r :! clear && printf '\e[3J' && rspec %<CR>
" TODO: plugin to execute different programming languages files

" Solution for performance problem
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
" autocmd BufWinLeave * call clearmatches()

" Solution for syntax highlight problem and hangup in typescript files
" autocmd BufEnter *.{jsx,tsx} :syntax sync fromstart
" autocmd BufLeave *.{jsx,tsx} :syntax sync clear

""
" Commands
""

" Working with vimrc
if !exists(":EditVimInit")
  command EditVimInit :e $MYVIMRC
endif
if !exists(":ReloadVimInit")
  command ReloadVimInit :source $MYVIMRC
endif

"
" Shortcuts
"
nmap <leader>d :Ex<CR>

nmap <leader>l :!./node_modules/.bin/eslint --no-ignore %<CR>

nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" The sudo tee trick mappings
cmap w!! w !sudo tee % >/dev/null

