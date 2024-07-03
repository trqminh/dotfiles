NVIM_FOLD=~/nvim-linux64/bin/
if [ -d "$NVIM_FOLD" ]; then
    echo "[nvim]: OK"
else 
    echo "INSTALL nvim"
    wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz ~/
    tar xzvf ~/nvim-linux64.tar.gz
    echo "alias nvim='~/nvim-linux64/bin/nvim'" >> ~/.bashrc
fi

FILE=~/.local/share/nvim/site/autoload/plug.vim
if [ -f "$FILE" ]; then
    echo "[vimplug for nvim]: OK"
else 
    echo "INSTALL VIMPLUG for nvim..."
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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

cp vim/vimrc ~/.config/nvim/init.vim
