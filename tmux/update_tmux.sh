if [ -d ~/tmux/ ]; then
    echo "tmux already installed"
    exit 0
fi

git clone https://github.com/tmux/tmux.git ~/tmux/

cd ~/tmux/
bash autogen.sh
./configure
make && sudo make install
cd -

echo "alias tmux='~/tmux/tmux'" >> ~/.bashrc
