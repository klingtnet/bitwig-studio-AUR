# Maintainer: Andreas Linz <alinz@klingt.net>
# based on `bitwig-studio-demo` AUR package

pkgname='bitwig-studio'
pkgver=2.4
pkgbeta=beta2
pkgchannel=beta
pkgrel=1
pkgdesc="Music production system for production, remixing and performance."
arch=( 'x86_64' )
url="http://www.bitwig.com"
license=('custom')
depends=( 'jack' 'xdg-utils' 'zenity' 'xcb-util-wm' 'libbsd')
optdepends=(
             'alsa-lib'
             'oss'
             'libav: MP3 support'
           )
provides=('bitwig-studio')
conflicts=('bitwig-studio-demo-rc' 'bitwig-studio-demo' 'bitwig-8-track')
# strip debugging symbols
options=(!strip)
source=("https://downloads.bitwig.com/${pkgchannel}/${pkgver}/${pkgname}-${pkgver}${pkgbeta}.deb")
md5sums=('22390f22e89f5cd246138a175bb2c7ef')

package() {
  cd $srcdir

  # create pkgdir folders
  install -d $pkgdir/usr/bin
  install -d $pkgdir/opt/${pkgname}
  install -d $pkgdir/usr/share/{applications,icons}
  install -d $pkgdir/usr/share/licenses/$pkgname

  tar -xf ./data.tar.xz -C "${pkgdir}/"

  install -m644 ${pkgdir}/opt/${pkgname}/EULA.rtf $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # Fix launcher category
  sed -i 's:Categories=Multimedia:Categories=Multimedia;AudioVideo;Player;Recorder;:' \
    $pkgdir/usr/share/applications/${pkgname}.desktop
}
