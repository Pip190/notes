1、navigatePages表示页码数量，就是是页面上展示几个分页的按钮。如下所示：

![a](C:\Users\ASUS\Desktop\a.jpg)

2、显示8是因在构造方法中默认为他赋值为了8了。

祝学习愉快！





# #{}和${}的区别：
#{}：底层使用PreparedStatement。特点：先进行SQL语句的编译，然后给SQL语句的占位符问号？传值。可以避免SQL注入的风险。
${}：底层使用Statement。特点：先进行SQL语句的拼接，然后再对SQL语句进行编译。存在SQL注入的风险。

优先使用#{}，这是原则，避免SQL注入的风险。

```mysql
# 这两个效果一样
where username = #{username}

where username = '${username}'
```



>  如果需要SQL语句的关键字放到SQL语句中，只能使用${},因为#{}是以值的形式放到SQL语句当中的。

>  向SQL语句当中拼接表名，就需要使用${}

>  批量删除：一次删除多条记录。批量删除的SQL语句有两种写法：

第一种or：delete from t_car where id=1 or id=2 or id=3；

第二种int：delete from t_car where id in（1，2，3）；

```mysql
# 批量删除方法名及参数值
deleteBatch(String ids)	------>ids: "11,12,13,14"
# SQL语句
delete from table where id in(${ids})
```

> 模糊查询：like

第一种方案：使用${}

```mysql
select * frome `table` 
where
username like '%${username}%'
```

第二种方案：使用mysql内置函数concat

```mysql
select * frome `table` 
where
username like concat('%',#{username},'%')
```

第三种方案：使用mysql内置函数时强制使用${}，比较鸡肋

```mysql
select * frome `table` 
where
username like concat('%','${username}','%')
```

第四种方案：使用#{}，前提”%“是双引号括起来，**使用较多**

```mysql
select * frome `table` 
where
username like "%"#{username}"%"
```

 

> 关于MyBatis中别名机制:

```xml
<typeAliases>
    <!--别名自己指定的-->
    <typeAlias type="com.powernode.mybatis.pojo.Car" alias="aaa"/>
    <typeAlias type="com.powernode.mybatis.pojo.Log" alias="bbb"/>
    <!--采用默认的别名机制-->
    <typeAlias type="com.powernode.mybatis.pojo.Car"/>
    <typeAlias type="com.powernode.mybatis.pojo.Log"/>
    <!--包下所有的类自动起别名.使用简名作为别名. -->
    <package name="com.powernode.mybatis.pojo"/>
</typeAliases>
所有别名不区分大小写.
namespace不能使用别名机制.
```

mapper.xml中的namespace

<!--namespace不能使用别名机制。必须写全限定接口名称。带有包名-->

mybatis配置文件起别名

![image-20230831103057218](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230831103057218.png)

mapper配置文件mapper标签的属性使用

![image-20230831104416152](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230831104416152.png)

![image-20230831104611938](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230831104611938.png)

新增数据时将自动生成的自增id赋值到实体类中（pojo）	自增主键返回

```xml
<!--
useGeneeatedKeys="true"	使用自动生成的主键值（开启）
keyProperty="id"	指定主键值赋值给对象的哪个属性。这个就表示将主键值赋值给Car对象的id属性
-->
<insert id="insertCarUseGeneratedKeys" useGeneeatedKeys="true" keyProperty="id">
    insert into t_car values(null,#{carNum},#{brand},#{guidePrice},#{produceTime},#{carType})
</insert>
```

![image-20230831105451912](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230831105451912.png)

@Param注解底层实现原理：

![image-20230831133008921](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230831133008921.png)

# 查询结果的列名和java对象的属性名对应不上怎么办?
第一种方式:as 给列起别名
第二种方式:使用resultMap进行结果映射
第三种方式:是否开启驼峰命名自动映射(配置settings)

如下为第三种方式：（开启驼峰命名自动映射需要同时满足数据库命名规范和Java命名规范）

如何启用该功能,在mybatis-config.xml文件中进行配置:
mybatis-config.xml

```xml
<!--放在properties标签后面-->
<settings>
	<setting name="mapUnderscoreToCamelCase" value="true"/>
</settings>
```

mybatis高级映射

![image-20230831145854644](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230831145854644.png)

## 多对一
多种方式，常见的包括三种：
第一种方式：一条SQL语句，级联属性映射I
第二种方式：一条SQL语句，association。
第三种方式：两条SQL语句，分步查询。（这种方式常用：优点一是可复用。优点二是支持懒加载。）



实际开发中的模式：
把全局的延迟加载打开。

```yml
mybatis:  
  configuration:
    lazy-loading-enabled: true
```

如果某一步不需要使用延迟加载，请设置：fetchType="eager" 不使用懒加载，全部都加载

```xml
<resultMap id="studentResultMapByStep" type="Student">
    <id property="sid" column="sid"/>
    <result property="sname" column="sname"/>
    <association property="clazz" select="com.powernode.mybatis.mapper.ClazzMapper.selectByIdStep2"
    column="cid" fetchType="eager"/> 
</resultMap>
```



mybatis二级缓存

![image-20230831160337232](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230831160337232.png)

缓存失效条件：

只要进行**insert、update、delete**操作都会清除**一级、二级**缓存。

一级缓存只要手动清空缓存也会失效

```java
//手动清空一级缓存
sqlSession.clearCache();
```

![image-20230831160809142](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230831160809142.png)



分页查询

![image-20230831163436559](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230831163436559.png)