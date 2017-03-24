<?php
/**
 * Created by myz
 * Date: 2016/11/10
 * Time: 13:38
 */

/**
 * 删除图片
 * @param string $path
 * @return bool
 */
function del_img($old_path)
{
    if (!$old_path) return false;
    $old_path = substr($old_path, 1);
    $path = explode('/', $old_path);
    $img = $old_path[count($path)-1];
    $new_path = "Public/Upload/delete/" . $img;
    $re = rename($old_path, $new_path);
    return $re;
}

/**
 * 根据输入密码生成加密窜
 * @param string $passwd
 * @return string
 */
function makePasswd($passwd)
{
    if (!$passwd) return '';
    return md5($passwd . "myz");
}

/**
 * 产生订单号
 * @return string 订单号
 */
function orderNum(){
    return date('ymdHis') . rand(1000, 9999);
}

/**
 * 检测手机号是否合法
 * @param string|int $phone
 * @return boolean
 */
function validPhone($phone)
{
    $reg = "/^(13[0-9]|15[012356789]|17[03678]|18[0-9]|14[57])[0-9]{8}$/";
    $regex2 = "/^[5689][0-9]{7}$/";
    return preg_match($reg, $phone) || preg_match($regex2, $phone);
}

/**
 * 密码长度是否合法
 * @param string $passwd
 * @return boolean
 */
function validPasswd($passwd)
{
    $count = strlen($passwd);
    return $count >= 6 && $count <= 32;
}

/**
 * 是否手机访问
 */
function isMobile() {
    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset ($_SERVER['HTTP_X_WAP_PROFILE'])) return true;

    //此条摘自TPM智能切换模板引擎，适合TPM开发
    if(isset ($_SERVER['HTTP_CLIENT']) && 'PhoneClient' == $_SERVER['HTTP_CLIENT']) {
        return true;
    }
    //如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
    if (isset ($_SERVER['HTTP_VIA'])) {
        //找不到为flase,否则为true
        return stristr($_SERVER['HTTP_VIA'], 'wap') ? true : false;
    }

    //判断手机发送的客户端标志,兼容性有待提高
    if (isset ($_SERVER['HTTP_USER_AGENT'])) {
        $clientkeywords = array(
            'nokia','sony','ericsson','mot','samsung','htc','sgh','lg','sharp','sie-','philips','panasonic','alcatel','lenovo','iphone','ipod','blackberry','meizu','android','netfront','symbian','ucweb','windowsce','palm','operamini','operamobi','openwave','nexusone','cldc','midp','wap','mobile'
        );
        //从HTTP_USER_AGENT中查找手机浏览器的关键字
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
            return true;
        }
    }

    //协议法，因为有可能不准确，放到最后判断
    if (isset ($_SERVER['HTTP_ACCEPT'])) {
        // 如果只支持wml并且不支持html那一定是移动设备
        // 如果支持wml和html但是wml在html之前则是移动设备
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
            return true;
        }
    }

    return false;
}


/**
 * 发送模板短信(容联云通讯)
 * 账号：13425157494 密码：***000
 * @param to 手机号码集合,用英文逗号分开
 * @param datas 内容数据 格式为数组
 * @param $tempId 模板Id,测试应用和未上线应用使用测试模板请填写1，正式应用上线后填写已申请审核通过的模板ID
 * @param $type 保存类型，1-短信验证码、2-文字内容
 * 示例：sendYunSms("13425157494", array(1111,'5'), "1");
 */
function sendYunSms($to, $datas, $tempId, $type = 1) {
    Vendor('CCPRestSDK');
    // 初始化REST SDK
    $accountSid = '8aaf07085a608ec2015a60ce206b0036';
    $accountToken = 'f94b9a2e8d454cedbf6a576ba3c330a6';
    switch(MODULE_NAME){
        case 'Music':
            $appId ='8a48b55149896cfd0149934290c304a6';
            break;
        default:
            $appId ='8aaf07085a608ec2015a60ce21f4003d';
    }

    if (strpos($to,'17962') === 0) {
        return false;
    }
    $serverIP='app.cloopen.com';
    $serverPort='8883';
    $softVersion='2013-12-26';
    //
    $rest = new REST($serverIP,$serverPort,$softVersion);
    $rest->setAccount($accountSid,$accountToken);
    $rest->setAppId($appId);
    // 发送模板短信
    $result = $rest->sendTemplateSMS($to,$datas,$tempId);
    if(count($datas)>0){ //发送的是数组
        if($type==1){
            $sms = array('content'=>serialize($datas),'verify'=>$datas[0],'type'=>$type,'mobile'=>$to,'sendtime'=>time());
        }else{
            $sms = array('content'=>serialize($datas),'type'=>$type,'mobile'=>$to,'sendtime'=>time());
        }
    }else{ // 发送的是字符串
        $sms = array('content'=>'','type'=>$type,'mobile'=>$to,'sendtime'=>time());
    }
    if($result == NULL || $result->statusCode!=0) { //发送失败
        if(!empty($result)) {
            $sms['remark'] = $result->statusCode.'-'.$result->statusMsg;
        }
        $sms['status'] = 1;
        \Common\Model\SmsModel::getInstance()->data($sms)->add();
        return false;
    }else{ // 发送成功
        $sms['status'] = 0;
        \Common\Model\SmsModel::getInstance()->data($sms)->add();
        return true;
    }
}