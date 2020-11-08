FOLD=~/.fzf/
if [ -d "$FOLD" ]; then
    echo "[fzf]: OK"
else 
    echo "INSTALL FZF..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

sudo apt-get install neovim

FILE=~/.local/share/nvim/site/autoload/plug.vim
if [ -f "$FILE" ]; then
    echo "[vimplug]: OK"
else 
    echo "INSTALL VIMPLUG..."
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

AUTO_FOLD=/home/quangminh/.oh-my-zsh/custom/plugins/zsh-autosuggestions
if [ -d "$AUTO_FOLD" ]; then
    echo "[autosuggestions]: OK"
else 
    echo "INSTALL autosuggestions-zsh..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

cp ./.vimrc ~/.vimrc
cp ./.ideavimrc ~/.ideavimrc
cp ./kitty.conf ~/.config/kitty/kitty.conf
cp -n ./fonts/Monaco-Linux.ttf ~/.local/share/fonts/
cp ./colors/minh_blue.vim ~/.vim/colors/
cp ./init.vim ~/.config/nvim/init.vim
cp ./.zshrc ~/.zshrc

echo DONE!!!
