# Setup dnf.conf
```
# add to dnf.conf
fastestmirror=True
defaultyes=True
max_parallel_downloads=10
```

# Update system
- sudo dnf update

# Enable rpm fusion
```
https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

# Plugins for movies and music
```
https://docs.fedoraproject.org/en-US/quick-docs/assembly_installing-plugins-for-playing-movies-and-music/
```

# Nvidia drivers
```
sudo dnf install akmod-nvidia
sudo dnf install xorg-x11-drv-nvidia-cuda
```

# Map caps to escape
```
`dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"`
```
