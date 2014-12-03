.PHONY: all install

all:
	cmd < build-icu.bat

install:
	for bits in 32 64; do for file in sicudt sicuin sicuio sicule siculx sicutest sicutu sicuuc; do cp  ../out/vs2013-icu-$${bits}/lib/Debug/$${file}d.lib ../out/vs2013-icu-$${bits}/lib/Debug/$${file}.lib; done; done

