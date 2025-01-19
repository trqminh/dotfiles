git clone https://github.com/tmux/tmux.git ~/tmux/

cd ~/tmux/
bash autogen.sh
./configure
make && sudo make install
cd -

