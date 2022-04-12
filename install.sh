#!/bin/zsh

# clone dotfile structure into home
if [[ -d "~/.dotstow"]] then
    echo ".dotstow exists, continue install progress..."
else
    git clone https://github.com/JeremyChuaWX/dotstow.git .dotstow
fi
echo "===== Done =====\n"

# setup git submodules
echo "===== Clone git submodules ====="
echo "--> Initalising submodules"
git submodule init
echo "--> Updating submodules"
git submodule update
echo "===== Done =====\n"

#---------------------------------------------------------------------------------------------------
#-- MacOS setup ------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

if [[ $OSTYPE = "darwin"* ]] then

    #--------------------#
    #- Install homebrew -#
    #--------------------#
    
    echo "===== Install homebrew ====="
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)
    echo "===== Done ====="
fi

#---------------------------------------------------------------------------------------------------
#-- Linux setup ------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

if [[ $OSTYPE = "linux-gnu" ]] then

    #---------------#
    #- First steps -#
    #---------------#

    # writing sane options to dnf
    echo "===== Writing sane options to dnf.conf ====="
    if [[ $(grep "defaultyes" /etc/dnf/dnf.conf) = "" ]] then
        echo "defaultyes=True\nfastestmirror=True\nmax_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
    else
        echo "dnf options have been set"
    fi
    echo "===== Done =====\n"

    #-----------------#
    #- Update system -#
    #-----------------#

    echo "===== Updating system ====="
    sudo dnf -y update
    echo "===== Done =====\n"

    #--------------------#
    #- Install packages -#
    #--------------------#
    
    # rpm fusion
    echo "===== Installing rpm fusion repos ====="
    sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    echo "===== Done =====\n"

    # media codecs
    echo "===== Installing media codecs ====="
    sudo dnf -y install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
    sudo dnf -y install lame\* --exclude=lame-devel
    sudo dnf -y group upgrade --with-optional Multimedia
    echo "===== Done =====\n"

    # nvidia drivers
    echo "===== Installing nvidia drivers ====="
    if [[ $(sudo lspci | grep "VGA") = "" ]] then
        echo "no nvidia card"
    else
        sudo dnf -y install akmod-nvidia
        sudo dnf -y install xorg-x11-drv-nvidia-cuda
    fi
    echo "===== Done =====\n"
    
    # other package managers
    echo "===== Installing other package managers ====="
    sudo dnf -y install python3-pip nodejs
    echo "===== Done =====\n"

    # text editors
    echo "===== Installing text editors ====="
    sudo dnf -y install vim neovim
    echo "===== Done =====\n"

    # utilities
    echo "===== Installing utilities ====="
    sudo dnf -y install zsh stow pass breeze-cursor-theme gnome-tweaks ripgrep gcc-c++
    echo "===== Done =====\n"

    # other apps
    echo "===== Installing other apps ====="
    sudo dnf -y install discord
    sudo rpm --import https://keys.openpgp.org/vks/v1/by-fingerprint/034F7776EF5E0C613D2F7934D29FBD5F93C0CFC3
    sudo dnf -y config-manager --add-repo https://rpm.librewolf.net
    sudo dnf -y install librewolf

fi


#---------------------------------------------------------------------------------------------------
#-- Stow configs -----------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

echo "===== Stow configs ====="
cd ~/.dotstow/
stow -v -R */
echo "===== Done ====="
