mount –o remount,rw /

重新挂载为已经挂载了的文件系统（以读写权限挂载），需要注意的是，
挂载点必须是一个已经存在的目录，这个目录可以不为空。一般用于此
目录下的文件为ro权限，需要临时变更为可修改权限。

参数：
-o <选项> 指定挂载文件系统时的选项，有些也可写到在 /etc/fstab 中。常用的有：
   defaults 使用所有选项的默认值（auto、nouser、rw、suid）
   auto/noauto 允许/不允许以 –a选项进行安装
   dev/nodev 对/不对文件系统上的特殊设备进行解释
   exec/noexec 允许/不允许执行二进制代码
   suid/nosuid 确认/不确认suid和sgid位
   user/nouser 允许/不允许一般用户挂载
   codepage=XXX 代码页
   iocharset=XXX 字符集
   ro 以只读方式挂载
   rw 以读写方式挂载
   remount 重新安装已经安装了的文件系统
   loop 挂载“回旋设备”以及“ISO镜像文件”
   