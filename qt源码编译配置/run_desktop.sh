#!/bin/sh
./../qt-everywhere-src-5.12.0/configure \
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
-prefix /opt/qt-5.12.0-desktop