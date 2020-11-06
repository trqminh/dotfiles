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
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

FOLD=~/.vim/colors/
if [ -d "$FOLD" ]; then
    echo "manual configuring colorscheme is ready !"
else 
    echo "Create .vim/colors/ ..."
    mkdir ~/.vim/colors/
fi

cp ./.vimrc ~/.vimrc
cp ./.ideavimrc ~/.ideavimrc
cp ./kitty.conf ~/.config/kitty/kitty.conf
cp -n ./fonts/Monaco-Linux.ttf ~/.local/share/fonts/
cp ./colors/minh_blue.vim ~/.vim/colors/
echo DONE!!!
