```bash
mvn compile
```

编译src/main目录下的所有java文件的。

![image-20230813232701973](https://raw.githubusercontent.com/Pip190/cloudimage/master/img/image-20230813232701973.png)

![image-20230813235232450](https://raw.githubusercontent.com/Pip190/cloudimage/master/img/image-20230813235232450.png)

![image-20230814000007209](https://raw.githubusercontent.com/Pip190/cloudimage/master/img/image-20230814000007209.png)

-DarchetypeCatalog=internal，maven项目创建时，会联网下载模版文件，比较大，使用archetypecatalog=internal，不用下载，创建maven项目速度快。

![image-20230814003848418](https://raw.githubusercontent.com/Pip190/cloudimage/master/img/image-20230814003848418.png)

![image-20230814005408258](https://raw.githubusercontent.com/Pip190/cloudimage/master/img/image-20230814005408258.png)

![image-20230815150442056](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230815150442056.png)

```xml
<properties>
  <maven.compiler.source>17</maven.compiler.source>
  <maven.compiler.target>17</maven.compiler.target>
  <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
</properties>
```

```bash
-DarchetypeCatalog=internal
```

