FILE=~/.vim/bundle/
if [ -d "$FILE" ]; then
    echo "vundle is setup"
else 
    echo "$FILE does not exist"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

cp ./current/.vimrc ~/.vimrc
