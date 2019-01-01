BASH = /bin/bash

FILES = xdaemon xlogin x@.service xlogin@.service

all: $(FILES)

.PHONY: install
install: all
	install -D --mode=755 xdaemon $(DESTDIR)/usr/local/bin/xdaemon
	install -D --mode=755 xlogin $(DESTDIR)/etc/X11/xinit/xinitrc.d/25-xlogin
	install -D --mode=644 x@.service $(DESTDIR)/etc/systemd/system/x@.service
	install -D --mode=644 xlogin@.service $(DESTDIR)/etc/systemd/system/xlogin@.service

clean:
	rm -f $(FILES)

% : %.in
	sed -e "s|@bash@|$(BASH)|g" $< > $@

