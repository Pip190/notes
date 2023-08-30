# curl 的用法指南

作者： [阮一峰](https://www.ruanyifeng.com/)

日期： [2019年9月 5日](https://www.ruanyifeng.com/blog/2019/09/)

## 简介

curl 是常用的命令行工具，用来请求 Web 服务器。它的名字就是客户端（client）的 URL 工具的意思。

它的功能非常强大，命令行参数多达几十种。如果熟练的话，完全可以取代 Postman 这一类的图形界面工具。

![img](https://www.wangbase.com/blogimg/asset/201909/bg2019090501.jpg)

本文介绍它的主要命令行参数，作为日常的参考，方便查阅。内容主要翻译自[《curl cookbook》](https://catonmat.net/cookbooks/curl)。为了节约篇幅，下面的例子不包括运行时的输出，初学者可以先看我以前写的[《curl 初学者教程》](https://www.ruanyifeng.com/blog/2011/09/curl.html)。

不带有任何参数时，curl 就是发出 GET 请求。

> ```bash
> $ curl https://www.example.com
> ```

上面命令向`www.example.com`发出 GET 请求，服务器返回的内容会在命令行输出。

## **-A**

`-A`参数指定客户端的用户代理标头，即`User-Agent`。curl 的默认用户代理字符串是`curl/[version]`。

> ```bash
> $ curl -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' https://google.com
> ```

上面命令将`User-Agent`改成 Chrome 浏览器。

> ```bash
> $ curl -A '' https://google.com
> ```

上面命令会移除`User-Agent`标头。

也可以通过`-H`参数直接指定标头，更改`User-Agent`。

> ```bash
> $ curl -H 'User-Agent: php/1.0' https://google.com
> ```

## **-b**

`-b`参数用来向服务器发送 Cookie。

> ```bash
> $ curl -b 'foo=bar' https://google.com
> ```

上面命令会生成一个标头`Cookie: foo=bar`，向服务器发送一个名为`foo`、值为`bar`的 Cookie。

> ```bash
> $ curl -b 'foo1=bar;foo2=bar2' https://google.com
> ```

上面命令发送两个 Cookie。

> ```bash
> $ curl -b cookies.txt https://www.google.com
> ```

上面命令读取本地文件`cookies.txt`，里面是服务器设置的 Cookie（参见`-c`参数），将其发送到服务器。

## **-c**

`-c`参数将服务器设置的 Cookie 写入一个文件。

> ```bash
> $ curl -c cookies.txt https://www.google.com
> ```

上面命令将服务器的 HTTP 回应所设置 Cookie 写入文本文件`cookies.txt`。

## **-d**

`-d`参数用于发送 POST 请求的数据体。

> ```bash
> $ curl -d'login=emma＆password=123'-X POST https://google.com/login
> # 或者
> $ curl -d 'login=emma' -d 'password=123' -X POST  https://google.com/login
> ```

使用`-d`参数以后，HTTP 请求会自动加上标头`Content-Type : application/x-www-form-urlencoded`。并且会自动将请求转为 POST 方法，因此可以省略`-X POST`。

`-d`参数可以读取本地文本文件的数据，向服务器发送。

> ```bash
> $ curl -d '@data.txt' https://google.com/login
> ```

上面命令读取`data.txt`文件的内容，作为数据体向服务器发送。

## **--data-urlencode**

`--data-urlencode`参数等同于`-d`，发送 POST 请求的数据体，区别在于会自动将发送的数据进行 URL 编码。

> ```bash
> $ curl --data-urlencode 'comment=hello world' https://google.com/login
> ```

上面代码中，发送的数据`hello world`之间有一个空格，需要进行 URL 编码。

## **-e**

`-e`参数用来设置 HTTP 的标头`Referer`，表示请求的来源。

> ```bash
> curl -e 'https://google.com?q=example' https://www.example.com
> ```

上面命令将`Referer`标头设为`https://google.com?q=example`。

`-H`参数可以通过直接添加标头`Referer`，达到同样效果。

> ```bash
> curl -H 'Referer: https://google.com?q=example' https://www.example.com
> ```

## **-F**

`-F`参数用来向服务器上传二进制文件。

> ```bash
> $ curl -F 'file=@photo.png' https://google.com/profile
> ```

上面命令会给 HTTP 请求加上标头`Content-Type: multipart/form-data`，然后将文件`photo.png`作为`file`字段上传。

`-F`参数可以指定 MIME 类型。

> ```bash
> $ curl -F 'file=@photo.png;type=image/png' https://google.com/profile
> ```

上面命令指定 MIME 类型为`image/png`，否则 curl 会把 MIME 类型设为`application/octet-stream`。

`-F`参数也可以指定文件名。

> ```bash
> $ curl -F 'file=@photo.png;filename=me.png' https://google.com/profile
> ```

上面命令中，原始文件名为`photo.png`，但是服务器接收到的文件名为`me.png`。

## **-G**

`-G`参数用来构造 URL 的查询字符串。

> ```bash
> $ curl -G -d 'q=kitties' -d 'count=20' https://google.com/search
> ```

上面命令会发出一个 GET 请求，实际请求的 URL 为`https://google.com/search?q=kitties&count=20`。如果省略`--G`，会发出一个 POST 请求。

如果数据需要 URL 编码，可以结合`--data--urlencode`参数。

> ```bash
> $ curl -G --data-urlencode 'comment=hello world' https://www.example.com
> ```

## **-H**

`-H`参数添加 HTTP 请求的标头。

> ```bash
> $ curl -H 'Accept-Language: en-US' https://google.com
> ```

上面命令添加 HTTP 标头`Accept-Language: en-US`。

> ```bash
> $ curl -H 'Accept-Language: en-US' -H 'Secret-Message: xyzzy' https://google.com
> ```

上面命令添加两个 HTTP 标头。

> ```bash
> $ curl -d '{"login": "emma", "pass": "123"}' -H 'Content-Type: application/json' https://google.com/login
> ```

上面命令添加 HTTP 请求的标头是`Content-Type: application/json`，然后用`-d`参数发送 JSON 数据。

## **-i**

`-i`参数打印出服务器回应的 HTTP 标头。

> ```bash
> $ curl -i https://www.example.com
> ```

上面命令收到服务器回应后，先输出服务器回应的标头，然后空一行，再输出网页的源码。

## **-I**

`-I`参数向服务器发出 HEAD 请求，然会将服务器返回的 HTTP 标头打印出来。

> ```bash
> $ curl -I https://www.example.com
> ```

上面命令输出服务器对 HEAD 请求的回应。

`--head`参数等同于`-I`。

> ```bash
> $ curl --head https://www.example.com
> ```

## **-k**

`-k`参数指定跳过 SSL 检测。

> ```bash
> $ curl -k https://www.example.com
> ```

上面命令不会检查服务器的 SSL 证书是否正确。

## **-L**

`-L`参数会让 HTTP 请求跟随服务器的重定向。curl 默认不跟随重定向。

> ```bash
> $ curl -L -d 'tweet=hi' https://api.twitter.com/tweet
> ```

## **--limit-rate**

`--limit-rate`用来限制 HTTP 请求和回应的带宽，模拟慢网速的环境。

> ```bash
> $ curl --limit-rate 200k https://google.com
> ```

上面命令将带宽限制在每秒 200K 字节。

## **-o**

`-o`参数将服务器的回应保存成文件，等同于`wget`命令。

> ```bash
> $ curl -o example.html https://www.example.com
> ```

上面命令将`www.example.com`保存成`example.html`。

## **-O**

`-O`参数将服务器回应保存成文件，并将 URL 的最后部分当作文件名。

> ```bash
> $ curl -O https://www.example.com/foo/bar.html
> ```

上面命令将服务器回应保存成文件，文件名为`bar.html`。

## **-s**

`-s`参数将不输出错误和进度信息。

> ```bash
> $ curl -s https://www.example.com
> ```

上面命令一旦发生错误，不会显示错误信息。不发生错误的话，会正常显示运行结果。

如果想让 curl 不产生任何输出，可以使用下面的命令。

> ```bash
> $ curl -s -o /dev/null https://google.com
> ```

## **-S**

`-S`参数指定只输出错误信息，通常与`-s`一起使用。

> ```bash
> $ curl -s -o /dev/null https://google.com
> ```

上面命令没有任何输出，除非发生错误。

## **-u**

`-u`参数用来设置服务器认证的用户名和密码。

> ```bash
> $ curl -u 'bob:12345' https://google.com/login
> ```

上面命令设置用户名为`bob`，密码为`12345`，然后将其转为 HTTP 标头`Authorization: Basic Ym9iOjEyMzQ1`。

curl 能够识别 URL 里面的用户名和密码。

> ```bash
> $ curl https://bob:12345@google.com/login
> ```

上面命令能够识别 URL 里面的用户名和密码，将其转为上个例子里面的 HTTP 标头。

> ```bash
> $ curl -u 'bob' https://google.com/login
> ```

上面命令只设置了用户名，执行后，curl 会提示用户输入密码。

## **-v**

`-v`参数输出通信的整个过程，用于调试。

> ```bash
> $ curl -v https://www.example.com
> ```

`--trace`参数也可以用于调试，还会输出原始的二进制数据。

> ```bash
> $ curl --trace - https://www.example.com
> ```

## **-x**

`-x`参数指定 HTTP 请求的代理。

> ```bash
> $ curl -x socks5://james:cats@myproxy.com:8080 https://www.example.com
> ```

上面命令指定 HTTP 请求通过`myproxy.com:8080`的 socks5 代理发出。

如果没有指定代理协议，默认为 HTTP。

> ```bash
> $ curl -x james:cats@myproxy.com:8080 https://www.example.com
> ```

上面命令中，请求的代理使用 HTTP 协议。

## **-X**

`-X`参数指定 HTTP 请求的方法。

> ```bash
> $ curl -X POST https://www.example.com
> ```

上面命令对`https://www.example.com`发出 POST 请求。











# curl网站开发指南

作者： [阮一峰](https://www.ruanyifeng.com/)

日期： [2011年9月 4日](https://www.ruanyifeng.com/blog/2011/09/)

我一向以为，[curl](http://curl.haxx.se/)只是一个编程用的函数库。

最近才发现，这个命令本身，就是一个无比有用的网站开发工具，请看我整理的它的用法。

===================================

**curl网站开发指南**

阮一峰 整理

![img](https://www.ruanyifeng.com/blogimg/asset/201109/bg2011090401.png)

[curl](http://curl.haxx.se/)是一种命令行工具，作用是发出网络请求，然后得到和提取数据，显示在"标准输出"（stdout）上面。

它支持多种协议，下面举例讲解如何将它用于网站开发。

**一、查看网页源码**

直接在curl命令后加上网址，就可以看到网页源码。我们以网址www.sina.com为例（选择该网址，主要因为它的网页代码较短）：

> 　　$ curl www.sina.com

> 　　<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">　　<html><head>　　<title>301 Moved Permanently</title>　　</head><body>　　<h1>Moved Permanently</h1>　　<p>The document has moved <a href="http://www.sina.com.cn/">here</a>.</p>　　</body></html>

如果要把这个网页保存下来，可以使用`-o`参数，这就相当于使用wget命令了。

> 　　$ curl -o [文件名] www.sina.com

**二、自动跳转**

有的网址是自动跳转的。使用`-L`参数，curl就会跳转到新的网址。

> 　　$ curl -L www.sina.com

键入上面的命令，结果就自动跳转为www.sina.com.cn。

**三、显示头信息**

`-i`参数可以显示http response的头信息，连同网页代码一起。

> 　　$ curl -i www.sina.com

> 　　HTTP/1.0 301 Moved Permanently
> 　　Date: Sat, 03 Sep 2011 23:44:10 GMT
> 　　Server: Apache/2.0.54 (Unix)
> 　　Location: http://www.sina.com.cn/
> 　　Cache-Control: max-age=3600
> 　　Expires: Sun, 04 Sep 2011 00:44:10 GMT
> 　　Vary: Accept-Encoding
> 　　Content-Length: 231
> 　　Content-Type: text/html; charset=iso-8859-1
> 　　Age: 3239
> 　　X-Cache: HIT from sh201-9.sina.com.cn
> 　　Connection: close
>
> 　　<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">　　<html><head>　　<title>301 Moved Permanently</title>　　</head><body>　　<h1>Moved Permanently</h1>　　<p>The document has moved <a href="http://www.sina.com.cn/">here</a>.</p>　　</body></html>

`-I`参数则是只显示http response的头信息。

**四、显示通信过程**

`-v`参数可以显示一次http通信的整个过程，包括端口连接和http request头信息。

> 　　$ curl -v www.sina.com

> 　　* About to connect() to www.sina.com port 80 (#0)　　* Trying 61.172.201.195... connected　　* Connected to www.sina.com (61.172.201.195) port 80 (#0)　　> GET / HTTP/1.1　　> User-Agent: curl/7.21.3 (i686-pc-linux-gnu) libcurl/7.21.3 OpenSSL/0.9.8o zlib/1.2.3.4 libidn/1.18　　> Host: www.sina.com　　> Accept: */*　　>　　* HTTP 1.0, assume close after body　　< HTTP/1.0 301 Moved Permanently　　< Date: Sun, 04 Sep 2011 00:42:39 GMT　　< Server: Apache/2.0.54 (Unix)　　< Location: http://www.sina.com.cn/　　< Cache-Control: max-age=3600　　< Expires: Sun, 04 Sep 2011 01:42:39 GMT　　< Vary: Accept-Encoding　　< Content-Length: 231　　< Content-Type: text/html; charset=iso-8859-1　　< X-Cache: MISS from sh201-19.sina.com.cn　　< Connection: close　　<　　<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">　　<html><head>　　<title>301 Moved Permanently</title>　　</head><body>　　<h1>Moved Permanently</h1>　　<p>The document has moved <a href="http://www.sina.com.cn/">here</a>.</p>　　</body></html>　　* Closing connection #0

如果你觉得上面的信息还不够，那么下面的命令可以查看更详细的通信过程。

> 　　$ curl --trace output.txt www.sina.com

或者

> 　　$ curl --trace-ascii output.txt www.sina.com

运行后，请打开output.txt文件查看。

**五、发送表单信息**

发送表单信息有GET和POST两种方法。GET方法相对简单，只要把数据附在网址后面就行。

> 　　$ curl example.com/form.cgi?data=xxx

POST方法必须把数据和网址分开，curl就要用到--data参数。

> 　　$ curl -X POST --data "data=xxx" example.com/form.cgi

如果你的数据没有经过表单编码，还可以让curl为你编码，参数是`--data-urlencode`。

> 　　$ curl -X POST--data-urlencode "date=April 1" example.com/form.cgi

**六、HTTP动词**

curl默认的HTTP动词是GET，使用`-X`参数可以支持其他动词。

> 　　$ curl -X POST www.example.com

> 　　$ curl -X DELETE www.example.com

**七、文件上传**

假定文件上传的表单是下面这样：

> 　　<form method="POST" enctype='multipart/form-data' action="upload.cgi">
> 　　　　<input type=file name=upload>
> 　　　　<input type=submit name=press value="OK">
> 　　</form>

你可以用curl这样上传文件：

> 　　$ curl --form upload=@localfilename --form press=OK [URL]

**八、Referer字段**

有时你需要在http request头信息中，提供一个referer字段，表示你是从哪里跳转过来的。

> 　　$ curl --referer http://www.example.com http://www.example.com

**九、User Agent字段**

这个字段是用来表示客户端的设备信息。服务器有时会根据这个字段，针对不同设备，返回不同格式的网页，比如手机版和桌面版。

iPhone4的User Agent是

> 　　Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7

curl可以这样模拟：

> 　　$ curl --user-agent "[User Agent]" [URL]

**十、cookie**

使用`--cookie`参数，可以让curl发送cookie。

> 　　$ curl --cookie "name=xxx" www.example.com

至于具体的cookie的值，可以从http response头信息的`Set-Cookie`字段中得到。

`-c cookie-file`可以保存服务器返回的cookie到文件，`-b cookie-file`可以使用这个文件作为cookie信息，进行后续的请求。

> 　　$ curl -c cookies http://example.com
> 　　$ curl -b cookies http://example.com

**十一、增加头信息**

有时需要在http request之中，自行增加一个头信息。`--header`参数就可以起到这个作用。

> 　　$ curl --header "Content-Type:application/json" http://example.com

**十二、HTTP认证**

有些网域需要HTTP认证，这时curl需要用到`--user`参数。

> 　　$ curl --user name:password example.com

**【参考资料】**

　　* [Using cURL to automate HTTP jobs](http://curl.haxx.se/docs/httpscripting.html)

　　* [教你学用CURL](http://bbs.et8.net/bbs/showthread.php?t=568472)

　　* [9 uses for cURL worth knowing](https://httpkit.com/resources/HTTP-from-the-Command-Line/)

（完）

### 文档信息

- 版权声明：自由转载-非商用-非衍生-保持署名（[创意共享3.0许可证](http://creativecommons.org/licenses/by-nc-nd/3.0/deed.zh)）
- 发表日期： 2011年9月 4日



# Linux Curl命令详解教程

curl是用于在本地计算机与远程服务器之间传输数据的命令行工具

- [![myfreax](data:image/webp;base64,UklGRmoEAABXRUJQVlA4WAoAAAAQAAAAHwAAHwAAQUxQSNsBAAABkHZb25nH6p/athl0bNu2bdu2bdu2bdueqe2+TnJ9eJI0ExETQFSW2PhXMH6YHki0bvJeAgDLZV6jij+geM1fE7t9UBZGa8L8U4Hrzlo00Kn5Gfa/4st5u1gXi/2npuj1m9tbu3gWw+GUGlnTXnd1VtuKhdzq6kjLNDlLkUJ2FRVWIU17dZqVTmVM3KTw0ldFm3cG0fz68Lc7It75dDTKPYpQCn0H+kyZtUBhC69bcjjorNBAJ/O4zh8At3zLPxQAQcCXYIWmBpm35wFAXGwbuBMFM/rM62SjUDFTJt9AIacNWY3MCkTtVBGABOX3A/8BS6xVWC0/t/ix+FynJBVJQFp9FcTHxXo34gUl+VflVBBSJw0aXnRXwT6ClgX1lex2Q1NxgFLId23MnZWCv2rzI1bJZgMl5Esy5myJKppgK2cfWXdCCgBTspwhXqR+b5zbv4aPDXGqfCVfJ0LW+PgXVIuvOoQ6h/IDtyxJgCVeB1wq1+3LVwHmeB0swu3Tv4ZyfKhLOMuybY8uqDc7J7d3TFzt5t9M2+uNPrF0RdUS9Uqy4S7Exi0wIppjGL7fiBIcx7DdxpZhGJ5lmNjwADcbQts6ufsGhYVHxLIsx8VGx8ZEhQX5ejjZEkIIAFZQOCBoAgAAUA4AnQEqIAAgAD6ROJZHpaMiITAIALASCWwAwRVBOo/o1MBwAOYB/ZrAA3inyZqWk9Jx+v8B4gbV3eCOEfy3/Jd4FAq8wNG96Df+L5PtQb9U/9L+aned9FX9gFt39jHS/ayon8wEnc1E+6Ehu+XloXmMQZCzaI1+FZgAAP7/OlArOJg+m8aTkofO99+tBmzz/5RUt09fHtgL+FwDYhLG1U4Ne2n8l8qpof1itu7GQtHysDhk/Qe2uK+XzFk8CSpdJ4Y/4/qqLO13gPCm7zONXKsC5zTd2qOfuuJCvbXf9V6Ge/MMoOi1aubP/zRL2vhCbRjG6l88794/ofph/LNew11j6MHyK6dHD9551oRwdSeF5fQsSGevD7/0jZhfe4ttlU0G5JHgux1q8PCvonch2p+H9TWcTxurlM0LEHh03TeWI+h0qVVWqEvqmtX/+MWur/8WYMRrPvTH46PEaTyOYZ7+mLlmQzPyXe0s3bVt+8FOj9fh/J3X/31qcTRr3Tf1g+udh8UH/p/x9EOIWnn9HVPlMzsJG0Sq/u+g/mt29v5Z4P0Choo61qByRp7qCYjx0yerQkEfOPGNhnQEoWOiQCYkCDlrLzTpVrGZ1fl8ArxhQrjOKsOBWM2InypRHm3mXEDE6bMd739Qt4dfhb7I4YaqsJFIajg8fSlH4yw2vqfM3OrrM0qvZnK0V1qE+WGGZ/aOK5BlgJIXX8LoSs+amKTx9PIJB595ubhsSIyUocIx3v1UJrsgQEGm2XqRGs4WInQtXeo8mO4w5eMVrazXHbmeN+am4tj2W2M/ux60h0/2UZCVkFgAAA==)](https://www.myfreax.com/curl-command-examples/)

Updated At 7 Jan 2023 12 min read

By [myfreax](https://www.myfreax.com/author/myfreax/)

![Linux Curl命令详解教程](https://www.myfreax.com/content/images/size/w816/2019/10/curl-command-examples.webp)Linux Curl命令详解教程

Curl 是用于在本地计算机与远程服务器之间传输数据的命令行工具。使用curl时您可以使用HTTP，HTTPS，[SCP ](https://www.myfreax.com/how-to-use-scp-command-to-securely-transfer-files/)，[ SFTP](https://www.myfreax.com/how-to-use-linux-sftp-command-to-transfer-files/)和[FTP](https://www.myfreax.com/how-to-use-linux-ftp-command-to-transfer-files/)等协议下载或上传数据。

Curl 提供了许多选项，使您可以恢复上传/下载，限制带宽，代理支持，用户身份验证等。

在本教程中，我们将说明如何在Linux使用Curl命令下载文件及其选项的详解。如果您未指定使用的协议，Curl默认使用HTTP协议。

Curl 命令已预安装在大多数Linux发行版。要检查你的Linux发行版是否已安装Curl，请按快捷键`CTRL+ALT+T`打开终端，键入`curl`，然后按Enter。

## 安装 Curl

如果已安装curl，则系统将打印`curl: try 'curl --help' or 'curl --manual' for more information`。

否则终端打印消息curl command not found `curl`命令未找到。如果你尚未安装Curl，则可以使用发行版的软件包管理器安装`curl`。

如果你的计算机运行的是基于Debian的Linux发行版，例如Ubuntu，Linux Mint等。请运行`sudo apt install curl`命令安装curl。

如果你的计算机运行的是基于Redhat的Linux发行版，例如CentOS，Fedora等。请运行`sudo yum install curl`命令安装Curl。

```shell
sudo yum install curl
sudo apt install curl
```

## Curl 命令与选项

`curl`命令的语法形式是`curl [options] [URL...]`，`options` Curl的[选项](https://curl.haxx.se/docs/manpage.html)，可选参数。`URL`表示远程服务器的地址。

在不指定任何选项运行Curl命令时，curl命令下载指定的URL资源并重定向到[标准输出](https://www.myfreax.com/stdout-stdin-and-redirection/)。

例如命令`curl https://www.google.com/`下载Google首页并在终端打印Google首页的源码。

## 发送 JSON Body

在发送JSON Body到服务器时，你需要设置header的`Content-Type`为`application/json`，指示Curl命令以JSON的格式发送Body的数据。

除了设置header的`Content-Type`之外，还需要使用Curl命令的`-d`/`--data`指定要发送的JSON字符串，注意JSON需要使用单引号转义。

例如命令`curl -X POST -H "Content-Type: application/json"  -d 'JSON String' URL`发送JSON字符串`{"email":"web@myfreax.com"}`到服务器。

```shell
curl -X POST -H "Content-Type: application/json"  -d '{"email":"web@myfreax.com","website":"myfreax.com"}' http://127.0.0.1:3000/site
```

## POST JSON并上传文件

在发送JSON数据并上传文件到服务器时，需要设置 header 的 Content-Type 为 multipart/mixed，指示 Curl 命令以混合的格式发送数据。

除了设置 header 的 Content-Type 之外，发送 JSON 格式数据是以 Curl 命令的 -F 选项指定要发送的 JSON 字符串，注意 JSON 需要使用单引号转义。

因此命令最终形式是 curl -X POST -H "Content-Type: multipart/mixed" -F blob=@文件路径 -F 'metadata=JSON 字符串;type=application/json' 。

```shell
curl -i -X POST -H "Content-Type: multipart/mixed" -F "blob=@/Users/username/Documents/bio.jpg" -F "metadata={\"edipi\":123456789};type=application/json" http://localhost:8080/api/v1/user/
```

## 仅上传文件

要使用 Curl 命令上传文件，只需要仅使用 Curl 命令的 -F 选项以键值对的形式name=content 指定 multipart MIME 数据。

但在使用 -F 选项指定文件时，需要在文件路径之前添加`@`符号。文件可以是任何类型文件包括图像，文档等。

例如参数 `-F 'image=@/home/user/Pictures/wallpaper.jpg'` 指定Key是 image ，文件是 /home/user/Pictures/wallpaper.jpg。

```shell
curl -X POST -F 'image=@/home/user/Pictures/wallpaper.jpg' http://example.com/upload
```

## HTML 表单 multipart/form-data

如果你需要使用Curl 命令模拟表单的请求，可以使用Curl 命令的`-F`选项创建POST请求并且使用`multipart/form-data`进行编码。

`-F`选项允许你指定multipart的数据。Curl 命令自动将内容类型设置为`multipart/form-data`发送数据。

也可以使用`-F`选项指定多个数据，数据的形式是以`field=value`键值对的方式指定。

例如以下Curl 命令将模拟HTML表单发送两个字段的数据，字段website 值是myfreax.com，字段email 值是web@myfreax.com。最后是指定请求的URL。

```shell
curl -X POST -F 'website=myfreax.com' -F 'email=web@myfreax.com' https://wwww.myfreax.com/contact.php
```

## HTML 表单 x-www-form-urlencoded

发出POST请求的另一种方法是使用Curl 命令的`-d`选项。在使用`-d`选项时Curl命令使用`application/x-www-form-urlencoded`对数据进行编码。

也会指定内容类型为`application/x-www-form-urlencoded`。使用这种方式发送的请求，就是使用查询字符串发送数据。

如果你需要发送大量的数据你不必多次使用`-d`选项，可以使用`&`符号合并数据，比如website=myfreax&email=myfreax@example.com。

```shell
curl -X POST -d 'name=myfreax' -d 'email=myfreax@example.com' https://example.com/contact.php

#上面和下面的命令是等价的
curl -X POST -d 'name=myfreax&email=myfreax@example.com' https://example.com/contact.php
```

## 发送 Header

如果要发送Header到服务器，可以使用Curl命令的`-H`/`--header`选项，它允许指定Header的键Key和值Value。

Header的Key和Value之间必须使用空格，并且header使用双引号包裹，避免shell的解释。

可以同时使用多个`-H`/`--header`选项来指定多个Header的Key和Value。你可以看到下面的命令将会发送多个Header。

第一个header设置内容类型`Content-Type: application/json`，第二个header发送`website: myfreax.com`。

```shell
curl -X POST -H "Content-Type: application/json" -H "website: myfreax.com"  -d '{"email":"web@myfreax.com","website":"myfreax.com"}' http://127.0.0.1:3000/site
```

## 下载文件

默认情况下`curl`命令下载URL指定资源并重定向[标准输出](https://www.myfreax.com/stdout-stdin-and-redirection/)。如果要保存下载到文件，可以使用`curl`命令的`-o`或`-O`选项。

使用小写`-o`选项时，你可以指定保存文件的名称，也可以指定绝对路径，Curl命令将会把文件下载到你指定绝对路径。

Curl命令的大写`-O`选项将使用其原始文件名保存到文件在当前目录，也就是运行`curl`命令所在的目录。

例如命令`curl -O https://cdn.jsdelivr.net/npm/vue/dist/vue.js`下载vue.js文件到当前的目录中。

命令`curl -o /home/myfreax/vue3.js https://cdn.jsdelivr.net/dist/vue.js`下载文件vue.js保存到文件`/home/myfreax/vue3.js`。

下载完成后，可以运行[ls命令](https://www.myfreax.com/how-to-list-files-in-linux-using-the-ls-command/)列出curl下载的文件。`ls vue*`表示列出名称包含vue字符串的文件。

```bash
curl -o /home/myfreax/work/vue.js https://cdn.jsdelivr.net/npm/vue/dist/vue.js

curl -O https://cdn.jsdelivr.net/npm/vue/dist/vue.js

ls vue* #查看刚下载文件
```

## 下载多个文件

要一次下载多个文件，请使用多个`-O`选项或者小写的`-o`选项，后跟要下载文件的URL。

与使用`curl`命令下载单个文件一样。当使用小写的`-o`选项时你需要指定的下载目录路径。使用大写`-O`选项会保存当前目录下。

还可以混合使用小写的`-o`选项和大写`-O`选项。下面的`curl`命令在使用`-O`选项时下载vue.js文件到当前的目录，以名称`vue.js`保存文件。

小写`-o`选项下载vue.js文件myfreax用户的家目录下的wrok目录，并将文件保存为`vue.js`。

```shell
curl -o /home/myfreax/work/vue.js https://cdn.jsdelivr.net/npm/vue/dist/vue.js \
-O https://cdn.jsdelivr.net/npm/vue/dist/vue.js

ls /home/myfreax/work/vue.js && ls vue.js #查看刚下载文件
```

## 断点续传/恢复下载

如果您在下载大文件期间断开连接。无需重新开始下载，可以使用`curl`命令的`-C -`选项恢复上一次的下载。

也可以在第一次下载文件时直接指定`-C -`选项，当下载大文件断开连接时，直接使用之前的命令即可恢复下载。

但有一点值得注意点是，Curl命令的断点续传/恢复下载需要服务器端支持断点续传，否则Curl会重新开始下载文件。

```bash
curl -C - -O https://releases.ubuntu.com/22.04/ubuntu-22.04-desktop-amd64.iso
```

## 查看 HTTP 响应头 Header

HTTP 响应头是使用冒号分隔的键/值对，其中包含服务器类型，通常是Nginx/Apache，内容类型和 HTTP 状态码等信息。

Curl 命令的 `-I` 选项允许你查看指定 URL 资源的 HTTP 响应头，也包括在 Nginx 或者 Apache 设置的自定义响应头。

例如命令 curl -I https://www.myfreax.com/ 打印URL `https://www.ubuntu.com/`响应头。

```bash
curl -I --http2 https://www.ubuntu.com/
```

## 测试 HTTP/2 的支持

要检查指定的 URL 是否支持 HTTP/2 协议，请组合使用 Curl 命令的 `-I` 和 `--http2`选项查看 HTTP 响应头，然后使用 [grep 命令](https://www.myfreax.com/how-to-use-grep-command-to-search-files-in-linux/)搜索[标准输出](https://www.myfreax.com/stdout-stdin-and-redirection/)。

如果你使用的 Curl 版本 7.47.0 或更高版本，则不需要使用 `--http2` 选项。默认情况下，Curl 默认使用 HTTP/2 协议进行连接。

Curl 命令的 `-s` 选项以静默方式运行 Curl 并隐藏进度和错误消息。如果远程服务器支持 HTTP/2 协议，终端打印消息 `HTTP/2.0 200`，否则是 `HTTP/1.1 200`。

```shell
curl -I --http2 -s https://www.myfreax.com/ | grep HTTP/2
HTTP/2 200
```

## 301 HTTP 重定向

如果尝试在没有 `www` 的情况下抓取 google.com 主页，你会注意到 Google 返回是301页面的内容，运行命令 `curl google.com`。

从 301 重定向的页面内容中可以看到，`google.com` 被重定向到 www 版本。并且在默认情况下 Curl 命令不遵循HTTP Location header。

因此你不会获得 Google 主页的源码。要跟随 301 重定向请使用 Curl 命令的`-L`/`--location`选项，Curl 命令直到服务器不返回状态码 301 才会终止。

```shell
curl -L google.com
```

## 指定用户代理 User-Agent

你应该遇到在使用不同浏览器时，有的浏览器可以下载，或者某个浏览器不能下载的情况。或者根据访问者的设备和浏览器，提供的不同页面内容。

这是因为服务器程序根据用户代理User-Agent 进行区分用户的设备类型，从而确定返回不同的内容或者阻止你的下载与访问。

为了避免服务器根据访问者的User-Agent 用户代理提供不同内容。请使用`curl`命令的`-A`选项模拟User-Agent 用户代理。

```bash
curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0" https://getfedora.org/
```

## 限制下载速度

Curl命令的`--limit-rate`选项允许您限制数据传输速度/速率。默认的速度的单位是字节。也可以使用`k`，`m`，`g`作为后缀，表示以不同的单位作为下载速度。

Curl命令将下载Go二进制文件并将下载速度限制为1MB，`-O`选项表示保存到文件在当前目录。

```bash
curl --limit-rate 1m -O https://dl.google.com/go/go1.10.3.linux-amd64.tar.gz
```

## 下载/上传 FTP 文件

Curl命令除了支持HTTP协议之外，还支持FTP协议文件下载和上传，以及列出FTP服务器的文件。

如果你需要使用`curl`命令访问受保护的FTP服务器，请使用Curl命令的`-u`选项并指定用户名和密码。

Curl命令的`-T`选项允许你将文件上传到FTP服务器，`-T`选项之后是您要上传的文件，也可以指定文件的绝对路径。

```shell
curl -u FTP_USERNAME:FTP_PASSWORD ftp://ftp.example.com/ #列出文件

curl -u FTP_USERNAME:FTP_PASSWORD ftp://ftp.example.com/file.tar.gz #下载文件

curl -T newfile.tar.gz -u FTP_USERNAME:FTP_PASSWORD ftp://ftp.example.com/ #上传文件
```

## 发送 Cookie

使用curl发出HTTP请求时，默认情况下，Curl命令不发送或存储任何Cookie信息。有时您可能需要指定Cookie发起HTTP请求才能访问服务器资源。

Curl命令的`-b`选项允许你将指定Cookie信息发送到服务器，请在`-b`选项后跟Cookie字符串或者包含Cookie的文件名称。

例如，你要下载Oracle Java JDK的[rpm文件](https://www.myfreax.com/how-to-install-rpm-packages-on-centos/)`jdk-10.0.2_linux-x64_bin.rpm`，您需要发送Cookie键值对`oraclelicense=a`。

```shell
curl -L -b "oraclelicense=a" -O http://download.oracle.com/otn-pub/java/jdk/10.0.2+13/19aef61b38124481863b1413dce1855f/jdk-10.0.2_linux-x64_bin.rpm
```

## 使用代理服务器

Curl命令支持不同类型的代理，包括HTTP，HTTPS和SOCKS。要通过指定代理服务传输数据，请使用Curl命令`-x`/`--proxy`选项，后跟代理服务器URL。

如果代理服务器需要身份验证，请使用Curl命令的`-U`/`--proxy-user`选项，后跟用冒号分隔的用户名和密码。

例如命令`curl -x 192.168.44.1:8888 URL`使用代理服务器`192.168.44.1:8888`。`curl -U 用户名:密码 -x URL`指定代理服务器用户名与密码。

```shell
curl -x 192.168.44.1:8888 http://linux.com/

curl -U mark:Passvv0rd -x 192.168.44.1:8888 http://linux.com/
```