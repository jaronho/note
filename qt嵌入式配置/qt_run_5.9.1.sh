#!/bin/sh
./../qt-everywhere-opensource-src-5.9.1/configure \
-verbose \
-opensource \
-release \
-shared \
-confirm-license \
-no-feature-cursor \
-make libs -make examples -make tools \
-compile-examples \
-xplatform linux-arm-gnueabi-g++ \
-prefix /opt/qt-5.9.1-imx6 \
-I/home/hezhanran/workspace/fsl-image-gui-imx6qsabresd/usr/include \
-L/home/hezhanran/workspace/fsl-image-gui-imx6qsabresd/usr/lib