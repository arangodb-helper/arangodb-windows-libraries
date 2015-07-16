.PHONY: all install install_bits

all:

install:
	$(MAKE) install_bits BITS=32
	$(MAKE) install_bits BITS=64

install_bits:
	rm -rf ../out/vs2013-zlib-$(BITS)

	mkdir ../out/vs2013-zlib-$(BITS)
	mkdir ../out/vs2013-zlib-$(BITS)/include
	mkdir ../out/vs2013-zlib-$(BITS)/lib

	cp -a zlib-1.2.7-$(BITS)/lib/Release ../out/vs2013-zlib-$(BITS)/lib/RelWithDebInfo
	cp -a zlib-1.2.7-$(BITS)/lib/Debug ../out/vs2013-zlib-$(BITS)/lib
	cp -a zlib-1.2.7-$(BITS)/include/* ../out/vs2013-zlib-$(BITS)/include
