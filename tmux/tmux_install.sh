tmux source-file tmux/tmux-reset
tmux source-file tmux/$1.conf
cp tmux/$1.conf ~/.tmux.conf
