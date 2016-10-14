#!/bin/bash

if [ -e boot.img ]; then
	rm boot.img
fi

if [ -e dt.img ]; then
	rm dt.img
fi

if [ -e boot.dt.img ]; then
	rm boot.dt.img
fi

if [ -e compile.log ]; then
	rm compile.log
fi

if [ -e ramdisk.cpio ]; then
	rm ramdisk.cpio
fi

if [ -e ramdisk.cpio.gz ]; then
        rm ramdisk.cpio.gz
fi


find -name '*.ko' -exec rm -rf {} \;
rm -rf arch/arm64/boot/Image*.* > /dev/null 2>&1
rm -rf arch/arm64/boot/.Image*.* > /dev/null 2>&1
rm -rf arch/arm64/boot/zImage > /dev/null 2>&1
rm -rf arch/arm64/boot/zImage-dtb > /dev/null 2>&1
rm -rf arch/arm64/boot/dt.img > /dev/null 2>&1
rm -rf arch/arm64/boot/dt.img > /dev/null 2>&1
rm -rf arch/arm64/boot/*.img > /dev/null 2>&1
rm -rf arch/arm64/boot/dts/*.dtb > /dev/null 2>&1
rm -rf arch/arm64/boot/dts/*.reverse.dts > /dev/null 2>&1
rm -f arch/arm64/boot/*.dtb > /dev/null 2>&1
rm -f arch/arm64/boot/*.cmd > /dev/null 2>&1
rm -rf arch/arm64/boot/Image > /dev/null 2>&1
rm zImage > /dev/null 2>&1
rm zImage-dtb > /dev/null 2>&1
rm boot.dt.img > /dev/null 2>&1
rm boot.img > /dev/null 2>&1
rm dt.img > /dev/null 2>&1
rm *.ko > /dev/null 2>&1
rm *.img > /dev/null 2>&1
rm -f kheaders*.tar.bz2 > /dev/null 2>&1
rm -f tuxera-exfat*.tgz > /dev/null 2>&1
rm -rf tuxera-exfat* > /dev/null 2>&1
rm -rf .tuxera_update_cache > /dev/null 2>&1


make clean && make mrproper
rm Module.symvers > /dev/null 2>&1

for i in `find . -type f \( -iname \*.rej \
				-o -iname \*.orig \
				-o -iname \*~ \
				-o -iname \*.bkp \
				-o -iname \*.ko \
				-o -iname \*.c.BACKUP.[0-9]*.c \
				-o -iname \*.c.BASE.[0-9]*.c \
				-o -iname \*.c.LOCAL.[0-9]*.c \
				-o -iname \*.c.REMOTE.[0-9]*.c \
				-o -iname \*.org \)`; do
	rm -vf $i;
done;

