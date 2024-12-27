# 管理员权限命令窗口集

**以管理员的方式**打开cmd命令窗口（直接打开cmd运行，可能会报错），并且进入到**mysql安装目录的bin目录下**。

然后输入命令

```bash
mysqld install
```

140文件缺失下载修复链接：https://learn.microsoft.com/zh-cn/cpp/windows/latest-supported-vc-redist?view=msvc-170

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

### 设置开机自启动命令式 

要通过命令行方式设置 MySQL 在 Windows 11 上的开机自启动，你可以按照以下步骤进行操作：

##### 1、打开[命令提示符](https://so.csdn.net/so/search?q=命令提示符&spm=1001.2101.3001.7020)或 PowerShell：

- 使用快捷键 Win + R 打开运行框。
- 在运行框中输入 "cmd" 或 "powershell" 并按 Enter 键，打开相应的命令行工具。

##### 2、使用[管理员权限](https://so.csdn.net/so/search?q=管理员权限&spm=1001.2101.3001.7020)运行命令行工具：

- 在开始菜单中找到命令提示符或 PowerShell，并右键点击。
- 选择 "以管理员身份运行"，以获取足够的权限执行命令。

##### 3、设置 MySQL 服务为开机自启动：

- 在命令行中输入以下命令并按 Enter 键：

> ```bash
> sc config mysql start= auto 
> ```

##### 4、启动 MySQL 服务：

- 在命令行中输入以下命令并按 Enter 键：

> ```bash
> net start mysql
> ```

##### 5、 验证设置是否生效：

- 在命令行中输入以下命令并按 Enter 键，检查 MySQL 服务的状态： 

> ```bash
> sc query mysql 
> ```

如果服务状态显示为 "RUNNING"，则表示 MySQL 服务已经成功启动。