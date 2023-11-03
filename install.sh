#!/usr/bin/env zsh

DOTFILES=$HOME/.dotfiles

# create sym links
echo "Creating sym links"
ln -sf $DOTFILES/.zshrc $HOME/.zshrc 2>/dev/null
ln -sf $DOTFILES/.tmux.conf $HOME/.tmux.conf 2>/dev/null
ln -sf $DOTFILES/.gitconfig $HOME/.gitconfig 2>/dev/null

if  [ ! -e $HOME/.config/nvim ]; then
    ln -sd $DOTFILES/nvim $HOME/.config/nvim 2>/dev/null
fi

packages=("fzf" "ripgrep" "bat" "neovim")

echo "Installing apt packages"
for package in "${packages[@]}"; do
    if dpkg -l | grep -q "$package"; then
        echo "$package is already installed"
    else
        echo "installing $package"
        sudo apt-get install -y "$package"
        if [ $? -eq 0 ]; then
            echo "$package has been successfully installed"
        else 
            echo "Failed to install $package"
        fi
    fi
done

# specail packages
if ! dpkg -l | grep -q exa; then
    echo "installing exa"
    exa_package_name="exa_0.9.0-4_amd64.deb"
    wget -c http://old-releases.ubuntu.com/ubuntu/pool/universe/r/rust-exa/$exa_package_name
    sudo apt-get install ./$exa_package_name
    rm $exa_package_name
else 
    echo "exa is already installed"
fi

if ! [ -e /usr/local/bin/lazygit ]; then
    echo "installing lazygit"
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm lazygit.tar.gz
    rm lazygit
else 
    echo "lazygit is already installed"
fi

