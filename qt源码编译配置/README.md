1.进入qt源码目录,例如:qt-everywhere-opensource-src-5.9.1

2.修改文件(可选,需要tslib):qtbase/mkspecs/common/linux.conf
	把"QMAKE_LIBS_THREAD = -lpthread"添加"-lts"改为"QMAKE_LIBS_THREAD = -lpthread -lts"

3.修改文件:qtbase/mkspecs/linux-arm-gnueabi-g++/qmake.conf
	参见"qmake.conf"

4.运行"qt_run.sh"进行配置

5.运行命令"make"进行编译

6.运行命令"make install"进行安装

7.配置开发板
	(1)把安装后的Qt的相关库拷贝到目标板指定目录,例如:
		创建目录:/opt/qt-5.9.1
		拷贝文件夹:lib,plugins,qml 到所创建目录
	
	(2)配置/etc/profile
		export QTDIR=/opt/qt-5.9.1
		export QT_PLUGIN_PATH=$QTDIR/plugins
		export QML_IMPORT_PATH=$QTDIR/qml
		export QML2_IMPORT_PATH=$QTDIR/qml
		export QT_QPA_FONTDIR=$QTDIR/lib/fonts
		export QT_QPA_PLATFORM_PLUGIN_PATH=$QTDIR/plugins/platforms
		export QT_QPA_PLATFORM=linuxfb
		export QT_QPA_EGLFS_FB=/dev/fb0
		export QT_QPA_EGLFS_FORCEVSYNC=1
		export QT_QPA_EGLFS_WIDTH=1920
		export QT_QPA_EGLFS_HEIGHT=1080
		export QT_EGLFS_IMX6_NO_FB_MULTI_BUFFER=1
		export FB_MULTI_BUFFER=2
		export FB_FRAMEBUFFER_0=/dev/fb0
		export DISPLAY=:0.0
		export XDG_RUNTIME_DIR=/tmp
		#把qt-5.9.1/lib加入动态库搜索路径
		export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH

	