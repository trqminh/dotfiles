## Nvim installation
- nvim + coc
### 1. Steps
- install nvim + nvm + config file
```bash
sh nvim/nvim_install.sh
source ~/.bashrc
```
- install nodejs
```bash
nvm install v20
```
- install nvim plugins
```bash
nvim
:PlugInstall
```

### 2. nvim-lspconfig

pyrightconfig.json
```
{
  "exclude": [
    "all_data/",
    "**/__pycache__",
    ".git",
    ".venv",
    "**/*.jpg",
    "**/*.png"
  ]
}
```

### 3. Coc python settings (deprecated)
Note that coc.nvim when updated requires higher nodejs versions. Use `nvm install version` to install a new version 
if needed, `nvm list` to list all installed versions of nodejs and use `nvm alias default version` to specify the 
default version.

- install nvim coc dependencies
```bash
:CocInstall coc-json coc-python coc-snippets coc-vimlsp
```
- specify python interpreter
```bash
conda activate ENV_NAME
conda install jedi
nvim
:CocConfig
```
then add or modify the python path:
```
{
    "python.pythonPath": "/home/tqminh/anaconda3/envs/ENV_NAME/bin/python",
    "snippets.ultisnips.pythonPrompt": false,
    "python.linting.pylintEnabled": true,
    "python.linting.pylintPath": "/home/tqminh/anaconda3/envs/ENV_NAME/bin/pylint",
    "python.linting.pylintArgs": [
        "--errors-only",
        "--generated-members=numpy.* ,torch.* ,cv2.* , cv.*"
    ],
    "diagnostic.checkCurrentLine": true
}
```
or using pyright:
```
:CocInstall coc-pyright
```
then, 
```
chmod +x ~/.config/nvim/pyright.py
```
and modify the python path:
```
{
    "python.pythonPath": "~/.config/nvim/pyright.py",
    "snippets.ultisnips.pythonPrompt": false,
    "python.linting.pylintEnabled": true,
    "python.linting.pylintArgs": [
        "--errors-only",
        "--generated-members=numpy.* ,torch.* ,cv2.* , cv.*"
    ],
    "diagnostic.checkCurrentLine": true
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
