BINDIR=${DESTDIR}/usr/local/bin
PIXDIR=${DESTDIR}/usr/share/pixmaps
XRESOURCES=${DESTDIR}/etc/X11/xdm/Xresources

START_MENU_IMG=img/icons/places/24/start-menu.png
LOGIN_IMG=img/hilde.xpm


HilDE:
	@echo "HilDE is a Lightweight Desktop Environment"



.install: HilDE xdm ${START_MENU_IMG} bin/stop.sh
	cp bin/stop.sh               ${BINDIR}/hilde-logout
	chmod a+x                    ${BINDIR}/hilde-logout
	cp -R img/icons/             ${DESTDIR}/usr/share/icons/HilDE/
	ln ${DESTDIR}/usr/share/icons/HilDE/places/24/start-menu.png ${PIXDIR}/

xdm: backup xtra/Xresources ${LOGIN_IMG}
	cp xtra/Xresources           ${XRESOURCES}
	cp ${LOGIN_IMG}              ${DESTDIR}/usr/share/X11/xdm/pixmaps/


debsetup:
	mv files/etc/skel/.xinitrc   files/etc/skel/.Xsession

### Unnecessary:

backup:
	cp ${XRESOURCES}             ${XRESOURCES}.old-`date +%F`

