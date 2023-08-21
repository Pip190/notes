要在Linux上安装Redis，可以按照以下步骤进行操作：

1. 打开终端，使用以下命令下载Redis的压缩包：

```
wget http:``//download.redis.io/releases/redis-x.x.x.tar.gz
```

注意将 "x.x.x" 替换为你想要下载的Redis版本号。

2. 解压下载的压缩包：

```
tar xzf redis-x.x.x.tar.gz
```

进入解压后的目录：

```
cd redis-x.x.x
```

3. 编译和安装Redis：

```
make``make install　　
```

4. 安装完成后，进入Redis安装目录：

```
cd /usr/local/bin　　
```

5. 启动Redis服务器：

```
./redis-server
```

或者在后台运行：

```
./redis-server --daemonize yes　　
```

Redis默认监听端口为6379。如果你想修改端口，可以编辑配置文件`redis.conf`进行相应的配置。

6. 检查Redis是否成功运行，可以使用以下命令连接到Redis服务器：

```
./redis-cli
```

　

这将打开Redis命令行界面。你可以输入Redis命令进行操作，例如 `ping` 测试连接是否正常，`set key value` 设置键值对等。

以上是基本的Redis安装过程。根据你的需求，你还可以进行其他配置和优化，例如设置密码、修改配置文件等。请参考Redis官方文档或其他相关资源获取更多详细信息。



./src/redis-server config/redis.conf