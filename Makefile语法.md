【= := ?= += 的区别】
=   是最基本的赋值,make会将整个Makefile展开后,再决定变量的值,例:
        x = foo
        y = $(x) bar
        x = xyz
    在上例中,y的值将会是:xyz bar,而不是:foo bar
:=  是覆盖之前的值,变量的值决定于它在makefile中的位置,例:
        x := foo
        y := $(x) bar
        x := xyz
    在上例中,y的值将会是:foo bar,而不是:xyz bar
?=  是如果没有被赋值过就赋予等号后面的值
+=  是添加等号后面的值
【函数】
Makefile里的函数使用,和取变量的值类似,是以一个'$'开始,
然后是一个括号里面是函数名和需要的参数列表,多个变量用逗号隔开,像这样:
    return = $(functionname arg1,arg2,arg3,...)
可能这里的'$'更像是从某个地址取值类似的操作
【wildcard】
    SRC = $(wildcard *.c ./foo/*.c) 
搜索当前目录及./foo/下所有以.c结尾的文件,生成一个以空格间隔的文件名列表,
并赋值给SRC,当前目录文件只有文件名,子目录下的文件名包含路径信息,如./foor/bar.c
【notdir】
    SRC = $(notdir $(SOURCES))
去除所有的目录信息,SRC里的文件名列表将只有文件名
【patsubst】
    OBJ = $(patsubst %.c,%.o,$(SRC)) 
patsubst是patten substitude的缩写,匹配替代的意思,
这句是在SRC中找到所有.c结尾的文件,然后把所有的.c换成.o
【filter】
    RET = $(filter %.h %.c ...,$(SRC))
过滤掉字串SRC中不符合模式%.h,%.c的单词,保留所有符合模式的单词,可以使用多个模式,
模式中一般需要包含模式字符"%",存在多个模式时,模式表达式之间使用空格分开,例如:
    sources := foo.c bar.c baz.s ugh.h
    ret = $(filter %.c %.s, $(sources)
返回值为:foo.c bar.c baz.s
