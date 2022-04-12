# Setup dnf.conf
```
# add to /etc/dnf/dnf.conf
fastestmirror=True
defaultyes=True
max_parallel_downloads=10
```

# Update system
```
sudo dnf update
```

# Install packages (to be included in the install script)
```
sudo dnf install stow python3-pip nodejs vim neovim pass
```

# Enable rpm fusion
- link: https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/
```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

# Plugins for movies and music
- link: https://docs.fedoraproject.org/en-US/quick-docs/assembly_installing-plugins-for-playing-movies-and-music/
```
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia
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
