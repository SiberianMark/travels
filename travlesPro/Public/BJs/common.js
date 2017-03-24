/**
 * Created with JetBrains PhpStorm.
 * User: kk
 * Date: 13-8-28
 * Time: 下午4:44
 */
function U() {
    var url = arguments[0] || [];
    var param = arguments[1] || {};
    var url_arr = url.split('/');

    if (!$.isArray(url_arr) || url_arr.length < 2 || url_arr.length > 3) {
        return '';
    }

    if (url_arr.length == 2)
        url_arr.unshift(_GROUP_);

    var pre_arr = ['g', 'm', 'a'];

    var arr = [];
    for (d in pre_arr)
        arr.push(pre_arr[d] + '=' + url_arr[d]);

    for (d in param)
        arr.push(d + '=' + param[d]);

    return _APP_+'?'+arr.join('&');
}


/*后台js*/
$(function(){
    //鼠标移动变色
    $(".main_tab table tr").hover(function(){$(this).attr("style","color: #333;background: #f4f8fc;");},function(){$(this).removeAttr("style")})
    
    //全选或取消   
     $("input[name='checkbox1']").click(function(){ $("input[name='checkbox2']").prop("checked",$(this).is(":checked"));});
    
});
/**
 * 分页跳转URL 
 * @lid 分页跳转URL分析
 * */
function clicktopage(obj){
    if(obj){
        var total = $(obj).attr('total');
        var current = $(obj).attr('curl');
        var domm = $(obj).parent().find("input[name=goonPageNum]");
        if(domm!=null && domm.val()>0){
            var curr =domm.val();
            current = current.substring(0,current.length-1);//alert(current);
            window.location.href = current + curr;
        }else{
            alert("请输入有效数据");return ;
        }
    }   
}
/*
 * 获取选项卡内容
 * @obj 点击元素
 * @url 请求路径 /admin/user/index
 * @uid 请求id
 * */
function Detail(obj,url,uid){
    $.post(url,{id:uid},function(data){
        //选项变色
        $(obj).attr("style","color:#0078b4;background:white;");
        $(".userinfo_tab li[id!="+$(obj).attr("id")+"]").removeAttr("style");  
        var node = $(".main_tab");
        if(node){
            node = node[0];
            node.innerHTML = data;
            var child      = node.children[0];
            child.onload = function(){
                if(child.contentDocument && child.contentDocument.body.offsetHeight){
                    node.style.height  = child.contentDocument.body.offsetHeight + 50 + 'px';
                    child.style.height = '100%';
                }
            }
        }
    });
}
/*
 *所选删除 
 **/
function  check_del(url){
    var chk_len =   $("input[name='checkbox2']:checked").length;//选中个数
    var chk_obj =   $("input[name='checkbox2']:checked");//复选框对象
    var id_all=new Array();
    if (chk_len > 0) {//至少选一个
        if(confirm("确认删除所有吗?")==false) return false;
        for (var i = 0; i < chk_len; i++) {
           id_all.push(chk_obj[i].value);//组合要删除的ID
        }
        $.post(url,{id_all:id_all},function(data){ if(data.status){ location.reload();}});
    } else {
        alert('至少选择一项!');
    }
}
/*
 *需求管理的下拉列表改变事件 
 **/
function chooseOn(){
    var chooseVal=document.getElementById("select1").value;
    var index=document.getElementById("select1").selectedIndex;
    var chooseTest=document.getElementById("select1").options[index].text;
    window.location.href="/admin/Demand/Serving?chooseVal="+chooseVal+"&chooseTest="+chooseTest;
}
/**
 * 下拉选择菜单事件
 */
function plist(obj){
    var id=$(obj).val();
    $.post("/admin/menu/getMenu",{id:id},function(data){
        $("#afterparentid").remove();
        $(obj).after("<select name='parentid' id='afterparentid'>"+data+"</select>");
    },'json');
}
