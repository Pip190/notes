# MySQL模糊匹配查询like、regexp、in

　　MySQL提供标准的SQL模式匹配，以及一种基于像Unix实用程序，如：vi、grep和sed的扩展正则表达式模式匹配的格式

 

**一、SQL模式（% ，_）**

　　SQL的模式匹配允许你使用“_”匹配任何单个字符，而“%”匹配任意数目字符（包括零个字符）。在MySQL中，SQL的模式缺省是忽略大小写的。

　　注意：在你使用SQL模式时，你不能使用=或!=；而使用LIKE或NOT LIKE比较操作符。

　　语法：SELECT 字段 FROM 表 WHERE 某字段 Like 条件

　　其中关于条件，SQL提供了两种匹配模式：

　　1、百分号（%）：表示任意个或多个字符。可匹配任意类型和长度的字符。

　　示例1：

```
SELECT * FROM character WHERE name LIKE ‘%孙%'；``即匹配姓名为“孙行者”，“行者孙，“行者孙”等包含“孙”类型的数据
```

　　示例2：

```
SELECT * FROM character WHERE name LIke ``'%孙%'` `and name like ``'%行%'``;``即匹配姓名为“孙行者”，“行者孙，“行者孙”等包含“孙”和“行”的数据
```

　　示例3：

```
SELECT * FROM character WHERE name LIke '%孙%行%‘;``只能匹配姓名为“孙行者”等类似“...孙...行...”的数据
```

　　2、下划线（_）：表示任意单个字符。匹配单个任意字符，它常用来限制表达式的字符长度语句：（可以代表一个中文字符）

　　示例1：

```
SELECT * FROM character WHERE name LIKE ‘_三_'；``即匹配姓名为“..三..”类型的数据，前后均只有一个字符
```

　　示例2：

```
SELECT * FROM character WHERE name LIKE ‘_三'；``即匹配姓名类似“...三”类型的数据，前面有且只有一个字符
```

　　

**二、正则模式**

　　正则表达式作用是匹配文本，将一个模式（正则表达式）与一个文本穿进行比较。

　　MySQL用where子句对正则表达式提供了初步的支持，允许你指定用正则表达式过滤SELECT检索出的数据。

　　1、MySQL正则表达式仅仅使SQL语言的一个子集，可以匹配基本的字符、字符串。

```
select * from wp_posts where post_name REGEXP ``'hello'``; ``可以检索出列post_name中所有包含hello的行
```

　　2、.匹配除\n之外的任意单个字符

```
select * from wp_posts where post_name REGEXP ``'.og'``;<br>注：.是正则表达式中的一个特殊字符。它表示匹配一个字符，因此bog，cog，dog等等都能匹配。
```

　　注意：

　　关于大小写的区分：MySQL中正则表达式匹配（从版本3.23.4后）不区分大小写。

　　如果要区分大小写，应该使用BINARY关键字，例如：

```
where post_name REGEXP BINARY ``'Hello .000'
```

　　3、^匹配字符串开始位置，如查询所有姓王的人名

```
select name from 表名 where name REGEXP ``'^王'``;
```

　　4、$匹配字符串结束位置，如查询所有姓名末尾是“明”的人名

```
select name from 表名 where name REGEXP ``'明$'``;
```

　　5、进行OR匹配

　　为搜索两个串之一（或者这个串，或者为另外一个串），使用|。

　　|作为OR操作符，表示匹配其中之一。可以给出两个以上的OR条件。

```
select * from products where pro_id REGEXP ``'1000|2000'``;``这样就``1000``和``2000``都能匹配并返回，当然，使用多个|就可以匹配多个串
```

　　6、[ ]匹配任何单一字符，是另一种形式的OR语句，可缩写的OR语句

　　例如，匹配范围：[0123456789]可以匹配0到9，[1-4][4-9]也是合法的范围。

　　此外，范围不一定只是数值的，[a-z]匹配任意字母字符。

　　例如，查询出w/z/s开头的人的人名

```
SELECT prod_name FROM products WHERE prod_name REGEXP ``'^[wzs]'``;
```

　　7、[^....]匹配不包含在[ ]的字符，如查询出chenmin之外的人名

```
SELECT prod_name FROM products WHERE prod_name REGEXP ``'^[wzs]'``;
```

　　注：^的双重用途：在集合中（用[ ]定义），它用来否定该集合。否则，用来指串的开始

　　8、匹配特殊字符使用\\进行转义

　　\\为前导。即转义，正则表达式内具有特殊意义的所有字符都必须以这种方式转义。

```
（``1``）\\-  表示查找-``（``2``）\\.  表示查找.``（``3``）\\f  表示换页``（``4``）\\n 表示换行``（``5``）\\r  表示回车``（``6``）\\t  表示制表``（``7``）\\v  表示纵向制表
```

　　注：为了匹配\本身，需要使用\\\

　　9、匹配字符类

```
（``1``）[:alnum:]  任意字母和数字（同[a-zA-Z0-``9``]）``（``2``）[:alpha:]   任意字符（同[a-zA-A]）``（``3``）[:blank:]   空格和制表符（同[\\t]）``（``4``）[:digit:]    任意数字（同[``0``-``9``]）``（``5``）[:lower:]   任意小写字母（同[a-z]）``（``6``）[:upper:]  任意大写字母（同[A-Z]）``（``7``）[:space:]  包括空格在内的任意空白字符（同 [\\f\\n\\t\\r\\v]）``（``8``）[:cntrl:]    ASCII控制字符（ASCII ``0``到``31``和``127``）``（``9``）[:graph:]  与["print:]相同，但不包括空格``（``10``）[:print:]   任意可打印字符``（``11``）[:punct:] 既不在 [:alnum:] 又不在 [:cntrl:] 中的任意字符``（``12``）[:xdigit:] 任意十六进制数字（同 [a-fA-F0-``9``]）
```

 

　　10、匹配多个示例，关于重复元字符

```
元字符       说明``*            ``0``个或多个匹配``+           ``1``个或多个匹配（等于 {``1``, }）``?           ``0``个或``1``个匹配（等于 {``0``, ``1``}）``{n}          指定数目的匹配``{n, }         不少于指定数目的匹配``{n ,m}        匹配数目的范围（m不超过``255``）
```

　　例子：

```
select prod_name from products where prod_name REGEXP ``'[[:DIGIT:]]{4}'``;<br>如前所述，[:digit:]匹配任意数字，因而它为数字的一个几何。<br>[[:digit:]]{``4``}匹配连在一起的任意``4``位数字，当然，上面的例子也可以这样写REGEXP ``'[0-9][0-9][0-9][0-9]'
```

　　11、定位符

```
^     文本的开始``$    文本的末尾``[[:<:]] 词的开始``[[:>:]] 词的结尾
```

　　注：like匹配整个串，而REGEXP匹配子串。

 

**三、in查询**

　　叫in查询不是很合理，更合理的说法是：in其实和=类似，区别在于：=后面是一个值。in后面可以是多个值。

　　示例1：

```
select * from role where name in(``"唐三"``)；``即匹配姓名为“唐三”一行数据；
```

　　示例2：

```
select * from role where name in(``"唐三"``,``"唐三藏"``)；``即匹配姓名为“唐三”，“唐三藏”一行数据；
```

　　示例3：

```
select * from role where name in(``"唐三"``,``"%行者%"``)``只匹配姓名为“唐三”一行数据；即in查询不支持模糊查询，如示例``4
```

　　示例4：

```
select * from role where name in(``"%行者%"``)``无匹配结果
```

　　**68 22 99**

**四、like contact模糊查询**

　　CONCAT(str1,str2,…) 函数返回结果为连接参数产生的字符串。

```
select * from role where name like contact(``"%"``,``"三"``,``"%"``)；``即匹配姓名为“唐三”，“唐三藏”等类型的数据数据；
```

　　like contact模糊查询强大的地方在于可以对传进来的参数进行某查询，比如经前端提交上的数据，赋值给参数name，则可以select * from table where name like contact("%",${name},"%")





# 索引

```mysql
create TABLE `customer`(
	id INT(10) auto_increment,
	customer_no VARCHAR(20),
	customer_name VARCHAR(20),
	PRIMARY KEY(id),
	UNIQUE idx_customer_no(customer_no),
	KEY idx_customer_name(customer_name),
	KEY idx_customer_no_name(customer_no,customer_name)
)

DROP TABLE if EXISTS customer;
create TABLE `customer`(
	id INT(10),
	customer_no VARCHAR(20),
	customer_name VARCHAR(20)
)
# 创建主键索引
ALTER TABLE customer add PRIMARY KEY(id);
# 删除主键索引
ALTER TABLE customer DROP PRIMARY KEY;
# 创建唯一索引
ALTER TABLE customer add UNIQUE idx_customer_no(customer_no);
# 删除唯一索引
DROP INDEX idx_customer_no ON customer;
# 创建单值索引
alter table customer add index idx_customer_name(customer_name);
# 删除单值索引
drop index idx_customer_name on customer;
# 创建复合索引
alter table customer add index idx_customer_no_name（customer_no，customer_name）；
# 删除复合索引
drop index idx_customer_no_name on customer；
```

调用索引例子

```mysql
DROP TABLE IF EXISTS person;
CREATE TABLE person (
PID int(11) AUTO_INCREMENT COMMENT '编号',
PNAME varchar(50) COMMENT '姓名',
PSEX varchar(10) COMMENT '性别',
PAGE int(11) COMMENT '年龄',
SAL decimal(7, 2) COMMENT '工资',
PRIMARY KEY (PID)
);
-- 创建存储过程
create procedure insert_person(in max_num int(10))
begin
	declare i int default 0;
	set autocommit = 0;
	repeat
	set i = i +1;
	insert into person (PID,PNAME,PSEX,PAGE,SAL) values (i,concat('test',floor(rand()*10000000)),IF(RAND()>0.5,'男','女'),FLOOR((RAND()*100)+10),FLOOR ((RAND()*19000)+1000));
	until i = max_num
	end repeat;
commit;
end;
-- 调用存储过程
call insert_person(30000000);

select * from person where PNAME = "test7170209"; # 10.578s

alter table person add index idx_pname(PNAME); # 118.357s
DROP INDEX idx_pname ON person; # 0.025s
select * from person where PNAME = "test7170209"; # 0.185s
```

用和不用的比较

```mysql
-- 不使用索引,根据pName进行查询
select * from person where PNAME = "test1209325"; #10.813S
给PNAME建立索引
alter table person add index idx_pname(PNAME);
select * from person where PNAME = "test1209325"; # 0.032S
select * from person where PID = 2800000; #0.021
```

explain 分析查询语句

```mysql
-- 创建四张测试表
CREATE TABLE t1(
id INT(10) AUTO_INCREMENT,
content VARCHAR(100),
PRIMARY KEY (id)
);
CREATE TABLE t2(
id INT(10) AUTO_INCREMENT,
content VARCHAR(100),
PRIMARY KEY (id)
);
CREATE TABLE t3(
id INT(10) AUTO_INCREMENT,
content VARCHAR(100),
PRIMARY KEY (id)
);
CREATE TABLE t4(
id INT(10) AUTO_INCREMENT,
content VARCHAR(100),
PRIMARY KEY (id)
);
-- 每张表中添加一条数据
INSERT INTO t1(content) VALUES(CONCAT('t1_',FLOOR(1+RAND()*1000)));
INSERT INTO t2(content) VALUES(CONCAT('t2_',FLOOR(1+RAND()*1000)));
INSERT INTO t3(content) VALUES(CONCAT('t3_',FLOOR(1+RAND()*1000)));
INSERT INTO t4(content) VALUES(CONCAT('t4_',FLOOR(1+RAND()*1000)));

#id相同时,执行顺序是从上往下
explain select * from t1,t2,t3 where t1.id=t2.id and t2.id = t3.id;
#id不同时
explain select t1.id from t1 where t1.id in
(select t2.id from t2 where t2.id in
(select t3.id from t3 where t3.id = 1)
);
#id相同和id不同
explain select t2.* from t2,(select * from t3) s3 where s3.id = t2.id;
-- select_type
#simple 简单的select查询
explain select * from t1;
#derived 
explain select * from (select t1.content from t1) s1;
#subquery
explain select t2.* from t2 where t2.id = (select t3.id from t3);
-- tpye
#Al1
explain select * from t1 where t1.content = "abc";
#system
explain select * from (select t1.id from t1 where id = 1) t;
#const 索引一次就找到了
explain select * from t1 where id = 1;
# eq_ref
explain select t1.*,t2.*
from t1
join t2
on t1. id = t2. id;
#ref非唯一索引扫描
alter table t1 add index idx_t1_content(content);
explain select * from t1 where t1.content = "abc";
# range
explain select * from t2 where t2. id >0;
# index
explain select id, content from t1;
-- possible keys key
explain select * from t2 where t2. id =1;
# 会让索引失效
explain select * from t2 where t2. id is not null;
-- ref
explain select t2.*,t3.* from t2,t3 where t2. id = t3. id;

-- rows     值越小越好
#删除person上的索引
drop index idx_pname on person;
alter table person add index idx_pname(PNAME);
explain select person.* from person where pname = "test3263609";
```



## 从最好到最差依次是：system>const>eq_ref>ref>range>index>All。一般来说，最好保证查询能达到 range 级别，最好能达到 ref。

#### 3.1 索引失效

1）最佳左前缀法则：如果索引了多列，要遵循最左前缀法则，指的是查询从索引的最左前列开始并且不跳过索引中的列。
2）不在索引列上做任何计算、函数操作，会导致索引失效而转向全表扫描。
3）存储引擎不能使用索引中范围条件右边的列。
4）Mysal在使用不等于时无法使用索引会导致全表扫描。
5）is null可以使用索引，但是is not null 无法使用索引。
6）like以通配符开头会使索引失效导致全表扫描。
7）字符串不加单引号索引会失效。
8）使用 or 连接时索引失效。



key_len的值越大越好，

```mysql
-- 索引失效情况
explain select * from students where sname="小明" and age = 22 and score = 100;	#109
explain select * from students where sname="小明" and age = 22;	#104
explain select * from students where sname="小明";	#99
explain select * from students where sname="小明" and score = 80; #99 --跳过中间字段失效
-- 不在索引列上做任何计算、函数操作,会导致索引失效而转向全表扫描.
explain select * from students where left(sname,2) = "小明";
explain select * from students where left(sname,2) = "小明";
-- 存储引擎不能使用索引中范围条件右边的列.
explain select * from students where sname="小明" and age > 22 and score = 100;
-- Mysql在使用不等于时无法使用索引会导致全表扫描.
explain select * from students where sname!="小明";
-- is null可以使用索引,但是is not null无法使用索引.
explain select * from students where sname is not null;
-- like以通配符开头会使索引失效导致全表扫描. （第一个不是通配符%不会失效）
explain select * from students where sname like "%明%";
-- 字符串不加单引号索引会失效.
explain select * from students where sname = 123;
-- 使用or连接时索引失效.
explain select * from students where sname="小明" or age = 22;
```

## 慢查询

![image-20230803120556689](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230803120556689.png)