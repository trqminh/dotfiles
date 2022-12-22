NVIM_FOLD=~/.config/nvim/
if [ -d "$NVIM_FOLD" ]; then
    echo "[nvim]: OK"
else 
    echo "INSTALL nvim"
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install neovim
    mkdir ~/.config/nvim/
    echo "alias vi='nvim'" >> ~/.bashrc
fi
cp ../vim/vimrc ~/.config/nvim/init.vim

FILE=~/.local/share/nvim/site/autoload/plug.vim
if [ -f "$FILE" ]; then
    echo "[vimplug for nvim]: OK"
else 
    echo "INSTALL VIMPLUG for nvim..."
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

echo "[nodejs install]"
if [ -d "${HOME}/.nvm/.git" ]; then
    echo "[nvm]: installed"
else
    cd ~
    curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh -o install_nvm.sh
    bash install_nvm.sh
    cd -

    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc
fi

