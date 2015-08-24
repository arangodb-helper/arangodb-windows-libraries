.PHONY: all install install_bits

all:

install:
	$(MAKE) install_bits BITS=32
	$(MAKE) install_bits BITS=64

install_bits:
	rm -rf ../out/$(VS)-openssl-$(BITS)

	mkdir ../out/$(VS)-openssl-$(BITS)
	mkdir ../out/$(VS)-openssl-$(BITS)/include
	mkdir ../out/$(VS)-openssl-$(BITS)/lib

	cp -a openssl-1.0.2-$(BITS)/lib/Debug ../out/$(VS)-openssl-$(BITS)/lib
	cp -a openssl-1.0.2-$(BITS)/lib/Release ../out/$(VS)-openssl-$(BITS)/lib/RelWithDebInfo
	cp -a openssl-1.0.2-$(BITS)/include/* ../out/$(VS)-openssl-$(BITS)/include
