
HilDE:
	@echo "HilDE is a Lightweight Desktop Environment"
	@echo "  On Debian based systems run 'make debsetup' before installing."

install: .install

.install:
	find files -type f -printf '%P\0' | xargs -0 -I {} install -Dm644 "files/{}" "${DESTDIR}/{}"
	chmod a+x "${DESTDIR}/etc/X11/xinit/xinitrc.d/99-spawn-xbindkeys.sh"
	chmod a+x "${DESTDIR}/usr/bin/hilde-logout"
	gzip "${DESTDIR}/usr/share/man/man1/hilde-logout.1"

debsetup:
	sed -i 's/reboot/sudo reboot/' files/usr/bin/hilde-logout
	sed -i 's/shutdown/sudo shutdown/' files/usr/bin/hilde-logout

