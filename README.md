# Installation of Omarchy
## Capslock to Ctrl
In .config/hypr/input.conf add
```kb_options = ctrl:nocaps```

## Change shortcuts
- Super Tab changing window in desktop
Add in .config/hypr/bindings.conf
```
unbind = SUPER, TAB
bind = SUPER, TAB, cyclenext
```

## Deleted things
- 1password
- Typora (no vim motions) :( 
-./config
  - ghostty

## Setup apps
### Trash-put instead of rm
```pacman -Sy trash-cli```

In .bashrc add:
```alias rm=trash-put```

### Hyprmon for multiple Monitors
```yay -S hyprmon-bin```

### Rstudio and air formatter
Install rstudio from yay. 

### CLI
1) starship
2) Completions

### nvim

### Firefox
1) Set it as standard Browser
```xdg-settings set default-web-browser firefox.desktop```

### ranger
In .bashrc add:
```alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'```
Also install ueberzugpp
```sudo pacman -Sy ueberzugpp```

!TODO strange showing of images. 

### Conda




