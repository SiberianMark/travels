/*
*模块化开发core模块
*实现js的类以及继承；参照大神，jQuery之父resig的思路,道古拉斯，克劳福德大神
*creator:JM 
*time:2017.05.09 11:08
*
* 1.创造构建函数
* 2.添加静态属性
* 3.继承父类
* 	3.1 继承父类属性
* 	3.2继承父类原型
* 4.添加自身类原型
* 
* 
 */
(function(){
	var hasOwn =Object.prototype.hasOwnProperty;
	//判断是否为Object的实例
	function isObject(o){
		return o instanceof Object;
	}
	//用来判断是否是Function的实例
	function isFunction(f){
		return Object.prototype.toString.call(f)=='[object Function]'
	}
	//简单复制对象(只可枚举属性)
	function copyObj(o){
		var tar=new Object();
		for(i in o){
			if(hasOwn.call(o,i)){
				tar[i]=o[i];
			}
		}
		return tar;
	}

	//单例模式，表示当前对象是否已经创建
	var initialzing = false;
	//声明构造函数，创建类接口
	JMCreateClass= function(options){
		if(!isObject(options)){
			throw Error('创建类选项必须为一个非空对象');
		 		//获取参数
		}
		var instanceMembers = isObject(options) && options.instanceMembers || {};//获取生成对象的实例方法
		var staticMembers= isObject(options) && options.staticMembers || {};//获取对象的静态属性
		var extend = isObject(options) && isFunction(options.extend) && options.extend;
		var prop;//对象索引
		//1.创建要返回的类
		function ResultClass(){
			if(extend){//如果有要继承的父类
				//则每个实例添加一个baseProto属性，以便实例内部可以通过这个属性访问到父类的原型
				//这是因为每次copyObj函数会导致原型链断裂
				this.baseProto=extend.prototype;
				//初始化函数
				if (isFunction(this.init)) {
	                this.init.apply(this, arguments);
	            }
            }
        }
        //2 添加静态成员，需要原型设置前执行，避免静态成员包含prototype属性，覆盖类的原型
        for(prop in staticMembers){
        	if(hasOwn.call(staticMembers,prop)){
        		//如果有需要继承的父类,继承父类的静态属性
        		if(extend){
        			extend.call(this,arguments);
        		}
        		ResultClass[prop]=staticMembers[prop];
        	}
        }
        if(extend){//3如果此类要从extend继承，则将父类所有方法继承到子类
        	ResultClass.prototype=copyObj(extend.prototype);
        }
        //4.添加实例方法
        for(prop in instanceMembers){
        	if(hasOwn.call(instanceMembers,prop)){
        		//如果有要继承的父类，且在父类的原型上存在当前实例方法同名的方法,则重新定义该方法，以保证子类同名方法的独立性
                if (extend && isFunction(instanceMembers[prop]) && isFunction(extend.prototype[prop])) {
                    ResultClass.prototype[prop] = (function (name, func) {
                        return function () {
                            //记录实例原有的this.base的值
                            var old = this.base;
                            //将实例的this.base指向父类的原型的同名方法
                            this.base = extend.prototype[name];
                            //调用子类自身定义的实例方法，也就是func参数传递进来的函数
                            var ret = func.apply(this, arguments);
                            //还原实例原有的this.base的值
                            this.base = old;
                            return ret;
                        }
                    })(prop, instanceMembers[prop]);
                } else {
                    ResultClass.prototype[prop] = instanceMembers[prop];
                }
        	}
        }
        // 5.修正构造函数
        ResultClass.prototype.constructor = ResultClass;
		// 6. 返回构造完成的类
		return ResultClass;
	
	}
	return JMCreateClass;
})();
	

