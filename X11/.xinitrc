urxvtd -o -q -f
setxkbmap -option caps:escape
xrdb -merge ~/.config/X11/.Xresources
exec i3
