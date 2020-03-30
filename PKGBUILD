# Maintainer: Hildigerr Vergaray <Maintainer@YmirSystems.com>
pkgname=hilde
pkgver=0.0.1
pkgrel=1
pkgdesc="Lightweight Desktop Environment"
arch=('any')
url="https://github.com/hildigerr/HilDE"
license=('Artistic2.0')

# GUI Basics
depends=(
    'xorg-server'
    'xorg-xdm'
    'xorg-xmessage'
)

# Session Startup
depends+=(
    'xbindkeys'
    'wmctrl'
    'xtrlock'
    'imagemagick'
    'fbautostart'
    'lxpanel'
)

# Default Apps

# File Manager
depends+=(
    'pcmanfm'
    'udiskie'
    'gvfs'
)

optdepends=(
    'sxiv: recommended immage viewer'
    'speedcrunch: recommended calculator'
    'firefox: recommended browser'
    'vlc: recommended video player'
    'xpad: recommended notepad'
    'file-roller: recommended archive manager'
    'meld: vidual diff and merge utility'
    'pdfarranger: pdf manipulation utility'
    'gimp: image file manipulation utility'
    'ghex: recommended hex editor'
)

package() {
    cd ..
	make DESTDIR="$pkgdir/" install
}
