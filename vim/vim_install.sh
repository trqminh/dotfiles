FOLD=~/.fzf/
if [ -d "$FOLD" ]; then
    echo "[fzf]: OK"
else
    echo "INSTALL FZF..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi


FILE=~/.vim/autoload/plug.vim
PLUG_FOLDER=~/.vim/autoload/
if [ -f "$FILE" ]; then
    echo "[vimplug for nvim]: OK"
else 
    echo "INSTALL VIMPLUG for nvim..."
    mkdir -p $PLUG_FOLDER
    #sh -c 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    #   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    wget -P $PLUG_FOLDER https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

cp vim/vimrc ~/.vimrc
