.PHONY: clean install

PKGNAME:=bitwig-studio
PKGVER=3.0
PKGBETA=beta1
PKGCHANNEL=beta
PKGREL:=1
PACKAGE:=$(PKGNAME)-$(PKGVER)-$(PKGREL)-$(PKGARCH).pkg.tar.xz
SOURCE_PACKAGE:=$(PKGNAME)-$(PKGVER)$(PKGBETA)-$(PKGREL).src.tar.gz
DEB:=bitwig-studio-$(PKGVER).deb
DEB_URL:=https://downloads.bitwig.com/stable/$(PKGVER)/$(DEB)

all: prepare $(PACKAGE) $(SOURCE_PACKAGE)

prepare: PKGBUILD
	cp $<.tmpl $<
	sed -i 's/<PKGVER>/$(PKGVER)/g' $<
	sed -i 's/<PKGBETA>/$(PKGBETA)/g' $<
	sed -i 's/<PKGCHANNEL>/$(PKGCHANNEL)/g' $<

$(PACKAGE):
	updpkgsums
	makepkg

$(SOURCE_PACKAGE):
	makepkg --source
	mksrcinfo

install: $(PACKAGE)
	sudo pacman -U $<

clean:
	rm -f $(PKGNAME)*.pkg.tar.xz\
		$(PKGNAME)*.src.tar.gz\
		$(PKGNAME)*.deb
	rm -fr ./src ./pkg

