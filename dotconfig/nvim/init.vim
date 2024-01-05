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
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring' " extension for comment.nvim
Plug 'mileszs/ack.vim'
Plug 'hoob3rt/lualine.nvim'
Plug 'christoomey/vim-system-copy'
" ctlspace tryout to replace fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"
" LSP + IDE features
" NOTE: use either manual or lsp-zero, not both
"
" OPTIONS 1: MANUAL LSP config dependencies
" Plug 'williamboman/mason.nvim'
" Plug 'williamboman/mason-lspconfig.nvim'
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'L3MON4D3/LuaSnip'
" Plug 'jose-elias-alvarez/null-ls.nvim'
" OPTIONS 2: LSP-ZERO config dependencies
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
" LSP-ZERO Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
" LSP-ZERO Snippets
Plug 'L3MON4D3/LuaSnip'
" FORMATTERS
Plug 'jose-elias-alvarez/null-ls.nvim'
" Snippet collection (Optional)
Plug 'rafamadriz/friendly-snippets'
" lsp-zero itself
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}
" git plugins
Plug 'lewis6991/gitsigns.nvim'
Plug 'NeogitOrg/neogit' " make sure it does not conflict with gitsigns
Plug 'sindrets/diffview.nvim'
"
" languages and syntax, only add if treesitter does not support it
"
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'pangloss/vim-javascript'
" Plug 'rvmelkonian/move.vim'
" Plug 'vim-ruby/vim-ruby'
" Plug 'ollykel/v-vim'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'elixir-editors/vim-elixir'
" Plug 'posva/vim-vue'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"
" colorschemes
"
Plug '~/Projects/open-source/neo-colorscheme.nvim'
" Plug 'arcticicestudio/nord-vim' " original
Plug 'shaunsingh/nord.nvim' " alternative nord vim colorscheme with LSP, treesitter support and mare
Plug 'embark-theme/vim'
Plug 'savq/melange'
Plug 'cocopon/iceberg.vim', {'as': 'iceberg'}
Plug 'rebelot/kanagawa.nvim'
Plug 'rose-pine/neovim', {'as': 'rose-pine'}
Plug 'nyoom-engineering/oxocarbon.nvim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'folke/tokyonight.nvim'
"
" dependencies
"
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'nvim-lua/plenary.nvim' " dependent: gitsigns.nvim, null-ls, neo-tree
Plug 'MunifTanjim/nui.nvim' " dependent: neo-tree
"
" tryout
"
" Plug 'tpope/vim-dispatch'
" Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'jparise/vim-graphql'
" Plug 'AndrewRadev/tagalong.vim' has issues with react fragments it replaces
" opening react fragment when you replace an opening tag inside this fragment
" Plug 'airblade/vim-gitgutter' " recommended for vim-js-file-import
" after neovim 0.5.0 try gitsigns
" Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
" Plug 'ludovicchabant/vim-gutentags' " for ctags, vim-js-file-import
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'kkvh/vim-docker-tools'
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'earthly/earthly.vim', { 'branch': 'main' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/playground' " is it included in neovim 8+?
Plug 'nvim-neo-tree/neo-tree.nvim'
" Plug 'vim-ctrlspace/vim-ctrlspace' " a replacement for fzf
" Plug 'github/copilot.vim'
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
" let g:embark_terminal_italics = 1
" colorscheme embark
colorschem neo
" colorscheme rose-pine
" require('rose-pine').setup({
"   --- @usage 'auto'|'main'|'moon'|'dawn'
"   variant = 'auto',
"   --- @usage 'main'|'moon'|'dawn'
"   dark_variant = 'main',
"   bold_vert_split = false,
"   dim_nc_background = false,
"   disable_background = false,
"   disable_float_background = false,
"   disable_italics = false,
"
"   --- @usage string hex value or named color from rosepinetheme.com/palette
"   groups = {
"     background = 'base',
"     background_nc = '_experimental_nc',
"     panel = 'surface',
"     panel_nc = 'base',
"     border = 'highlight_med',
"     comment = 'muted',
"     link = 'iris',
"     punctuation = 'subtle',
"
"     error = 'love',
"     hint = 'iris',
"     info = 'foam',
"     warn = 'gold',
"
"     headings = {
"       h1 = 'iris',
"       h2 = 'foam',
"       h3 = 'rose',
"       h4 = 'gold',
"       h5 = 'pine',
"       h6 = 'foam',
"     }
"     -- or set all headings at once
"     -- headings = 'subtle'
"   },
"
"   -- Change specific vim highlight groups
"   -- https://github.com/rose-pine/neovim/wiki/Recipes
"   highlight_groups = {
"     ColorColumn = { bg = 'rose' },
"
"     -- Blend colours against the "base" background
"     CursorLine = { bg = 'foam', blend = 10 },
"     StatusLine = { fg = 'love', bg = 'love', blend = 10 },
"
"     -- By default each group adds to the existing config.
"     -- If you only want to set what is written in this config exactly,
"     -- you can set the inherit option:
"     Search = { bg = 'gold', inherit = false },
"   }
" })

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

" hex codes colorizer plugin on tryout
lua require('colorizer').setup()

source $HOME/dotfiles/dotconfig/nvim/fzf.config.vim
" source $HOME/dotfiles/dotconfig/nvim/ctrlspace_config.vim
" :luafile ~/dotfiles/dotconfig/nvim/lsp_config.lua
:luafile ~/dotfiles/dotconfig/nvim/zero_lsp_config.lua
:luafile ~/dotfiles/dotconfig/nvim/status_line_config.lua
:luafile ~/dotfiles/dotconfig/nvim/treesitter_config.lua
:luafile ~/dotfiles/dotconfig/nvim/comment_config.lua
:luafile ~/dotfiles/dotconfig/nvim/neogit.lua
" old config nvin-lsp + nvin-lsp-installer (no longer maintained)
" remove backup when lsp is configured
" source $HOME/dotfiles/dotconfig/nvim/lsp.config_bak_20221009.vim
" remove legacy config when lsp is configured
" source $HOME/dotfiles/dotconfig/nvim/lsp.config.vim
" source $HOME/dotfiles/dotconfig/nvim/nvim-tree.config.vim
" source $HOME/dotfiles/dotconfig/nvim/orgmode.config.vim

" Highlight on yank
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=329, on_visual=true}

"
" status line
" https://github.com/hoob3rt/lualine.nvim
"

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
lua require('gitsigns').setup({ current_line_blame_opts = { virt_text = true, virt_text_pos = 'eol', delay = 1000, ignore_whitespace = false }, current_line_blame_formatter = '<abbrev_sha> <author> <author_time:%Y-%m-%d> - <summary>' })

"
" neogit
"
" command Gcontext Gblame
command G Neogit

"
" diffview
"
" command D DiffviewOpen


"
" neo-tree
" 
let g:neo_tree_remove_legacy_commands = 1
nmap <leader>ft :Neotree float<CR>

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
let g:javascript_plugin_flow = 0 " no longer using flow

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

nmap <leader>gt :! clear && yarn test<CR>

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

" use treesitter playground to display highlight under the cursor
nmap <leader>hg :TSHighlightCapturesUnderCursor<CR>

" The sudo tee trick mappings
cmap w!! w !sudo tee % >/dev/null

