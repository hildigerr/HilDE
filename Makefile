
HilDE:
	@echo "HilDE is a Lightweight Desktop Environment"
	@echo "  On Debian based systems run 'make debsetup' before installing."

install: .install

.install:
	chmod a+x                    files/usr/bin/hilde-logout
	cp -a files/*                "${DESTDIR}"

debsetup:
	sed -i 's/reboot/sudo reboot/' files/usr/bin/hilde-logout
	sed -i 's/shutdown/sudo shutdown/' files/usr/bin/hilde-logout

