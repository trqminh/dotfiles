FILE=~/.vim/autoload/plug.vim
if [ -f "$FILE" ]; then
    echo "vimplug is setup"
else 
    echo "$FILE does not exist"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

cp ./current/.vimrc ~/.vimrc
cp ./.ideavimrc ~/.ideavimrc
