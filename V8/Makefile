.PHONY: all install

all:
	cmd < build-v8.bat

install:
	$(MAKE) install_bits BITS=32
	$(MAKE) install_bits BITS=64

install_bits:
	rm -rf ../out/vs2013-V8-$(BITS)

	mkdir ../out/vs2013-V8-$(BITS)
	mkdir ../out/vs2013-V8-$(BITS)/include
	mkdir ../out/vs2013-V8-$(BITS)/lib
	mkdir ../out/vs2013-V8-$(BITS)/lib/Release
	mkdir ../out/vs2013-V8-$(BITS)/lib/Debug

	cp -a V8-3.29.59/build/Debug$(BITS)/lib/*.lib ../out/vs2013-V8-$(BITS)/lib/Debug
	cp -a V8-3.29.59/build/Release$(BITS)/lib/*.lib ../out/vs2013-V8-$(BITS)/lib/Release
	cp -a V8-3.29.59/include/* ../out/vs2013-V8-$(BITS)/include
