
# Installation of Omarchy

## Deleted things

- 1password
- Typora (no vim motions) :(
-./config
  - ghostty

## Setup apps

### Hyprmon for multiple Monitors

```bash
yay -S hyprmon-bin
```

### Rstudio and air formatter

Install rstudio from yay. And add air in formatting settings of Rstudio

### Firefox

1) Set it as standard Browser

```bash
xdg-settings set default-web-browser firefox.desktop
```

### ranger

In .bashrc add:

```txt
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
```

Also install ueberzugpp

```bash
sudo pacman -Sy ueberzugpp
```

### Conda

# TODOs

1) Ranger thumbnails are stange
2) Bash completions
3) Cli completions scroll with tab
4) conda
5) Voice Recognition script
6) CLi gray completions by the half of the command
7) Language notifications, or lang in bar
