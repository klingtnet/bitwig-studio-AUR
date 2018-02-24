# Maintainer: Andreas Linz <alinz@klingt.net>
# based on `bitwig-studio-demo` AUR package

pkgname='bitwig-studio'
pkgver=2.3
pkgbeta=beta5
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
conflicts=('bitwig-studio-demo-rc', 'bitwig-studio-demo', 'bitwig-8-track')
# strip debugging symbols
options=(!strip)
source=("https://downloads.bitwig.com/${pkgchannel}/${pkgver}/${pkgname}-${pkgver}${pkgbeta}.deb")
md5sums=('738e71d1ae1df99562a20366569399c9')

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
