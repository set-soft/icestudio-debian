#!/usr/bin/make
INST_DIR := /usr/lib/x86_64-linux-gnu/icestudio

help:
	@echo "Available options:"
	@echo "run    Start icestudio"
	@echo "dist   Create distributions"

run: node_modules
	npm start

node_modules:
	npm install --no-optional

dist: app node_modules
	npm run dist

deb:
	fakeroot dpkg-buildpackage -b -uc

clean:
	-@rm .tcedit.dst

clean-all:
	-@rm debian/.tcedit.dst
	fakeroot debian/rules clean

install: dist
	install -m 0755 -d $(DESTDIR)$(INST_DIR)
	# Temporaly move the toolchain out
	#mv dist/icestudio/linux64/toolchain/ dist/icestudio/
	cp -r dist/icestudio/linux64/* $(DESTDIR)$(INST_DIR)
	# Restore the toolchain
	#mv dist/icestudio/toolchain/ dist/icestudio/linux64/
	chmod -x $(DESTDIR)$(INST_DIR)/locales/*.pak $(DESTDIR)$(INST_DIR)/*.pak $(DESTDIR)$(INST_DIR)/*.dat
	install -m 0755 -d $(DESTDIR)/usr/bin/
	ln -s $(INST_DIR)/icestudio $(DESTDIR)/usr/bin/icestudio
	rm $(DESTDIR)$(INST_DIR)/credits.html


