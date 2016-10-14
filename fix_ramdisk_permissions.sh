#!/bin/sh

RAMFS="/home/androidgx/projects/kernels/SimpleGX-MM-6.0_H815/ramdisk"

chmod -R g-w $RAMFS/*
chmod g-w $RAMFS/*.rc $RAMFS/default.prop $RAMFS/sbin/*.sh
cd $RAMFS
chmod 644 file_contexts
chmod 644 se*
chmod 644 default.prop
chmod 750 *.rc
chmod 750 *.sh
chmod 640 fstab*
chmod 644 ueventd*
chmod 644 lge.fo*
chmod 644 set_emmc_size.sh
chmod 771 data
chmod 755 dev
chmod 555 proc
chmod 755 res
chmod 644 res/images/charger/*
chmod 750 sbin
chmod 750 sbin/*
chmod 755 sbin/busybox
chmod 777 sbin/*.sh
chmod 555 sys
chmod 755 system

