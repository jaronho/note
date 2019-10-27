#!/bin/sh
./../qt-everywhere-src-5.12.0/configure \
-verbose \
-opensource \
-release \
-shared \
-confirm-license \
-linuxfb \
-make libs \
-no-opengl \
-xplatform linux-arm-gnueabi-g++ \
-prefix /opt/qt-5.12.0-imx6-noopengl \
-I/opt/fsl-image-gui-imx6qsabresd/usr/include \
-L/opt/fsl-image-gui-imx6qsabresd/usr/lib \
-I/opt/tslib-1.11/include \
-L/opt/tslib-1.11/lib