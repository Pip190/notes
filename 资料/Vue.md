# vue3第一天

vue框架（4周)

react 框架（3-4周）

小程序和uniapp 

web3.0和vue2 复习

就业周

aaa

## vue3

~~~
官网:https://cn.vuejs.org/
~~~

```
 <div id="box">
        {{str}}
    </div>
    <div id="box2">
        {{str}}
    </div>
    <script>
        let obj ={str:"hello"}
        //创建一个根实例
        let app=Vue.createApp({
            data(){  //data函数的作用向组件或容器提供数据  //Proxy
                return {
                    str:'hello world'   //响应式数据 数据变化了，视图会自动更新（vue会找到变更的差异部分，进行局部的刷新)
                                        //数据驱动  （数据变化了，视图会自动更新)
                }
            }
        }).mount("#box")  //mount挂载，把app和特定的容器进行关联，关联以后，app就可以控制容器渲染的内容
        console.log(app)
        //面试题：data函数要返回一个对象？
        //每一个实例有独立的数据对象互相之间不影响

        let app2=Vue.createApp({
            data(){
                return {
                    str:"qf"
                }
            }
        }).mount("#box2")
    </script>
```



### 什么是vue

~~~
渐进式JavaScript框架  （声明式编程)
易学易用，性能出色，适用场景丰富的 Web 前端框架    vue性能：引入了虚拟demo机制，引入了diff算法，diff算法可以进行差异更新，采用了声明式编程
~~~

### 什么叫渐进式框架

弱主张的框架，只提供必要的和核心的功能，需要时再进行逐渐的扩展

### 搭建环境

 脚手架环境(用命令搭建一个空的vue项目)

在html文件中引入vue.js(cdn)



```
	<div id="box">
		{{str}}
	</div>
	<script>
		// console.log(Vue.createApp)
		//创建一个根实例
	 let app=Vue.createApp({
		data(){  //data函数的作用向组件或者容器提供数据
			return{
				str:'hello word'  //响应式数据（数据变化了,视图也会自动更新）---vue会找到变更的差异部分，进行局部的刷新
				//数据驱动：数据变化了,视图也会自动更新
			}
		}
	 }).mount('#box')  //mount挂载，把app和特定的容器进行关联，关联以后，app就可以控制容器渲染的内容
	 console.log(app)

	 //面试题：data函数为什么要返回一个对象？
	 //因为每一个实例都有独立的数据对象，它们互相之间不影响
	</script>
```



### 差值表达式

{{js表达式}}  是差值表达式   mustache

含有差值表达式的html叫模板(template)

~~~
  <div id="box">
        {{str}}  ---  {{str.toUpperCase()}} ---反转  {{str.split("").reverse().join("")}}
    </div>
    <script>
        let appInstance = Vue.createApp({
            data(){
                return {
                    str:"hello world"
                }
            },
            // template:`<div>   //template的优先级比  mount挂载的元素高！
            //                 test hello
            //          </div>
            //     `
        });
        let app = appInstance.mount("#box");
      
    </script>
~~~

### MVVM

~~~
M model 模型    数据
v view  视图    渲染数据
vm viewmodel 视图模型  数据驱动
~~~

vue的两大核心是数据驱动和组件系统

指令(directive)

组件(component)

路由(router)

vuex 

 第三方库

## 指令

### 1.v-text    作用和{{差值表达式}}一样

### 2.v-bind   把变量或数据绑定到对象的属性上  v-bind:属性=“变量"   简写为":"   数据变化视图会变化，视图变化，数据不会变化，所以是一个单向绑定指令

### 3.v-model 双向绑定指令   （v-bind和v-on的合体)

修饰符 

~~~
.lazy 文本框失去焦点的时候再帮我们将文本框的值同步给Model
.number 把文本框的数据当成数值处理
.trim 去掉前后空格
~~~



### 4.v-on 指令  可以简写为@  $event 是事件对象

可以响应多个事件对象 

~~~
<button v-on="{'mouseover':()=>change(1),'mouseout':change.bind(this,-1)}">test</button>
~~~

事件处理函数放到methods里

~~~
  methods:{
                // increment(){
                //     this.n=this.n+1
                // },
                // sub(){
                //     if(this.n>1){
                //         this.n=this.n-1 
                //     }
                   
                // }
                change(p){
                    console.log("change",p)
                    // if(e.target.innerHTML==="-" && this.n>1){
                    //     this.n--;
                    // }
                    // else if(e.target.innerHTML==="+"){
                    //     this.n++;
                    // }
                  //  this.n=Math.max(this.n+p,1)
                  
                   if(this.n+p>1){
                         this.n=this.n+p;
                   }
                   else{
                    this.n=1
                   }
                }
            }
~~~

### 5.v-if和v-show

区别  v-show 只是切换元素的css样式，可见还是不可见

v-if 惰性指令 true 才渲染 false 不渲染

### 6.v-for

~~~
   <div id="box">
        <ul>
            <li v-for="item in list" :key="item.id">  
                //key是个唯一的值，通过key值能找到对应的同一个节点，判断数据的变化，从而减少比对次数，提高比对效率。
                {{item.name}} {{item.age}}
            </li>
        </ul>
    </div>
    <script>
        const list=Mock.mock({
            "list|30":[{
                id:"@id",
                name:'@cname',
                "age|20-30":25
            }]
        })
        console.log(list)
        let app = Vue.createApp({
            data() {
                return {
                    list:list.list
                }
            }
        }).mount('#box')
        
~~~

### v-else

### v-else-if



# vue3第二天

### npm  i vue -S



## 绑定样式

### 绑定style

~~~
 v-bind:style="{key:value.....}"
 v-bind:style="[styleObj1,styleObj2.....]"
~~~

### 绑定class

~~~
v-bind:class="{className:布尔表达式，。。。。。}"
v-bind:class="[{clasaName:布尔表达式}，{   }]"
~~~

von修饰符

   .stop   阻止冒泡

  .capture 捕获模式

 .prevent 阻止默认的行为

 .once 事件只响应一次

.self  只有本身响应

.enter 回车事件

## vfor遍历数字，遍历字符串，对象

~~~
    <div id="box">
        <!-- <ul>
            <li v-for="x in str"  :key="x">{{x}}</li>
        </ul> 
        <ul>
            <li v-for="(value,key,index) in obj">
                {{index}}---{{key}}---{{value}}
            </li>
        </ul>-->
        <ul>
            <li v-for="(item,index) in arr" :key="item">
                    {{index}}--{{item}}
            </li>
        </ul>
    </div>
~~~



## 计算属性

```
<div id="box">
		<span>{{str}}</span>
	</div>
	<script>
		let app = Vue.createApp({
			data() {
				return {
					str:'海鸥'
				}
			},
			render(){   //vue运行时会把模板转换成render函数
				// console.log(Vue.h)
				return Vue.h("span",{title:'哈哈哈哈'},this.str)
			}
		}).mount("#box")
	</script>
```



```
<div id="box">
		<input type="text" v-model="str"> <br>
		{{reverseStr}}
		<button @click="getC">获取计算属性的值</button>
	</div>
	<script>
		let app = Vue.createApp({

			//计算属性：值变化了，返回的计算值自动更新（如果数据不变化取缓存（取上一次计算的结果））
			computed:{
				reverseStr(){
					return this.str.split('').reverse().join('')+Math.random().toFixed(2)
				}
			},
			data() {
				return {
					str:'hhajsuhdhshaewy'
				}
			},
			methods: {
				getC(){
					console.log(this.reverseStr)
				}
			},
		}).mount("#box")
	</script>
```



## 计算属性 get和set的用法

```
<div id="box">
		<input type="text" maxlength="20"  v-model="str">
		<button @click="info='海鸥'">点击按钮</button>
		{{info}}
	</div>
	<script>
		let app = Vue.createApp({
			computed:{
				info:{
					get(){
						return `还可以输入${20-this.str.length}个字`
					},
					set(value){
						this.str=value
					}
				}
			},
			data() {
				return {
					str:""
				}
			},
		}).mount("#box")
	</script>
```



```
        /**
         * v-bind  v-model
         * v-if    v-show
         * v-text  v-html
         * v-on    v-for
         * v-memo  v-once
         * v-pre   v-cloak
        */
```



# vue3第三天

### 组件 component

可以复用的页面的一部分，叫做组件（本质就是一组dom元素的封装）

#### 组件的分类

全局组件：一旦声明可以在任何地方使用

局部注册的组件：需要调用 才能使用

```
<div id="box">
        <One></One>
        全局（<Local></Local>）
    </div>
   
    <script>
        //vnode
        // let div={
        //     tag:"div",
        //     props:{
        //         id:"box"
        //     },
           
        // }
        let Local=Vue.defineComponent({  //定义一个局部注册的组件
            template:`<div>局部注册的组件</div>`
        })
        let appInstance = Vue.createApp({  //全局组件
            components:{  //局部注册的组件，需要在组件里进行里注册，才能在这个组件的模板里使用
                Local
            },
            data() {
                return {

                }
            }
        })
        appInstance.component("Two",{  //全局组件在任何其他组件的模板里都可以使用，不用注册
            template:`<div>two component</div>`
        })
        appInstance.component("One",{
            components:{  //注册组件
                Local
            },
            template:`<div>one component  One( <Local></Local></div>) <Two></Two>`
        })
       let app = appInstance.mount('#box')

      
    </script>
```





## 组件component

### 1.定义

可以复用的页面的一部分，叫组件（本质就是一组dom元素的封装)

### 2.分类

全局组件

~~~
 <div id="box">
        <!-- 不用注册就可以在App的模板里使用 -->
         <Counter></Counter>  
    </div>
    <script>
        let appInstance = Vue.createApp({
            data() {
                return {}
            }
        })
        //定义全局组件Counter
        appInstance.component("Counter",{ 
            template:`
                <div>Counter组件 {{n}}  <button @click="inc">+</button></div>

            `,
            data(){
                return {
                    n:1
                }
            },
            methods:{
                inc(){
                    this.n++
                }
            }
        })
        let app= appInstance.mount('#box')
    </script>
~~~



局部注册的组件

## 组件通讯

### 1.父传子

~~~
<div id="box">
        <!-- 父组件通过自定义属性把值传给子组件 -->
        <box-message money="111"></box-message>
        <button>弹出</button>
    </div>
    <script>
        let boxMessage = {
            props:["money"],    //子组件通过 props接受父组件传过来的值
            template: `<div class='message'></div>`
        }
        let app = Vue.createApp({
            components: {
                boxMessage
            },
            data() {
                return {
                    flag:false //控制对话框的显示和隐藏
                }
            }
        }).mount('#box')
~~~



```
 <div id="box">
        <!-- 父组件通过自定义属性把值传给子组件 没有绑定数据传的任何数据都是字符串，加上绑定可以识别各种数据类型和变量-->
        <box-message v-bind:money="111" :title="title" :flag="flag" :arr="arr" :index="index"></box-message>
      
        <button @click="showBox('添加')">添加</button>
        <ul>
            <li v-for="(item,index) in arr" :key="index">{{item}}   <button @click="showBox('修改',index)">修改</button></li>
        </ul>
    </div>
    <script>
        let boxMessage = {
            props:["money","flag","title","arr","index"],    //子组件通过 props接受父组件传过来的值
            template: `<div class='message' v-show="flag">
                {{index}}
                        <h3>{{title}}</h3>
                        {{money}} {{typeof money}} {{flag}}
                        
                        <input type='text' v-model="str" @keyup.enter="add" v-if="title==='添加'" />
                        <input type='text' v-model="str" @keyup.enter="modify" v-else />
                      </div>`,
            data(){
                return {
                    str:""
                }
            },
            watch:{   //监听数据的变化
                index(newIndex){
                    this.str=this.arr[newIndex];
                }
            },
            methods:{
                add(){
                    this.arr.push(this.str);
                    this.str="";
                    //error  这是错误的做法，父组件传给子组件的基本数据类型的值不能改因为是只读的（单向数据流）
                    //父组组件传给子组件引用数据类型的值是可以改的 ，因为地址没变
                  //  this.flag=false  error
                  this.$parent.flag=false;  //这种方法少用，因为破坏了单向数据流
                },
                modify(){
                    console.log("修改")
                }

            }
                
        }
        let app = Vue.createApp({
            components: {
                boxMessage
            },
            methods:{
                showBox(title,index){
                    this.flag=true; //对话框可见
                    this.title=title
                    this.index=index;
                }
            },
            data() {
                return {
                    index:-1, //要修改元素的下标
                    flag:false, //控制对话框的显示和隐藏
                    title:"添加",
                    arr:['aa','bb']
              
                }
            }
        }).mount('#box')
    </script>
```



props验证

  type:类型

default：默认值

required:是否必须传

validator ：自定义验证规则

### 2.子传父

```
<div id="box">
		<input1 @txt="jia"></input1>
		<!-- <ul>
			<li v-for="(item,index) in arr" :key="index">
				{{item}}
			</li>
		</ul> -->
		<lii :arr="arr"></lii>
	</div>
	<script>
		let lii={
			props:["arr"],
			template:`
			<ul>
			<li v-for="(item,index) in arr" :key="index">
				{{item}}
			</li>
		</ul>
			`
		}
		let input1 = {
			template: `
			<input type="text" v-model="str" @keyup.enter="send">
			`,
			data(){
				return{
					str:''
				}
			},
			methods: {
				send(){
					this.$emit('txt',this.str);
					this.str=''
				}
			},
		}
		let app = Vue.createApp({
			components: {
				input1,lii
			},
			data() {
				return {
					arr: ['海鸥', '哈哈哈']
				}
			},
			methods:{
				jia(str){
					this.arr.push(str)
				}
			}
		}).mount("#box")
	</script>
```



### 3.非父子组件的传值

```
  <!-- 一定要引入mitt这个库，才是在vue3中实现中央消息总线 -->
  <script src="https://unpkg.com/mitt/dist/mitt.umd.js"></script>



<div id="box">
		<One></One>
		<Two></Two>
	</div>
	<script>
		let emitter = mitt()  //需要去引入mitt   发布订阅模式】、
		let One = {
			template: `<div>One	<button @click="send"> send </button> </div>`,
			methods: {
				send(){
					.j//emit 向兄弟组件传值
				}
			}
		}
		let Two = {
			template: `<div>Two {{data}}</div>`,
			data(){
				return{
					data:23
				}
			},
			created () {  //生命周期的钩子函数，在实例处理完所有状态的相关的选项后调用
				emitter.on('haiou',(data)=>{  //on  接受兄弟组件传过来的值  data就是其他组件传递过来的值
					this.data=data
				})
			}
		}
		let app = Vue.createApp({
			components: {
				One,Two
			},
			data() {
				return {
				}
			},
		}).mount("#box")
	</script>
```



### 4.爷孙组件传值

##### 爷组件

```
export default {
    components: { Test },
    data(){
      return{
        n:2323
      }
    },
 **** provide(){   
      return {
        n:this.n
      }
    }
}
```



##### 爷组件（使用computed可以使传的值有响应  爷组件的值改变了 孙子的值也会改变）

```
<template>
  <div>
<Test></Test>
{{ n }} <button @click="n++">+</button>
  </div>
</template>

<script>
import Test from './components/Test.vue';
  *** import {computed} from 'vue'
  export default {
    components: { Test },
    data(){
      return{
        n:2323
      }
    },
   **** provide(){
      return {
        n:computed(()=>this.n)
      }
    }
}
</script>

<style lang="scss" scoped>

</style>
```



##### 孙组件

```
<template>
	<div>
		TestSon {{ n }}
	</div>
</template>

<script>
	export default {
		inject:['n']  ***
	}
</script>

<style lang="scss" scoped>

</style>
```



## watch

监控数据的变化



# vue3第四天

### Object.values  和  Object.keys

```
let obj={
			a:1,b:2,c:3
		}
		Object.values(obj) //[1,2,3]   Object.values---将对象的值拿到存在数组里面
		Object.keys(obj)  //['a','b',c]   Object.keys----将对象的键拿到存在数组里面
```

### 计数器

```
<div id="box">
		<!-- <Counter :n="obj.n" @nn="change" name="n"></Counter>
		<Counter :n="obj.m" @nn="change" name="m"></Counter>
		<Counter :n="obj.h" @nn="change" name="h"></Counter> -->
		
		<Counter v-for="(value,key,index) in obj" :n="value" @nn="change" :name="key" :key="key"></Counter>
		{{sum}}
	</div>
	<script>

		let Counter = {
			props: ["n", "name"],
			template: `<div>计数器 {{n}} <button @click="add">+</button> </div>`,
			methods: {
				add() {
					this.$emit('nn', this.n + 1, this.name)
				}
			}
		}
		let app = Vue.createApp({
			computed: {
				sum() {
					// return this.obj.n + this.obj.m + this.obj.h
					return Object.values(this.obj).reduce((a,b)=>a+b)
				}
			},
			components: {
				Counter
			},
			data() {
				return {
					obj: {
						n: 3,
						m: 6,
						h: 7,
						jj:99,
						kk:2
					}

				}
			},
			methods: {
				change(...arges) {
					console.log(arges);
					this.obj[arges[1]] = arges[0]
				},
			}
		}).mount("#box")

	</script>
```



### 生命周期的钩子函数

```
<div id="box">
		<input type="text" id="txt" ref="txt">{{str}}
		<Child ref="child"></Child>
		<button @click="sc">删除</button>
	</div>
	<script>
		// 生命周期的钩子函数 => 在组件的各个生命周期中可以自动调用的函数叫做生命周期的钩子函数
		// 创建阶段 挂载阶段 更新阶段 销毁阶段
		// 1. beforeCreate     实例创建前触发
		// 2. created          实例创建完成，
		// 3. beforeMount      模板渲染前，可以访问数据，模板编译完成，虚拟DOM已经存在   
		// 4. mounted          模板渲染完成，可以拿到DOM节点和数据
		// 5. beforeUpdate     更新前
		// 6. updated          更新完成
		// 7. beforeUnmount   销毁前
		// 8. unmounted       销毁后

		let Child = {
			template: `<div>child</div>`,
			methods: {
				fun() {
					console.log('哈哈哈哈哈')
				}
			},
			//创建的钩子函数
			beforeCreate() {   //不能访问数据
				console.；log('child beforeCreate')
			},
			created() {   //可以访问数据
				console.log('child created')
			},

			//挂载的钩子函数
			beforeMount() {  //能拿到数据  但拿不到dom节点
				// console.log('beforeMount',this.str,document.getElementById('txt'))
				console.log('child beforeMount')
			},
			mounted() {   //即能拿到数据  还能拿到dom节点
				// console.log('mounted',this.str,document.getElementById('txt'))
				console.log('child mounted')
			},
		}
		let appIntance = Vue.createApp({
			components: {
				Child
			},
			data() {
				return {
					str: '海鸥'
				}
			},
			//创建的钩子函数
			beforeCreate() {   //不能访问数据
				console.log('app beforeCreate', this.str)
			},
			created() {   //可以访问数据
				console.log('app created', this.str)
			},

			//挂载的钩子函数
			beforeMount() {  //能拿到数据  但拿不到dom节点
				// console.log('beforeMount',this.str,document.getElementById('txt'))
				console.log('app beforeMount', this.str, this.$refs.txt)
			},
			mounted() {   //即能拿到数据  还能拿到dom节点
				// console.log('mounted',this.str,document.getElementById('txt'))
				console.log('app mounted', this.str, this.$refs.txt),
					this.$refs.child.fun()
			},

		
			//更新阶段
			beforeUpdate() {  //更新dom数前
				console.log('app beforeUpdate',this.str)
			},
			updated() {   //更新dom数之后
				console.log('app updated',this.str)
			},	
			
			//销毁阶段
			beforeUnmount() {
				console.log('app beforeUnmount')
			},
			unmounted() {
				console.log('app unmounted')
			},
			methods:{
				sc(){
					appIntance.unmount()
				}
			}
		})
		appIntance.mount("#box")
	</script>
```



## 子组件给父组件传值

1. 监听

   ~~~
   <My-form :index="index" :arr="arr" v-on:evt="changeIndex($event)"></My-form>
   ~~~

2. 发送

   ~~~
    this.$emit("evt",0)  //2.发送是新值给父组件
   ~~~

3. 接收

   ~~~
     changeIndex(n){  //3.接收 在事件处理函数里接收子组件传过来的值n
                       console.log(n)
                       this.index=n;
                   }
   ~~~

   

## v-model 双向绑定组件

<组件  v-model="变量" />等价于

<组件  v-bind:modelValue="变量"  v-on:update:model-value="变量=$event" />

## 兄弟组件传值

~~~
    <script src="https://unpkg.com/mitt/dist/mitt.umd.js"></script>
      let emitter= mitt();
      let One={
            template:`<div>one compnent <button @click="send">send</button></div>`,
            methods:{
                send(){
                    emitter.emit("msg",12345)  //向兄弟组件传值
                }
            }
        }
        
        let Two={
            template:`<div>Two compnent {{num}}</div>`,
            data(){
                return {
                   num:0 
                }
                
            },
            created(){  //生命周期的钩子函数  在实例处理完所有与状态相关的选项后调用
                emitter.on("msg",(data)=>{  //data就是其他组件传递过来的值
                    this.num=data;
                })
            }   
        }
~~~

指令  12

组件

​	组件定义和使用

   组件的传值 

​	生命周期的钩子函数

   动态组件

​     插槽



路由

vuex

第三方库

## 生命周期的钩子函数

在组件的各个生命周期中可以自动调用的函数叫生命周期的钩子函数

 创建阶段

​		beforeCreate   实例初始化时调用

​         created  在实例处理完所有与状态相关的选项后调用

挂载阶段

​     beforeMount  在实例挂载之前调用     可以拿到数据，但是拿不到真实的dom节点

​     mounted 挂载之后调用   既可以拿到数据，也可以拿到真实的dom节点

​    <input  ref="节点标识" /> 

# ref

```
    <input  ref="节点标识" /> 
    
    this.$refs.ref节点标识 拿到节点 
    this.$refs.ref节点标识.数据名字  拿到数据
```

   

创建和挂载节点父子组件的执行顺序

~~~
app beforeCreate undefined
app created hello
app beforeMount hello undefined
child beforeCreate
child created
child beforeMount
child mounted
app mounted
~~~



更新阶段

beforeUpdate  状态已经更新后，DOM树更新前调用

updated   状态已经更新后 DOM树更新后调用

销毁阶段

beforeUnmount

组件卸载之前调用  清理资源，防止内存泄露

unmounted 

组件卸载之后调用

```
<div id="box">
		<input type="text" id="txt" ref="txt">{{str}}
		<Child ref="child"></Child>
		<button @click="sc">删除</button>
	</div>
	<script>
		// 生命周期的钩子函数 => 在组件的各个生命周期中可以自动调用的函数叫做生命周期的钩子函数
		// 创建阶段 挂载阶段 更新阶段 销毁阶段
		// 1. beforeCreate     实例创建前触发
		// 2. created          实例创建完成，
		// 3. beforeMount      模板渲染前，可以访问数据，模板编译完成，虚拟DOM已经存在   
		// 4. mounted          模板渲染完成，可以拿到DOM节点和数据
		// 5. beforeUpdate     更新前
		// 6. updated          更新完成
		// 7. beforeUnmount   销毁前
		// 8. unmounted       销毁后

		let Child = {
			template: `<div>child</div>`,
			methods: {
				fun() {
					console.log('哈哈哈哈哈')
				}
			},
			//创建的钩子函数
			beforeCreate() {   //不能访问数据
				console.log('child beforeCreate')
			},
			created() {   //可以访问数据
				console.log('child created')
			},

			//挂载的钩子函数
			beforeMount() {  //能拿到数据  但拿不到dom节点
				// console.log('beforeMount',this.str,document.getElementById('txt'))
				console.log('child beforeMount')
			},
			mounted() {   //即能拿到数据  还能拿到dom节点
				// console.log('mounted',this.str,document.getElementById('txt'))
				console.log('child mounted')
			},
		}
		let appIntance = Vue.createApp({
			components: {
				Child
			},
			data() {
				return {
					str: '海鸥'
				}
			},
			//创建的钩子函数
			beforeCreate() {   //不能访问数据
				console.log('app beforeCreate', this.str)
			},
			created() {   //可以访问数据
				console.log('app created', this.str)
			},

			//挂载的钩子函数
			beforeMount() {  //能拿到数据  但拿不到dom节点
				// console.log('beforeMount',this.str,document.getElementById('txt'))
				console.log('app beforeMount', this.str, this.$refs.txt)
			},
			mounted() {   //即能拿到数据  还能拿到dom节点
				// console.log('mounted',this.str,document.getElementById('txt'))
				console.log('app mounted', this.str, this.$refs.txt),
					this.$refs.child.fun()
			},

		
			//更新阶段
			beforeUpdate() {  //更新dom数前
				console.log('app beforeUpdate',this.str)
			},
			updated() {   //更新dom数之后
				console.log('app updated',this.str)
			},	
			
			//销毁阶段
			beforeUnmount() {
				console.log('app beforeUnmount')
			},
			unmounted() {
				console.log('app unmounted')
			},
			methods:{
				sc(){
					appIntance.unmount()
				}
			}
		})
		appIntance.mount("#box")
	</script>
```



activated   组件启用缓存的时候调用
deacitvated  组件停用缓存的时候调用

# vue3第五天

## 手动搭建vue3

### npm init -y    初始化

### npm i vue -S    安装vue

### npm i vite -S    打包

### npx vite   运行

### 在package.json文件夹中更改运行命令

```
 "scripts": {

  "test": "echo \"Error: no test specified\" && exit 1",

  "dev":"npx vite"  //dev 这个单词可以随便起 

 },
 
 运行方式：npm run dev   等价于 npx vite
```



### npx vite build  打包项目

```
"scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "dev": "npx vite",
    "build":"npx vite build"    //build这个单词可以随便起 
  },
  运行方式：npm run build 等价于 npx vite build
```



#### html

```
<div id="box">
	
	</div>
	<script src="./js/vue.js" type="module"></script>
```

#### js

```
import {createApp,h} from 'vue'
let app = createApp({
	render(){
		return h('span',null,this.yy)  //span标签  null属性  yy内容 
	},
	data() {
		return {
			yy: '海鸥'
		}
	},
}).mount("#box")
```



## 自动搭建vue3

### npm init -y    初始化

### npm init vue@latest   搭建脚手架

### npm i sass  -S  写样式  不报错

### npm i normalize.css   重置css的样式

```
购物车中的加加减减

<template>
    <div>
        <ul>
            <li v-for="item in list" :key="item.id" class="row">
                <p><input type="checkbox" v-model="item.flag" /></p>
                <div>
                    <img :src="item.img"  width="120"/>
                </div>
                <div>
                    {{ item.text }}<br />
                   <button @click="changeCount(item.id,-1)">-</button>
                    {{ item.count }}
                    <button @click="changeCount(item.id,1)">+</button>
                </div>
            </li>
        </ul>
    
    </div>
</template>

<script>
export default {
    props: ["list"],
    //方法
    methods:{
        changeCount(id,p){
            let index=this.list.findIndex(item=>item.id===id)
   
            this.list[index].count= Math.max(this.list[index].count +p,1) 
            
         
        }
    }
}
</script>

<style lang="scss" scoped>
    .row{
        display: flex;
        align-items: center;
     
    }
</style>
```



```
<template>
  <div>
    <p>哈哈哈</p>
    <div class="item">app</div>
    <div class="item">海鸥</div>
  </div>
</template>

<script>
export default {

};
</script>

<style lang="scss" scoped>    //scoped  只对当前的组件有作用
div{
  p{
    color: blue;
    &:hover{     //上一级
      color: aqua;
    }
  }
  background-color: red;
  .item{
    color: green;
  }
}
</style>

```



### 动态组件

根据组件的名字来渲染组件的内容

```
<Keep-alive></Keep-alive>   //用来包裹 <component></component> 组件 可以保存组件的内容  

activated   组件启用缓存的时候调用
deacitvated  组件停用缓存的时候调用

  <keep-alive :include="['One']">   //给one和two组件写一个name:对应的名字  然后在keep-alive中操作，写了one这样就只保存one 中的数据
      <component :is="cname"></component>
    </keep-alive>
```



### cname

```
<template>
  <div>
    动态组件
	<keep-alive>
	 <component :is="cname"></component>
	</keep-alive>
  
   <button @click="cname='One'">one</button>
   <button @click="cname='Two'">two</button>
  </div>
</template>

<script>
import One from "./One.vue";
import Two from "./Two.vue";
export default {
  components: { One, Two },
  data(){
	return{
		cname:'One'
	}
  },
};
</script>

<style lang="scss" scoped></style>

```



### 插槽(slot)

组件的预留位置可以在不修改组件代码的前提下，扩展组件的内容

### 匿名插槽

#### Demo.vue

```
<template>
  <div>
	<slot></slot> <input type="text">
	Demo组件
  </div>
</template>

<script>
export default {

};
</script>

<style lang="scss" scoped></style>

```



#### app.vue

```
<template>
  <div>
<Demo>
  <template v-slot:default>    //  使用v-slot:绑定插槽 ,default 表示没有名字的插槽 ----匿名插槽
     <span>用户名:</span>
  </template>
</Demo>
  </div>
</template>

<script>
import Demo from './components/Demo.vue'
  export default {
    components:{
      Demo
    }
  }
</script>

<style lang="scss" scoped>

</style>
```

### 有名字的插槽----具名插槽

```
<slot name="btn"></slot>

<template v-slot:btn>
   <button>添加</button>
  </template>
```

#### v-slot:    可以简写为 #

```
#
```



### 通过插槽传值  ----作用域插槽

```
<slot name="btn" :n="5"></slot>

 <template v-slot:btn="props" >   //props 这个名字不定
   <button>添加 {{ props.n }}</button>
  </template>
```



# 添加  

```
  add() {
      if (!this.newsTitle || !this.content) {
        return alert("请输入完整数据");
      }
      this.list.push({
        id: Date.now(),
        title: this.newsTitle,
        content: this.content,
      });
      this.close();
    },
```

# 删除

```
	remove(id){
		let index=this.list.findIndex(item=>item.id===id);
		// console.log(index)
		this.list.splice(index,1)
	}
```

# 修改

```
 editOk() {
      let index = this.list.findIndex((item) => item.id === this.id);
      this.list[index].title = this.newsTitle;
      this.list[index].content = this.content;
      this.close();
    },
```

# 搜索

```
computed:{
	filterList(){
		return this.list.filter(item=>item.title.includes(this.kw))
	}
  },
```



# 全选和全不选

```
computed:{
				select:{
					get(){
						return this.list.every(item=>item.flag)
					},
					set(v){
						// console.log(v)
						this.list.forEach((item)=>{item.flag=v})
					}
				}
			},
```



# vue3第六天

### watch的使用

```
<template>
	<div>
demo{{ n }} <button @click="n++">+</button>
{{ obj }}
<button @click="obj.a++">+</button>
	</div>
</template>

<script>
	export default {
		data(){
			return{
				n:5,
				obj:{
					a:1
				}
			}
		},
		
		// watch:{
		// 	n(newV,oldV){
		// 		console.log(newV,oldV)
		// 	}
		// }
		
		watch:{
			n:{   //监听普通数据
				handler(newV,oldV){
					console.log(newV,oldV)
				}
			},
			obj:{   //监听对象
				handler(newV){
					console.log(newV)
				},
				deep:true, //对象要用深度监听，否则监听不到
				immediate:true  //立即监听
			}
		}
	}
</script>

<style lang="scss" scoped>

</style>
```



### npm i swiper@5 -S    下载轮播图插件

### npm i axios -S    下载axios



### nextTick   

是一个事件循环中的异步队列中的微任务

this.$nextTick   延迟执行回调，直到dom加载完毕 

```
 <ul>
		<li v-for="(item,index) in list" :key="index" ref="lii">
		{{ item }}
		</li>
	</ul>
	
 
 methods:{
	add(){
		this.list.push(23);
		this.$nextTick(()=>{
			console.log(this.$refs.lii)
		})
	}
  }
```

### 组件异步传值

~~~
     <TestSwiper :imgs="imgs" v-if="imgs.length>0"></TestSwiper>
~~~

### 跨域设置

#### 代理跨域

##### vite.config.js

```
server: {
    proxy: {
      "/api": {
        target: "http://121.89.205.189:3000",
        changeOrigin: true,
      },
    },
  },

 axios.get("/api/banner/list")
```



# vue3第七天

### vue3中  v-if的优先级比v-for的优先级高



### watch跟computed的区别 (面试题)

1、功能上：computed是计算属性，watch是监听一个值的变化，然后执行对应的回调。

2、是否调用缓存：computed中的函数所依赖的属性没有发生变化，那么调用当前的函数的时候会从缓存中读取，而watch在每次监听的值发生变化的时候都会执行回调。

3、是否调用return：computed中的函数必须要用return返回，watch中的函数不是必须要用return。

4、computed默认第一次加载的时候就开始监听；watch默认第一次加载不做监听，如果需要第一次加载做监听，添加immediate属性，设置为true（immediate:true）

5、使用场景：computed----当一个属性受多个属性影响的时候，使用computed-----购物车商品结算。watch–当一条数据影响多条数据的时候，使用watch-----搜索框.

computed的值依赖多个数据，一个值变化了，他的值会自动计算，watch的值依赖多个数据，需要监听多个数据

### 路由

根据不同的url渲染不同的组件

### 路由有两种模式

hash模式 # -------createWebHashHistory

history模式 ------------createWebHistory



```
<RouterLink to="/页面名称">对应的标题</RouterLink>  ----链接

<RouterView></RouterView>  ----渲染页面
```





### 路由的重定向和路由的别名

```
import {createRouter,createWebHistory} from 'vue-router'
import Home from '@/views/Home.vue'
const router = createRouter({
	// 4. 内部提供了 history 模式的实现。为了简单起见，我们在这里使用 hash 模式。
	history:createWebHistory(),
	routes:[
		{
			path:'/',
			// redirect: "/home"   //路由的重定向  方法1
			// redirect:{         //方法2
			// 	name:'home'
			// },
			redirect:'/h'    //方法3
		},
	  {          //Route对象
		  path:'/home',
		  name:'home',  //命名路由   对应方法2
		  alias:"/h", //别名     对应方法3
		  component:Home
  
	  },
	  {
		  path:'/two',
		  // component:Two
		  component:()=>import('@/views/Two.vue')
	  }
	] 
  });
  export default router
```

7

### 配置404页面

```
<template>
  <div>
    app
    <router-link to="/"> 首页</router-link>
    <router-link to="/two">第二页</router-link>
    <router-link to="/xxx">xxx</router-link>
    <RouterView msg="我是HelloWorld组件"></RouterView>
  </div>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped>
.router-link-active{
  color: red;
}
</style>

```

#### 使用页面只显示404页面方法1

```
<template>
  <div>
   //使用一个div 将这三个组件包起来
    <div v-show="flag">
      <router-link to="/"> 首页</router-link>
      <router-link to="/two">第二页</router-link>
      <router-link to="/xxx">xxx</router-link>
    </div>

    <RouterView msg="我是HelloWorld组件"></RouterView>
  </div>
</template>

<script>
export default {
  data() {
    return {
      flag: true,   //为true 导航条可见  为false导航条不可见
    };
  },
  //方法1  使用watch监听路由的变化
  watch: {
    $route: {
      handler(n) {
        this.flag = !n.meta.visible;
      },
      deep: true,
      immediate: true,
    },
  },
};
+
</script>

<style lang="scss" scoped>
.router-link-active {
  color: red;
}
</style>

```

#### 使用页面只显示404页面方法2

```
<template>
  <div>
  //使用一个div 将这三个组件包起来  然后使用 v-show="!$route.meta.visible"  点击的时候xxx的时候只显示404页面
    <div v-show="!$route.meta.visible">
      <router-link to="/"> 首页</router-link>
      <router-link to="/two">第二页</router-link>
      <router-link to="/xxx">xxx</router-link>
    </div>

    <RouterView msg="我是HelloWorld组件"></RouterView>
  </div>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped>
.router-link-active {
  color: red;
}
</style> 

```



### 配置404页面 在路由上操作的重要代码

```
{
		path:"/:pathMatch(.*)",
		component:()=>import("@/views/NotFound.vue"),
		meta:{    //路由对象的元信息
			visible:true    //true表示导航条是不可见的
		}
	  }
```



动态组件

<componedt :is="组件的名字" />

<keep-alive> 可以缓存

include 决定缓存哪个组件

~~~
<KeepAlive :include="['One']">
       <component :is="cname"></component>
      </KeepAlive>
~~~

## 路由

根据不同的url渲染不同的组件

vue-router 4 

## 路由有两种模式

hash  #    location.hash    onhashchange    createWebHashHistory()  

history模式     createWebHistory()

components 小组件  views 页面的组件

## 使用步骤

1. npm   i vue-router -S

2. 引入   import {createRouter,createWebHashHistory} from 'vue-router'

3. 创建实例   

   ~~~
   const router = createRouter({
       // 4. 内部提供了 history 模式的实现。为了简单起见，我们在这里使用 hash 模式。
       history: createWebHashHistory(),  //hash模式
       routes:[] 
     })
   ~~~

   

4. 使用路由插件

   ~~~
   app.use(router)
   ~~~

 5.组件里就可以使用 RouterLInk  和  RouterView  组件里

## 路由相关的样式

~~~
.router-link-active   对当前 routerLInk  组件有效，也对嵌套路由里的  routerlink 有效
.router-link-exact-active   只对当前 routerLInk  组件有效，对嵌套路由里的  routerlink  无效
~~~

## 异步组件

切换到这个组件的时候才进行加载，起到一个路由级别的代码分割的作用

~~~
   {
            path:"/two",
            component:()=>import("@/views/Two.vue")
        }
~~~

## 重定向命名路由别名

~~~
 {
            path:"/",
            // redirect:"/home"  //路由的重定向
            // redirect:{
            //     name:'home'
            // }
            redirect:"/h"
  },
 {       //Route对象
            path:"/home",
            name:"home",  //命名路由
            alias:'/h',  //别名
            component:Home
  },
~~~

## 404页面

~~~
{
            path:"/:pathMatch(.*)",
            component:()=>import("@/views/NotFound.vue")
 }
~~~

## meta

~~~
 meta:{   //元信息
              visible:true  //true 表示导航条不可见的
 }
 
     <div class="nav" v-show="!$route.meta.visible">
      <RouterLink to="/home">首页</RouterLink>
      <RouterLink to="/two">第二页</RouterLink>
      <RouterLink to="/xxx">xxx</RouterLink>
    </div>
~~~



# vue3第八天

### vue移动端适配 rem适配法

\- 安装 npm i amfe-flexible postcss-pxtorem -S

-安装 npm i normalize.css   重置css的样式

\- amfe-flexible 用于设置根字体大小的

\- postcss-pxtorem 用来自动转换单位的

\- 在根目录创建一个 .postcssrc.js

 \```
 module.exports = {
  plugins: {
   "postcss-pxtorem": {
    rootValue: 37.5,
    propList: ["*"],
   },
  },
 };
 \```

### main.js

```
一定要在main.js里面引入这两个文件
import 'normalize.css'
import  "amfe-flexible"
```

### 用自己手机检测移动端的适配

在vite.config.js中写下面的代码，用电脑给手机开热点，然后重启项目 ，会出现一个地址，用手机输入地址

```
server:{
    host:'0.0.0.0'
  },
```

### 代理跨域

#### 必须安装  npm i axios -S

#### vite.config.js  方法1

```
 server:{
    host:'0.0.0.0',
    proxy:{
      "/api":{
        "target":"http://47.94.148.165:3001",
        "changeOrigin":true,
        "rewrite":(path)=>path.replace(/^\/api/,'')
      }
    }
  },
```

### App.vue

```
<script>
import axios from 'axios'
  export default {
    mounted(){
      axios.get('/api/pro/list? count=1').then((res)=>{
        console.log(res)
      })
    }
  }
</script>
```





#### vite.config.js  方法2

```
server:{
    host:'0.0.0.0',
    proxy:{
      "/hg":{       //如果使用hg 那么需要使用rewrite把默认的hg去掉
        "target":"http://47.94.148.165:3001",
        "changeOrigin":true,
        
        rewrite: (path) => path.replace(/^\/hg/, ''),
      }
    }
  },
```

#### App.vue

```
<script>
import axios from 'axios'
  export default {
    mounted(){
      axios.get('/hg/api/pro/list? count=1').then((res)=>{
        console.log(res)
      })
    }
  }
</script>

```

### 放静态资源的

public  打包时不参与

assets  打包时参与

### 子路由

在components写一个文件夹用于存放对应路由的子路由，下面是子路由的写法

```
  {
      path: "/my",
      name: "my",
      component: () => import("../views/My.vue"),
      children: [
        {
          path: "tou",
          component: () => import("../components/my/tou.vue"),
        },
        {
          path: "xinx",
          component: () => import("../components/my/xinx.vue"),
        },
      ],
    },
```

### 子路由在父路由的写法

```
 <div>
    <router-link to="/my/tou">头像</router-link>
    <router-link to="/my/xinx">信息</router-link>
	<router-view></router-view>
  </div>
```

### route 和router 的区别

route   路由的对象   身上都是属性

router   是 vue  router的实例  身上都是方法

### 编程式导航

```
  <button @click="go('/cart')">购物车</button>
```

```
  methods:{
    go(path){
      this.$router.push(path)
    }
  }
```

go   ：go(-1) 返回     go(+1) 前进

back ： 返回

forward :前进按钮

push ：可以跳转到任何页面  同时可以返回当前页面

replace   替换  不能返回当前页面

addRoute

### 路由传值

#### 1.动态路由

```
 //路由传值方法1---动态路由传值
    {
      path:"/detail/:id",
      component:()=>import('../views/Detail.vue')
    },
    
    	<!-- //路由传值方法1---动态路由传值 -->
    <ul>
      <li v-for="(item, index) in list" :key="item.proid" class="row" @click="$router.push(`/detail/${item.proid}`)">
        <div class="item">
          <img :src="item.img1" alt="" />
          <h3>{{ item.proname }}</h3>
        </div>
      </li>
    </ul>
    
       //路由传值方法1---动态路由传值
  mounted() { axios.get(`/api/pro/detail/${this.$route.params.id}`).then((res) => {
    console.log(res.data);d1`	X
      if (res.data.code == "200") {
        this.deatilObj = res.data.data;
      }
    });
  },

//this.$route.params.id   拿到对应的值
```



#### 2.查询字符串传值

```
//路由传值方法1---查询字符串传值
    {
      path:"/xq",
      component:()=>import('../views/Detail.vue')
    },
    
    <!-- //路由传值方法1---查询字符串传值 -->
	<ul>
      <li v-for="(item, index) in list" :key="item.proid" class="row" @click="$router.push(`/xq?id=${item.proid}`)">
        <div class="item">
          <img :src="item.img1" alt="" />
          <h3>{{ item.proname }}</h3>
        </div>
      </li>
    </ul>
    
    //路由传值方法1---查询字符串传值
mounted() {
    axios.get(`/api/pro/detail/${this.$route.query.id}`).then((res) => {
      console.log(res.data);
      if (res.data.code == "200") {
        this.deatilObj = res.data.data;
      }
    });
  },
```



# vue3第九天

### 实现路由切换的动画效果

```
<template>
  <div class="box">
    <router-view v-slot:default="{ Component }">
      <Transition mode="out-in">   //必要的
        <component :is="Component"></component>
      </Transition>
    </router-view>
    <router-link to="/">首页</router-link>
    <router-link to="/about">关于</router-link>
  </div>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped>
.box {
  color: red;
}
//CSS的效果  必要的
.v-enter-from {
  transform: translateX(-100%);
}
.v-enter-active,.v-leave-active {
  transition: all 1s;
}
.v-leave-to {
  transform: translateX(100%);
}
</style>

```



### 配置全局 axios  

必须安装  npm i axios -S

配置全局axios   在main.js当中写这两句话  然后要使用axios的时候需要写成  this.axios....

```
import axios from 'axios'

app.config.globalProperties.axios=axios
```



### 防跳墙

#### 导航守卫的分类：

#### 1、全局的路由导航守卫:

#####              跳转前  beforeEach

##### vue3的防跳墙写法

```
//全局的路由的前置守卫
router.beforeEach((to,from)=>{
  console.log(to,from)  //to 目标路由对象  from 原路由对象
  if(to.fullPath==='/login'){   //运行进入登录界面
     return true;  //如果是 return false 不允许跳转  如果是 return true 允许跳转
  }
  else if(localStorage.getItem('token')){  //除了登录之外的界面，看有没有token，如果有token 说明登录过了  可以进入
      return true
    }
    else{
      //return false  //没有token 说明没有登录 所以不可以进入
      return {path:'/login'}    //没有token 说明没有登录 所以不可以进入  强制跳转到登录页面
    }
   
  
```

##### vue2的防跳墙写法

```
w28///vue2的防跳墙写法
router.beforeEach((to, from, next) => {
  console.log(to, from);
  if (to.fullPath === "/login") {
    //如果to.fullPath  等于 /login 进入登录页面
    next();79312+
  } else if (localStorage.getItem("token")) {
    //如果存在了token  那么就说明已经登录了  所以可以进入其他页面
    next();
  } else {
    //如果没有token  那么就说明没有登录 所以不能进入其他页面  强制跳转到登录页面
    //  next({path:'/login'})
    router.push("/login");
  }
});
```



​             跳转后  afterEach

2、路由独享的守卫

3、组件内的守卫



### vuex   

全局的状态管理工具

#### 安装 npm i vuex -S

在main.js写

```
import {createStore} from 'vuex'  //从vuex引入createStore的方法

const store=createStore({  //创建一个仓库
	state(){   //存储的所以组件都可以取到的变量   取仓库值的方法  this.$store.state.变量
		return{
			isLogin:false  //在仓库里存入isLogin 的值
		}
	},
	mutations:{   //存放修改的state 的同步方法
		changeLoginState(state,payload){    //在组件里调用 this.$store.commit("changeLoginState",true)
		
			state.isLogin=payload
		}
	}
})
app.use(store)  //使用仓库

```

Login.vue

```
this.$store.commit("changeLoginState",true)
```

App.vue

```
 <div v-show="$store.state.isLogin && !$route.meta.flag">
      <router-link to="/home">首页</router-link>
      <router-link to="/about">关于</router-link>
    </div>
    
```



### vuex状态的持久化

#### 安装    npm i -S  vuex-persistedstate

引入持久化仓库     import  persistedstate  from 'vuex-persistedstate'

使用持久化仓库     plugins:[persistedstate()] 

```
import  persistedstate  from 'vuex-persistedstate'  //引入持久化插件

import {createStore} from 'vuex'  //从vuex引入createStore的方法
const store=createStore({  //创建一个仓库
	state(){   //存储的所以组件都可以取到的变量   取值的方法  this.$store.state.变量
		return{
			isLogin:false  //在仓库里存入isLogin 的值
		}
	},
	mutations:{   //存放修改的state 的同步方法
		changeLoginState(state,payload){    //在组件里调用 this.$store.commit("changeLoginState",true)
			state.isLogin=payload
		}
	},
	plugins:[persistedstate()]  //使用持久化插件
})
app.use(store)  //使用仓库
```



#### 生成vuex的代码

首先使用

vue -V   检测版本号

npm i @vue/cli -g （一个电脑只安装一次，如果安装过了就不用安装了  用vue -V检测是否有版本号 有就直接输入指令 vue add vuex 就会自动生产一个store， 没有就使用该语句安装在输入指令 vue add vuex 就会自动生产一个store ）

#### 自动安装仓库

vue add vuex  



##### 没有登录时，可以跳转到其他页面，和不可以跳转某一个页面,下面是不可以跳转到about页面

```
{
      path: "/about",
      name: "about",
      meta:{
        needLogin:true
      },
      component: () => import("../views/AboutView.vue"),
    },
    
    
router.beforeEach((to, from) => {
  if (!to.meta.needLogin) {
    return true;
  } else if (localStorage.getItem("token")) {
    return true;
  } else {
    return { path: "/login" };
  }
});
```



# vue3第十天

#### 导航守卫的分类：

#### 1、全局的导航守卫:

#####                 跳转前  beforeEach-------监控每次路由跳转之前执行的回调

#####   跳转后  afterEach-------监控每次路由跳转之后执行的回调

```
每页标题栏显示对应的文字的方法一：
在App.vue里面写 
 <h2>{{ title }}</h2>
 
<script>
export default{
  data(){
    return{
      title:''
    }
  },
  created(){
    this.$router.afterEach((to,from)=>{
      if(to.fullPath==='/'){
        // document.title='首页'
        this.title='首页'
      }else if(to.fullPath==='/about'){
        this.title='关于'
      }else{
        this.title='其他'
      }
    })
  }
}
</script>
```



```
每页标题栏显示对应的文字的方法二：

在APP.vue里面拿到标题
    <h2>{{ $route.meta.title }}</h2>

在router--index.js对应的路由写上meta  并且写上对应的文字
 meta:{
        title:'首页'
      }
```



#### 2、路由独享的守卫

```
在对应路由位置写：----拦截特定的路由跳转
beforeEnter(to,from,next){
        if(prompt('请输入密码')==='haiou'){
          next()
        }
      },
```



#### 3、组件内的守卫

beforeRouteEnter

beforeRouteLeave

beforeRouteUpdate



用于模拟后端数据库：

 安装  npm i json-server -g   (全局安装 每一个电脑只能安装一次)

检测是否安装了上面的那个   json-server --version

然后再 src下面建立一个文件夹mock  再mock文件夹下面建立一个文件data.json 再里面写数据

```
{
  "list": [
    { "id": 1, "name": "海鸥", "flag": "true" },
    { "id": 2, "name": "哈哈哈", "flag": "false" },
    { "id": 3, "name": "嘻嘻嘻", "flag": "true" }
  ]
}
```

在集成终端运行   json-server data.json  之后出来地址  http://localhost:3000/list

然后再仓库的actions 发送请求

```
  actions: {
    getList(){
      axios.get('http://localhost:3000/list').then((res)=>{
        console.log(res)
      })
    }
  },
```

之后再做点击按钮获取后端数据

```
<button @click="$store.dispatch('getList')">获取列表</button>
```



### 仓库分模块

#### 没分模块之前：

```
import { createStore } from "vuex";
import axios from "axios";
export default createStore({
  state: {  //存放数据
    n: 23323,
    list: [],
  },
  getters: { //存放计算属性
    selecteCount(state) {
      return state.list.filter((item) => item.flag).length;
    },
  },
  mutations: { //存放的同步方法 commit
    changeN(state, payload) {
      state.n += payload;
    },
    selectAllNone(state, payload) {
      //全选全不选
      state.list.forEach((item) => (item.flag = payload));
    },
    changeList(state, payload) {
      //修改列表的数据
      state.list = payload;
    },
  },
  actions: {  //存放异步的方法  dispatch
    getList(context, payload) {
      //context  上下文对象---（commit方法可以调用mutations里面的方法）  payload 参数
      axios.get("http://localhost:3000/list").then((res) => {
        console.log(res);
        context.commit("changeList", res.data); //异步成功以后，要调用mutations里的同步方法修改数据
      });
    },

    addNum(context, payload) {
      setTimeout(() => {
        context.commit("changeN", payload);
      }, 2000);
    },
  },
  modules: {},
});

```



#### 分模块之后： 

分仓库后   分完模块后需要在Test.vue文件中的代码对应的位置前添加模块名

在仓库store中建立文件夹counter/index.js

```
export default {
  namespaced: true,
  state: {
    //存放数据
    n: 23323,
  },

  mutations: {
    //存放的同步方法 commit
    changeN(state, payload) {
      state.n += payload;
    },
  },
  actions: {
    addNum(context, payload) {
      setTimeout(() => {
        context.commit("changeN", payload);
      }, 2000);
    },
  },
};

```

在仓库store中建立文件夹list/index.js

```
import axios from "axios";
export default{
	namespaced: true,    写这个的时候  需要在test.vue文件中对应代码对应位置添加模块名/  例如： /list
	state: {
		//存放数据
		list: [],
	  },
	  getters: {
		//存放计算属性
		selecteCount(state) {
		  return state.list.filter((item) => item.flag).length;
		},
	  },
	  mutations: {
		selectAllNone(state, payload) {
		  //全选全不选
		  state.list.forEach((item) => (item.flag = payload));
		},
		changeList(state, payload) {
		  //修改列表的数据
		  state.list = payload;
		},
	  },
	  actions: {
		//存放异步的方法  dispatch
		getList(context, payload) {
		  //context  上下文对象---（commit方法可以调用mutations里面的方法）  payload 参数
		  axios.get("http://localhost:3000/list").then((res) => {
			console.log(res);
			context.commit("changeList", res.data); //异步成功以后，要调用mutations里的同步方法修改数据
		  });
		},
	  },
}
```

#### 总仓库：

```
import { createStore } from "vuex";
import counter from "./counter";
import list from "./list";
export default createStore({

  modules: {
    counter,list
  },
});

```

#### views/Test.vue

```
<template>
  <div>
    <!-- {{ $store.state.n }} -->
    {{ n }}
    <button @click="inc">+</button>
    <button @click="add">+10</button>
    <input type="checkbox" v-model="select" />
    <ul>
      <li v-for="item in list" :key="item.id">
        <input type="checkbox" v-model="item.flag" />
        {{ item.name }}
      </li>
    </ul>
    {{ count }}
    <button @click="$store.dispatch('list/getList')">获取列表</button>
  </div>
</template>

<script>
//引入lodash
// import _ from "lodash";
export default {
  // created(){
  // 	this.fun=_.debounce(()=>{
  // 		this.$store.commit('changeN',100)
  // 	},1000)
  // },
  computed: {
    n() {
      return this.$store.state.counter.n;  //在对应的
    },
    list() {
      return this.$store.state.list.list;   //
    },
    count() {
      return this.$store.getters['list/selecteCount'];
    },
    select: {
      set(v) {
        this.$store.commit("list/selectAllNone", v);
      },
      get() {
        return this.$store.state.list.list.every((item) => item.flag);
      },
    },
  },
  methods: {
    inc(){
    	this.$store.commit('counter/changeN',10)
    },
    //节流的写法：
    // inc: _.debounce(function () {
    //   this.$store.commit("changeN", 10);
    // }, 1000),


    add() {
      this.$store.dispatch("addNum", 10);
    },
  },
};
</script>

<style lang="scss" scoped></style>

```





# 老师的笔记

## 路由的导航守卫

​      全局守卫

​				beforeEach

 router.beforeEach((to,from)=>{  //to    path fullPath matched meta  params query.....

  console.log(to.matched)  //to.matched 当前匹配路径的路由对象(数组)

   return true;

 })

​				afterEach

               ~~~

  this.$router.afterEach((to,from)=>{
               if(to.fullPath==="/"){
                 this.title="首页"
               }
               else if(to.fullPath==='/about'){
                this.title="关于"
               }
               else{
                this.title="默认"
               }
          })
               ~~~



​	  路由独享的守卫

~~~
 beforeEnter(to,from,next){
        if(prompt("输入密码")==="admin"){
             next();
        }
      },
~~~



​      组件内的守卫

​		 beforeRouteEnter

        ~~~
     beforeRouteEnter(to,from,next){  //监听组件里路由刚刚进入时触发 执行事件比 beforeCreate 早
      console.log(to.params.n)
      next((vm)=>{
        console.log(vm.color)
      });
    },
    beforeCreate(){
      console.log("beforeCreate")
    },

 










        ~~~

​		 beforeRouteLeave

      beforeRouteLeave(to,from,next){
      if(this.flag){
        next();
      } 
      else{
        alert("不能退出,请先交卷")   
      } 
    },
        ~~~



​        beforeRouteUpdate

~~~
  // beforeRouteUpdate(to,from){
    //     console.log(to.params.n)
    // },
~~~

## vuex

state 存放数据的对象

mutations  存放修改状态的同步方法

getteres 仓库里的计算属性

~~~
getters: {
    selectedCount(state){  //选中的商品的数量
      return state.list.filter(item=>item.flag).length
    }
  },
  
  //获取仓库里面的数据
 this.$store.getters.selectedCount   // ------------this.$store.getters. 变量
~~~



## actions 

~~~
  actions: {  //存放异步的方法  dispatch
     getList(){
        axios.get("http://localhost:3000/list").then((res)=>{
          console.log(res)
        })
     }
  },
  
  this.$store.dispatch('getList')
~~~

## mock数据

~~~
npm i json-server -g

json-server -v

json-server  xxx.json   //运行对应的json文件

~~~

在src下面建立一个文件夹mock，在在mock文件夹中建立文件data.json  数据格式如下： 

使用 json-server  data.json 在data.json的集成中端运行该文件  //运行对应的json文件

```
{
    "list":[
        {
            "id":1,
            "name":"aaa",
            "flag":true
          },
          
            {
              "id":2,
              "name":"bbb",
              "flag":false
            },
            {
              "id":3,
              "name":"ccc",
              "flag":false
            }

    ]
}
```

## action和节流（防抖和节流）

## vuex的单向数据流



## 分模块

~~~
==========store/counter/index.js
export default {

namespaced:true   //开启命名空间

    state: {   //存放数据
        n:666,
    },
    mutations: {  //存放的同步的方法  commit 
        changeN(state,payload){
            state.n+=payload
        }

     },
     actions: {  //存放异步的方法  dispatch
        asyncAdd(context,payload){
           setTimeout(()=>{
               context.commit("changeN",payload)
           },2000)
        }
     }


}

=========store/list/index.js
import  axios from 'axios'
export default {

namespaced:true   //开启命名空间
    state: {   //存放数据
     
        list:[      
        ]
    },
    getters: {  //存放计算属性
      selectedCount(state){  //选中的商品的数量
        return state.list.filter(item=>item.flag).length
      }
    },
    mutations: {  //存放的同步的方法  commit 
    
       selectAllNone(state,payload){  //全选全不选
          state.list.forEach(item=>item.flag=payload)
       },
       changeList(state,payload){  //修改列表数据
          state.list=payload
       }
    },
    actions: {  //存放异步的方法  dispatch
       getList(context,payload){  //context 上下文对象 （commit方法可以调用mutations里的方法)   payload 参数
          axios.get("http://localhost:3000/list").then((res)=>{
            context.commit("changeList",res.data)  //异步成功以后，要调用mutations里的同步方法修改数据
          })
       }
    }
}

==============store/index.js
import { createStore } from 'vuex'
import list from './list'
import counter from './counter'
export default createStore({
  modules: {
    list,counter
  }
})

this.$store.state.模块名.变量
~~~

分完模块后 在组件里面  对应的数据之前要添加对应的文件名 例如：...list.list...

分完模块后。getters重名会报错  mutations  actions重名多个模块都会调用

为了区分分模块后的getters ,mutations，actions要启用命名空间

namespaced:true

## 四个辅助函数

~~~
import {mapState,mapGetters,mapMutations,mapActions} from 'vuex';

 computed:{
        ...mapState({
            n:(state)=>state.counter.n,
            list:(state)=>state.list.list
        }),
        ...mapGetters({
            count:'list/selectedCount'
        }),
       
        select:{
            set(v){
               this.selectAllNone(v)
            },
            get(){

                return this.list.every((item)=>item.flag)
            }
        }
       
    },
    
    methods:{
        ...mapMutations({
            selectAllNone:"list/selectAllNone",
            changeN:"counter/changeN"
        }),
        inc(){
            this.changeN(10)
        //    ( _.debounce(()=>{
                // this.$store.commit("counter/changeN",10)
            // },2000))()
        },
        ...mapActions({
            asyncAdd:"counter/asyncAdd",
            getList:"list/getList"
        })
    }
~~~



# vue3第十一天

### watch和computed的区别

watch:当  watch依赖多个值的时候，每个值都要分别监控；能监听异步；没有缓存

computed:当  computed依赖多个值的时候，如果有一个值变化了，计算属性就会变化；不能监听异步；有缓存

### 选项式语法

### setup  ----组合式语法（组合式api)

最早执行的钩子函数 setup   setup里面不能写钩子函数beforeCreate和created     使用其他钩子函数时需要在钩子函数前面写on 然后引入

```
import { ref,reactive,onMounted} from "vue";

onMounted(()=>{
  console.log('onMounted')
})
```



```
//需要引入ref
import { ref,reactive } from "vue";

//然后再setup里面写数据、方法等等   当值改变的时候用ref   当引用类型的数据的属性改变的时候用reactive
setup() {  //组件式api
    console.log("setup", this); 
    let k = ref(0); //ref 声明的变量相当于data里的响应式数据不调用ref没有响应式
    let money = ref(100);
    let obj = reactive({   //最重要的函数  让对象产生响应式  使对象的属性具有响应性
      a:1
    })
    const inc = () => { //这个函数相当于methods里的方法
      k.value++;    //ref 声明的变量，使用时加上  .value
      obj.a++
    };
    return {   //无论是数据还是方法都必须return  才能在模板里面使用
      k,
      money,
      inc,
      obj
    };
  },
```

### setup的语法糖：

直接在script里面写setup  之后直接不要写export default   也不需要写return 就可以直接使用了



复合api子接收父传过来的值使用  defineProps

```
defineProps({
  msg: {
    type: String,
    required: true
  }
})
```



### UI库(vant)

#### 安装  npm i vant -S

### 使用

在main.js中引入    Button示例

```
import { createApp } from 'vue';
import { Button } from 'vant';

const app = createApp();
app.use(Button);
```



## 1.复习选项式的语法

## 2.setup使用

~~~
  import { ref } from 'vue';
  setup(){  //组件式api
    console.log("setup",this);
     let k = ref(0);  //ref 声明的变量相当于data里的响应式数据不调用ref没有响应性
     let money=ref(100)
     const inc=()=>{    //这个函数相当于methods里的方法
        k.value++;  //ref 声明的变量，使用时加上 .value
     }
     return {
      k,money,inc   //无论是数据还是方法必须return 才能在模板里使用
     }
  }
~~~

## 3.ref和reactive

~~~
 setup(){  //组件式api
    console.log("setup",this);
     let k = ref(0);  //ref 声明的变量相当于data里的响应式数据不调用ref没有响应性
     //当你改变值得时候要用ref
     //当应用类型的数据属性变化的时候要用 reactive
     let money=ref(100)  // 本质  相当于  reactive({value:xxxx})
     let obj =ref({  //最重要的函数   是对象的属性具有响应性
         a:1
     })
     const change=()=>{
         obj.value={
          b:5
         }
     }
     const inc=()=>{    //这个函数相当于methods里的方法
      //  k.value++;  //ref 声明的变量，使用时加上 .value
      obj.a++
     }
     return {
      k,money,inc,obj,change  //无论是数据还是方法必须return 才能在模板里使用
     }
  }
~~~

<script setup> 就不用注册组件，不用 export default   不用 return 




## 4.watch和computed

~~~
watch(obj, (n) => {
  console.log(n.a)
}, {
  deep: true,
  immediate: true
})

let money1=computed(()=>price.value*count.value);
~~~

## 5.生命周期钩子函数

~~~
onMounted(() => {   //setup 里不能用 beforeCreate,created  其他钩子前面加on 
  console.log("onMounted")
})
~~~

## 6.UI库(vant)

官网

~~~
https://vant-contrib.gitee.io/vant/#/zh-CN
~~~

安装

~~~
npm i vant -S
~~~

使用

~~~
main.js
import 'vant/lib/index.css';
import {Button} from 'vant'
app.use(Button)
~~~





# vue3第十二天

### 内件组件

使用 teleport 使页面全部被遮盖住

```
 <teleport to="body">
      <van-overlay :show="show1" @click="show1 = false" />
    </teleport>
```



## vant组件

### 1.Notify组件

### 2.CountDown组件

### 3.Overlay组件

### 4.Popup组件

### 5.form

~~~
  <van-form @submit="submithandle">
      <van-field v-model="username" name="用户名" label="用户名" placeholder="用户名"
        :rules="[{ required: true, message: '请填写用户名' }]" />
        <van-field v-model="phone" name="手机号" label="手机号" placeholder="手机号"
        :rules="[{ required: true,pattern:/^1[3456789]\d{9}$/,  message: '请填写手机号' }]"  />
      <div style="margin: 16px;">
        <van-button round block type="primary" native-type="submit">
          提交
        </van-button>
      </div>
    </van-form>
~~~

### 6.购物车相关组件

~~~
<van-checkbox-group v-model="result">
            <van-checkbox v-for="item in list" :key="item.proid" :name="item.proid">
                <van-card :num="item.num" :price="item.originprice"  :title="item.proname"
                    :thumb="item.img1" />
            </van-checkbox>
        </van-checkbox-group>
~~~

### 7.地址编辑组件

~~~
<template>
    <div>
        <van-address-list v-model="chosenAddressId" :list="list" default-tag-text="默认" @add="onAdd" @edit="onEdit" />

        <van-popup v-model:show="show" position="bottom" :style="{ height: '70%' }">
            <van-address-edit :area-list="areaList" :address-info="addressInfo" show-delete show-set-default show-search-result
                :search-result="searchResult" :area-columns-placeholder="['请选择', '请选择', '请选择']" @save="onSave"
                @delete="onDelete" @change-detail="onChangeDetail" />
        </van-popup>
    </div>
</template>

<script>
import { areaList } from '@vant/area-data';
export default {
    data() {
        return {
            areaList,
            chosenAddressId: "1",
            searchResult: [],
            addressInfo:{},
            list: [
                {
                    id: '1',
                    name: '张三',
                    tel: '13000000000',
                    address: '浙江省杭州市西湖区文三路 138 号东方通信大厦 7 楼 501 室',
                    isDefault: true,
                    province:"浙江省",
                    city:'杭州市',
                    county:'西湖区',
                    addressDetail:'文三路 138 号东方通信大厦 7 楼 501 室'
                },
                {
                    id: '2',
                    name: '李四',
                    tel: '1310000000',
                    address: '浙江省杭州市拱墅区莫干山路 50 号',
                    province:"浙江省",
                    city:'杭州市',
                    county:'拱墅区',
                    addressDetail:'莫干山路 50 号'

                },
            ],
            show: false,
            curIndex:-1,

        }
    },
    methods: {
        onSave(item) {
            if(this.curIndex===-1){//添加
                 this.list.push({
                    id:(this.list.length+1)+"",
                    ...item
                 })
            }
            else{ //修改
                this.list[this.curIndex]={...item}
            }
            
            this.show=false;
            this.curIndex=-1;
            this.addressInfo={}
        },
        onAdd() {
            console.log("onAdd")
            this.show = true;
        },
        onDelete(curItem) {
            let index= this.list.findIndex(item=>item.id===curItem.id);
            this.list.splice(index,1)
            this.show=false;
            this.curIndex=-1;
            this.addressInfo={}
        },
        onChangeDetail(val) {
            if (val) {
                this.searchResult = [
                    {
                        name: '黄龙万科中心',
                        address: '杭州市西湖区',
                    },
                ];
            } else {
                this.searchResult= [];
            }
        },
        onEdit(item,index) {
           this.curIndex=index
           this.addressInfo={...item};
           this.show=true;
        }
    }
}

</script>
~~~

### 8.列表组件



# vue3第十三天

### 打包

首先需要把路由设置为hash模式，base要设置为 ./

## axios的二次封装（为了每次发请求的时候重复的代码只写一次)

环境几种

import.meta.env.MODE(vite官网)应用运行的模式

开发环境      development

测试环境

生产环境      production

~~~
路由要设置为hash模式
base:"./"
~~~



service/index.js

~~~
import axios from 'axios'
if(import.meta.env.MODE==="development"){
    url="/api"   //开发环境
}
else if(import.meta.env.MODE==="production"){
    url="http://47.94.148.165:3001/api"   //开发环境 
}
let instance = axios.create({
    baseURL:url
})

export default instance
~~~

方法二:

~~~
.env.production
VITE_APP_BASE_URL="http://47.94.148.165:3001"
~~~

~~~
.env.development
VITE_APP_BASE_URL=""
~~~

~~~
import axios from 'axios'
let instance = axios.create({
    baseURL:import.meta.env.VITE_APP_BASE_URL+"/api" //开发环境 /api 生成环境 http://47.94.148.165:3001
})

export default instance
~~~



import axios from '../server/index.js'

## 打包遇到的问题

1.路由要变为hash模式

~~~
import { createRouter, createWebHashHistory } from 'vue-router'


const router = createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL)
  }）
~~~

2.打包后请求数据请求不到

设置不同模式下不同的url，把baseURL改为获取数据的服务器ip地址

## 拦截器（interceptors)

请求拦截器

~~~
instance.interceptors.request.use((config)=>{  // 请求拦截器
     if(localStorage.getItem("token")){
        config.headers["token"]=localStorage.getItem("token");
     }
    return config;
})
~~~



响应拦截器

~~~
instance.interceptors.response.use((res)=>{ //响应拦截器
    if(res.data && res?.data?.data.token){  //如果有token ,token就存储到本地存储里
        localStorage.setItem("token",res.data?.data?.token)
    }
    showNotify({   //显示服务器端发回的消息
        type:res.data.code=="200"?'success':'danger',
        message:res.data.message
    })
    return res.data;  //所有请求的返回值都少写一个data
})
~~~

## vue管理系统项目

1. npm i  axios      -S
2. vue add vuex
3. npm i element-plus -S
4. npm i normalize.css
5. git init 
6. git  add .
7. git commit -m "xxxx"
8. git remote add origin  仓库地址
9. git push origin master 
10. git  clone  仓库地址(第一次)
11. cd 项目目录     git    pull





### 防跳

```
//用导航守卫进行登录的防跳
router.beforeEach((to, from) => {
  if (to.fullPath == "/login") {
    if(localStorage.getItem('token')){
      return {path:'/home'}
    }else{
      return true
    }
  } else if (localStorage.getItem("token")) {
    return true;
  } else {
    return { path: "/login" };
  }
});
export default router;

```





# vue3第十八天

### echarts的使用   npm i echarts -S

## git ssh方式上传

~~~
ssh-keygen -t rsa -C xxxx@yy.com
~~~

 找到.ssh目录

.pub文件的内容复制 贴到 gitee账号 /设置/ssh公钥

git remote  -v  查看所有链接

git remote add origin1 ssh地址   添加一个远程链接

git  add .   提交文件从工作区到暂存区

git commit -m "xxx"  把文件从暂存区提交到本地仓库

git push orgigin1 master  推送本地仓库文件到远程仓库

## tinymce

~~~
http://tinymce.ax-z.cn/
~~~

## echarts使用



# vue3第十九天

### ref和reactive的区别

ref是简单数据类型   监控简单值得变化  适合使用在值的变化上面

 reactive是引用数据类型  监控数据对象得属性得变化  适合使用在对象值得变化



### setup的用法

```
<script setup>
import { RouterLink, RouterView, useRouter } from "vue-router";;

let router = useRouter();
const push= (path) => {
  router.push(path);
};
</script>


<nav>
        <RouterLink to="/">Home</RouterLink>
        <RouterLink to="/about">About</RouterLink>
        
        //使用button代替RouterLink
        
        <button @click="push('/')">hong</button>
        <button @click="push('/about')">about</button>
      </nav>

```

### pinia





### 安装tsc  npm i typescript -g

### 检测tsc   tsc --version

###  将tsc转换成js   tsc -w   在集成终端输入



## 组合式api

### 1.ref和reactive

~~~
<template>
  <div>
      <input v-model="str"  @keyup.enter="add" />{{ str }}
      <ul>
        <li v-for="(item,index) in todos" :key="index">{{ item }}</li>
      </ul>
  </div>
</template>

<script setup>
import { ref,reactive } from 'vue';

    let str=ref("");
    let todos=reactive([]);
    const add=()=>{
        todos.push(str.value);
        str.value=""
    }

</script>
~~~

### 2.toRefs

是对象的属性结构后具有响应性

### 3.计算属性

~~~
<template>
  <div class="about">
    <h1>This is an about page ! price: {{price }}count:{{ count }}</h1>
    <button @click="addA">+</button> {{ money }}
  </div>
</template>
<script setup>
import { reactive,toRefs,computed } from 'vue';

  let obj=reactive({
    price:2,
    count:3
  })
  let {price,count}=toRefs(obj);
  let money=computed(()=>obj.price*obj.count) //计算属性
  const addA=()=>{
     obj.count++;
  }
</script>
~~~

### 4.useRouter和useRoute

~~~
let router=useRouter();
const go=(path)=>{
  router.push(path)
}

let route = useRoute();
~~~

### 5.watch

~~~
watch(route, (n) => {  //动态的面包屑导航
  routes.value = n.matched;
})
~~~

### 6.组合式api的自定义函数

~~~
import { ref, reactive } from 'vue';
export let str = ref("");
export const useTodos = (str) => {  //str 就是文本框的内容
    let todos = reactive([]);  //代办事项列表

    const add = () => {
        todos.push(str.value);
        str.value = ""
    }
    return {
        todos,
        add
    }

}


~~~

### Pinia

~~~
export const useCounterStore=defineStore('counter',{
  state(){
    return {
       n:666   //状态
    }
   
  },
  getters:{
    doubleN(state){
       return state.n*2;   //计算属性
    }
   
  },
  actions:{  //同步的方法异步的方法都放到这里
    inc(){
       this.n++
    }
   
  }
})
~~~

组件

~~~
<template>
    <div>
            test  {{ n }} <button @click="couterStore.inc">+</button>
            {{ couterStore.doubleN }}
    </div>
</template>

<script setup>
   import {storeToRefs} from 'pinia'
    import {useCounterStore} from '@/stores/counter'
    let couterStore=useCounterStore();
   console.log(couterStore)
    let  {n}=storeToRefs(couterStore)  //storeToRefs 使解构出来的数据具有响应性
    console.log(n.value)
 
</script>
~~~

### pinia持久化

~~~
npm  i  pinia-plugin-persistedstate -S

import piniaPluginPersistedstate from 'pinia-plugin-persistedstate'
let piniains = createPinia()
piniains.use(piniaPluginPersistedstate)
app.use(piniains)

store/counter.js
....
 persist: {
    enabled: true // true 表示开启持久化保存
  }
....
~~~

### 父子组件传值

~~~
<TestSon :n="n" @msg="receive"></TestSon> // 父组件
<template>
    <div>
            testSon  {{ n }}
            <button @click="send">send</button>
    </div>
</template>
<script setup>
 const receive=(newV)=>{
        receiveN.value=newV
    }
</script>
-----------------------------------------------------------------------------------
子组件
<script setup>
    let props= defineProps({  //接收父组件传过来的值
        n:Number
    })
    let emit =defineEmits(['msg'])  //定义发送对象 ,参数是数组，里面是要发送的事件
    const send=()=>{
        emit("msg",props.n+1)   //发送新值给父组件
    }
</script>
~~~

### 父组件调用子组件里的方法

~~~
子组件里暴露方法
 const fun=()=>{
        console.log("Fun")
}
defineExpose({  //暴露fun方法给父组件使用
    fun
})
父组件用ref标识组件
<TestSon :n="n" @msg="receive" ref="testson"></TestSon>
  const testson=ref()  //找到了子组件
  testson.value.fun()   //父组件调用子组件里的方法
~~~

## typescript

npm   i  typescript -g

tsc --version

tsc --init 会产生一个tsconfig.json 



# tsc 第二十天

### 配置路径  在tsconfig.json中

29行    "rootDir": "./src",   

58行     "outDir": "./dist", 



### 提交tsc到git

git init    

git add .

git commit -m "tsc第一次提交"

git log

git log --pretty=oneline



### interface和type的区别

type不能重复定义 interface可以

type 除了对象外也可以约束基本数据类型  interface约束的是对象

 type 不可以继承  interface 可以用extends继承



## git版本管理

git log  提交的日志记录

git reflog 查看所有的日志记录

git reset --hard  xxxxxxxxx

## ts中的class

~~~
class Person {
   // static xq:string="earth";  //静态属性 用类型可以直接调用的属性 
    protected name:string;  //public  任何地方都可以访问  private 只有类的内部可以访问
              //protected 只有自己和派生类可以访问
    age:number; 
    constructor(name:string,age:number){
        this.name=name;
        this.age=age;
    }
    say():string{
        return this.name+","+this.age;
    }
}
//console.log(Person.xq)
// let p = new Person("zs",10);

// console.log(p.say())

 class Student  extends Person{
        school:string;
        constructor(name:string,age:number,school:string){
            super(name,age);
            this.school=school
        }
        say(): string {
         
            return super.say()+','+this.school;
        }
 }

 let s = new Student("ls",18,'qf');
 console.log(s.say())
~~~

## ts中的接口(interface)

### 1.属性接口

~~~
//对对象进行约束
interface  iPerson{  //接口定义的是规范
     name:string,
     age:number,
     //school?:string  //可选属性
   // [key:string]:any
}

// interface iPerson{  //可以重名 ，重名的属性合并
//     height:number,
//     city:string
// }
interface iStudent extends iPerson{  //可以继承 
    school:string
}

let p:iStudent={
    name:'zs',
    age:15,
    school:"www"
   
}
~~~

### 2.函数类接口

~~~
 interface ISum{  //这个接口是约束函数的
       (a:number,b:number):number
    }
    let sum:ISum=(a:number,b:number)=>a+b
~~~

### 3.类类型接口

~~~
interface iAnimal{
    eat:()=>string
}
class Dog implements iAnimal{  //类实现接口，一定要实现(implements)接口里的方法
    eat(){
        return "dog eat sth"
    } 
    
}
~~~

## 泛型

~~~
interface IArr<T>{  //泛型
    [index:number]:T
}

let arr:IArr<number>=[1,2]

~~~

### 泛型函数

~~~
function sum2<P>(x:P):P{
    return (x as any)+(x as any)
}
console.log(sum2<string>("hello"))
~~~

### 泛型类

~~~
class IWorker<T> {
    no:T;
    name:string;
    constructor(no:T,name:string){
        this.name=name;
        this.no=no;
    }
    say():string{
        return this.no+','+this.name
    }
}

let w=new IWorker<number>(1,'zs');
console.log(w.say())
~~~

### 泛型接口

~~~
interface iDou<T>{
    (x:T):T
}

function funDouble<T>(x:T):number{
    return (x as number)*2
}

console.log(funDouble<number>(666))
~~~

# vue3+ts

## 基本约束

~~~~
import {reactive, ref} from 'vue'
    let  n= ref(666)
    const add=(p:number)=>{
       n.value+=p
    }
    let str=ref("");
    let list:Array<string>=reactive([]);
    const addItem=(e:KeyboardEvent)=>{
      // list.push(str.value);
      // str.value=""
      list.push((e.target as HTMLInputElement).value);
      (e.target as HTMLInputElement).value=""
    }
   
   <template>
   <div>hello  {{ n }} <button @click="add(10)">add</button>
  
    <br />
    <input type="text"  @keyup.enter="addItem($event)" />
    <ul>
      <li v-for="(item,index) in list" :key="index">
        {{ item }}
      </li>
    </ul>
  </div>
   
</template>
~~~~

## type 自定义类型

~~~
 //interface的区别
    //不能重复定义，interface可以
    //interface约束的是对象  type储里对象外也可以约束基本数据类型
    //interface 可以用extends 继承  type不可以
~~~

]