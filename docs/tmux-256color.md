# How to add `tmux-256color` to terminfo
- Download and unpack the latest nucurses terminal descriptions
    - `curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz && gunzip terminfo.src.gz`
- Compile `tmux-256color` terminal info; the result is placed into `~/.terminfo`
    - `tic -xe tmux-256color terminfo.src`
