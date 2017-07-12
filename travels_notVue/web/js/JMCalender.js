;(function(){
	var JMCalender=function(obj,mon,data){
		this.obj=obj;
		this.mon=mon;
		this.data=data || {};
		this.date=new Date();

	}
	JMCalender.prototype={
		init:function(){
			//创建插件模板
			try{
				this.createCalender(this.mon,this.data);
				this.eventBind(this.obj);
			}catch(error){
				alert(error);
				console.log(error);
			}
			
			//根据传入数据渲染模板RenderCalender(obj,data)
			//绑定事件eventBind(obj);
			//插入DOM并显示效果
		},
		createCalender:function(mon,data){//创建插件模板
			//根据特定月份获取当月天数getDayOfMon(mon);根据当月获取当月1号星期数getMonFirstDay()
			//根据天数创建月份静态模板createMonMol(mon,day)
			var li=null,num= 0,text=null,date=new Date(mon);
			var DAYS=this._getDayofMon(mon);
			var day = this._getMonFirstDay(mon);
			var fragment=document.createDocumentFragment();
			len=0;//日历模板盒子个数
			arr=[];
			if(day===6&&DAYS>29){
				len=42;
			}else{
				len=35;
			}
			for(var i=0;i<=len;i++){
				if(i>=day && num<DAYS){//大于当天星期则渲染
					num++;
					console.log(i,num);
					li=document.createElement('li');
					text=document.createTextNode(num+'');
					li.appendChild(text);	
				}else{//否则盒子留空
					 li=document.createElement('li');
				}
				fragment.appendChild(li);
				 arr.push(li);

			}
			this.obj.innerHTML='';
     		this.obj.appendChild(fragment);
    		if(arguments[1]){//如果有传入动态数据，则按照动态数据进行渲染
		        this._RenderCalender(arr,mon,DAYS,data);
			}
			if(arguments[2]){
			    this.createSevenDay(arguments[2],arguments[3]);
			}
		},
		_RenderCalender:function(arr,mon,DAYS,data){//动态数据渲染
			var day=this._getMonFirstDay(mon),//获取当月第一天的星期
				lis=arr.slice(day,DAYS+day);//截取所有不为空盒的日期
				for(var i=0;i<lis.length;i++){
					if(data[i].detail){
						var fragmentp=document.createDocumentFragment();
						//渲染价格
						var price=document.createElement('p');
						var yuliang=document.createElement('p');
						var textprice=document.createTextNode('￥'+data[i].detail.adult_price);
						var textyuliang=document.createTextNode('充足');
						price.appendChild(textprice);
						yuliang.appendChild(textyuliang);
						price.className="price";
						price.setAttribute("child_price",data[i].detail.child_price); // 设置  
						price.setAttribute("adult_price",data[i].detail.adult_price); 
						price.setAttribute("single_room",data[i].detail.single_room);
						price.setAttribute("date_id",data[i].detail.id);
						price.setAttribute("line_date",data[i].detail.line_date);
						price.setAttribute("single_room",data[i].detail.single_room);
						fragmentp.appendChild(price);
						fragmentp.appendChild(yuliang);
						lis[i].className="hasPrice";
						
						lis[i].appendChild(fragmentp);
					}
				}
		},
		eventBind:function(obj){

		},
		_getDayofMon:function(mon){
			var date=null;
			if(arguments[0]){
				//解决ios不支持‘2015-05-01’的日历格式
				mon=mon.replace(/-/g,'/')+'/01'
				date=new Date(mon);
			}else{
				//当时时间对象
				date=new Date();
			}
			//获取全称年份
			var Y=date.getFullYear(),
			    M=date.getMonth()+1,//获取月份
			    bigMon=[1,3,5,7,8,10,12]//31天
			    smallMon=[4,6,9,11];//30天
			    if(bigMon.indexOf(M)!==-1){
			    	day=31;
			    }else if(smallMon.indexOf(M)>-1){
			    	day=30;
			    }else{//二月份
			    	if(Y%4===0&&Y%100!==0 || Y%400===0){//闰年
			    		day=29;
			    	}else{//平年
			    		day=28;
			    	}
			    }
			    return day;

		},
		_getMonFirstDay:function(date){//获取某一天是星期几
			//解决ios不支持‘2015-05-01’的日历格式
			date=date.replace(/-/g,'/')+'/01'
			var day=new Date(date),D=day.getDay();
			return parseInt(D);
		}
		
	}
	window.JMCalender=JMCalender;
})();