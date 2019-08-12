##################################################
################ 可修改和配置参数 ################
##################################################
#目标文件名,例如:test
TARGET      := test
#标识定义,例如:ARM x86
DEFINES		:=
#源码宏定义,例如:-DEBUG -TEST=1
MACROS		:=
#头文件路径,例如:-I/user/include
INCLUDES	:= -I.
#源文件路径
SOURCE_PATH	:= algorithm \
			   common \
			   formula \
			   httpserver \
			   inifile \
			   logfile \
			   probability \
			   process \
			   pugixml \
			   shareprefs \
			   xmlhelper
#动态库路径,例如:-L/user/lib
LDFLAGS     :=
#动态库文件,例如:-lpthread
LIBS        :=
#静态库文件,例如:libgendll.a
LIB_STATICS	:= libevent/libevent.a libevent/libevent_core.a libevent/libevent_extra.a libevent/libevent_pthreads.a
ifeq (ARM,$(filter ARM,$(DEFINES)))
	LIB_STATICS += jpeg/lib/arm/libjpeg.a
else
	LIB_STATICS += jpeg/lib/x86/libjpeg.a
endif
#编译器
COMPILE		:= g++
ifeq (ARM,$(filter ARM,$(DEFINES)))
	COMPILE := /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++ -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a7
endif
#C编译器选项
CFLAGS      := -g -Wall -O3
#C++编译器选项
CXXFLAGS    := -DHAVE_CONFIG_H -std=c++11
#构建目录,存放临时文件
BUILD_DIR	?= _build
OBJ_C_DIR	?= $(BUILD_DIR)/object_c
OBJ_CXX_DIR	?= $(BUILD_DIR)/object_cxx

##################################################
# Brief:	搜索当前目录下的子节点(包含目录和文件)
# Param:	空
# Return:	列表,空格分隔
##################################################
pwdFiles = $(wildcard *)

##################################################
# Brief:	搜索指定目录下的子节点(包含目录和文件)
# Param:	参数1 - 目录列表,空格分隔,如.a b c
# Return:	列表,空格分隔
##################################################
searchFiles = $(foreach dir,$(1),$(wildcard $(dir)/*))

##################################################
############# 构建流程,基本不需再修改 ############
##################################################
#源文件
SOURCES := $(filter %.c %.cpp %.hpp,$(call pwdFiles) $(call searchFiles,$(SOURCE_PATH)))
#.d文件(依赖关系)
DEPENDS_C := $(patsubst %.c,$(OBJ_C_DIR)/%.d,$(filter %.c,$(SOURCES)))
DEPENDS_CPP := $(patsubst %.cpp,$(OBJ_CXX_DIR)/%.d,$(filter %.cpp,$(SOURCES)))
DEPENDS_HPP := $(patsubst %.hpp,$(OBJ_CXX_DIR)/%.d,$(filter %.hpp,$(SOURCES)))
DEPENDS := $(DEPENDS_C) $(DEPENDS_CPP) $(DEPENDS_HPP)
#.o文件
OBJECTS := $(DEPENDS:%.d=%.o)
#编译参数
FLAGS := $(MACROS) $(INCLUDES) $(CFLAGS) $(CXXFLAGS)
#链接库参数
LIB_FLAGS := $(LDFLAGS) $(LIBS) $(LIB_STATICS)

#伪目标
.PHONY: all clean veryclean rebuild

all: $(TARGET)

#编译c源码的.d文件
$(OBJ_C_DIR)/%.d: %.c
	@mkdir -p $(@D)
	@set -e; rm -f $@; \
		$(COMPILE) -MM $(FLAGS) $< > $@.$$$$; \
		sed 's,$(notdir $*)\.o[ :]*,$(OBJ_C_DIR)/$*\.o $@ : ,g' < $@.$$$$ > $@; \
		rm -f $@.$$$$

#编译c++源码点.d文件
$(OBJ_CXX_DIR)/%.d: %.cpp
	@mkdir -p $(@D)
	@set -e; rm -f $@; \
		$(COMPILE) -MM $(FLAGS) $< > $@.$$$$; \
		sed 's,$(notdir $*)\.o[ :]*,$(OBJ_CXX_DIR)/$*\.o $@ : ,g' < $@.$$$$ > $@; \
		rm -f $@.$$$$

$(OBJ_CXX_DIR)/%.d: %.hpp
	@mkdir -p $(@D)
	@set -e; rm -f $@; \
		$(COMPILE) -MM $(FLAGS) $< > $@.$$$$; \
		sed 's,$(notdir $*)\.o[ :]*,$(OBJ_CXX_DIR)/$*\.o $@ : ,g' < $@.$$$$ > $@; \
		rm -f $@.$$$$

#编译.o文件描述
o_describe:
	@echo "========================== Generate .o File =========================="

#编译c源码的.o文件
$(OBJ_C_DIR)/%.o: %.c
	@echo $@
	@mkdir -p $(@D)
	@$(COMPILE) $(FLAGS) -c $< -o $@

#编译c++源码点.o文件
$(OBJ_CXX_DIR)/%.o: %.cpp
	@echo $@
	@mkdir -p $(@D)
	@$(COMPILE) $(FLAGS) -c $< -o $@

#链接目标文件
-include $(DEPENDS)
$(TARGET): o_describe $(OBJECTS)
	@echo "======================== Generate Target File ========================"
	@$(COMPILE) $(FLAGS) -o $(BUILD_DIR)/$@ $(OBJECTS) $(LIB_FLAGS)
	@echo 'Build "$(BUILD_DIR)/$@" OK ...'

#只清除.o文件
clean:
	@rm -rf $(OBJ_C_DIR) $(OBJ_CXX_DIR)
	@echo "Clean OK ..."

#清除所有构建生成的文件
veryclean:
	@rm -rf $(BUILD_DIR)
	@echo "Very Clean OK ..."

#重新构建
rebuild: clean all
