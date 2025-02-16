#!/bin/sh
#
# HilDE is a Lightweight Desktop Environment
#

export XDG_CURRENT_DESKTOP=HILDE

if [ -z "$XDG_CONFIG_HOME" ]; then
  XDG_CONFIG_HOME="$HOME/.config"
fi

#### CONFIGURATION ####
TASKBAR=lxpanel
WALLPAP="display -window root /usr/share/backgrounds/hilde/Hippo-in-a-TuTu-1600x900.png"
EXTRA="xbindkeys -f $XDG_CONFIG_HOME/.xbindkeysrc"
ASTART="env FBXDG_DE=$XDG_CURRENT_DESKTOP fbautostart"
WINMGR=lwm
#######################

# Ensure Drop-in Scripts are Sourced
xinitdir=/etc/X11/xinit
if [ -d $xinitdir/xinitrc.d ] ; then
  for f in "$xinitdir/xinitrc.d"/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

$TASKBAR &
$WALLPAP &
$EXTRA   &
$ASTART  &
$WINMGR
