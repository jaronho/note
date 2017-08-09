1.进入qt源码目录,例如:qt-everywhere-opensource-src-5.9.1

2.修改文件:qtbase/mkspecs/common/linux.conf
	把"QMAKE_LIBS_THREAD = -lpthread"添加"-lts"改为"QMAKE_LIBS_THREAD = -lpthread -lts"

3.修改文件:qtbase/mkspecs/linux-arm-gnueabi-g++/qmake.conf
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

4.运行"qt_run.sh"进行配置

5.运行命令"make"进行编译

6.运行命令"make install"进行安装

7.配置开发板
	(1)把安装后的Qt的相关库拷贝到目标板指定目录,例如:
		创建目录:/usr/local/qt-5.9.1-arm
		拷贝文件夹:lib,plugins,qml 到所创建目录
	
	(2)配置/etc/profile
		export QTDIR=/usr/local/qt-5.9.1-arm
		
		#
		export QWS_MOUSE_PROTO="tslib:/dev/input/event0"
		
		#
		export QT_QPA_PLATFORM=linuxfb
		
		#
		export QT_QPA_FONTDIR=$QTDIR/lib/fonts
		
		#
		export QT_PLUGIN_PATH=$QTDIR/plugins
		
		#
		export QML2_IMPORT_PATH=$QTDIR/qml
		
		#把qt-5.9.1-arm/lib加入动态库搜索路径
		export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH
		
	
	