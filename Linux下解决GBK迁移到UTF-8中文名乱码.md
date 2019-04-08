在windows上使用ftp上传文件到Linux上,中文名称在Linux系统中显示为乱码.
虽然将Linux的env设置了LANG=en_US.UTF-8,并且本地的Shell客户端编码也设置成UTF-8,
但在Shell中(或通过http访问)仍是乱码.

原因在于:Windows的文件名中文编码默认为GB,压缩或者上传后,文件名还会是GBK编码,
而Linux中默认文件名编码为UTF8,由于编码不一致所以导致了文件名乱码的问题,
解决这个问题需要对文件名进行转码.

安装convmv:
    sudo apt-get install convmv

使用:
    convmv -f gbk -t utf-8 -r --notest /home/test

常用参数:
    -f 指定目前文件名的编码,如: gbk
    -t 指定将要转换成的编码,如: utf-8
    -r 递归处理子文件夹
    --notest 真正进行操作,默认是只打印转换后的效果,加这个选项才真正执行转换操作
    -i 交互模式(询问每一个转换,防止误操作)

注意:
    不要在NTFS和FAT文件系统中使用此命令,否则可能产生意外