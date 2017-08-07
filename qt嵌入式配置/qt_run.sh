#!/bin/sh
./configure \
-v \
-prefix /opt/qt-5.9.1-arm \
-release \
-opensource \
-no-accessibility
-make libs \
-xplatform linux-arm-gnueabi-g++ \
-optimized-qmake \
-pch \
-qt-sql-sqlite \
-qt-zlib \
-tslib \
-no-opengl \
-no-sse2 \
-no-openssl \
-no-nis \
-no-cups \
-no-glib \
-no-pkg-config \
-no-separate-debug-info \
-I /opt/tslib-1.11/include \
-L /opt/tslib-1.11/lib \
-importdir /opt/qt-5.9.1-arm/qml