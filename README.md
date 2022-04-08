# How to use GNU Stow
- install stow on the machine
- clone this repo into ~/.dotstow
- cd to ~/.dotstow
- run `path/to/stow -v -R */`
    - `-v`: verbose; list out what stow is doing
    - `-R`: remove old links, and then add new links
    - `-t ~`: set the target directory to stow packages to
    - `*/`: the package to be installed, or wildcard to install all packages

# How to setup git submodules
- run `git submodule init`
- run `git submodule update ...` (where ... is the respective submodules)

# Shell
- zsh

# Package managers
- [homebrew](docs/homebrew-packages.md)
- [npm](docs/npm-packages.md)
- [pip](docs/pip-packages.md)
- yarn

# Fonts
- [FuraCode](fonts/FuraCode)
- [JetBrains](fonts/JetBrains)

# Other setups
- [Fedora](docs/fedora-setup.md)
- [GCM](docs/gcm-setup.md)

# TODO
- create an `install.sh`
