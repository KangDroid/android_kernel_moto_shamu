# Compiling script:

export DEFCONFIG=kangdroid_shamu_defconfig
make ARCH=arm CROSS_COMPILE=ccache\ arm-eabi- C_INCLUDE_PATH=$(pwd)/osx/src/libelf/ -j4 mrproper
make ARCH=arm CROSS_COMPILE=ccache\ arm-eabi- C_INCLUDE_PATH=$(pwd)/osx/src/libelf/ -j4 $DEFCONFIG
make ARCH=arm CROSS_COMPILE=ccache\ arm-eabi- C_INCLUDE_PATH=$(pwd)/osx/src/libelf/ -j4 zImage-dtb
