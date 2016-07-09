#!/bin/sh
#
# HilDE is a Light Desktop Environment
#

NONE=true       # <--Exec `true` for unused Parts

##CONFIGURATION##
TASKBAR=lxpanel #
FILEMGR=$NONE   # Eg: pcmanfm, thunar, doublecmd-gtk
WALLPAP="display -window root /usr/share/pixmaps/default-background.png"
EXTRA=$NONE     #
WINMGR=lwm      # Eg: openbox, tinywm
#################

$TASKBAR &
$FILEMGR &
$WALLPAP &
$EXTRA   &
$WINMGR
