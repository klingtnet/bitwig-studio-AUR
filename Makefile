.PHONY: clean install

PKGNAME:=bitwig-studio
PKGVER=2.2
PKGREL:=1
PACKAGE:=$(PKGNAME)-$(PKGVER)-$(PKGREL)-$(PKGARCH).pkg.tar.xz
SOURCE_PACKAGE:=$(PKGNAME)-$(PKGVER)-$(PKGREL).src.tar.gz
DEB:=bitwig-studio-$(PKGVER).deb
DEB_URL:=https://downloads.bitwig.com/stable/$(PKGVER)/$(DEB)

all: $(PACKAGE) $(SOURCE_PACKAGE)

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

