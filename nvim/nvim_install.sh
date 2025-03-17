NVIM_FOLD=~/nvim-linux-x86_64/bin/
if [ -d "$NVIM_FOLD" ]; then
    echo "[nvim]: OK"
else 
    echo "INSTALL nvim"
    cd ~
    wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz 
    tar xzvf ~/nvim-linux-x86_64.tar.gz
    echo "alias nvim='~/nvim-linux-x86_64/bin/nvim'" >> ~/.bashrc
    cd -
fi

FILE=~/.local/share/nvim/site/autoload/plug.vim
PLUG_FOLDER=~/.local/share/nvim/site/autoload/
if [ -f "$FILE" ]; then
    echo "[vimplug for nvim]: OK"
else 
    echo "INSTALL VIMPLUG for nvim..."
    mkdir -p PLUG_FOLDER
    wget -P $PLUG_FOLDER 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

echo "[nodejs install..]"
if [ -d "${HOME}/.nvm/.git" ]; then
    echo "[nvm]: installed"
else
    cd ~
    #curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh -o install_nvm.sh
    wget -O install_nvm.sh https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh
    bash install_nvm.sh
    cd -

    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc
fi

mkdir -p ~/.config/nvim/
cp nvim/init.vim ~/.config/nvim/init.vim
cp nvim/pyright.py ~/.config/nvim/pyright.py
