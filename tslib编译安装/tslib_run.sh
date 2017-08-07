#交叉编译器目录:/opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/
export PATH=$PATH:/opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/

#CROSS_COMPILE
#即交叉编译器的前缀(prefix),也就是选择将代码编译成目标cpu的指令的工具,
#如指定make CROSS_COMPILE=arm-none-linux-gnueabi-就是使用arm-none-linux-gnueabi-gcc,
#arm-none-linux-gnueabi-ld等工具将代码编译成arm的可执行指令.如果不指定CROSS_COMPILE参数,
#make时将认为prefix为空,即使用gcc来编译.这里cross_compile的设置,是假定所用的交叉工具链的
#gcc程序名称为arm-linux-gcc.如果实际使用的gcc名称是some-thing-else-gcc,则这里照葫芦画瓢填
#some-thing-else-即可.总之,要省去名称中最后的gcc那3个字母.
export CROSS_COMPILE=arm-poky-linux-gnueabi-

#ARCH
#即architecture,就是选择编译哪一种cpu的architecture,也就是编译arch/目录下的哪一个子目录.
#如指定make ARCH=arm就是编译arch/arm下的代码.如果不指定,make将使用本机(用什么机器编译就是什么)
#的cpu作为缺省ARCH.
export ARCH=arm

./autogen.sh

#--prefix:指定安装路径,用户可以自行指定tslib的安装目录.
#--host:指定交叉编译器,如果交叉编译器是arm-none-linux-guneabi-gcc,则指定arm-none-linux-guneabi.
#--enable-inputapi=no:是为了解决运行中提示"ts_open:Inappropriate ioctol for device",它表示不使用ioctl来控制触摸屏
#ac_cv_func_malloc_0_nonnull=yes,是为解决如下编译错误设置的:"undefined reference to `rpl_malloc'"
./configure CC="arm-poky-linux-gnueabi-gcc -mfloat-abi=hard" --prefix=/opt/tslib --host=arm-poky-linux-gnueabi --enable-inputapi=no ac_cv_func_malloc_0_nonnull=yes
