.PHONY: clean install

PKGNAME:=bitwig-studio
PKGVER=3.3
PKGBETA=beta5
PKGCHANNEL=beta
PKGREL:=1
PKGARCH:=x86_64
PACKAGE:=$(PKGNAME)-$(PKGVER)-$(PKGREL)-$(PKGARCH).pkg.tar.zst
SOURCE_PACKAGE:=$(PKGNAME)-$(PKGVER)$(PKGBETA)-$(PKGREL).src.tar.gz
DEB:=bitwig-studio-$(PKGVER).deb

all: PKGBUILD $(PACKAGE) $(SOURCE_PACKAGE)

PKGBUILD: Makefile
	cp $@.tmpl $@
	sed -i 's/<PKGVER>/$(PKGVER)/g' $@
	sed -i 's/<PKGBETA>/$(PKGBETA)/g' $@
	sed -i 's/<PKGCHANNEL>/$(PKGCHANNEL)/g' $@

$(PACKAGE): .SRCINFO PKGBUILD
	updpkgsums
	makepkg

$(SOURCE_PACKAGE): .SRCINFO
	makepkg --source

.SRCINFO:
	makepkg --printsrcinfo > .SRCINFO

install: $(PACKAGE)
	sudo pacman -U $<

clean:
	rm -f $(PKGNAME)*.pkg.tar.zst\
		$(PKGNAME)*.src.tar.gz\
		$(PKGNAME)*.deb
	rm -fr ./src ./pkg

