#!/bin/sh
./configure \
-prefix /opt/qt-5.9.1-arm \
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
-no-opengl

#要在开发版配置:export QT_QPA_PLATFORM="linuxfb",否则会自动使用"EGLFS",出现:
#This application failed to start because it could not find or load the Qt platform plugin "eglfs" in "".