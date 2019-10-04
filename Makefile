BUNDLE = tech.imvictor.iproute2ios
VERSION = 1.2.3

dist:
	mkdir -p dist
	mkdir -p deb-src/usr/local/bin/
	cp src/ip.py deb-src/usr/local/bin/ip
	chmod a+x deb-src/usr/local/bin/ip
	chown -R 0:0 deb-src/usr/
	dpkg-deb -b ./deb-src ./dist/$(BUNDLE)-$(VERSION).deb

clean:
	rm -r dist
	rm -r deb-src/usr

