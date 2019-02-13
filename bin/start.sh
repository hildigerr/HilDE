#!/bin/sh
#
# HilDE is a Light Desktop Environment
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
