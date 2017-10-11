#!/bin/sh
./../qt-everywhere-opensource-src-5.9.1/configure \
-verbose \
-opensource \
-release \
-shared \
-confirm-license \
-make libs \
-nomake tools \
-nomake examples \
-nomake tests \
-no-feature-cursor \
-no-qml-debug \
-no-use-gold-linker \
-no-iconv \
-prefix /opt/qt-5.9.1-desktop