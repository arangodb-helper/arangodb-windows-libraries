.PHONY: all install install_bits

all:

install:
	$(MAKE) install_bits BITS=32
	$(MAKE) install_bits BITS=64

install_bits:
	rm -rf ../out/$(VS)-zlib-$(BITS)

	mkdir ../out/$(VS)-zlib-$(BITS)
	mkdir ../out/$(VS)-zlib-$(BITS)/include
	mkdir ../out/$(VS)-zlib-$(BITS)/lib

	cp -a zlib-1.2.7-$(BITS)/lib/Release ../out/$(VS)-zlib-$(BITS)/lib/RelWithDebInfo
	cp -a zlib-1.2.7-$(BITS)/lib/Debug ../out/$(VS)-zlib-$(BITS)/lib
	cp -a zlib-1.2.7-$(BITS)/include/* ../out/$(VS)-zlib-$(BITS)/include
