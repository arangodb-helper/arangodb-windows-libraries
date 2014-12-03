.PHONY: all install install_bits

all:

install:
	$(MAKE) install_bits BITS=32
	$(MAKE) install_bits BITS=64

install_bits:
	rm -rf ../out/vs2013-openssl-$(BITS)

	mkdir ../out/vs2013-openssl-$(BITS)
	mkdir ../out/vs2013-openssl-$(BITS)/include
	mkdir ../out/vs2013-openssl-$(BITS)/lib

	cp -a openssl-1.0.1g-$(BITS)/lib/Debug ../out/vs2013-openssl-$(BITS)/lib
	cp -a openssl-1.0.1g-$(BITS)/lib/Release ../out/vs2013-openssl-$(BITS)/lib
	cp -a openssl-1.0.1g-$(BITS)/include/* ../out/vs2013-openssl-$(BITS)/include
