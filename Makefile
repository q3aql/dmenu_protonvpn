# dmenu - dynamic menu
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c dmenu.c stest.c util.c
OBJ = $(SRC:.c=.o)

all: options dmenu stest

options:
	@echo dmenu build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

.c.o:
	$(CC) -c $(CFLAGS) $<

config.h:
	cp config.def.h $@

$(OBJ): arg.h config.h config.mk drw.h

dmenu: dmenu.o drw.o util.o
	$(CC) -o $@ dmenu.o drw.o util.o $(LDFLAGS)

stest: stest.o
	$(CC) -o $@ stest.o $(LDFLAGS)

clean:
	rm -f dmenu stest $(OBJ) dmenu-$(VERSION).tar.gz

dist: clean
	mkdir -p dmenu-$(VERSION)
	cp LICENSE Makefile README arg.h config.def.h config.mk dmenu.1\
		drw.h util.h dmenu_protonvpn stest.1 $(SRC)\
		dmenu-$(VERSION)
	tar -cf dmenu-$(VERSION).tar dmenu-$(VERSION)
	gzip dmenu-$(VERSION).tar
	rm -rf dmenu-$(VERSION)

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/
	mkdir -p /usr/share/fonts/truetype/ubuntumono/
	tar Jxvf fonts/ubuntumono-nerd-fonts.tar.xz -C /usr/share/fonts/truetype/ubuntumono/
	cp -f dmenu dmenu_protonvpn dmenu_protonvpn_cli stest $(DESTDIR)$(PREFIX)/
	cp -f dmenu_protonvpn /usr/bin/
	cp -f dmenu_protonvpn_cli /usr/bin/
	chmod 755 /usr/bin/dmenu_protonvpn
	cp -rf config $(DESTDIR)$(PREFIX)/
	cp -rf fonts $(DESTDIR)$(PREFIX)/
	cp -rf menu $(DESTDIR)$(PREFIX)/
	cp -rf icon $(DESTDIR)$(PREFIX)/
	cp -rf icon/dmenu_protonvpn.desktop /usr/share/applications/
	chmod +x /usr/share/applications/dmenu_protonvpn.desktop
	touch $(DESTDIR)$(PREFIX)/proton-user.txt
	touch $(DESTDIR)$(PREFIX)/proton-pass.txt
	touch $(DESTDIR)$(PREFIX)/proton-credentials.txt
	chmod 755 -R $(DESTDIR)$(PREFIX)/menu
	chmod 755 -R $(DESTDIR)$(PREFIX)/icon
	chmod 755 $(DESTDIR)$(PREFIX)/dmenu
	chmod 755 $(DESTDIR)$(PREFIX)/dmenu_protonvpn
	chmod 755 $(DESTDIR)$(PREFIX)/dmenu_protonvpn_cli
	chmod 755 $(DESTDIR)$(PREFIX)/stest
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	chmod 777 $(DESTDIR)$(PREFIX)/proton-user.txt
	chmod 777 $(DESTDIR)$(PREFIX)/proton-pass.txt
	chmod 777 $(DESTDIR)$(PREFIX)/proton-credentials.txt
	sed "s/VERSION/$(VERSION)/g" < dmenu.1 > $(DESTDIR)$(MANPREFIX)/man1/dmenu.1
	sed "s/VERSION/$(VERSION)/g" < stest.1 > $(DESTDIR)$(MANPREFIX)/man1/stest.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/dmenu.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/stest.1

uninstall:
	rm -rf $(DESTDIR)$(PREFIX)/dmenu\
		$(DESTDIR)$(PREFIX)/dmenu_protonvpn\
		$(DESTDIR)$(PREFIX)/dmenu_protonvpn_cli\
		$(DESTDIR)$(PREFIX)/config\
		$(DESTDIR)$(PREFIX)/fonts\
		$(DESTDIR)$(PREFIX)/menu\
		$(DESTDIR)$(PREFIX)/icon\
		$(DESTDIR)$(PREFIX)/proton-credentials.txt\
		$(DESTDIR)$(MANPREFIX)/man1/dmenu.1\
		$(DESTDIR)$(MANPREFIX)/man1/stest.1
	rm -rf /usr/share/applications/dmenu_protonvpn.desktop
	rm -rf /usr/bin/dmenu_protonvpn

.PHONY: all options clean dist install uninstall
