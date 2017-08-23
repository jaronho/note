1.需要先安装:sudo apt-get install autoconf automake

2.下载tslib源码,可以通过git clone https://github.com/kergoth/tslib

3.使用"tslib交叉编译配置.sh"来配置

4.输入命令"make"编译

5.输入命令"make install"进行安装

6.安装成功后,会在安装目录下生成四个目录
	(1)ect:用于配置tslib
	(2)bin:tslib的测试程序,运行在ARM开发板
	(3)lib:动态库,由于获取坐标等信息
	(4)include:头文件,用于编译源码

7.配置开发板
	(1)把安装后的tslib拷贝到目标板的指定目录,例如:/usr/local/
	(2)修改tslib/etc/ts.conf文件
		"# module_raw input"去除"#"改为"module_raw input"
	(3)连接触摸屏和开发板,获取触摸屏设备文件
		开发板上执行:hexdump/dev/input/event0,然后用手指点击触摸屏,
		看串口终端是否有打印信息,如果没有,event0不是触摸屏的设备文件,
		再执行:hexdump/dev/input/event1,同样点击屏幕看是否有打印信息,
		如果没有,再次更换设备文件为event2,直到找到触摸屏的设备文件,
		例如:hexdump/dev/input/event3,有打印信息,至此触摸屏的设备文件为/dev/input/event3
	(4)配置/etc/profile
		export TSLIBDIR=/usr/local/tslib
		
		#控制台设备文件名
		export TSLIB_CONSOLEDEVICE=none
		
		#framebuffer的文件名
		export TSLIB_FBDEVICE=/dev/fb0
		
		#触屏的文件名,取决于具体的设备驱动,根据步骤(3)找触摸屏的设备文件
		export TSLIB_TSDEVICE=/dev/input/event0
		
		#触屏校正信息保存文件
		export TSLIB_CALIBFILE=$TSLIBDIR/etc/pointercal
		
		#tslib配置文件
		export TSLIB_CONFFILE=$TSLIBDIR/etc/ts.conf
		
		#tslib需要加载模块所在的目录
		export TSLIB_PLUGINDIR=$TSLIBDIR/lib/ts
		
		#把tslib/bin加入PATH
		export PATH=$TSLIBDIR/bin:$PATH
		
		#把tslib/lib加入动态库搜索路径
		export LD_LIBRARY_PATH=$TSLIBDIR/lib:$LD_LIBRARY_PATH
	(5)添加使用tslib时的标准系统库(libdl)
		find /home/tarena/workdir/toolchains/opt/S5PV210-crosstools/4.4.6/arm-concenwit-linux-gnueabi/lib/ \( -name "libdl-*"-o -name "libdl.so*"\) -exec cp -frd {}/opt/rootfs/lib/ \
		重启开发板,进行触摸屏校准
	(6)开发板运行:ts_calibrate
		此时屏幕有一个十字光标,用手指精确点击光标,点击光标5次,完成校准,
		生成一个校准文件保存在tslib/etc/pointercal
	(7)开发板运行:ts_test
		点击屏幕”Draw”,写字,画画
		