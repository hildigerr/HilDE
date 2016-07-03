#!/bin/sh

exit # Don't Run This Yet

# Prepare System
add-apt-repository ppa:moonsdad/ppa
apt-get update && apt-get upgrade && apt-get dist-upgrade

# GUI Basis
apt-get install xinit

# Desktop Environment Default Apps
apt-get install termit medit speedcrunch
apt-get install --install-suggests firefox

# Desktop Environment Extra Apps (Games+Media)
apt-get install roll
apt-get install recordmydesktop imagemagick gimp
apt-get install sox  libsox-fmt-all

# Development
apt-get install meld bugd
apt-get install --install-suggests build-essential
apt-get install --install-suggests devhelp