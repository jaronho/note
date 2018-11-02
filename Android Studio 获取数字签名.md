下面介绍下调试版本和发布版本,获取数字签名的方法,通过以下方法可以获取到SHA1和MD5
【调试版本】
在调试模式下,Android studio会默认生成一个debug.keystore签名文件,
因此我们无需自己生成,获取数字签名的方法如下:
    在Android Studio中打开终端,输入以下命令(密码默认为android或者直接回车):
    keytool -list -v -keystore debug.keystore

【发布版本】
    在Android Studio中打开终端,输入以下命令:
    keytool -list -v -keystore xxx(签名文件名称).jks