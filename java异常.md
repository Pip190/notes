NumberFormatException

SQLSyntaxErrorException

算术异常类：ArithmeticExecption

空指针异常类：NullPointerException

类型强制转换异常：ClassCastException

数组负下标异常：NegativeArrayException

数组下标越界异常：ArrayIndexOutOfBoundsException

违背安全原则异常：SecturityException

文件已结束异常：EOFException

文件未找到异常：FileNotFoundException

字符串转换为数字异常：NumberFormatException

操作数据库异常：SQLException

输入输出异常：IOException

方法未找到异常：NoSuchMethodException





































































































创建统一信息返回类

```java
public class Resp<T> {

    //服务端返回的错误码
    private int code = 200;
    //服务端返回的错误信息
    private String msg = "success";
    //我们服务端返回的数据
    private T data;

    private Resp(int code,String msg,T data){
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static <T> Resp success(T data){
        Resp resp = new Resp(200, "success", data);
        return resp;
    }

    public static <T> Resp success(String msg,T data){
        Resp resp = new Resp(200,msg, data);
        return resp;
    }

    public static <T> Resp error(AppExceptionCodeMsg appExceptionCodeMsg){
        Resp resp = new Resp(appExceptionCodeMsg.getCode(), appExceptionCodeMsg.getMsg(), null);
        return resp;
    }
    public static <T> Resp error(int code,String msg){
        Resp resp = new Resp(code,msg, null);
        return resp;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public T getData() {
        return data;
    }

}
```

创建全局统一异常处理类

```java
@ControllerAdvice
public class GlobalExceptionHandler {


    @ExceptionHandler(value = {Exception.class})
    @ResponseBody
    public <T> Resp<T> exceptionHandler(Exception e){
        //这里先判断拦截到的Exception是不是我们自定义的异常类型
        if(e instanceof AppException){
            AppException appException = (AppException)e;
            return Resp.error(appException.getCode(),appException.getMsg());
        }

        //如果拦截的异常不是我们自定义的异常(例如：数据库主键冲突)
        return Resp.error(500,"服务器端异常");
    }
}
```

创建一个枚举类型

```java
//这个枚举类中定义的都是跟业务有关的异常
public enum AppExceptionCodeMsg {

    INVALID_CODE(10000,"验证码无效"),
    USERNAME_NOT_EXISTS(10001,"用户名不存在"),
    USER_CREDIT_NOT_ENOUTH(10002,"用户积分不足");
    ;

    private int code ;
    private String msg ;

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }


    AppExceptionCodeMsg(int code, String msg){
        this.code = code;
        this.msg = msg;
    }

}
```

创建自定义的异常类

```java
public class AppException extends RuntimeException{

    private int code = 500;
    private String msg = "服务器异常";


    public AppException(AppExceptionCodeMsg appExceptionCodeMsg){
        super();
        this.code = appExceptionCodeMsg.getCode();
        this.msg = appExceptionCodeMsg.getMsg();

    }

    public AppException(int code,String msg){
        super();
        this.code = code;
        this.msg = msg;

    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

}
```

创建一个controller

```java
@RestController
public class DemoController {


    @GetMapping("demo")
    public Resp<String> demo1(String name){

        if("ok".equals(name)){
            return Resp.success("succ");
        }
        if("err".equals(name)){
            //抛业务相关的异常
            throw new AppException(AppExceptionCodeMsg.USERNAME_NOT_EXISTS);
        }

        if("errcode".equals(name)){
            throw new AppException(AppExceptionCodeMsg.INVALID_CODE);
        }
        if("0".equals(name)){
            int i=1/0;
        }

        //检查用户积分是否足够，如果不够，就抛出异常
        if("notenough".equals(name)){
            throw new AppException(AppExceptionCodeMsg.USER_CREDIT_NOT_ENOUTH);
        }

        return Resp.success("default");
    }
    
   @GetMapping("list")
    public Resp<List> list(){
		List<String> list = Arrays.asList("zhangsan","lisi","wangwu");

        return Resp.success(list);
    }
}
```