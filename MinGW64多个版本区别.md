【DWARF】
    DWARF-2(DW2)EH,这需要使用DWARF-2(或DWARF-3)调试信息.DW-2 EH可以导致可执行文件
略显膨胀,因为大的调用堆栈解开表必须包含在可执行文件中的.
【SJLJ】
    setjmp/longjmp(SJLJ).基于SJLJ的EH比DW2 EH慢得多(在没有异常时会惩罚甚至正常执行),
但是可以在没有使用GCC编译的代码或没有调用堆栈的代码上工作.
【SEH】
    结构化异常处理(SEH)(Structured Exception Handling)Windows使用自己的异常处理机制.