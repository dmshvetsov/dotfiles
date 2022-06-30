" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" external dependencies, need to install manually:
" brew install fd code-minimap

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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'L3MON4D3/LuaSnip'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
"
" LSP
"
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
"
" languages and syntax
"
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
" Plug 'vim-ruby/vim-ruby'
" Plug 'ollykel/v-vim'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'elixir-editors/vim-elixir'
" Plug 'posva/vim-vue'
"
" colorschemes
"
Plug 'davidklsn/vim-sialoquent'
" Plug 'arcticicestudio/nord-vim' " original
Plug 'shaunsingh/nord.nvim' " alternative nord vim colorscheme with LSP, treesitter support and mare
Plug 'embark-theme/vim'
Plug 'savq/melange'
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
" Plug 'kkvh/vim-docker-tools'
" focus mode goyo and limelight
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'wfxr/minimap.vim'
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'earthly/earthly.vim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

""
" Main configuration
""

" allow unsaved changes in buffer switches
" disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1
" with `set hidden` netrw hidden buffers appear in buffers list
set hidden

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
" theme (color shceme and related) setup
"

" lua nord theme
" colorscheme nord

" original nord theme
" colorscheme nord
" let g:nord_bold = 1
" let g:nord_italic = 1
" let g:nord_italic_comments = 1
" let g:nord_underline = 1

" embark theme
let g:embark_terminal_italics = 1
colorscheme embark

set background=dark

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
source $HOME/dotfiles/dotconfig/nvim/lsp.config.vim
" source $HOME/dotfiles/dotconfig/nvim/nvim-tree.config.vim
" source $HOME/dotfiles/dotconfig/nvim/orgmode.config.vim

" Highlight on yank
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=329, on_visual=true}

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
  -- extensions = {'fzf', 'fugitive'}
  --   options = {
  --   icons_enabled = true,
  --   theme = 'auto',
  --   component_separators = { left = '>', right = '<'},
  --   section_separators = { left = '>', right = '<'},
  --   disabled_filetypes = {},
  --   always_divide_middle = true,
  -- },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        symbols = {error = 'e', warn = 'w', info = 'i', hint = 'h'},
      }
    },
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  -- inactive_sections = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = {'filename'},
  --   lualine_x = {'location'},
  --   lualine_y = {},
  --   lualine_z = {}
  -- },
  -- tabline = {},
  -- extensions = {}
}
EOF

"
" Minimap
"

let g:minimap_auto_start = 1
let g:minimap_close_filetypes = ['', 'startify', 'netrw', 'vim-plug', 'json'] " json is disabled because I often open extreamly large json files with vim and minimap is blocking content rendering

"
" Distraction free editor
"
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nmap <leader>g :Goyo<cr>

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
" TODO: before using again the solution below read about possible alternaives
" from
" - commetns here https://vim.fandom.com/wiki/Fix_syntax_highlighting
" - https://github.com/vim/vim/issues/2790
" autocmd BufEnter * :syntax sync fromstart

"
" fugutive
"
command Gcontext Gblame

"
" navigation
"

" paragraph movements without jump marks
nnoremap } :keepjumps normal! }<cr>
nnoremap { :keepjumps normal! {<cr>
xnoremap } :<C-u>keepjumps normal! gv}<cr>
xnoremap { :<C-u>keepjumps normal! gv{<cr>

" previous and next buffer
nmap <leader>[ :bprevious<cr>
nmap <leader>] :bnext<cr>

" close current buffer and open previous
" works with neovim split windows
" https://stackoverflow.com/a/19619038/6317812
nmap <leader>x :b#<bar>bd#<CR>

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

" Vim way
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

""
" MISC
""

let g:jsx_ext_required = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 0 " tmp disabled, need to make ts and flow work well together

""
" Extensions
""

" vim-commentary
" setting up .jsx and .tsx
if exists('g:context#commentstring#table')
  " TODO not sure if it works
  let g:context#commentstring#table['javascript.jsx'] = {
        \ 'jsComment' : '// %s',
        \ 'jsImport' : '// %s',
        \ 'jsxStatment' : '// %s',
        \ 'jsxRegion' : '{/*%s*/}',
        \}
  " TODO doesn't work
  let g:context#commentstring#table['typescriptreact'] = {
        \ 'tsComment' : '// %s',
        \ 'tsImport' : '// %s',
        \ 'tsxStatment' : '// %s',
        \ 'tsxRegion' : '{/*%s*/}',
        \}
endif

" Prettier
let g:prettier#autoformat = 0
" what is it?
" autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
nmap <leader>p  <Plug>(Prettier)
vmap <leader>p  :PrettierFragment<cr>

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
" nmap <leader>r :! clear && printf '\e[3J' && rspec %<CR>
" TODO: plugin to execute different programming languages files

nmap <leader>t :! clear && yarn test<CR>

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
" TODO only in JS/TS files
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

