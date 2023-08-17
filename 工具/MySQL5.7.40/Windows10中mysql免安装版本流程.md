# 管理员权限命令窗口集

**以管理员的方式**打开cmd命令窗口（直接打开cmd运行，可能会报错），并且进入到**mysql安装目录的bin目录下**。

然后输入命令

```bash
mysqld install
```

   显示成功

再输入：

```bash
mysqld --initialize 
```

 此时应该没有任何提示（双杠，否则报错）

==可查看临时密码的==

```bash
mysqld --initialize  --console
```

再输入：

```bash
net start mysql
```

 显示 

# 修改密码

第一次登陆MYSQL时，会提示要求输入初始密码，这是考虑安全因素。初始密码在上图data文件夹下的xxx.err文件中，可以用记事本打开，用ctrl+f 查找功能找到如下一行记录：

> 2022-04-08T04:01:52.830995Z 1 [Note] A temporary password is generated for root@localhost: O;ew9aMNV:** 

 O;ew9aMNV:**即为初始密码，注意不要少字符

执行命令：mysql -uroot -p，输入初始密码

执行sql，修改root用户密码为123456

```mysql
ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
```