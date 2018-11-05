【1】disconnected no supported authentication methods available(server sent: publickey)
安装好小乌龟git后,用小乌龟的pull从github上拉取项目,遇到错误:
disconnected no supported authentication methods available(server sent: publickey) 
或者是 git did not exit cleanly (exit code 1)
亦或者是 git did not exit cleanly (exit code 128)
多半是因为git和小乌龟有冲突,解决方法:
    右键--小乌龟---settings--network--修改ssh client(默认为TortoiseGitPlink.exe)为git的ssh.exe