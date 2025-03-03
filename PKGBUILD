# Maintainer: Hildigerr Vergaray <Maintainer@YmirSystems.com>
pkgname=('hilde' 'hilde-gtk3')
pkgver=0.1.0
pkgrel=2
pkgdesc="Lightweight Desktop Environment"
arch=('any')
url="https://github.com/hildigerr/HilDE"
license=('Artistic2.0')
source=("hilde::git+${url}")
md5sums=('SKIP')

install=hilde.install
backup=(
    etc/X11/xdm/hilde/Xresources
    etc/X11/xdm/hilde/Xsession
    etc/X11/xdm/hilde/xdm-config
)

makedepends=('git')

# GUI Basics
depends=(
    'xorg-server'
    'xorg-xdm'
    'xorg-xmessage'
    'lwm'
    'notification-daemon'
    'mate-polkit'
)

# Session Startup
depends+=(
    'xbindkeys'
    'wmctrl'
    'xtrlock'
    'imagemagick'
    'fbautostart'
)

# Default Apps

# File Manager
depends+=(
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

package_hilde() {
  conflicts=(hilde-gtk3)
  depends+=(
    'lxpanel'
    'pcmanfm'
  )
  _package
}

package_hilde-gtk3() {
  conflicts=(hilde)
  depends+=(
    'lxpanel-gtk3'
    'pcmanfm-gtk3'
  )
  _package
}

_package () {
  cd "$srcdir/${pkgbase}"
  make DESTDIR="$pkgdir/" install
  ln -s "/usr/share/applications/notification-daemon.desktop" "$pkgdir/etc/xdg/autostart/notification-daemon.desktop"
}
