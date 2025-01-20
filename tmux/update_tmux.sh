file=~/tmux/tmux
if [ -f "$file" ]; then
    echo "tmux already installed"
    exit 1
fi

git clone https://github.com/tmux/tmux.git ~/tmux/

cd ~/tmux/
bash autogen.sh
./configure
make && sudo make install
cd -

if [ -f "$file" ]; then
    echo "tmux is successfully installed"
    echo "alias tmux='~/tmux/tmux'" >> ~/.bashrc
fi
