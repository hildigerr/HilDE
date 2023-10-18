#!/bin/sh
#
# HilDE is a Lightweight Desktop Environment
#

if [ -z "$XDG_CONFIG_HOME" ]; then
  XDG_CONFIG_HOME="$HOME/.config"
fi

#### CONFIGURATION ####
TASKBAR=lxpanel
WALLPAP="display -window root /usr/share/backgrounds/hilde/Hippo-in-a-TuTu-1600x900.png"
EXTRA="xbindkeys -f $XDG_CONFIG_HOME/.xbindkeysrc"
ASTART=fbautostart
WINMGR=lwm
#######################

$TASKBAR &
$WALLPAP &
$EXTRA   &
$ASTART  &
$WINMGR
