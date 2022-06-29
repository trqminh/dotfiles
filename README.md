# dotfiles
vim, tmux
## preferences
- vim: with nerdtree, fzf, and git gutter.   
- tmux: config from geohot + some modifications.
## Installation
```
git clone https://github.com/trqminh/dotfiles.git
cd dotfiles
```
Install vim plug, fzf, and transfer vim + tmux config
```
bash install.sh
```
Install fonts
```
mkdir ~/.local/share/fonts/
cp -n ./fonts/* ~/.local/share/fonts/
fc-cache -f -v
```


