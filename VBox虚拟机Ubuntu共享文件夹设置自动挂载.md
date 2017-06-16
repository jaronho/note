1. 安装增强功能包(Guest Additions)

安装好Ubuntu 后，运行Ubuntu并登录。然后在VirtualBox的菜单里选择"设备(D)" -> "安装增强功能(I)..."。

您会发现在Ubuntu桌面上多出一个光盘图标，这张光盘默认被自动加载到了文档夹

/media/VBoxGuestAdditions-4.1.4

进入命令行终端，输入：

cd /media/VBoxGuestAdditions-4.1.4

sudo ./VboxLinuxAdditions.run

不同版本路径可能有所不同，请根据自己的实际情况安装

开始安装工具包，安装完毕后重启Ubuntu。

2. 配置共享文档夹

重启完成后点击"设备(Devices)" -> 共享文档夹(Shared Folders)菜单，添加一个共享文档夹，
选项固定和临时是指该文档夹是否是持久的。共享名能够任取一个自己喜欢的，比如"gongxiang"，尽量使用英文名称。

3. 挂载共享文档夹

重新进入虚拟Ubuntu，在命令行终端下输入：

sudo mkdir /mnt/shared

sudo mount -t vboxsf gongxiang /mnt/shared

其中"gongxiang"是之前创建的共享文档夹的名字。OK，现在Ubuntu和主机能够互传文档了。

假如您不想每一次都手动挂载，在文件 /etc/rc.local 中（用root用户）追加如下命令 mount -t vboxsf share /home/liuqin/mnt

4. 卸载的话使用下面的命令： sudo umount -f /mnt/shared 注意： 共享文档夹的名称千万不要和挂载点的名称相同。