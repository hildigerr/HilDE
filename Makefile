PIXDIR=${DESTDIR}/usr/share/pixmaps
XRESOURCES=${DESTDIR}/etc/X11/xdm/Xresources

START_MENU_IMG=img/icons/places/24/start-menu.png


HilDE:
	@echo "HilDE is a Lightweight Desktop Environment"



.install: HilDE backup ${START_MENU_IMG}
	chmod a+x                    files/usr/bin/hilde-logout
	cp -R img/icons/             ${DESTDIR}/usr/share/icons/HilDE/
	ln ${DESTDIR}/usr/share/icons/HilDE/places/24/start-menu.png ${PIXDIR}/


debsetup:
	mv files/etc/skel/.xinitrc   files/etc/skel/.Xsession
	mkdir files/usr/share/X11
	mv files/usr/share/xdm       files/usr/share/X11
	sed -i s.share/xdm.share/X11/xdm. files/etc/X11/xdm/Xresources

### Unnecessary:

backup:
	cp ${XRESOURCES}             ${XRESOURCES}.old-`date +%F`

