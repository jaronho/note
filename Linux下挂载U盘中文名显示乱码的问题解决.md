当在Linux下挂载U盘时,如果U盘中的文件或目录是中文名,可能会显示乱码.
解决方法:
    需要在挂载的时候,指定字符集编码(最好为utf8)
例如:
    mount -o iocharset=utf8 /dev/sdb4 /media/jaron
   