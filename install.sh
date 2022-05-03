#!/bin/zsh

#---------------------------------------------------------------------------------------------------
#-- Clone dotfile structure into home --------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

echo "\n===== Clone dotstow repo ====="
USER_HOME=~$SUDO_USER

if [[ ! -d "$USER_HOME/.dotstow" ]] then
    sudo -u $SUDO_USER git clone https://github.com/JeremyChuaWX/dotstow.git .dotstow
else
    echo ".dotstow exists, continue install progress..."
fi

echo "===== Done =====\n"

# cd to .dotstow
cd $USER_HOME/.dotstow/
echo "cd into dotstow dir..."
pwd

#---------------------------------------------------------------------------------------------------
#-- Setup git submodules ---------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

echo "\n===== Clone git submodules ====="
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

    echo "\n===== Setting system configurations ====="

    # Faster key repeat
    defaults write NSGlobalDomain KeyRepeat -int 2
    defaults write NSGlobalDomain InitialKeyRepeat -int 15

    # Show filename extensions by default
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true

    # Enable tap-to-click
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

    echo "===== Done =====\n"

    #--------------------#
    #- Install homebrew -#
    #--------------------#
    
    echo "\n===== Install homebrew ====="

    if [[ ! $(which brew) ]] then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew already installed..."
    fi

    sudo -u $SUDO_USER brew update

    echo "===== Done =====\n"

    #--------------------#
    #- Install packages -#
    #--------------------#
    
    echo "\n===== Installing apps ====="
    sudo -u $SUDO_USER brew install alacritty
    echo "===== Done =====\n"

    echo "\n===== Installing text editors ====="
    sudo -u $SUDO_USER brew install neovim
    echo "===== Done =====\n"

    echo "\n===== Installing utilities ====="
    sudo -u $SUDO_USER brew install coreutils fzf git ripgrep fd tree tmux stow
    echo "===== Done =====\n"

    echo "\n===== Installing languages ====="
    sudo -u $SUDO_USER brew install node python3 go
    echo "===== Done =====\n"

fi

#---------------------------------------------------------------------------------------------------
#-- Linux setup ------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

if [[ $OSTYPE = "linux-gnu" ]] then

    if [[ $(which dnf) ]] then

        echo "\n==============================="
        echo "===== dnf system detected ====="
        echo "===============================\n"

        #---------------#
        #- First steps -#
        #---------------#

        # writing sane options to dnf
        echo "\n===== Writing sane options to dnf.conf ====="
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

        echo "\n===== Updating system ====="
        sudo dnf -y update
        echo "===== Done =====\n"

        #--------------------#
        #- Install packages -#
        #--------------------#
        
        echo "\n===== Installing rpm fusion repos ====="
        sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
        sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
        echo "===== Done =====\n"

        echo "\n===== Installing media codecs ====="
        sudo dnf -y install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
        sudo dnf -y install lame\* --exclude=lame-devel
        sudo dnf -y group upgrade --with-optional Multimedia
        echo "===== Done =====\n"

        echo "\n===== Installing nvidia drivers ====="
        if [[ $(sudo lspci | grep "VGA") = "" ]] then
            echo "no nvidia card"
        else
            sudo dnf -y install akmod-nvidia
            sudo dnf -y install xorg-x11-drv-nvidia-cuda
        fi
        echo "===== Done =====\n"
        
        echo "\n===== Installing other package managers ====="
        sudo dnf -y install python3-pip
        echo "===== Done =====\n"

        echo "\n===== Installing text editors ====="
        sudo dnf -y install vim neovim python3-neovim
        echo "===== Done =====\n"

        echo "\n===== Installing utilities ====="
        sudo dnf -y install zsh stow pass breeze-cursor-theme gnome-tweaks ripgrep fd-find gcc-c++
        echo "===== Done =====\n"

        echo "\n===== Installing languages ====="
        sudo dnf -y install nodejs go
        echo "===== Done =====\n"

        echo "\n===== Installing other apps ====="
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

echo "\n===== Stowing configs ====="
stow -vvvv -R */
echo "===== Done =====\n"

#---------------------------------------------------------------------------------------------------
#-- Npm installs -----------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

echo "\n===== Installing global npm packages ====="
sudo npm -g i npm typescript neovim prettier eslint_d
echo "===== Done =====\n"

#---------------------------------------------------------------------------------------------------
#-- Pip installs -----------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

echo "\n===== Installing pip packages ====="
sudo -u $SUDO_USER pip3 install neovim black flake8
echo "===== Done =====\n"
