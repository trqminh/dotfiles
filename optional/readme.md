## Optional installation
- nvim + coc (root command required)
### 1. Steps
```
cd optional/
sh optional_install.sh
nvm install v12.18.0
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
