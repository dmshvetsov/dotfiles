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

### Searching and openening files

`<C-p>` – open fzf search
`:ex` or `<leader>d` – open netrw file explorer in the current directory

In fzf:

`<CR>` – open file under the cursor in a new buffer
`<C-t>` – open file under the cursor in a new Vim tab
`<C-s>` – open file under the cursor in a horizontal split panel
`<C-v>` – open file under the cursor in a vertiacal split panel

in netrw file explorer:

`<CR>` open file under the cursor in a new buffer
`t` – open fie under the cursor in a new tab
`s` – open fie under the cursor in a horizontal split panel
`v` – open fie under the cursor in a vertiacal split panel

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

Use `<C-p>` and `<C-n>` to move betwee lines with files in the git status output.  Press minus key `-` to add or remove file under the cursor from the git index. You can use vim visual mode to add multiple files with single `-` key press.

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
