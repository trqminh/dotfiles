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


cp vim/vimrc ~/.vimrc

tmux source-file tmux/tmux-reset
tmux source-file tmux/solarized_tmux.conf
cp tmux/solarized_tmux.conf ~/.tmux.conf
