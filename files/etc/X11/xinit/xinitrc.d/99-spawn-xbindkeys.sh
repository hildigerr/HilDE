#!/bin/sh

config_file="${XDG_CONFIG_HOME:-$HOME/.config}/xbindkeysrc"
if [ ! -f "$config_file" ]; then
  if [ -f "$HOME/.xbindkeysrc" ]; then
    config_file="$HOME/.xbindkeysrc"
  else
    config_file="/etc/xdg/hilde/xbindkeysrc"
  fi
fi

if command -v xbindkeys >/dev/null 2>&1; then
  xbindkeys -f "$config_file" &
else
  echo "Warning: xbindkeys is not installed. Not spawning."
fi
