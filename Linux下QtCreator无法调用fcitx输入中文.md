sudo apt-get install fcitx-frontend-qt5
发现软件已经被安装了,那么找一下软件安装的位置
dpkg -L fcitx-frontend-qt5
把"libfcitxplatforminputcontextplugin.so"拷到QtCreator安装目录的lib/Qt/plugins/platforminputcontexts下
重启QtCreator