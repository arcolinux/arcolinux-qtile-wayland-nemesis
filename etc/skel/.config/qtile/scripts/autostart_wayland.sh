#!/usr/bin/env bash
# Autostart script for Qtile under Wayland session
# Mimics the X11 version, including the 'run' function.

function run {
  # If the command is not already running, launch it
  if ! pgrep -x $(basename "$1" | head -c 15) 1>/dev/null; then
    "$@" &
  fi
}

#Set your native resolution IF it does not exist in xrandr
#More info in the script
#run $HOME/.config/qtile/scripts/set-screen-resolution-in-virtualbox.sh

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal

# autostart ArcoLinux Welcome App
run dex $HOME/.config/autostart/arcolinux-welcome-app.desktop &

# Set your wallpaper
run swaybg -i /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg -m fill &
run swaybg -i /usr/share/backgrounds/archlinux/arch-wallpaper.jpg -m fill &
# wallpaper for other Arch based systems
# run swaybg -i /usr/share/archlinux-tweak-tool/data/wallpaper/wallpaper.png -m fill &

#starting utility applications at boot time
run variety &
#run nm-applet &
#run pamac-tray &
#run xfce4-power-manager &
numlockx on &
#blueberry-tray &
#picom --config $HOME/.config/qtile/scripts/picom.conf &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#/usr/lib/xfce4/notifyd/xfce4-notifyd &

#starting user applications at boot time
#run volumeicon &
#run discord &
#nitrogen --restore &
#run caffeine -a &
#run vivaldi-stable &
#run firefox &
#run thunar &
#run dropbox &
#run insync start &
#run spotify &
#run telegram-desktop &
#run /usr/bin/octopi-notifier &
#run code &