Install fonts

### On Ubuntu
```
mkdir ~/.local/share/fonts/
cp -n ./fonts/* ~/.local/share/fonts/
rm -rf ~/.local/share/fonts/readme.md
fc-cache -f -v
```

### On Mac
```
cp -n ./fonts/* ~/Library/Fonts/
```
