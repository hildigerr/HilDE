# Maintainer: Hildigerr Vergaray <Maintainer@YmirSystems.com>
pkgname=hilde-gtk3
pkgver=0.0.2
pkgrel=0
pkgdesc="Lightweight Desktop Environment"
arch=('any')
url="https://github.com/hildigerr/HilDE"
license=('Artistic2.0')
source=("hilde::git+${url}")
md5sums=('SKIP')
conflicts=(hilde)

install=hilde.install

makedepends=('git')

# GUI Basics
depends=(
    'xorg-server'
    'xorg-xdm'
    'xorg-xmessage'
    'lwm'
    'notification-daemon'
)

# Session Startup
depends+=(
    'xbindkeys'
    'wmctrl'
    'xtrlock'
    'imagemagick'
    'fbautostart'
    'lxpanel-gtk3'
)

# Default Apps

# File Manager
depends+=(
    'pcmanfm-gtk3'
    'udiskie'
    'gvfs'
)

optdepends=(
    'ed: recommended text editor'
    'termit-git: recommended terminal emulator'
    'sxiv: recommended image viewer'
    'speedcrunch: recommended calculator'
    'firefox: recommended browser'
    'vlc: recommended video player'
    'xpad: recommended notepad'
    'file-roller: recommended archive manager'
    'meld: visual diff and merge utility'
    'pdfarranger: pdf manipulation utility'
    'gimp: image file manipulation utility'
    'sox: sound processing'
)

package() {
  cd "$srcdir/${pkgname%-gtk3}"
  make DESTDIR="$pkgdir/" install
}
