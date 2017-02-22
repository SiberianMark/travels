gainian: wu li shang shi canvas hua de yi zhang tupian :ye jiu shi xu ni dom de wu li cun zai yi yi yuan li

export defalut: 默认导出，这样vue实例会默认渲染导出的模板


vue实例里面 el:挂载元素；temlate :渲染模板

vue生命周期：

beforeCreate:VUE Vitual DOM创建之前
 data:
 event:
Created:创建成功；

before mouted:挂载之前

mouted:挂载成功 this 改变 this.$el

beforeUpdated:数据改变时触发
updated:


components:{}:注册组件以及导入文件为标签

components:{
	hello:Hello,
	myCompo:mycomponent//局部注册
}

全局注册；
Vue.component('myComp',myComponent);

组件：(嵌套组件)
var mycomponent=Vue.extend({
	template:'<div>This is my first Component</div>'
	components:{
	 hello:Hello
	}
});

build:打包好的配置文件


config:
	dev.env.js 开发环境配置

node_modules:插件包

src:项目源码

static：第三方插件包
	main.js:应用入口文件

index.html:项目入口文件HTML

package.json:项目 包的配置文件



1. main.js :将大的App.vee 插入 #app下
2. index.html
3. app.vue 包含第二级插件
4. 第二级插件包含第三级
5. 。。。


思路：
1. 先在app.script下开始逐层编写应用的插件树