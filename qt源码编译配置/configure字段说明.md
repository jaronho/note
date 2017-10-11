先使用./configure --help来看看都有哪些参数

1.【安装选项】

	选项							作用
 -prefix <dir>				指定部署目录(默认 /usr/local/Qt-5.6.0)
 -extprefix <dir>			安装目录(默认 SYSROOT/PREFIX)
 -hostprefix [dir]			运行在这个主机上的构建工具的安装目录,如果不给定,使用当前目录(默认 EXTPREFIX)

你可以用这些来改变安装的布局.请注意,所有目录除sysconfdir外,其他的应位于-prefix/hostprefix下

	选项							作用
 -bindir <dir>				用户可执行文件将安装到这个目录(默认 PREFIX/bin)
 -headerdir <dir>			头文件安装目录(默认 PREFIX/include)
 -libdir <dir>				库文件安装目录(默认 PREFIX/lib)
 -archdatadir <dir>			QT相关的数据将被安装到<dir>(默认 PREFIX)
 -plugindir <dir>			插件安装目录(默认 ARCHDATADIR/plugins)
 -libexecdir <dir>			程序的可执行文件安装目录(默认 ARCHDATADIR/libexec, ARCHDATADIR/bin for MinGW)
 -importdir <dir>			导入QML1安装目录(默认 ARCHDATADIR/imports)
 -qmldir <dir>				导入QML2安装目录(默认 ARCHDATADIR/qml)
 -datadir <dir>				QT独立的数据安装目录(default PREFIX)
 -docdir <dir>				文档安装目录(default DATADIR/doc)
 -translationdir <dir>		Qt程序的翻译数据安装目录(default DATADIR/translations)
 -sysconfdir <dir>			设置使用QT程序的搜寻目录(default PREFIX/etc/xdg)
 -examplesdir <dir>			示例文件安装目录(default PREFIX/examples)
 -testsdir <dir>			测试文件安装目录(default PREFIX/tests)
 -hostbindir <dir>			主机可执行文件安装目录(default HOSTPREFIX/bin)
 -hostlibdir <dir>			主机库文件安装目录(default HOSTPREFIX/lib)
 -hostdatadir <dir>			qmake使用数据安装目录(default HOSTPREFIX)

2.【Configure选项】

下表中第一列中的*表示默认并可行的.+表示默认,但需要进行评估(检测),评估通过才可接受

 	选项							作用
*-release					编译和链接Qt的release版本
 -debug						编译和链接debug版本
 -debug-and-release			编译和链接release和debug两个版本的QT.没有和有debug输出(仅适用于MAC)
 -force-debug-info			强制为release构建输出调试信息
 -developer-build			Qt开发者编译和链接选项(包括自动测试/输出)
*-no-optimized-tools		即使在调试版本中,也不构建优化的主机工具
 -optimized-tools			构建优化的主机工具,即使在调试版本
 -opensource				编译和链接Qt开源版本
 -commercial				编译和链接的Qt商业版
 -confirm-license			自动确认许可证(使用开源或是商业)
 -c++std <edition>			编译QT使用的C++标准(c++98, c++11, c++14, c++1z)默认:最高支持版本
*-shared					创建并使用Qt共享库
 -static					创建并使用QT静态库
 -no-largefile				禁用大文件支持
+-largefile					启用QT访问大于4GB的文件功能
 -no-accessibility			不编译的可访问性支持,禁用访问不推荐,它将破坏QStyle并且可能影响QT构建,这个选项启用将创建一个源不兼容版本的QT,这是不支持
+-accessibility				编译访问支持
 -no-sql-<driver>			完全禁用SQL <driver>
 -qt-sql-<driver>			在 Qt SQL 模块启用SQL <driver>,默认是不启用的
 -plugin-sql-<driver>		启用SQL <driver\>作为一个插件在运行时链接,<driver>的可能值为:[db2 ibase mysql oci odbc psql sqlite sqlite2 tds]
 -system-sqlite				利用操作系统SQLite
 -no-qml-debug				不构建在QML调试支持
+-qml-debug					构建QML调试支持
 -platform target			构建的目标操作系统和编译器(默认检测主机系统),读readme文件获取支持的操作系统和编译器列表
 -no-sse2					编译不要使用SSE2指令
 -no-sse3					编译不要使用SSE3指令
 -no-ssse3					编译不要使用SSSE3指令
 -no-sse4.1					编译不要使用SSE4.1指令
 -no-sse4.2					编译不要使用SSE4.2指令
 -no-avx					编译不要使用AVX指令
 -no-avx2					编译不要使用AVX2指令
 -no-mips_dsp				编译不要使用MIPS DSP指令
 -no-mips_dspr2				编译不要使用MIPS DSP Rev2指令
 -qtnamespace <name>		把所有的Qt库代码放入namespace <name> {...}中
 -qtlibinfix <infix>		重命名所有libQt*.so为libQt*<infix>.so
 -testcocoon				Instrument Qt with the TestCocoon code coverage tool
 -gcov						Instrument Qt with the GCov code coverage tool
 -D <string>				显示的添加一个宏定义到预处理器
 -I <string>				显示的添加一个包含路径
 -L <string>				显示添加一个库路径
+-pkg-config				使用pkg-config检测包括库路径.默认情况下,配置决定是否使用pkg-config或不具有启发式如检查环境变量
 -no-pkg-config				禁用pkg-config支持
 -force-pkg-config			强制使用pkg-config(跳过pkg-config可用性启发式检测)
 -help, -h					显示帮助信息

3.【第三方库】

下表中第一列中的*表示默认并可行的.+表示默认,但需要进行评估(检测),评估通过才可接受

 	选项							作用
 -qt-zlib					使用QT自带zlib库
+-system-zlib				使用操作系统自带的zlib库,http://www.gzip.org/zlib
 -no-mtdev					不要编译mtdev支持,mtdev包含了应用程序对多点触摸协议的支持
+-mtdev						启用mtdev的支持
+-no-journald				不要把日志输出到journald,Journald是为Linux服务器打造的新系统日志方式
 -journald					日志输出到journald
+-no-syslog					不要输出日志到syslog
 -syslog					输出日志到syslog
 -no-gif					不要编译GIF读取支持
 -no-libpng					不要编译PNG支持
 -qt-libpng					使用Qt自带的libpng
+-system-libpng				使用操作系统自带的libpng,http://www.libpng.org/pub/png
 -no-libjpeg				不要编译JPEG支持
 -qt-libjpeg				使用QT自带的libjpeg
+-system-libjpeg			使用系统自带的libjpeg,http://www.ijg.org
 -no-freetype				不要编译Freetype2的支持
 -qt-freetype				使用QT自带的libfreetype
+-system-freetype			使用系统自带的libfreetype(假如存在)(启用,如果-fontconfig选项开启),http://www.freetype.org
 -no-harfbuzz				不要编译HarfBuzz-NG 支持
*-qt-harfbuzz				使用QT自带的HarfBuzz-NG去进行文本构形,仍然可以通过设置QT_HARFBUZZ环境变量到”old”来禁用
 -system-harfbuzz			使用系统自带的HarfBuzz-NG区进行文本构形,仍然可以通过设置QT_HARFBUZZ环境变量到”old”来禁用,http://www.harfbuzz.org
 -no-openssl				不要编译OpenSSL的支持
 -openssl					启用运行时OpenSSL支持
 -openssl-linked			启用并链接OpenSSL支持
 -no-libproxy				不要编译libproxy的支持
+-libproxy					使用操作系统自带的libproxy
 -qt-pcre					使用QT自带的PCRE library
+-system-pcre				使用操作系统自带的PCRE library
 -qt-xcb					使用QT自带的xcb-libraries,(libxcb.so将仍然使用操作系统自带的)
+-system-xcb				使用操作吸引自带的xcb- libraries
 -xkb-config-root			设置默认的XKB config root.这个选项仅与-qt-xkbcommon-x11一起使用
 -qt-xkbcommon-x11			在构建xcb中使用QT自带的xkbcommon library
+-system-xkbcommon-x11		在构建xcb中使用操作系统自带的 xkbcommon library
 -no-xkbcommon-evdev		当编译libinput支持时,不使用X-less xkbcommon
*-xkbcommon-evdev			当编译libinput支持时,使用X-less xkbcommon
 -no-xinput2				不要编译XInput2的支持
*-xinput2					编译XInput2支持
 -no-xcb-xlib				不要编译Xcb-Xlib支持
*-xcb-xlib					编译 Xcb-Xlib支持
 -no-glib					不要编译 Glib 支持
+-glib						编译 Glib 支持
 -no-pulseaudio				不要编译PulseAudio 支持
+-pulseaudio				编译 PulseAudio 支持
 -no-alsa					不要编译 ALSA 支持
+-alsa						编译 ALSA 支持
 -no-gtkstyle				不要编译GTK theme 支持
+-gtkstyle					编译 GTK theme 支持

4.【附加选项】

下表中第一列中的*表示默认并可行的.+表示默认,但需要进行评估(检测),评估通过才可接受

	选项							作用
 -make <part>				在make时添加要构建的组件,(默认为:libs tools examples)
 -nomake <part>				在构建时排除组件
 -skip <module>				排除整个模块的建立
 -no-compile-examples		仅安装examples的源码,不要编译它
 -no-gui					不要构建Qt GUI模块和依赖
+-gui						构建Qt GUI 模块和依赖
 -no-widgets				不要构建Qt Widgets 模块和依赖
+-widgets					构建 Qt Widgets模块和依赖
 -R <string>				显示添加一个运行时库的路径去构建Qt libraries
 -l <string>				显示添加一个library
 -no-rpath					不使用库安装路径作为一个运行时库路径,在苹果的平台上,这意味着使用绝对安装名称(基于在libdir)动态库和框架
+-rpath						链接 Qt 库和可执行文件使用库安装路径作为运行时库路径.相当于-R install_libpath
 -continue					如果发生错误,尽量继续
 -verbose, -v				打印每个步骤的配置过程的详细的信息
 -silent					减少生成输出,这样可以更容易看到警告和错误
 -no-nis					不要编译 NIS 支持
*-nis						编译 NIS 支持
 -no-cups					不要编译CUPS支持
*-cups						编译CUPS支持. 要求 cups/cups.h 和libcups.so.2
 -no-iconv					不编译对 iconv(3) 的支持
*-iconv						编译对 iconv(3) 的支持
 -no-evdev					不编译对 evdev 的支持
*-evdev						编译对 evdev 的支持
 -no-tslib					不编译对 tslib 的支持,tslib是对触屏的支持
*-tslib						编译对 tslib 的支持
 -no-icu					不编译对 ICU libraries 的支持,这是IBM发布的字符集编码转换库
+-icu						编译对 ICU libraries 的支持
 -no-fontconfig				不编译系统中的FontConfig支持
+-fontconfig				编译系统中的FontConfig支持
 -no-strip					不对二进制文件和库的使用strip去除不需要的符号
*-strip						在安装时对二进制文件和库的使用strip去除不需要的符号
*-no-pch					不使用预编译的头支持
 -pch						使用预编译的头支持
*-no-ltcg					不使用链接时代码生成
 -ltcg						使用链接时代码生成
 -no-dbus					不要编译Qt D-Bus 模块
+-dbus-linked				编译Qt D-Bus模块并链接到libdbus-1
 -dbus-runtime				编译Qt D-Bus模块并动态加载libdbus-1
 -reduce-relocations		减少通过额外的链接器优化库的重加载(仅qt/X11 和Qt/linux嵌入式 ;实验性的;需要 GNU ld > = 2.18)
 -no-use-gold-linker		不要使用GNU gold linker进行链接
+-use-gold-linker			使用GNU gold linker进行链接
 -force-asserts				强制启用Q_ASSERT,即使在release构建中
 -sanitize [address/thread/memory/undefined]	启用指定编译器的sanitizer
 -device <name>				跨平台编译<name>设备 (试验性)
 -device-option <key=value>	添加device mkspec的device选项 (试验性)
*-no-separate-debug-info	不将调试信息存储在一个单独的文件
 -separate-debug-info		将调试信息到一个单独的文件
 -no-xcb					不要编译Xcb (X protocol C-language Binding) 支持
*-xcb						编译 Xcb 支持
 -no-eglfs					不要编译EGLFS (EGL Full Screen/Single Surface) 支持
*-eglfs						编译 EGLFS 支持
 -no-kms					不要编译KMS的后端
*-kms						编译 KMS的后端
 -no-gbm					不要编译 GBM 的后端
*-gbm						编译 GBM的后端
 -no-directfb				不要编译 DirectFB 支持
*-directfb					编译 DirectFB 支持
 -no-linuxfb				不要编译Linux Framebuffer 支持
*-linuxfb					编译 Linux Framebuffer 支持
*-no-mirclient				不要编译 Mir client 支持
 -mirclient					编译 Mir client 支持
 -qpa <name>				设置默认的QPA 平台 (示例 xcb, cocoa, windows)
 -xplatform target			指定目标平台(在跨平台编译时)
 -sysroot <dir>				将<dir>设置为目标编译器和 qmake 的 sysroot 并且也设置 pkg-confing路径
 -no-gcc-sysroot			当使用-sysroot时,它禁用将–sysroot传递到编译器
 -no-feature-<feature>		在<feature>中的不编译
 -feature-<feature>			编译<feature>中的,可用的功能介绍在src/corelib/global/qfeatures.txt
 -qconfig local				使用src/corelib/global/qconfig-local.h,而不是默认的(全部)
 -qreal [double/float]		为qreal指定类型,默认值是double.请注意,更改此标志影响二进制兼容性
 -no-opengl					禁用OpenGL支持
 -opengl <api>				启用 OpenGL 支持.不带参数时,这将会尝试自动检测的 OpenGL ES 2.0 和更高版本,或常规的桌面版OpenGL. 使用 es2 的<api>将替代自动检测
 -no-libinput				禁用libinput支持
*-libinput					启用libinput 支持
 -no-gstreamer				禁用GStreamer支持
+-gstreamer <version>		启用 GStreamer 支持,不带参数,这将会尝试自动检测 GStreamer 0.10 和 1.0.GStreamer 1.0 是默认使用的可用时.使用 0.10 或 1.0 <version>来覆盖自动检测
*-no-system-proxies			默认情况下,不使用系统网络代理
 -system-proxies			默认情况下,使用系统网络代理
 -no-warnings-are-errors	Make时把warnings当做正常
 -warnings-are-errors		Make时把warnings 当做错误(如果启用了-developer-build)

5.【QNX/Blackberry选项】

	选项							作用
 -no-slog2					不编译 slog2 的支持
 -slog2						编译 slog2 的支持
 -no-pps					不编译 pps 的支持
 -pps						编译 pps 的支持
 -no-imf					不编译 imf 的支持
 -imf						编译 imf 的支持
 -no-lgmon					不编译 lgmon 的支持
 -lgmon						编译 lgmon 的支持

6.【Android选项】

下表中第一列中的*表示默认并可行的.+表示默认,但需要进行评估(检测),评估通过才可接受

 	选项							作用
 -android-sdk path			Android SDK 根目录,(默认 $ANDROID_SDK_ROOT)
 -android-ndk path			Android NDK 根目录,(默认 $ANDROID_NDK_ROOT)
 -android-ndk-platform		设置android 平台版本,(默认 android-9)
 -android-ndk-host			设置android NDK 主机类型(linux-x86, linux-x86_64, etc.),(默认 $ANDROID_NDK_HOST)
 -android-arch				设置android 体系结构(armeabi, armeabi-v7a, x86, mips, arm64-v8a, x86_64, mips64),(默认 armeabi-v7a)
 -android-toolchain-version	设置android 工具链版本,(默认 4.9)
 -no-android-style-assets	不编译 通过运行时设备自动提取style-assets的代码.设置这将使Android风格的行为不当，但与lgpl2.1许可兼容
*-android-style-assets		编译 通过运行时设备自动提取style-assets的代码.此选项将使Android平台的lgpl2.1许可不兼容.

