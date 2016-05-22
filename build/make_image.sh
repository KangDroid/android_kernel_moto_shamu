#!/bin/sh
# Script for making boot.img

# First, unpack normal boot.img(CyanogenMod13, Shamu)
export UNPACK=$(pwd)/bin/unpackbootimg
export REPACK=$(pwd)/bin/mkbootimg
export WORKDIR=$(pwd)/workdir
export DATE=$(date -u +%Y%m%d)

#mkdir $WORKDIR
# $UNPACK -i $(pwd)/boot.img -o $WORKDIR
cp ../arch/arm/boot/zImage-dtb $WORKDIR
$REPACK --kernel $WORKDIR/zImage-dtb --ramdisk $WORKDIR/boot.img-ramdisk.gz --cmdline "console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=shamu msm_rtb.filter=0x37 ehci-hcd.park=3 utags.blkdev=/dev/block/platform/msm_sdcc.1/by-name/utags utags.backup=/dev/block/platform/msm_sdcc.1/by-name/utagsBackup coherent_pool=8M" --base 0x00000000 --pagesize 2048 --ramdisk_offset 0x02000000 --tags_offset 0x01E00000 --output newboot_$DATE.img