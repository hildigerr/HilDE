BINDIR=$DESTDIR/usr/local/bin

BIN=bin/start.sh bin/stop.sh
IMG=img/start-menu.xpm
FILES=$BIN $IMG

HilDE:
	@echo "HilDE is a Lightweight Desktop Environment"


install: HilDE $FILES 
	cp bin/start.sh              $BINDIR/hilde-start
	cp bin/stop.sh               $BINDIR/hilde-logout
	cp -r lxpanel-profile        $LXPDIR/hilde
	cp img/start-menu.xpm        $DESTDIR/usr/share/pixmaps/

xsession: xtra/hilde.desktop
	cp xtra/hilde.desktop        $DESTDIR/usr/share/xsessions/
