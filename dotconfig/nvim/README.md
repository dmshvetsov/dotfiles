# NeoVim Config

## Glosary

Read glosarry to understadn the bellow content.

`%` – path to currently opened file
`C` or `ctrl` – control keyboard key
`S` or `shift` – shift keyboard key
`CR` – carege return same as hit the enter keyboard key
`:` – start Vim command
`<leader>` – leader key, `\` keyboard key by default

## Usage guide

### Navigating and openening files

`<leader>ff` – open fzf search
`:ex` or `<leader>d` – open netrw file explorer in the current directory

`<C-h>` - switch to the buffer on the left
`<C-j>` - switch to the buffer below
`<C-k>` - switch to the buffer a// bowe
`<C-l>` - switch to the buffer on the right

`]c` - previous change not staged in git
`[c` - next change not staged in git

`<leader>[` - previous buffer, the same as `:bp`
`<leader>]` - next buffer, the same as `:bn`
`<leader>x` - close current buffer, the same as `:bd` and open a previous buffer, if in a split window the window will be preserved

In fzf:

`<CR>` – open file under the cursor in a new buffer
`<C-t>` – open file under the cursor in a new Vim tab
`<C-s>` – open file under the cursor in a horizontal split panel
`<C-v>` – open file under the cursor in a vertiacal split panel

`gd` – go to where functiona or variable or class is defined
`gr` – show quick list of references where function, variable, or class is defined

`<C-o>` – go back

### Distraction free UI

`<leader>g` - toggle on and off simplifyed UI for reading and editing a buffer

### Project-wide search

`:Ack <pattern> [<search folder>]`

Use `:Ack!` to disable auto-open the first found result

### Manipulating content

`<leader>p` - to format current buffer in normal mode and selected lines in visual mode with [prettier](https://prettier.io/) and [vim-prettier plugin](https://github.com/prettier/vim-prettier)
`<leader>r` - rename symbol and all it usage in the projects
`<leader>a` - show code actions on current symbol under the cursor

### Working with Git

Powered by fugutive vim pluging

`Gread` - read opened file from the index, equivalent to `git checkout %`
`Gwrite` - add opened file to the git index, equivalent to `git add %`
`Gremove` - remove opened file from a repository
`Gmove` – move file in the repository (rename), equivalent to `git mv % a/new/path/to/the_file`, note it works relatively to the currently opened path, which is handy in Vim, start the destination path with slash `/path/to/file` if you want to move file relatively to the root of the repository.
`Gcommit` – make a commit in the current Vim instance, which has access to autocompletion of currently opened files
`Gstatus` – display current Git index status

#### Adding and removing files from index

Open git status:

    :Gstatus

Use `<C-p>` and `<C-n>` to move betwee lines with files in the git status output. Press minus key `-` to add or remove file under the cursor from the git index. You can use vim visual mode to add multiple files with single `-` key press.

If you want to add all of the files you might want to use:

    :Git add .

Use `=` key on a file under the cursor wil show inline diff for a file.

Use `<S-p>` to add or remove part of changed files to the Git index. Equal to `:Git add --patch %` or `:Git reset --patch %`.

Use `<CR>` to open a file in a Vim buffer.

Use `<S-c>` to make a commit. Note works only in the Fugutive status buffer.

#### Diff

To open a diff for a currently opened file use:

    :Gdiff

Use `:Gread` of read from the index when you in a file buffer and `:Gwrite` to add file to the Git index when you in the file buffer. It works vice versa when you are in an index buffer, `:Gread` will write a file to the index and `:Gwrite` will reset changes in a file.

#### Misc

Open indexed version of a file:

    :Gedit :path/to/a/file

or currently opened file:

    :Gedit :0

Open readonly buffer with a file from another branch

    :Gedit otherbranch:path/to/file

or if you want to see currently opened file

    :Gedit otherbranch:%

note autocompletion works for the branch name and the path to a file. `:Gvsplit` and `:Gsplit` wokrs like `:Gedit` but opens a file in a split buffer. You can open commit, tag, blob, or tree with these commands.

## Useful links

`:help :lua-heredoc` to learn how to use Lua from your `init.vim`.
