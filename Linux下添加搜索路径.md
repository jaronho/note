【添加可执行程序路径】
    (1)打开 "/etc/profile" 文件,配置全局变量"PATH",例如:
       PATH=$PATH:/opt/opencv-3.4.2/bin
    (2)输入命令使配置生效: source /etc/profile
【添加动态库路径】
    (1)打开 "/etc/profile" 文件,配置全局变量"LD_LIBRARY_PATH",例如:
       LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/opencv-3.4.2/lib
    (2)输入命令使配置生效: source /etc/profile
【添加静态库路径】
    (1)打开 "/etc/profile" 文件,配置全局变量"LIBRARY_PATH",例如:
       LIBRARY_PATH=$LIBRARY_PATH:/opt/opencv-3.4.2/lib
    (2)输入命令使配置生效: source /etc/profile
【添加C头文件路径】
    (1)打开 "/etc/profile" 文件,配置全局变量"C_INCLUDE_PATH",例如:
       C_INCLUDE_PATH=$C_INCLUDE_PATH:/opt/opencv-3.4.2/include
    (2)输入命令使配置生效: source /etc/profile
【添加C++头文件路径】
    (1)打开 "/etc/profile" 文件,配置全局变量"CPLUS_INCLUDE_PATH",例如:
       CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/opt/opencv-3.4.2/include
    (2)输入命令使配置生效: source /etc/profile