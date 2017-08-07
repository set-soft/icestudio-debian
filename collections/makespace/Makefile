#!/usr/bin/make
INST_DIR:=/usr/share/icestudio/collections
ZIPNAME:=makespace-17.zip

help:
	@echo "Available options:"
	@echo "deb   Create Debian package"

deb:
	fakeroot dpkg-buildpackage -b -uc

clean:

clean-all:
	fakeroot debian/rules clean

install: $(ZIPNAME)
	install -m 0755 -d $(DESTDIR)$(INST_DIR)
	unzip $(ZIPNAME) -d $(DESTDIR)$(INST_DIR)


