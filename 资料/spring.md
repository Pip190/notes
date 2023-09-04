1.OCP开闭原则
什么是OCP？
OCP是软件七大开发原则当中最基本的一个原则：开闭原则
对什么开？对扩展开放。
对什么闭？对修改关闭。
OCP原则是最核心的，最基本的，其他的六个原则都是为这个原则服务的。
OCP开闭原则的核心是什么？
只要你在扩展系统功能的时候，没有修改以前写好的代码，那么你就是符合OCP原则的。
反之，如果在扩展系统功能的时候，你修改了之前的代码，那么这个设计是失败的，违背OCP原则。
当进行系统功能扩展的时候，如果动了之前稳定的程序，修改了之前的程序，之前所有程序都需要进行重新测试。这是不想看到的，因为非常麻烦。

2. 依赖倒置原则（DIP原则）
   什么是依赖倒置原则？
   面向接口编程，面向抽象编程，不要面向具体编程。
   依赖倒置原则的目的？
   降低程序的耦合度，提高扩展力。
   什么叫做符合依赖倒置？
   上 不依赖 下，就是符合。
   什么叫做违背依赖倒置？
   上 依赖 下，就是违背。
   只要”下”一改动，“上”就受到牵连。

3. 当前程序的设计，显然既违背OCP，又违背DIP，怎么办？

   ![image-20230902163609657](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230902163609657.png)





# 在singleton + setter模式下，为什么循环依赖不会出现问题，Spring是如何应对的？

主要的原因是，在这种模式下Spring对Bean的管理主要分为清晰的两个阶段：
	第一个阶段：在Spring容器加载的时候，实例化Bean，只要其中任意一个Bean 实例化之后，马上进行“曝光”【不等属性赋值就曝光】】
	第二个阶段：Bean“曝光”之后，再进行属性的赋值（调用set方法。〕。
		核心解决方案是：实例化对象和对象的属性赋值分为两个阶段来完成的。

注意：只有在scope是singleton的情况下，Bean才会采取提前“曝光”的措施。

注意：当两个bean的scope都是prototype的时候，才会出现异常。如果其中任意一个是singleton的，就不会出现异常。

# 构造方法注入bean下的循环依赖有问题，无论是singleton还是prototype

注意：基于构造注入的方式下产生的循环依赖也是无法解决的，所以编写代码时一定要注意。



# Spring解决循环依赖的机理

Spring为什么可以解决set + singleton模式下循环依赖？
根本的原因在于：这种方式可以做到将“实例化Bean"和“给Bean属性赋值"这两个动作分开去完成。
实例化Bean的时候：调用无参数构造方法来完成。==此时可以先不给属性赋值，可以提前将该Bean对象"曝光"给外界。==
给Bean属性赋值的时候：调用setter方法来完成。
两个步骤是完全可以分离开去完成的，并且这两步不要求在同一个时间点上完成。
也就是说，Bean都是单例的，我们可以先把所有的单例Bean实例化出来，放到一个集合当中（我们可以称之为缓存），所有的单例Bean全部实例化完成之后，以后我们再慢慢的调用setter方法给属性赋值。这样就解决了循环依赖的问题。

# Spring解决循环依赖源码分析

![image-20230904094419349](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230904094419349.png)



# 反射机制

![image-20230904100017664](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230904100017664.png)



# Spring注解的使用

如何使用以上的注解呢？
·第一步：加入aop的依赖
第二步：在配置文件中添加context命名空间
第三步：在配置文件中指定扫描的包
第四步：在Bean类上使用注解

声明bean注解：-------------------------->让spring容器扫描到，交由spring来管理。

@Component

@Controller ------------------------->@Component的别名

@Service ------------------------->@Component的别名

@Repository------------------------->@Component的别名

注入bean注解

@Value--------------------------->注入**简单数据类型**的	==使用@Value注解注入的话，可以用在属性上，并且可以不提供setter方法。==

![image-20230904110503820](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230904110503820.png)

@Value使用的三种方式：

![image-20230904111609884](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230904111609884.png)



![image-20230904111800367](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230904111800367.png)

@Autowired注解可以写在如下位置：

构造方法上、构造方法参数上、set方法上、属性上

当@Autowired省略时，要求只有一个方法（并且无无参构造方法）--------------->如果一个类当中构造方法只有一个，并且构造方法上的参数和属性能够对应上。

当有两个实现类时，@Autowired无法自动装配，需要配合@Qualifier(实现类名)		指定实现类名称来实现



@Resource

![image-20230904113702561](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230904113702561.png)![image-20230904114426612](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230904114426612.png)





全注解式开发

![image-20230904114828700](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230904114828700.png)

![image-20230904114714111](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230904114714111.png)



Spring实现事务的两种方式编程式事务
通过编写代码的方式来实现事务的管理。
声明式事务
基于注解方式
基于XML配置方式



![image-20230904164909424](https://raw.githubusercontent.com/Pip190/cloudimg/master/img/image-20230904164909424.png)