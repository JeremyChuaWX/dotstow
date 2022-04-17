#!/bin/zsh

#---------------------------------------------------------------------------------------------------
#-- Clone dotfile structure into home --------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

echo "===== Clone dotstow repo ====="
HOME=$(eval echo ~$SUDO_USER)

if [[ ! -d "$HOME/.dotstow" ]] then
    sudo -u $SUDO_USER git clone https://github.com/JeremyChuaWX/dotstow.git .dotstow
else
    echo ".dotstow exists, continue install progress..."
fi

echo "===== Done =====\n"

#---------------------------------------------------------------------------------------------------
#-- Setup git submodules ---------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

echo "===== Clone git submodules ====="
echo "--> Initalising submodules..."
sudo -u $SUDO_USER git submodule init
echo "--> Updating submodules..."
sudo -u $SUDO_USER git submodule update
echo "===== Done =====\n"

#---------------------------------------------------------------------------------------------------
#-- MacOS setup ------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

if [[ $OSTYPE = "darwin"* ]] then

    #------------------------#
    #- System configuration -#
    #------------------------#

    echo "===== Setting system configurations ====="

    # Faster key repeat
    defaults write NSGlobalDomain KeyRepeat -int 2

    # Show filename extensions by default
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    # Enable tap-to-click
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

    echo "===== Done ====="

    #--------------------#
    #- Install homebrew -#
    #--------------------#
    
    echo "===== Install homebrew ====="

    if [[ ! $(which brew) ]] then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew already installed..."
    fi

    sudo -u $SUDO_USER brew update

    echo "===== Done ====="

    #--------------------#
    #- Install packages -#
    #--------------------#
    
    echo "===== Installing apps ====="
    sudo -u $SUDO_USER brew install alacritty
    echo "===== Done ====="

    echo "===== Installing text editors ====="
    sudo -u $SUDO_USER brew install neovim
    echo "===== Done ====="

    echo "===== Installing utilities ====="
    sudo -u $SUDO_USER brew install node python3 fzf git ripgrep tree tmux stow # utils
    sudo -u $SUDO_USER brew install black prettier # linters
    echo "===== Done ====="

fi

#---------------------------------------------------------------------------------------------------
#-- Linux setup ------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

if [[ $OSTYPE = "linux-gnu" ]] then

    if [[ $(which dnf) ]] then

        echo "==============================="
        echo "===== dnf system detected ====="
        echo "==============================="

        #---------------#
        #- First steps -#
        #---------------#

        # writing sane options to dnf
        echo "===== Writing sane options to dnf.conf ====="
        if [[ $(grep "defaultyes" /etc/dnf/dnf.conf) = "" ]] then
            echo "defaultyes=True\nfastestmirror=True\nmax_parallel_downloads=10" | sudo tee -a /etc/dnf/dnf.conf > /dev/null
            echo "dnf options have been set..."
        else
            echo "dnf options already set..."
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
        sudo dnf -y install vim neovim python3-neovim
        echo "===== Done =====\n"

        # window manager
        echo "===== Installing window managers ====="
        sudo dnf -y install awesome nitrogen
        echo "===== Done =====\n"

        # utilities
        echo "===== Installing utilities ====="
        sudo dnf -y install zsh stow pass breeze-cursor-theme gnome-tweaks ripgrep gcc-c++ # utils
        sudo dnf -y install black prettier # linters
        echo "===== Done =====\n"

        # other apps
        echo "===== Installing other apps ====="
        # discord
        sudo dnf -y install discord

        # librewolf
        sudo rpm --import https://keys.openpgp.org/vks/v1/by-fingerprint/034F7776EF5E0C613D2F7934D29FBD5F93C0CFC3
        sudo dnf -y config-manager --add-repo https://rpm.librewolf.net
        sudo dnf -y install librewolf

        echo "===== Done =====\n"

    fi

fi

#---------------------------------------------------------------------------------------------------
#-- Stow configs -----------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

echo "===== Stowing configs ====="
stow -vvvvv -R */
echo "===== Done =====\n"

#---------------------------------------------------------------------------------------------------
#-- Npm installs -----------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

echo "===== Installing global npm packages ====="
sudo npm -g i npm typescript create-react-app neovim prettier
echo "===== Done =====\n"

#---------------------------------------------------------------------------------------------------
#-- Pip installs -----------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

echo "===== Installing pip packages ====="
sudo -u $SUDO_USER pip3 install neovim
echo "===== Done =====\n"
