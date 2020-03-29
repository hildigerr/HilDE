BINDIR=${DESTDIR}/usr/local/bin
SKELDIR=${DESTDIR}/etc/skel
PIXDIR=${DESTDIR}/usr/share/pixmaps
XRESOURCES=${DESTDIR}/etc/X11/xdm/Xresources

WALLSIZE=1600x900

WALLPAPER=img/bg/Hippo-in-a-TuTu-${WALLSIZE}.png
START_MENU_IMG=img/icons/places/24/start-menu.png
LOGIN_IMG=img/hilde.xpm


HilDE:
	@echo "HilDE is a Lightweight Desktop Environment"



.install: HilDE skel xdm ${WALLPAPER} ${START_MENU_IMG} bin/stop.sh
	cp bin/stop.sh               ${BINDIR}/hilde-logout
	chmod a+x                    ${BINDIR}/hilde-logout
	cp ${WALLPAPER}              ${PIXDIR}/
	cp -R img/icons/             ${DESTDIR}/usr/share/icons/HilDE/
	ln ${DESTDIR}/usr/share/icons/HilDE/places/24/start-menu.png ${PIXDIR}/

xdm: backup xtra/Xresources ${LOGIN_IMG}
	cp xtra/Xresources           ${XRESOURCES}
	cp ${LOGIN_IMG}              ${DESTDIR}/usr/share/X11/xdm/pixmaps/


skel: bin/start.sh
	cp bin/start.sh              ${SKELDIR}/.Xsession

### Unnecessary:

backup:
	cp ${XRESOURCES}             ${XRESOURCES}.old-`date +%F`

