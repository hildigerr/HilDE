LXPDIR=$DESTDIR/usr/share/lxpanel/profile
BINDIR=$DESTDIR/usr/local/bin
XRESOURCES=$DESTDIR/etc/X11/xdm/Xresources

BIN=bin/start.sh bin/stop.sh
IMG=img/start-menu.xpm img/hilde-on-ubuntu.xpm
FILES=$BIN $IMG xtra/Xresources


HilDE:
	@echo "HilDE is a Lightweight Desktop Environment"


install: HilDE $FILES backup
	cp bin/start.sh              $BINDIR/hilde-start
	cp bin/stop.sh               $BINDIR/hilde-logout
	cp -r lxpanel-profile        $LXPDIR/hilde
	cp xtra/Xresources           $XRESOURCES
	cp img/hilde-on-ubuntu.xpm   $DESTDIR/usr/share/X11/xdm/pixmaps/
	cp img/start-menu.xpm        $DESTDIR/usr/share/pixmaps/

### Unnecessary:

backup:
	mv $XRESOURCES               $XRESOURCES.old-`date +%F`


xsession: xtra/hilde.desktop
	cp xtra/hilde.desktop        $DESTDIR/usr/share/xsessions/

