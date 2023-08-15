```java
//        Stream流常见的生成方式
//        1.Collection体系的集合可以使用默认方法stream()生成流
//          default Stream<E> stream()
//        2.Map体系的集合间接的生成流
//        3.数组可以通过Stream接口的静态方法of(T...values)生成流
        // Collection体系的集合可以使用默认方法stream()生成流
        List<String> list = new ArrayList<String>();
        java.util.stream.Stream<String> listStream = list.stream();
        Set<String> set = new HashSet<String>();
        java.util.stream.Stream<String> setStream = set.stream();
        // Map体系的集合间接的生成流
        Map<String, Integer> map = new HashMap<String, Integer>();
        java.util.stream.Stream<String> keyStream = map.keySet().stream();
        java.util.stream.Stream<Integer> valuesStream = map.values().stream();
        java.util.stream.Stream<Map.Entry<String, Integer>> entryStream = map.entrySet().stream();
        // 数组可以通过Stream接口的静态方法of(T...values)生成流
        String[] strArray = {"张三", "李四", "王五", "赵六"};
        java.util.stream.Stream<String> strArrayStream = java.util.stream.Stream.of(strArray);
        java.util.stream.Stream<String> stringStream = java.util.stream.Stream.of("张三", "李四", "王五", "赵六");
        ArrayList<String> list = new ArrayList<>();
        list.add("linqingxia");
        list.add("zhangmanyu");
        list.add("wangzuxian");
        list.add("liuyan");
        list.add("zhangmin");
        list.add("zhangwuji");
        list.add("dilireba");
        list.add("huge");
        // 找出姓张的，名字是三个字的
        list.stream().filter(s -> s.startsWith("张")).filter(s ->s.length() == 3).forEach(System.out::println);

//        Stream流的常见中间操作方法
//        Stream<T> filter(Predicate predicate):用于对流中的数据进行过滤
//                Predicate接口中的方法
//          boolean test(T t):对给定的参数进行判断,返回一个布尔值
//        Stream<T> limit(long maxSize):返回此流中的元素组成的流,截取前指定参数个数的数据
//        Stream<T> skip(long n):跳过指定参数个数的数据,返回由该流的剩余元素组成的流
//        static <T> Stream<T> concat(Stream a, Stream b):合并a和b两个流为一个流
//        Stream<T> distinct):返回由该流的不同元素(根据Object.equals(Object) )组成的流
//        Stream<T> sorted（：返回由此流的元素组成的流，根据自然顺序排序
//        Stream<T> sorted（Comparator comparator）：返回由该流的元素组成的流，根据提供的Comparator进行排序
//        <R> Stream<R> map（Function mapper）：返回由给定函数应用于此流的元素的结果组成的流
//                Function接口中的方法    R apply（Tt）
//        IntStream mapToInt（ToIntFunction mapper）：返回一个IntStream其中包含将给定函数应用于此流的元素的结果
//        IntStream:表示原始int流
//        ToIntFunction接口中的方法       int applyAsInt(T value)

        // 需求1：取前4个数据组成一个流
        java.util.stream.Stream<String> limit4 = list.stream().limit(4);
        // 需求2：跳过2个数据组成一个流
        java.util.stream.Stream<String> skip2 = list.stream().skip(2);
        // 需求3：合并需求1和需求2得到的流，并把结果在控制台输出
//        java.util.stream.Stream.concat(limit4,skip2).forEach(System.out::println);
        // 需求4：合并需求1和需求2得到的流，并把结果在控制台输出，要求字符串元素不能重复
//        java.util.stream.Stream.concat(limit4,skip2).distinct().forEach(System.out::println);

        // 需求1：按照字母顺序把数据在控制台输出
//        list.stream().sorted().forEach(System.out::println);
        // 需求2：按照字符串长度把数据在控制台输出,并要求当长度一致时按字母排序
        list.stream().sorted(Comparator.comparingInt(String::length).thenComparing(s -> s)).forEach(System.out::println);


//        Stream流的常见终结操作方法
//                Stream流的常见终结操作方法
//        void forEach(Consumer action):对此流的每个元素执行操作
//                Consumer接口中的方法
//        void accept(T t):对给定的参数执行此操作
//        long countO:返回此流中的元素数
```

![image-20230815222011786](https://raw.githubusercontent.com/Pip190/cloudimage/master/img/image-20230815222011786.png)

![image-20230815223804525](https://raw.githubusercontent.com/Pip190/cloudimage/master/img/image-20230815223804525.png)