
XRESOURCES=${DESTDIR}/etc/X11/xdm/Xresources

HilDE:
	@echo "HilDE is a Lightweight Desktop Environment"



.install: HilDE backup
	chmod a+x                    files/usr/bin/hilde-logout


debsetup:
	mv files/etc/skel/.xinitrc   files/etc/skel/.Xsession
	mkdir files/usr/share/X11
	mv files/usr/share/xdm       files/usr/share/X11
	sed -i s.share/xdm.share/X11/xdm. files/etc/X11/xdm/Xresources

### Unnecessary:

backup:
	cp ${XRESOURCES}             ${XRESOURCES}.old-`date +%F`

