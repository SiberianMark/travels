VueThink
===============

## 项目介绍
VueThink是一套基于Vue全家桶（Vue2.x + Vue-router2.x + Vuex）+ Thinkphp的前后端分离框架。
脚手架构建也可以通过vue官方的vue-cli脚手架工具构建
实现了一般后台所需要的功能模块

VueThink不仅适用于管理后台或管理系统开发，且广泛适用于B/S架构的项目开发。VueThink是对前后端分离技术的应用实践，2016年由洪睿科技的技术团队研发并投入商业开发使用，已有许多的商业项目实践。而今框架开源，希望能有更多志同道合的伙伴参与VueThink的迭代 ^_^

## 使用许可：
VueThink是基于MIT协议的开源框架，它完全免费。你可以免费下载VueThink，用来搭建自己的或者团体的软件。

##主要适用技术栈
* 后端框架：ThinkPHP 5.x
* 前端MVVM框架：Vue.JS 2.x
* 开发工作流：Webpack 1.x
* 路由：Vue-Router 2.x
* 数据交互：Axios
* 代码风格检测：Eslint
* UI框架：Element-UI 1.1.6
* JS函数库：Lodash

> VueThink的运行环境要求PHP5.4以上。

详细开发文档参考 [ThinkPHP5完全开发手册](http://www.kancloud.cn/manual/thinkphp5)


* 登录、退出登录
* 修改密码、记住密码
* 菜单管理
* 系统参数
* 权限节点
* 岗位管理
* 部门管理
* 用户组管理
* 用户管理

### Demo
演示地址：<http://demo.vuethink.com>

用户名：user01

密码：user01

### QQ群交流
欢迎加入qq群：340506819

### 开发依赖
* vue <https://vuefe.cn/v2/guide/>
* element-ui@1.1.3  <http://element.eleme.io/1.1/#/zh-CN/component/installation>
* axios  <https://github.com/mzabriskie/axios>
* fontawesome <http://fontawesome.io/icons/>
* js-cookie  <https://github.com/js-cookie/js-cookie>
* lockr  <https://github.com/tsironis/lockr>
* lodash  <http://lodashjs.com/docs/>
* moment  <http://momentjs.cn/>


### 数据交互
数据交互通过axios以及RESTful架构来实现

用户校验通过登录返回的auth_key放在header

值得注意的一点是：跨域的情况下，会有预请求OPTION的情况

附上接口文档：<http://api.vuethink.com>

### Server搭建
服务端使用的框架为thinkphp5.搭建前请确保拥有lamp/lnmp/wamp环境。

集成环境推荐使用phpstudy：<http://www.phpstudy.net/> 

这里所说的搭建其实就是把server框架放入WEB运行环境，并使用80端口。

导入服务端根文件夹数据库文件install.sql，并修改config/database.php配置文件。

* PHP >= 5.4.0
* PDO PHP Extension
* MBstring PHP Extension
* CURL PHP Extension

服务端开发手册请参考：<http://www.kancloud.cn/manual/thinkphp5/118003>

当访问 <http://localhost>, 出现“vuethink接口”即代表后端接口搭建成功。

p.s 如果使用的nginx服务，请设置重写规则
```
location / {

    if (!-e $request_filename) {

        rewrite ^(.*)$ /index.php?s=$1 last;

        break;

    }
}
```





搭建步骤：
	确保已安装nodejs以及服务器集成开发环境upupw或者phpstudy或者WAMP等等
```1.下载代码包，解压文件夹



2.### 前端搭建
	cmd 进入frontEnd文件夹
	运行npm install
	之后运行npm run dev

请参考frontEnd里的README文件
```



3. ####
   ##########建立本地模板数据库：复制用数据库客户端平台navicat在本地数据库打开install.sql文件，运行sql代码建立本地数据库
   ##########配置数据库文件：php/config/database.php映射到本地数据库，填写本地数据库的地址
   							 // 服务器地址
						    'hostname'       => '127.0.0.1',
						    // 数据库名
						    'database'       => 'vuethink',
						    // 用户名
						    'username'       => 'root',
						    // 密码
						    'password'       => 'root',
						    // 端口
						    'hostport'       => '3306',
4. 修改前端服务器连接地址： frontEnd/build/webpack.base.conf.js/修改
							var DEV_HOST = JSON.stringify('http://www.vuethink.jm:80/')//为本地主机地址以及端口号
							var PUB_HOST = JSON.stringify('http://www.vuethink.jm:80/')//为部署主机地址以及端口号
5. 重启npn run dev



### 前端目录导航
	--fontEnd
		--build	//流程管理相配置
			build.js         	 //打包执行文件
			check-versions.js    //版本控制文件
			dev-client.js
			dev.server.js
			utils.js
			webpack.base.conf.js //webpack基础配置
			webpack.dev.conf.js  //webpack开发环境配置
			webpack.prod.conf.js //webpack生产环境配置
		--config  //环境相关配置
			dev.env.js
			index.js    
			prod.env.js
		--node_modules  //项目依赖模块
		--src
			--assets          //应用相关静态文件
				--css
				--fonts
				--images
				--js
					.DS_Store
					filter.js
					form_com.js
					global.js       //共用方法封装
					http.js 	    //Ajax方法封装
					list_com.js
				--plugins
				.DS_Story
			--components   //应用页面组件
				--Account          //账号相关
				--Administrative   //
					--personnel
						--users
						.DS_Story
					--structures
						--groups
						--position
						--structures
						.DS_Store
					--system
						--config
						--menu
						--rule
				--Common         //可复用组件
				DS_Store
				Home.vue         //首页
				refresh.vue      //

			--Vuex         //应用状态管理
			.DS_Store
			App.vue    //应用入口组件
			main.js    //应用入口
			routes.js  //应用路由
		.babelrc       //es6转换配置文件
		.eslintrc.json //代码风格检测配置文件
		index.html     //vue应用入口文件 在webpack中配置
		package.json   //nodejs项目配置文件
		README.md      //项目说明文件

### 前端运行逻辑节点汇总
	0. npm run dev 开启整个项目（运行package.json下的script命令：node dev-server.js）开启开发服务器
		0.1 dev-server.js作为整个项目运行启动执行文件，主要是任务是加载webpack配置打包部署文件；并开启开发服务器监听部署路径,
			

	1. 打包完的路径包含index.html以及几个打包好的js文件
		1.1 index.html作为程序的入口文件，当用户访问部署路径时进行初始化，后续工作由应用内部逻辑决定
	2. 程序内部逻辑，与打包入口文件相对应的main.js作为应用的内部逻辑入口文件，主要完成应用的初始化工作
		2.1 包括应用所依赖的所有静态文件的模块引入
		2.2 vue路由注入
		2.3 vue状态管理注入
		2.4 模板注入
		2.5 节点挂载
		2.6 vue实例初始化
	3. login.vue 作为运行首页面主要由路由所决定，在/src/routes.js下配置为根目录，而后在main.js中通过路由注入激活整个app的路由配置

	4. routes.js 定义了整个app的路由跳转
	5. /src/js/http.js 中resetCommonData用于接收用户登录之后返回的菜单等权限信息之后进行路由重定义处理并跳转到权限默认界面（通过router.replace()特性进行跳转）

### 前端打包逻辑节点汇总
	0. npm run build 开启整个webpack项目（运行package.json下的script命令：node build.js）启动打包执行文件
		0.1 build.js作为整个webpack打包项目的启动运行文件，主要是任务是加载webpack配置文件并执行webpack命令启动webpack管理任务
				（webpack(webpackConfig, function (err, stats) {var webpackConfig=require('./webpack.prod.conf');
				  spinner.stop()
				  if (err) throw err
				  process.stdout.write(stats.toString({
				    colors: true,
				    modules: false,
				    children: false,
				    chunks: false,
				    chunkModules: false
				  }) + '\n')
				})）
 	1.在package.json定义入口命令：node build.js
 	2.在入口执行文件build.js引入webpack特定环境配置文件webpack.prod.conf.js以及执行webpack启动api:webpack(conf,function(){})
 	3.webpack文件配置一般分为两个环境，开发环境webpack配置webpack.dev.conf.js，生产webpack配置；第二步用的就是生产环境的webpack配置webpack.prod.conf.js；新建这两个文件并将特定环境的配置在这两个环境配置
 	  3.1配置将打包的js路径插入到filename的html模板中
 	  3.2具体工作插件配置
 	4.抽离出两个环境共用的webpack配置项成为webpack.base.conf.js并在webpack.prod.conf.js/webpack.dev.conf.js中引入并合并到对应的环境配置中
 	  共用配置文件配置项：
 	  4.1 开发以及部署服务器地址
 	  4.2 入口文件 main.js 
 	  4.3 打包文件输出路径
 	  4.4 代码风格检查eslint
 	  4.5 插件定义HOST
 	  4.6 共用路径重定向resolve
 	  4.7 模块依赖
 	  	  4.7.1 loader加载器
 	  	  		4.7.1.1 eslint,css,json babel等
 	  4.8 vue

###各个环境基本配置项目
	1. 入口文件entry:[string | array | object]
	2. 输出文件output:
		output.path:[string]  //路径
		output.filename:[string] //文件名
		output.name:[string]  //模块集名
		output.hash
		output.chunkhash
		output.chunckFileName:[string]
	3. 模块依赖：module:
			module.loader:[{name:loadername}] //库list-of-loaders
	4. 重定向：resolve
	5. 插件：plugins:

###vue运行逻辑
	1. 源代码入口文件为main.js
	   1.1 引入vue web依赖的模块
	   		1.1.1   import 'babel-polyfill' //配合Babel(只转化ES句法)使用，用于将ES6的新特性方法转化为浏览器可用的ES5JavaScript
			1.1.2	import Vue from 'vue'   //Vue框架
			1.1.3	import App from './App' //Vue挂载根节点入口文件
			1.1.4	import axios from 'axios'//基于Promise对象的Http通信模块，负责与后台数据交互
			1.1.5	import Lockr from 'lockr' //轻量级的LocalStorage交互模块，负责进行LocalStorage的增删查改
			1.1.6	import Cookies from 'js-cookie'//A simple, lightweight JavaScript API for handling browser cookies
			1.1.7	import _ from 'lodash' //JavaScript实用程序库，提供模块化，性能和附加功能。
			1.1.8	import moment from 'moment'//JavaScript 日期处理类库
			1.1.9	import ElementUI from 'element-ui'//基于Vue2.0基础框架实现的组件库，它面向企业级的后台应用，能够帮助你快速地搭建网站
			1.1.10	import 'element-ui/lib/theme-default/index.css'//element ui样式文件
			1.1.11	import routes from './routes' //自定义webapp应用路由
			1.1.12	import VueRouter from 'vue-router'//路由模块
			1.1.13	import store from './vuex/store' //vuex是vue组件的状态管理模块，用于管理组件生命周期内的数据以及方法各种状态
			1.1.14	import filter from './assets/js/filter'//Vue提供的一种自定义过滤器模式，用于自定义一些过滤器函数，处理输入的参数并输出处理结果
			1.1.15	import _g from './assets/js/global'//自定义公用JavaScript函数模块
			1.1.16	import NProgress from 'nprogress'//进度条模块
			1.1.17	import 'nprogress/nprogress.css'
			1.1.18	import 'assets/css/global.css'//公用css文件
			1.1.19	import 'assets/css/base.css'//公用css文件
	  1.2 数据交互http全局配置 
	  		1.2.1 地址
	  		1.2.2 timeout
	  		1.2.3 请求头
	  		1.2.4 请求方式
	  		...
	  1.3 路由注入前处理
	  1.4 路由注入后处理
	  1.5 路由注册
	  1.6 Vue实例化
	  	  1.6.1 根节点挂载
	  	  1.6.2 模板挂载
	  	  1.6.3 过滤器注入
	  	  1.6.4 路由注入
	  	  1.6.5 vuex插件状态管理注入
	2.Vue实例化后应用启动，应用根据注入路由动态加载渲染并发送对应的模块插件用于前端展示
	3.routes 定义如果访问根目录则渲染login.vue模板
	4.登录成功之后获取用户权限菜单根据菜单路由跳转到对应的权限页面
	5.vue目前的架构原理采用的是官方推荐的单文件组件设计模式
	6.模块化用的是ES6的export以及import特性：export导出模块，import引入模块，export default导出默认模块,当其他模块引用时没有指明则默认使用默认的



	入口视图：index.html
	入口启动文件main.js
	挂载节点文件：App.vue
	入口插件：login.vue

###vue-router创建步骤
	1. 定义路由组件（可import进来）
		const Foo = { template: '<div>foo</div>' }
		const Bar = { template: '<div>bar</div>' }
		import a from 'a'
	2. 定义路由（一个路由对应一个组件）,基本值有路径（相对），组件，路由名，参数
		const routes = [
		  { path: '/foo', component: Foo,name:foo,param:{a:a} },
		  { path: '/bar', component: Bar,name:bar,param:{a:a} }
		]
	3.创建路由实例
		new VueRouter({
			routers
		})
	4.挂载到Vue实例上
		const app= new Vue({
			router
		}).$mount("#app")
	5.使用路由query为跳转路由时显传入的路由参数
	  <template>
		<router-link to="{path:'/foo',query:{a:'a'}}"></router-link>
		<router-link to="{path:'/bar',query:{a:'bar'}}"></router-link>
	  </template>
	6.点击跳转到对应路由


#vue-router构造配置
	declare type RouteConfig = {
	  path: string;
	  component?: Component;
	  name?: string; // for named routes (命名路由)
	  components?: { [name: string]: Component }; // for named views (命名视图组件)
	  redirect?: string | Location | Function;
	  alias?: string | Array<string>;
	  children?: Array<RouteConfig>; // for nested routes
	  beforeEnter?: (to: Route, from: Route, next: Function) => void;
	  meta?: any;
}

#vue-router配置参数
{
	mode:"history"|"hash"|"abstract"
		配置路由模式:
			hash: 使用 URL hash 值来作路由。支持所有浏览器，包括不支持 HTML5 History Api 的浏览器。
			history: 依赖 HTML5 History API 和服务器配置。查看 HTML5 History 模式.
			abstract: 支持所有 JavaScript 运行环境，如 Node.js 服务器端。如果发现没有浏览器的 API，路由会自动强制进入这个模式。
	base:'/'
		应用的基路径。例如，如果整个单页应用服务在 /app/ 下，然后 base 就应该设为 "/app/"。
	linkActiveClass:
		全局配置 <router-link> 的默认『激活 class 类名』
	scrollBehavior:
	meta:路由元信息：（不知道传递什么参数用的，用$route.matched.some((record)=>{
		record.meta...
	}))获取
}


###router实例
	属性：
		router.app
			类型: Vue instance
			配置了 router 的 Vue 根实例。
		router.mode
			类型: string
			路由使用的 模式。
		router.currentRoute
			类型: Route
			当前路由对应的 路由信息对象.
	方法：
		router.beforeEach(guard)
			//每次导航触发前都会调用的钩子处理函数（按照传入顺序）
		router.afterEach(hook)
			//每次导航触发后都会调用的钩子处理函数（按照传入顺序）
		router.push(location)
		router.replace(location)
		router.go(n)
		router.back()
		router.forward()
			动态的导航到一个新 url。
			/**********利用此类方法实现编程式路由(后续会写到)**********/
			router.getMatchedComponents(location?)

			返回目标位置或是当前路由匹配的组件数组（是数组的定义/构造类，不是实例）。通常在服务端渲染的数据预加载时时候。

		router.resolve(location, current?, append?)

			2.1.0+

			解析目标位置（格式和 <router-link> 的 to prop 一样），返回包含如下属性的对象：

			{
			  location: Location;
			  route: Route;
			  href: string;
			}
		router.addRoutes(routes)

			2.2.0+

			动态添加更多的路由规则。参数必须是一个符合 routes 选项要求的数组。

		router.onReady(callback)

			2.2.0+

			添加一个会在第一次路由跳转完成时被调用的回调函数。此方法通常用于等待异步的导航钩子完成，比如在进行服务端渲染的时候。
###vue-router使用
	###router-link ：	
		1.作用：用户可以用此组件实现应用内的点击跳转功能，无论是页面某个位置的切换还是整个页面的切换
		2.属性：
			props:{
					定义router-view的名字，用于设置将试图渲染至特定同name的router-view内
				**to:
					路由的链接，点击会出发router.push(),将路由压如路由栈（可以是一个字符串路径或者路由的名称name）
					<!-- 字符串 -->
					<router-link to="home">Home</router-link>
					<!-- 渲染结果 -->
					<a href="home">Home</a>

					<!-- 使用 v-bind 的 JS 表达式 -->
					<router-link v-bind:to="'home'">Home</router-link>

					<!-- 不写 v-bind 也可以，就像绑定别的属性一样 -->
					<router-link :to="'home'">Home</router-link>

					<!-- 同上 -->
					<router-link :to="{ path: 'home' }">Home</router-link>

					<!-- 命名的路由 -->
					<router-link :to="{ name: 'user', params: { userId: 123 }}">User</router-link>

					<!-- 带查询参数，下面的结果为 /register?plan=private -->
					<router-link :to="{ path: 'register', query: { plan: 'private' }}">Register</router-link>
				replace:
					路由的跳转方式，当为true时，系统用router.replace()代替router.push()不会留下history
						<router-link :to="{ path: '/abc'}" replace></router-link>
				append:
					在当前基础上加路径，当为true时表示在当前路径加上路径，如当前路径为/a,不加为/b,加了为/a/b
					<router-link :to="{ path: 'relative/path'}" append></router-link>
				**tag:
					显示渲染结果标签：
						<router-link to="/foo" tag="li">foo</router-link>
						<!-- 渲染结果 -->
						<li>foo</li>
				**active-class：
					设置点击激活时样式，默认是router-line-active
				exact:
				**event:
					声明用来触发导航的事件，默认是点击事件，可以是字符串或者字符串数组
			}
	###<router-view>
		1.<router-view>组件是一个 functional 组件，渲染路径匹配到的视图组件
		
		1.2 用嵌套路由（嵌套）展示多个视图
		2.属性：
			props:{
				**name:	
					设置视图的名字
					用命名视图（name属性）实现（在同级下（同一个路径下））展示多个视图：例如创建一个布局，有 sidebar（侧导航） 和 main（主内容） 两个视图
					<router-view class="view one"></router-view>
					<router-view class="view two" name="a"></router-view>
					<router-view class="view three" name="b"></router-view>
					const router = new VueRouter({
					  routes: [
					    {
					      path: '/',
					      components: {
					        default: Foo,
					        a: Bar,
					        b: Baz
					      }
					    }
					  ]
					})
			}
		3.行为表现：
			其他属性（非 router-view 使用的属性）都直接传给渲染的组件（利用此特性将数据传入被渲染的组件）
			被渲染组件用props:[]获取数据
		4.配合transition和keep alive使用
	###路由信息对象this.$route
		路由除了跳转的作用之外，我们有时还要对路由的状态进行监控并作出相应等需求，
		在Vue中，vue-router注入vue实例之后就会产生一个router object对象$router
		每一次成功导航都会产生一个新的对象
		属性：
			props:{
				**$route.path//当前路由路径，总是解析为绝对路径
				**$route.params//路由参数（包含动态片段和全匹配片段？）
				**$route.query//获取通过query传入的查询参数，无为空对象
				**$route.fullPath//完整路径包含查询地址以及hash
				**$route.hash//获取hash,无为空字符串
				**$route.name//返回路由名字
				**$route.matched//包含所有签到路径片段的路由路径
			}
###路由实现业务需求
	###动态效果切换
		<transition>
			<router-view></router-view>
		</transiton>
		基于路由的动态过渡
		还可以基于当前路由与目标路由的变化关系，动态设置过渡效果：
		<!-- 使用动态的 transition name -->
		<transition :name="transitionName">
		  <router-view></router-view>
		</transition>
		// 接着在父组件内
		// watch $route 决定使用哪种过渡
		watch: {
		  '$route' (to, from) {
		    const toDepth = to.path.split('/').length
		    const fromDepth = from.path.split('/').length
		    this.transitionName = toDepth < fromDepth ? 'slide-right' : 'slide-left'
		  }
		}
	###获取数据
		导航完成之后获取：先完成导航，然后在接下来的组件生命周期钩子中获取数据。在数据获取期间显示『加载中』之类的指示。

			导航完成之前获取：导航完成前，在路由的 enter 钩子中获取数据，在数据获取成功后执行导航。

			从技术角度讲，两种方式都不错 —— 就看你想要的用户体验是哪种。

			导航完成后获取数据

			当你使用这种方式时，我们会马上导航和渲染组件，然后在组件的 created 钩子中获取数据。这让我们有机会在数据获取期间展示一个 loading 状态，还可以在不同视图间展示不同的 loading 状态。

			假设我们有一个 Post 组件，需要基于 $route.params.id 获取文章数据：

			<template>
			  <div class="post">
			    <div class="loading" v-if="loading">
			      Loading...
			    </div>

			    <div v-if="error" class="error">
			      {{ error }}
			    </div>

			    <div v-if="post" class="content">
			      <h2>{{ post.title }}</h2>
			      <p>{{ post.body }}</p>
			    </div>
			  </div>
			</template>
			export default {
			  data () {
			    return {
			      loading: false,
			      post: null,
			      error: null
			    }
			  },
			  created () {
			    // 组件创建完后获取数据，
			    // 此时 data 已经被 observed 了
			    this.fetchData()
			  },
			  watch: {
			    // 如果路由有变化，会再次执行该方法
			    '$route': 'fetchData'
			  },
			  methods: {
			    fetchData () {
			      this.error = this.post = null
			      this.loading = true
			      // replace getPost with your data fetching util / API wrapper
			      getPost(this.$route.params.id, (err, post) => {
			        this.loading = false
			        if (err) {
			          this.error = err.toString()
			        } else {
			          this.post = post
			        }
			      })
			    }
			  }
			}
			在导航完成前获取数据

			通过这种方式，我们在导航转入新的路由前获取数据。我们可以在接下来的组件的 beforeRouteEnter 钩子中获取数据，当数据获取成功后只调用 next 方法。

			export default {
			  data () {
			    return {
			      post: null,
			      error: null
			    }
			  },
			  beforeRouteEnter (to, from, next) {
			    getPost(to.params.id, (err, post) => 
			      if (err) {
			        // display some global error message
			        next(false)
			      } else {
			        next(vm => {
			          vm.post = post
			        })
			      }
			    })
			  },
			  // 路由改变前，组件就已经渲染完了
			  // 逻辑稍稍不同
			  watch: {
			    $route () {
			      this.post = null
			      getPost(this.$route.params.id, (err, post) => {
			        if (err) {
			          this.error = err.toString()
			        } else {
			          this.post = post
			        }
			      })
			    }
			  }
			}
			在为后面的视图获取数据时，用户会停留在当前的界面，因此建议在数据获取期间，显示一些进度条或者别的指示。如果数据获取失败，同样有必要展示一些全局的错误提醒。

			路由懒加载

				当打包构建应用时，Javascript 包会变得非常大，影响页面加载。如果我们能把不同路由对应的组件分割成不同的代码块，然后当路由被访问的时候才加载对应组件，这样就更加高效了。

				结合 Vue 的 异步组件 和 Webpack 的 code splitting feature, 轻松实现路由组件的懒加载。

				我们要做的就是把路由对应的组件定义成异步组件：

				const Foo = resolve => {
				  // require.ensure 是 Webpack 的特殊语法，用来设置 code-split point
				  // （代码分块）
				  require.ensure(['./Foo.vue'], () => {
				    resolve(require('./Foo.vue'))
				  })
				}
				这里还有另一种代码分块的语法，使用 AMD 风格的 require，于是就更简单了：

				const Foo = resolve => require(['./Foo.vue'], resolve)
				不需要改变任何路由配置，跟之前一样使用 Foo：

				const router = new VueRouter({
				  routes: [
				    { path: '/foo', component: Foo }
				  ]
				})
				把组件按组分块

				有时候我们想把某个路由下的所有组件都打包在同个异步 chunk 中。只需要 给 chunk 命名，提供 require.ensure 第三个参数作为 chunk 的名称:

				const Foo = r => require.ensure([], () => r(require('./Foo.vue')), 'group-foo')
				const Bar = r => require.ensure([], () => r(require('./Bar.vue')), 'group-foo')
				const Baz = r => require.ensure([], () => r(require('./Baz.vue')), 'group-foo')
				Webpack 将相同 chunk 下的所有异步模块打包到一个异步块里面 —— 这也意味着我们无须明确列出 require.ensure 的依赖（传空数组就行）。

###路由总结

	1. 用动态路由实现把某种模式匹配到的所有路由，全都映射到同个组件，即模板相同，只是传入的参数不同
		//传入
		const User = {
		  template: '<div>User</div>'
		}

		const router = new VueRouter({
		  routes: [
		    // 动态路径参数 以冒号开头
		    { path: '/user/:id', component: User }
		  ]
		})
		//组件内获取该参数并渲染数据
		const User = {
		  template: '...',
		  watch: {
		    '$route' (to, from) {
		      // 对路由变化作出响应...获取参数并重新获取数据刷新视图
		      getData(this.$route.params.id)
		    }
		  }
		}
	2. 利用嵌套式路由实现多级组件切换（router-link,router-view）
	3. 利用编程式路由在代码中切换路由(router.replace,go,matched,push)
	4.用命名视图（name属性）实现（在同级下（同一个路径下））展示多个视图：例如创建一个布局，有 sidebar（侧导航） 和 main（主内容） 两个视图