# dotfiles (Archived)
This is my previous dotfiles set up with Zsh, Neovim, kitty terminal, and i3wm. I archived this since I am currently working much time on server machines, for which I don't have root privileges. Also, it's daunting to maintain and initial install in new machines.

## Screenshots and my preferences
...
## Installation
```
git clone https://github.com/trqminh/dotfiles.git
cd dotfiles
```
### 1. Install nodejs for coc (using nvm)
```
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh -o install_nvm.sh
bash install_nvm.sh
```
Some variables need to be exported, and then install what ever version of nodejs (included in zshrc):
```
nvm install v12.18.0
```
### 2. Install i3 and related apps
```
sudo apt-get install i3
sudo apt-get install lxappearance
sudo apt-get install thunar
sudo apt-get install rofi
sudo apt-get install i3blocks
sudo apt-get install pavucontrol
sudo apt-get install xbacklight
```
Some i3 bindings-key issues can be found [here](https://github.com/vivien/i3blocks-contrib/commit/1b3efc6e44ca2a01da2fb23ac60dbfc49bdec33c) (for sound) and [here](https://sourabhtk37.github.io/blog/post/brightness-and-volume-control-i3/) (for brightness).   

My unsolved issues about i3wm:   
- A battery indicator
- Regional screenshots



### 3. Full Installation (Vimplug, fzf, fonts, zsh, kitty config, coc, i3...)
One command for all
```
sh install.sh
```
then, in NVim
```
vi
:PlugInstall
```
and
```
:CocInstall coc-json coc-python coc-snippets coc-vimlsp
```
There will be some errors of coc that just needed to follow the instructions.



