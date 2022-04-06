# How to use GNU Stow
- install stow on the machine
- clone this repo into ~/.dotstow
- cd to ~/.dotstow
- run `path/to/stow -v -R .`
    - `-v`: verbose; list out what stow is doing
    - `-R`: remove old links, and then add new links
    - `-t ~`: set the target directory to stow packages to
    - `.`: the package to be installed, or wildcard to install all packages

# How to setup git submodules
- run `git submodule init`
- run `git submodule update ...` (where ... is the respective submodules)

# Shell
- zsh

# Package managers
- homebrew
- npm
- pip
- yarn

# Homebrew
- node
- python
- adoptopenjdk11
- alacritty
- macdown
- fzf
- zoxide
- ripgrep
- yarn
- tree
- git
- neovim
- stow
- tmux
- ffmpeg
- mysql
- mycli

# npm
- neovim
- create-react-app
- typescript

# pip
- neovim

# Fonts
- [FuraCode](fonts/)

# Other setups
- [Fedora](docs/fedora-setup.md)

# TODO
- create an `install.sh`
