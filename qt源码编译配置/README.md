1.进入qt源码目录,例如:qt-everywhere-opensource-src-5.9.2

2.修改文件(可选,需要tslib):qtbase/mkspecs/common/linux.conf
	把"QMAKE_LIBS_THREAD = -lpthread"添加"-lts"改为"QMAKE_LIBS_THREAD = -lpthread -lts"

3.修改文件:qtbase/mkspecs/linux-arm-gnueabi-g++/qmake.conf
	参见"qmake.conf"

4.运行"qt_run.sh"进行配置

5.运行命令"make"进行编译

6.运行命令"make install"进行安装

7.配置开发板
	(1)把安装后的Qt的相关库拷贝到目标板指定目录,例如:
		创建目录:/opt/qt-5.9.2-imx6
		拷贝文件夹:lib,plugins,qml 到所创建目录
	
	(2)配置/etc/profile,使用eglfs启动OpenGL功能
		export QTDIR=/opt/qt-5.9.2-imx6
		export QT_PLUGIN_PATH=$QTDIR/plugins
		export QML_IMPORT_PATH=$QTDIR/qml
		export QML2_IMPORT_PATH=$QTDIR/qml
		export QT_QPA_FONTDIR=$QTDIR/lib/fonts
		export QT_QPA_PLATFORM_PLUGIN_PATH=$QTDIR/plugins/platforms
		export QT_QPA_PLATFORM=eglfs
		export QT_QPA_EGLFS_INTEGRATION=eglfs_viv
		export QT_QPA_EGLFS_FORCEVSYNC=1
		export FB_MULTI_BUFFER=2
		export XDG_RUNTIME_DIR=/tmp
		export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH

	(3)配置/etc/profile,使用linuxfb
		export QTDIR=/opt/qt-5.9.2-imx6-noopengl
		export QT_PLUGIN_PATH=$QTDIR/plugins
		export QML_IMPORT_PATH=$QTDIR/qml
		export QML2_IMPORT_PATH=$QTDIR/qml
		export QT_QPA_FONTDIR=$QTDIR/lib/fonts
		export QT_QPA_PLATFORM_PLUGIN_PATH=$QTDIR/plugins/platforms
		export QT_QPA_PLATFORM=linuxfb
		export XDG_RUNTIME_DIR=/tmp
		export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH
	