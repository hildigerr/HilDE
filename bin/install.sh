#!/bin/sh

echo "Don't Run This -- Just for Reference" && exit

install() { echo "install: " $@; }

# Prepare System
if which apt-get 2>/dev/null
  then
    add-apt-repository ppa:moonsdad/ppa
    apt-get purge \
      byobu \
      yelp #https://bugs.launchpad.net/ubuntu/+source/yelp/+bug/1404728
    apt-get autoremove
    apt-get update && apt-get upgrade && apt-get dist-upgrade
    install() { apt-get install $@; }
fi


# GUI Basis
install xinit xdm
install lxpanel

# Desktop Environment Default Theme
ln -s /usr/share/lxpanel/profile/hilde /etc/skel/.config/lxpanel/default
cp -R img/icons/ /usr/share/icons/HilDE/
ln /usr/share/icons/HilDE/places/24/start-menu.png /usr/share/pixmaps/start-menu.png

# Desktop Environment Default Apps
# Terminal Emulator
install hermit
# Text and Number Processing
install ed medit speedcrunch
# Networking
install firefox
# Games
install roll
# Image Processing
install imagemagick gimp
# Audio Processing
install sox libsox-fmt-all
# Misc
install pass xpad
# Development
install meld bugd git ascii
install --install-suggests build-essential
install --install-suggests devhelp


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

