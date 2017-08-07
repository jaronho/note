(1)进入qt源码目录,例如:qt-everywhere-opensource-src-5.9.1

(2)修改文件:qtbase/mkspecs/common/linux.conf
	把"QMAKE_LIBS_THREAD = -lpthread"添加"-lts"改为"QMAKE_LIBS_THREAD = -lpthread -lts"

(3)修改文件:qtbase/mkspecs/linux-arm-gnueabi-g++/qmake.conf
	# modifications to g++.conf
	QMAKE_CC                = /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gcc -mfloat-abi=hard -lts
	QMAKE_CXX               = /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++ -mfloat-abi=hard -lts
	QMAKE_LINK              = /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++ -mfloat-abi=hard -lts
	QMAKE_LINK_SHLIB        = /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++ -mfloat-abi=hard -lts

	# modifications to linux.conf
	QMAKE_AR                = /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-ar cqs
	QMAKE_OBJCOPY           = /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-objcopy
	QMAKE_NM                = /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-nm -P
	QMAKE_STRIP             = /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-strip

(4)运行"qt_run.sh"进行配置

(5)运行命令"make"进行编译

(6)运行命令"make install"进行安装