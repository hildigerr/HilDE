#!/bin/sh

config_file="${XDG_CONFIG_HOME:-$HOME/.config}/xbindkeysrc"
if [ ! -f "$config_file" ]; then
  if [ -f "$HOME/.xbindkeysrc" ]; then
    echo "Warning: For better organization, you can move your .xbindkeysrc into your XDG config directory:"
    echo "     mv \"$HOME/.xbindkeysrc\" \"$config_file\""
    echo "This will move it to: \"$config_file\""
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
