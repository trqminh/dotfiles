# dotfiles
vim, tmux
## preferences
- regarding vim, nerdtree, fzf, and gits.   
- regarding tmux, my own custom solarized colors and geohot's key bindings 
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


