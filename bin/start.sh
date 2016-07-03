#!/bin/sh
#
# HilDE is a Light Desktop Environment
#

NONE=true       # <--Exec `true` for unused Parts

##CONFIGURATION##
TASKBAR=$NONE   #
FILEMGR=$NONE   #
WALLPAP=$NONE   #
EXTRA=$NONE     #
WINMGR=$NONE    #
#################

$TASKBAR &
$FILEMGR &
$WALLPAP &
$EXTRA   &
$WINMGR
