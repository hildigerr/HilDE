#!/bin/sh

config_file="${XDG_CONFIG_HOME:-$HOME/.config}/xbindkeysrc"
if [ ! -f "$config_file" ]; then
  if [ -f "$HOME/.xbindkeysrc" ]; then
    config_file="$HOME/.xbindkeysrc"
  else
    config_file="/etc/xdg/hilde/xbindkeysrc"
  fi
fi

xbindkeys -f "$config_file" &
