## I3WM
### 2. Install i3 and related apps
```
sudo apt-get install i3
sudo apt-get install lxappearance
sudo apt-get install thunar
sudo apt-get install rofi
sudo apt-get install i3blocks
sudo apt-get install pavucontrol
sudo apt-get install xbacklight
sudo apt-get install feh

# copy configs
bash i3/i3_install.sh
```
Some i3 bindings-key issues can be found [here](https://github.com/vivien/i3blocks-contrib/commit/1b3efc6e44ca2a01da2fb23ac60dbfc49bdec33c) (for sound) and [here](https://sourabhtk37.github.io/blog/post/brightness-and-volume-control-i3/) (for brightness).   

My unsolved issues about i3wm:   
- A battery indicator
- Regional screenshots


Mapping capslock as left control, paste those to bashrc
```
xmodmap -e "remove lock = Caps_Lock"
xmodmap -e "keycode 66 = Control_L"
xmodmap -e "add control = Control_L"
```


### 3. Usage
Essential key bindingds
```
$mod + d: open rofi for searching and open app
$mod + number: change workspace
$mod + shift + number: move the current window to the destination workspace
$mod + shift + q: quit window
$mod + shift + r: restart i3
$mod + shift + x: lock screen
$mod + shift + e: exit i3

```
