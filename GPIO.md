**************************************************
【M4工作模式】
4种输入模式
    GPIO_Mode_AIN           模拟输入
    GPIO_Mode_IN_FLOATING   浮空输入
    GPIO_Mode_IPD           下拉输入
    GPIO_Mode_IPU           上拉输入
4种输出模式
    GPIO_Mode_Out_OD        开漏输出(带上拉或者下拉)
    GPIO_Mode_Out_PP        推挽输出(带上拉或者下拉)
    GPIO_Mode_AF_OD         复用开漏输出(带上拉或者下拉)
    GPIO_Mode_AF_PP         复用推挽输出(带上拉或者下拉)
GPIO还支持四种最大翻转速度(2MHz,25MHz,50MHz,100MHz)
**************************************************
【STM32】
typedef struct {    // GPIO初始化结构体
    uint32_t GPIO_Pin;              // 指定要配置的GPIO引脚
    GPIOMode_TypeDef GPIO_Mode;     // 指定所选引脚的操作模式
    GPIOSpeed_TypeDef GPIO_Speed;   // 指定选定引脚的速度
    GPIOOType_TypeDef GPIO_OType;   // 指定所选引脚的操作输出类型
    GPIOPuPd_TypeDef GPIO_PuPd;     // 指定所选引脚的操作上拉/下拉/浮空
} GPIO_InitTypeDef;
typedef enum {      // 引脚模式
    GPIO_Mode_IN = 0x00,            // GPIO输入模式
    GPIO_Mode_OUT = 0x01,           // GPIO输出模式
    GPIO_Mode_AF = 0x02,            // GPIO复用模式
    GPIO_Mode_AN = 0x03             // GPIO模拟模式
} GPIOMode_TypeDef;
typedef enum {      // 引脚速度
    GPIO_Low_Speed = 0x00,          // 低速
    GPIO_Medium_Speed = 0x01,       // 中速
    GPIO_Fast_Speed = 0x02,         // 快速
    GPIO_High_Speed = 0x03          // 高速
} GPIOSpeed_TypeDef;
#define GPIO_Speed_2MHz     GPIO_Low_Speed
#define GPIO_Speed_25MHz    GPIO_Medium_Speed
#define GPIO_Speed_50MHz    GPIO_Fast_Speed
#define GPIO_Speed_100MHz   GPIO_High_Speed
typedef enum {      // 输出模式
    GPIO_OType_PP = 0x00,           // 推挽输出模式
    GPIO_OType_OD = 0x01            // 开漏输出模式
} GPIOOType_TypeDef;
typedef enum {      // 引脚操作
    GPIO_PuPd_NOPULL = 0x00,        // 无上下拉/浮空
    GPIO_PuPd_UP = 0x01,            // 上拉
    GPIO_PuPd_DOWN = 0x02           // 下拉
} GPIOPuPd_TypeDef;
【为什么要设置时钟】
    任何外设都需要时钟,51单片机,stm32,430等等,因为寄存器是由D触发器组成的,往触发器里面写
东西,前提条件是有时钟输入.stm32是低功耗,他将所有的门都默认设置为disable(不使能),在你需要
用哪个门的时候,开哪个门就可以,也就是说用到什么外设,只要打开对应外设的时钟就可以,其他的没
用到的可以还是disable(不使能),这样耗能就会减少.
【为什么STM32要有多个时钟源】
    因为首先STM32本身非常复杂,外设非常的多,但是并不是所有外设都需要系统时钟这么高的频率,
比如看门狗以及RTC只需要几十k的时钟即可.同一个电路,时钟越快功耗越大,同时抗电磁干扰能力也
会越弱,所以对于较为复杂的MCU一般都是采取多时钟源的方法来解决这些问题.
**************************************************

