# How to use GNU Stow
- install stow on the machine
- clone this repo into ~/.dotstow
- cd to ~/.dotstow
- run `path/to/stow -v -R */`
    - `-v`: verbose; list out what stow is doing
    - `-R`: remove old links, and then add new links
    - `-t ~`: set the target directory to stow packages to
    - `*/`: the package to be installed, or wildcard to install all packages
