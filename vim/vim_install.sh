FOLD=~/.fzf/
if [ -d "$FOLD" ]; then
    echo "[fzf]: OK"
else
    echo "INSTALL FZF..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

FILE=~/.vim/autoload/plug.vim
if [ -f "$FILE" ]; then
    echo "[vimplug]: OK"
else
    echo "INSTALL VIMPLUG..."
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

VIMDIM=~/.vim/pack/plugins/start/vim-dim
if [ -d "$VIMDIM" ]; then
    echo "[vim dim]: OK"
else
    echo "INSTALL vim dim color..."
    git clone --branch 1.x git@github.com:jeffkreeftmeijer/vim-dim.git ~/.vim/pack/plugins/start/vim-dim
fi

cp vim/vimrc ~/.vimrc
