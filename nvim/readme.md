## Nvim installation
- nvim + coc (root command required)
### 1. Steps
```
cd nvim/
sh nvim_install.sh
source ~/.bashrc
nvm install v14
:PlugInstall
:CocInstall coc-json coc-python coc-snippets coc-vimlsp
```
### 2. Coc python settings
Note that coc.nvim when updated requires higher nodejs versions. Use `nvm install version` to install a new version 
if needed, `nvm list` to list all installed versions of nodejs and use `nvm alias default version` to specify the 
default version.
```
conda activate ENV_NAME
conda install jedi
vi
:CocConfig
```
then add or modify the python path:
```
{
    "python.pythonPath": "/home/tqminh/anaconda3/envs/ENV_NAME/bin/python"
}
```

### 3. Copilot.nvim
Install
```
git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim
```
Setup:
```
:Copilot setup
```
Note that copilot.nvim also requires high nodejs versions.
