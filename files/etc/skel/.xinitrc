#!/bin/sh
#
# HilDE is a Lightweight Desktop Environment
#


####CONFIGURATION####
TASKBAR=lxpanel
WALLPAP="display -window root /usr/share/pixmaps/default-background.png"
EXTRA=fbautostart
WINMGR=lwm
###################

$TASKBAR &
$WALLPAP &
$EXTRA   &
$WINMGR
