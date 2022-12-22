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
