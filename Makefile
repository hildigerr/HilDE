BINDIR=${DESTDIR}/usr/local/bin
SKELDIR=${DESTDIR}/etc/skel
PIXDIR=${DESTDIR}/usr/share/pixmaps
XRESOURCES=${DESTDIR}/etc/X11/xdm/Xresources
LXPDIR=${DESTDIR}/usr/share/lxpanel/profile

WALLSIZE=1600x900

WALLPAPER=img/bg/Hippo-in-a-TuTu-${WALLSIZE}.png
START_MENU_IMG=img/icons/places/24/start-menu.png



HilDE:
	@echo "HilDE is a Lightweight Desktop Environment"



.install: HilDE skel xdm ${WALLPAPER} ${START_MENU_IMG} bin/stop.sh
	cp bin/stop.sh               ${BINDIR}/hilde-logout
	mkdir -p                     ${LXPDIR}
	cp -r lxpanel-profile        ${LXPDIR}/hilde
	cp ${WALLPAPER}              ${PIXDIR}/
	cp -R img/icons/             ${DESTDIR}/usr/share/icons/HilDE/
	ln ${DESTDIR}/usr/share/icons/HilDE/places/24/start-menu.png ${PIXDIR}/

xdm: backup xtra/Xresources img/hilde-on-ubuntu.xpm
	cp xtra/Xresources           ${XRESOURCES}
	cp img/hilde-on-ubuntu.xpm   ${DESTDIR}/usr/share/X11/xdm/pixmaps/


skel: bin/start.sh xxxdirxxx
	cp bin/start.sh              ${SKELDIR}/.Xsession
	cp -r lxpanel-profile        ${SKELDIR}/.config/lxpanel/default

### Unnecessary:

backup:
	cp ${XRESOURCES}             ${XRESOURCES}.old-`date +%F`

xxxdirxxx:
	mkdir -p                     ${SKELDIR}/.config/lxpanel
	mv ${SKELDIR}/.config/lxpanel/default ${SKELDIR}/.config/lxpanel/default-old-`date +%F`

xsession: xtra/hilde.desktop
	cp xtra/hilde.desktop        ${DESTDIR}/usr/share/xsessions/

