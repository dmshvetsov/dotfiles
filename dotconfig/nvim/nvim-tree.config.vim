let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }
" close nvim tree when file is opened
let g:nvim_tree_quit_on_open = 1

command Ex :NvimTreeToggle

lua << EOF
require'nvim-tree'.setup {
  disable_netrw = true,
}
EOF
