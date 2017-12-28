#!/bin/sh

echo "Don't Run This -- Just for Reference" && exit

# Prepare System
add-apt-repository ppa:moonsdad/ppa
apt-get purge \
  byobu \
  yelp #https://bugs.launchpad.net/ubuntu/+source/yelp/+bug/1404728
apt-get autoremove
apt-get update && apt-get upgrade && apt-get dist-upgrade


# GUI Basis
apt-get install xinit xdm
apt-get install lxpanel lxappearance

# Desktop Environment Default Theme
ln -s /usr/share/lxpanel/profile/hilde /etc/skel/.config/lxpanel/default
cp -R img/icons/ /usr/share/icons/HilDE/
ln /usr/share/icons/HilDE/places/24/start-menu.png /usr/share/pixmaps/start-menu.png

# Desktop Environment Default Apps
# Terminal Emulator
apt-get install termit
sed -i -e "s/^defaults.topMenu = false/defaults.topMenu = true/" /etc/xdg/termit/rc.lua
# Text and Number Processing
apt-get install medit speedcrunch
# Networking
apt-get install firefox
# Games
apt-get install roll
# Image Processing
apt-get install imagemagick gimp
# Audio Processing
apt-get install sox libsox-fmt-all

# Development
apt-get install meld bugd git ascii
apt-get install --install-suggests build-essential
apt-get install --install-suggests devhelp


# Enable Desktop Environment for Users

# Basic Default Security Settings
# Logging and UMASK
sed -i.old-`date +%F` -e "s/^#SULOG_FILE/SULOG_FILE/" /etc/login.defs
sed -i -e "s/^UMASK.*$/UMASK\t\t077/" /etc/login.defs
sed -i -e "s/#umask 022/#umask 077/" /etc/skel/.profile

# Use users Group
sed -i -e "s/USERGROUPS_ENAB yes/USERGROUPS_ENAB no/" /etc/login.defs
sed -i -e "s/^# GROUP=100/GROUP=100/" /etc/default/useradd
usermod -g users $USER && gpasswd -d $USER $USER && delgroup $USER
chmod -R g-w $HOME

# users can shutdown and reboot
echo |                       (EDITOR="tee -a" visudo)
echo "#Users can shutdown" | (EDITOR="tee -a" visudo)
echo "%users ALL =NOPASSWD: /sbin/poweroff,/sbin/shutdown,/sbin/reboot" | \
                             (EDITOR="tee -a" visudo)

