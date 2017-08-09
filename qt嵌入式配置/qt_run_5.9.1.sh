#!/bin/sh
./configure \
-extprefix /opt/qt-5.9.1-arm \
-device linux-imx6-g++ \
-device-option CROSS_COMPILE=/opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi- \
-sysroot /opt/poky/1.7/sysroots/cortexa9hf-vfp-neon-poky-linux-gnueabi \
-nomake examples \
-nomake tests \
-v \
-no-feature-cursor \
-release \
-opensource \
-confirm-license \
-no-opengl \
-qt-freetype