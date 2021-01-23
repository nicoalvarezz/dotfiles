#!/bin/sh

userresources=$HOME/ .Xresources
usermodmap=$HOME/ .Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/ .Xmodmap

# merge defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi 

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f 
fi

picom &
setxkbmap us & # keyboard layout
xrandr --output eDP-1 --off --output HDMI-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal & # Screen cofig
#feh --bg-scale ~/.config/qtile/themes/Wallpapers/wallpaper02.jpg & # wallpaper
pulseaudio & # audio 
sudo rfkill unblock wifi
sudo ip link set wlo1  up
