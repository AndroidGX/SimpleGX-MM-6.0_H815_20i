#!/bin/bash

tools/dtbtoolv3 -2 -o arch/arm64/boot/dt.img -s 4096 -p scripts/dtc/ arch/arm64/boot/dts/

cd ramdisk
find . | cpio -o -H newc | gzip > ../ramdisk.img
cd ..

tools/mkbootimg --kernel arch/arm64/boot/Image --ramdisk ramdisk.img --output boot.img \
--cmdline "console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 user_debug=31 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.selinux=permissive msm_rtb.filter=0x37 androidboot.hardware=p1" \
--base 0x00000000 --pagesize 4096 --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --dt arch/arm64/boot/dt.img

