修改/etc/profile文件当本机仅仅作为开发使用时推荐使用这种方法,
因为此种配置时所有用户的shell都有权使用这些环境变量,可能会给系统带来安全性问题,
用文本编辑器打开/etc/profile,在profile文件末尾加入:

export JAVA_HOME=/opt/jdk-10.0.2
export PATH=$JAVA_HOME/bin:$PATH