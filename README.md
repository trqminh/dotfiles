# dotfiles
Vim, tmux, kitty
## preferences
I use vim with nerdtree, fzf, and git gutter. With tmux, I use the config from geohot and also have some modifications.
## Installation
```
git clone https://github.com/trqminh/dotfiles.git
cd dotfiles
```
Install tmux, vim, and kitty config
```
bash light_install.sh
```
Install fonts
```
mkdir ~/.local/share/fonts/
cp -n ./fonts/* ~/.local/share/fonts/
fc-cache -f -v
```


