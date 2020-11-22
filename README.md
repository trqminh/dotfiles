# dotfiles
Zsh, Neovim, kitty terminal
## To Install
```
git clone https://github.com/trqminh/dotfiles.git
cd dotfiles
```
### Install nodejs for coc (using nvm)
```
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh -o install_nvm.sh
bash install_nvm.sh
```
Some variables need to be exported, and then install what ever version of nodejs:
```
nvm install v13.14.0
```
### Full Installation (Vimplug, fzf, fonts, zsh, kitty config, coc...)
```
sh install.sh
```
then
```
vi
:PlugInstall
```
### Light Installation (NVim/Vim config only)
```
sh light_install.sh
```
There will be some errors of coc that just need to follow the instructions
