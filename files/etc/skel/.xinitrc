#!/bin/sh
#
# HilDE is a Lightweight Desktop Environment
#


####CONFIGURATION####
TASKBAR=lxpanel
WALLPAP="display -window root /usr/share/backgrounds/hilde/Hippo-in-a-TuTu-1600x900.png"
EXTRA=fbautostart
WINMGR=lwm
###################

$TASKBAR &
$WALLPAP &
$EXTRA   &
$WINMGR
