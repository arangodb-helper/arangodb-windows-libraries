TARGET=Visual Studio 12
VS=vs2013
all: checkcmake
	cd getopt && make all TARGET="$(TARGET)" VS=$(VS)
	cd libev && make all TARGET="$(TARGET)" VS=$(VS)
	cd linenoise && make all TARGET="$(TARGET)" VS=$(VS)
	cd regex && make all TARGET="$(TARGET)" VS=$(VS)
	cd openssl && make all TARGET="$(TARGET)" VS=$(VS)
	cd zlib && make all TARGET="$(TARGET)" VS=$(VS)

checkcmake:
	if test -z "`cmake --help |grep -i visual`"; then \
		echo "Your cmake is not sufficient; it lacks support for visual studio." ; \
		exit 1; \
	fi


install:
	cd getopt && make install TARGET="$(TARGET)" VS=$(VS)
	cd libev && make install TARGET="$(TARGET)" VS=$(VS)
	cd linenoise && make install TARGET="$(TARGET)" VS=$(VS)
	cd regex && make install TARGET="$(TARGET)" VS=$(VS)
	cd openssl && make install TARGET="$(TARGET)" VS=$(VS)
	cd zlib && make install TARGET="$(TARGET)" VS=$(VS)

3rdParty:
	rm -rf WindowsLibraries
	mkdir WindowsLibraries

	$(MAKE) 3rdParty_bits BITS=32 TARGET="$(TARGET)" VS=$(VS)
	$(MAKE) 3rdParty_bits BITS=64 TARGET="$(TARGET)" VS=$(VS)

3rdParty_bits:
	mkdir WindowsLibraries/$(BITS)
	mkdir WindowsLibraries/$(BITS)/bin
	mkdir WindowsLibraries/$(BITS)/include
	mkdir WindowsLibraries/$(BITS)/lib
	mkdir WindowsLibraries/$(BITS)/lib/Debug
	mkdir WindowsLibraries/$(BITS)/lib/RelWithDebInfo

	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=getopt
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=libev
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=linenoise
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=regex
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=openssl
	$(MAKE) 3rdParty_project BITS=$(BITS) PROJECT=zlib

	cp -a etcd/$(BITS)/bin/*.exe WindowsLibraries/$(BITS)/bin

3rdParty_project:
	cp -af out/$(VS)-$(PROJECT)-$(BITS)/include/* WindowsLibraries/$(BITS)/include
	cp -af out/$(VS)-$(PROJECT)-$(BITS)/lib/Debug/*.lib WindowsLibraries/$(BITS)/lib/Debug
	cp -af out/$(VS)-$(PROJECT)-$(BITS)/lib/RelWithDebInfo/*.lib WindowsLibraries/$(BITS)/lib/RelWithDebInfo
	for i in out/$(VS)-$(PROJECT)-$(BITS)/lib/RelWithDebInfo/*pdb; do \
		if test  -f "$$i" ; then \
	  		cp -af $$i WindowsLibraries/$(BITS)/lib/RelWithDebInfo; \
		fi; \
	done

