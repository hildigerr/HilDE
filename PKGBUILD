# Maintainer: Hildigerr Vergaray <Maintainer@YmirSystems.com>
pkgname='hilde'
pkgver=0.1.4
pkgrel=1
pkgdesc="Lightweight Desktop Environment"
arch=('any')
url="https://github.com/hildigerr/HilDE"
license=('Artistic2.0')
source=("hilde::git+${url}")
md5sums=('SKIP')
conflicts=(hilde-gtk3)
replaces=(hilde-gtk3)

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
    'hilde-lxmenu-data'
    'lxpanel'
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
    'pcmanfm'
)

optdepends=(
    'at: recommended command scheduler'
    'ed: recommended text editor'
    'xfce4-terminal: recommended terminal emulator'
    'sxiv: recommended image viewer'
    'speedcrunch: recommended calculator'
    'firefox: recommended browser'
    'vlc: recommended video player'
    'xpad: recommended notepad'
    'xarchiver: recommended archive manager'
    'meld: visual diff and merge utility'
    'pdfarranger: pdf manipulation utility'
    'gimp: image file manipulation utility'
    'sox: sound processing'
)

package_hilde() {
  cd "$srcdir/${pkgbase}"
  make DESTDIR="$pkgdir/" install
  ln -s "/usr/share/applications/notification-daemon.desktop" "$pkgdir/etc/xdg/autostart/notification-daemon.desktop"
}
