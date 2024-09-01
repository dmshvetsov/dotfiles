# Dmitry Shvetsov software configuration files

## Shell

avaliable configuration files:

- $HOME/.zshenv - for env files
- $HOME/.zprofile - commands to run on login
- $HOME/.zshrc - shell configuration
- $HOME/.zlogin - same as zprofile but read after .zshrc
- $HOME/.zlogout - execute command on shell exit

## TODO

- create .gitconfig in Projects folder or inform to do so manually
- automaticaly install all vim plugins utility dependencies
- install zsh (brew install zsh?), and set it as default in iterm ($ chsh -s `which zsh`)
- install xkbswitch-macosx from this [repo](https://github.com/myshov/xkbswitch-macosx) and this [repo](https://github.com/myshov/libxkbswitch-macosx) for vim-xkbswitch
- configure [bash completion for docker](https://docs.docker.com/compose/completion/)
- can i use [Nix](https://nixos.org/) to setup my working machines?

Imptovements to work with multiple spaces:

System Preferences > Mission Control > Uncheck "When switching to an application, switch to a Space with open windows for the application"

and map to switching withing the space to different keys, `CMD + TAB` for example, and switching between spaces to `CTR + F4` (it iwll switch shortcuts between each other)

OR

System Preferences > Keyboard > Shortcuts > Keyboard > Disable "Move focus to active or next window"

## Inspiration

- Solving the Dotfiles Problem (And Learning Bash) https://www.youtube.com/watch?v=mSXOYhfDFYo
