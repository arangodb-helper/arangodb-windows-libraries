all:
	cd getopt && make all
	cd libev && make all
	cd linenoise && make all
	cd regex && make all
	cd openssl && make all
	cd v8 && make all
	cd zlib && make all

install:
	cd getopt && make install
	cd libev && make install
	cd linenoise && make install
	cd regex && make install
	cd openssl && make install
	cd v8 && make install
	cd zlib && make install

3rdParty:
	rm -rf 3rdParty-Windows
	mkdir 3rdParty-Windows

	$(MAKE) 3rdParty_bits BITS=32
	$(MAKE) 3rdParty_bits BITS=64

3rdParty_bits:
	mkdir 3rdParty-Windows/$(BITS)
	mkdir 3rdParty-Windows/$(BITS)/bin
	mkdir 3rdParty-Windows/$(BITS)/include
	mkdir 3rdParty-Windows/$(BITS)/lib
	mkdir 3rdParty-Windows/$(BITS)/lib/Debug
	mkdir 3rdParty-Windows/$(BITS)/lib/Release

	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=getopt
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=libev
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=linenoise
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=regex
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=openssl
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=V8
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=zlib

	cp -a etcd/$(BITS)/bin/*.exe 3rdParty-Windows/$(BITS)/bin
	$(MAKE) 3rdParty_project_header BITS=$(BITS) PROJECT=icu

3rdParty_project:
	cp -af out/vs2013-$(PROJECT)-$(BITS)/include/* 3rdParty-Windows/$(BITS)/include
	cp -af out/vs2013-$(PROJECT)-$(BITS)/lib/Debug/*.lib 3rdParty-Windows/$(BITS)/lib/Debug
	cp -af out/vs2013-$(PROJECT)-$(BITS)/lib/Release/*.lib 3rdParty-Windows/$(BITS)/lib/Release

3rdParty_project_header:
	cp -af out/vs2013-$(PROJECT)-$(BITS)/include/* 3rdParty-Windows/$(BITS)/include
