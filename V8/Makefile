.PHONY: all install

all: build64 clean64 build32


build64:
	./build-v8.bat x86_amd64 x64 x64 64 

build32:
	cmd x86 ia32 Win32 32 < build-v8.bat


clean64:
	cmd x86_amd64 x64 x64 64 < clean-v8.bat 

clean32:
	cmd x86 ia32 Win32 32 < clean-v8.bat 

clean: clean32 clean64


distclean64:
	cmd x86_amd64 x64 x64 64 < clean-v8.bat 

distclean32:
	cmd x86 ia32 Win32 32 < clean-v8.bat 


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
	mkdir -p ../out/vs2013-icu-$(BITS)/include/layout/
	mkdir -p ../out/vs2013-icu-$(BITS)/include/unicode/

	cp -a V8-3.29.59/build/Debug$(BITS)/lib/*.lib ../out/vs2013-V8-$(BITS)/lib/Debug
	cp -a V8-3.29.59/build/Release$(BITS)/lib/*.lib ../out/vs2013-V8-$(BITS)/lib/Release
	cp -a V8-3.29.59/include/* ../out/vs2013-V8-$(BITS)/include

	for FOLDER in 	common \
			i18n \
			extra/uconv \
			tools/ctestfw \
			io ; \
		do \
		cp -a V8-3.29.59/third_party/icu/source/$${FOLDER}/unicode/* ../out/vs2013-icu-$(BITS)/include/unicode/ ;\
	 done

#cp -a V8-3.29.59/third_party/icu/source/i18n/examples/layout/*.h ../out/vs2013-V8-$(BITS)/include/layout/

# for bits in 32 64; do for file in sicudt sicuin sicuio sicule siculx sicutest sicutu sicuuc; do cp  ../out/vs2013-icu-$${bits}/lib/Debug/$${file}d.lib ../out/vs2013-icu-$${bits}/lib/Debug/$${file}.lib; done; done

