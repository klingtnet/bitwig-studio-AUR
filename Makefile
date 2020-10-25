.PHONY: clean install

PKGNAME:=bitwig-studio
PKGVER=3.0
PKGBETA=
PKGCHANNEL=stable
PKGREL:=1
PACKAGE:=$(PKGNAME)-$(PKGVER)-$(PKGREL)-$(PKGARCH).pkg.tar.zst
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
	makepkg --printsrcinfo > .SRCINFO

install: $(PACKAGE)
	sudo pacman -U $<

clean:
	rm -f $(PKGNAME)*.pkg.tar.zst\
		$(PKGNAME)*.src.tar.gz\
		$(PKGNAME)*.deb
	rm -fr ./src ./pkg

