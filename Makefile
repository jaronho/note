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
################# 可修改和配置参数 #################
##################################################
#目标文件名,例如:test
TARGET      := test_cxx
#宏定义,例如:-DEBUG -TEST=1
DEFINES		:=
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
#编译器
COMPILE     := g++
#C编译器选项
CFLAGS      := -g -Wall -O3
#C++编译器选项
CXXFLAGS    := -DHAVE_CONFIG_H -std=c++11
#构建目录,存放临时文件
BUILD_DIR	?= _build
OBJ_C_DIR	?= $(BUILD_DIR)/object_c
OBJ_CXX_DIR	?= $(BUILD_DIR)/object_cxx
##################################################
############## 构建流程,基本不需再修改 ##############
##################################################

#源文件
SOURCES := $(filter %.c %.cpp,$(call pwdFiles) $(call searchFiles,$(SOURCE_PATH)))
#.o文件
OBJECTS_C := $(patsubst %.c,$(OBJ_C_DIR)/%.o,$(filter %.c,$(SOURCES)))
OBJECTS_CXX := $(patsubst %.cpp,$(OBJ_CXX_DIR)/%.o,$(filter %.cpp,$(SOURCES)))
OBJECTS := $(OBJECTS_C) $(OBJECTS_CXX)
#编译参数
FLAGS := $(DEFINES) $(INCLUDES) $(CFLAGS) $(CXXFLAGS)
#链接库参数
LIB_FLAGS := $(LDFLAGS) $(LIBS) $(LIB_STATICS)

#伪目标
.PHONY: all gendir clean veryclean rebuild

all: gendir $(TARGET)

#自动创建目录
gendir:
	@mkdir -pv $(BUILD_DIR)
	@mkdir -p $(OBJ_C_DIR) $(OBJ_CXX_DIR)

#编译c源码的.o文件
$(OBJ_C_DIR)/%.o: %.c
	@mkdir -p $(@D)
	@echo $@
	@$(COMPILE) $(FLAGS) -c $< -o $@

#编译c++源码点.o文件
$(OBJ_CXX_DIR)/%.o: %.cpp
	@mkdir -p $(@D)
	@echo $@
	@$(COMPILE) $(FLAGS) -c $< -o $@

#链接目标文件
$(TARGET): $(OBJECTS)
	@$(COMPILE) $(FLAGS) -o $(BUILD_DIR)/$@ $(OBJECTS) $(LIB_FLAGS)
	@echo "Build OK ..."

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
