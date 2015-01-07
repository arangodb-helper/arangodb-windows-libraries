all:
	cd getopt && make all
	cd libev && make all
	cd linenoise && make all
	cd regex && make all
	cd openssl && make all
	cd zlib && make all

install:
	cd getopt && make install
	cd libev && make install
	cd linenoise && make install
	cd regex && make install
	cd openssl && make install
	cd zlib && make install

3rdParty:
	rm -rf WindowsLibraries
	mkdir WindowsLibraries

	$(MAKE) 3rdParty_bits BITS=32
	$(MAKE) 3rdParty_bits BITS=64

3rdParty_bits:
	mkdir WindowsLibraries/$(BITS)
	mkdir WindowsLibraries/$(BITS)/bin
	mkdir WindowsLibraries/$(BITS)/include
	mkdir WindowsLibraries/$(BITS)/lib
	mkdir WindowsLibraries/$(BITS)/lib/Debug
	mkdir WindowsLibraries/$(BITS)/lib/Release

	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=getopt
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=libev
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=linenoise
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=regex
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=openssl
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=zlib

	cp -a etcd/$(BITS)/bin/*.exe WindowsLibraries/$(BITS)/bin

3rdParty_project:
	cp -af out/vs2013-$(PROJECT)-$(BITS)/include/* WindowsLibraries/$(BITS)/include
	cp -af out/vs2013-$(PROJECT)-$(BITS)/lib/Debug/*.lib WindowsLibraries/$(BITS)/lib/Debug
	cp -af out/vs2013-$(PROJECT)-$(BITS)/lib/Release/*.lib WindowsLibraries/$(BITS)/lib/Release
