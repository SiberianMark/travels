<?php
/**
 * Created by PhpStorm.
 * User: myz
 * Date: 2017/3/7
 * Time: 11:40
 */

class CheckIPController {


    public function getIP() {
        return isset($_SERVER["HTTP_X_FORWARDED_FOR"]) ? $_SERVER["HTTP_X_FORWARDED_FOR"] : (isset($_SERVER["HTTP_CLIENT_IP"]) ? $_SERVER["HTTP_CLIENT_IP"] : $_SERVER["REMOTE_ADDR"]);
    }


    public function check_ip() {
        $allow_ip = array('127.0.0.2', '192.168.*.*');
        $ip = $this->getIP();
        $bRange = implode('.', array_slice(explode('.', $ip), 0, 2)) . '.*.*';
        $cRange = implode('.', array_slice(explode('.', $ip), 0, 3)) . '.*';
        if (in_array($ip, $allow_ip) || in_array($bRange, $allow_ip) || in_array($cRange, $allow_ip)) {
            return true;
        } else {
            return false;
        }
    }

    public function check_ip1(){
        $allow_ip = array('127.0.0.1', '192.168.*.*');
        $ip = $this->getIP();
        $check_ip_arr = explode('.', $ip);//要检测的ip拆分成数组
        #限制IP
        if(!in_array($ip, $allow_ip)) {
            foreach ($allow_ip as $val){
                if(strpos($val, '*') !== false) {//发现有*号替代符
                    $arr = array();//
                    $arr = explode('.', $val);
                    $bl = true;//用于记录循环检测中是否有匹配成功的
                    for($i=0; $i<4; $i++) {
                        if($arr[$i] != '*'){//不等于*  就要进来检测，如果为*符号替代符就不检查
                            if($arr[$i] != $check_ip_arr[$i]){
                                $bl = false;
                                break;//终止检查本个ip 继续检查下一个ip
                            }
                        }
                    }//end for
                    if($bl){//如果是true则找到有一个匹配成功的就返回
                        return;
                        die('success');
                    }
                }
            }//end foreach
            header('HTTP/1.1 403 Forbidden');
            echo "Access forbidden";
            die;
        }
    }





}