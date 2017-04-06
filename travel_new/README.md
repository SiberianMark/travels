# travelfront

> A Vue.js project

## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report

# run unit tests
npm run unit

# run e2e tests
npm run e2e

# run all tests
npm test
```

For detailed explanation on how things work, checkout the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).

### 项目介绍
	travels是基于Vue全家桶(Vue2.0 + Vue-router2.x +VueX)+ ThinkPhp 的前后端交互应用，主要用于旅游行业旅行社的网上商场，帮助用户构建自己的旅游商城webapp

	travels 不仅仅适用于旅游行业商城，其被设计为一个商城模板，可以根据具体需求适当配置修改成为其他webapp应用

### 主要使用技术栈
* 后端框架：ThinkPHP 3.2.2
* 前端MVVM框架：Vue.JS 2.x
* 开发工作流：Webpack 1.x
* 路由：Vue-Router 2.x
* 数据交互：Axios
* 代码风格检测：Eslint
* UI框架：
* JS函数库：Lodash


* 详细功能：
* 首页
* 国内游
* 线路详情
* 订单确认
* 下单
* 登录
* 注册
* 修改密码
* 个人中心
* 搜索

### Demo
演示地址：<http://demo.vuethink.com>

### 开发依赖
* vue <https://vuefe.cn/v2/guide/>(使用了es5的object.defineproperty，所以旧浏览器不支持（IE6-8）在移动端大多数浏览器都是基于webkit或者webkit的衍生版本blink，Gegko等等)
* axios  <https://github.com/mzabriskie/axios>
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

