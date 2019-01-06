(1)git config --global user.name "developer"
(2)git config --global user.email "developer@mail.com"
(3)ssh-keygen -t rsa -C "developer@mail.com"
会在/c/Users/Administrator/.ssh/目录中生成两个文件
	a.密钥:id_rsa
    b.公钥:id_rsa.pub
将公钥的内容拷贝到Git服务器上