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


FOLD=~/.config/kitty/
if [ -d "$FOLD" ]; then
    echo "Copying kitty config.."
    cp ./kitty.conf ~/.config/kitty/kitty.conf
else
    echo "Machine does not have kitty terminal"
fi

cp ./lightvimrc ~/.vimrc
cp ./ideavimrc ~/.ideavimrc
cp ./tmux.conf ~/.tmux.conf
