# Maintainer: Rafael <tampaseguraa@gmail.com>

pkgname=aahp
pkgver=1.2.2
pkgrel=2
pkgdesc="AAHP (Another Aur Helper) - An simple Aur Helper written in Shell/Bash Script"
url="https://github.com/Nuxel-Developer/AAHP"
license=('GPL3')
arch=('any')
source=("https://github.com/Nuxel-Developer/AAHP/releases/download/pkgs_release2/$pkgname-$pkgver.tar.gz")
sha256sums=('aa9eb848794ee33500c0a9f6d0dbddb0c62aea58cc96451a50c45b567da4674c')

depends=(
    'pacman'
    'git'
    'tar'
)

package(){
    cd $srcdir/$pkgname-$pkgver
    install -D -m755 aahp "${pkgdir}/usr/bin/$pkgname"
}