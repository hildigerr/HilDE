#!/bin/sh

exit # Don't Run This Yet

# Prepare System
add-apt-repository ppa:moonsdad/ppa
apt-get purge \
  byobu \
  yelp #https://bugs.launchpad.net/ubuntu/+source/yelp/+bug/1404728
apt-get autoremove
apt-get update && apt-get upgrade && apt-get dist-upgrade

# GUI Basis
apt-get install xinit xdm lxpanel

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

# Enable Desktop Environment for User
pushd . && cd .. #Expecting to called from within HilDE/bin/
  make install && cp -r /usr/share/lxpanel/profile/hilde $HOME/.config/default
  cp `which hilde-start` $HOME/.Xsession
popd

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

