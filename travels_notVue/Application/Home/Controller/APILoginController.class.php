<?php
/**
 * 登录注册接口
 */
namespace Home\Controller;
use Common\Model\MemberModel;
use Common\Model\SmsModel;

class APILoginController extends CommonController
{

    public function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 账户登录
     */
    public function login() {
        $phone = I('request.phone', '', 'strip_tags,htmlspecialchars,trim');
        $passwd = I('request.passwd', '', 'strip_tags,htmlspecialchars,trim');
        $verify = I('request.verify', '', 'trim');

        // 验证手机号
        if (!validPhone($phone)) {
            $this->ajax(0, '手机号码错误');
        }
        // 获取用户
        $truePasswd = $this->makePasswd($passwd);
        $member = MemberModel::getInstance()->getMemberByPhone($phone);
        if (!empty($passwd)) {//使用密码登录
            if (!$member) {
                $this->ajax(0, '该手机号码未注册');
            }
            if (empty($member['password'])) {
                $this->ajax(0, '您暂未设置密码，请更换用手机验证码登录');
            } else {
                if ($member['password'] != $truePasswd) {
                    $this->ajax(0, '密码错误');
                }
            }
        } elseif (!empty($verify)) {//使用手机验证码登录
            if (!SmsModel::getInstance()->checkSms($phone, $verify)) {
                $this->ajax(0, '手机验证码错误');
            }
            if (!$member) { //未注册用户直接注册

            }
        } else {
            $this->ajax(0, '非法请求');
        }

        // 禁止登陆
        if ($member['status'] == 0) {
            $this->ajax(0, '账号异常，请联系客服');
        }
        // 加session
        session("memberId", $member['id']);

        $logintoken = MemberModel::getInstance()->getLogintoken($member['id'], true); //设置logintoken
        //设置cookie信息
        setcookie('user_id', $member['id'], time() + 604800, "/");
        setcookie('logintoken', $logintoken, time() + 604800, "/");

        // 更新用户信息
        $data['lastlogin'] = time();
        $data['lastip'] = get_client_ip();
        MemberModel::getInstance()->where(array('id' => $member['id']))->save($data);
        /*$re['user_id'] = $member['id'];
        $re['mobile'] = $member['mobile'];
        $re['lastlogin'] = $member['lastlogin'];*/
        $this->ajax(1, '登录成功', $member['id']);
    }

    /**
     * 发送验证码
     * @param $phone 手机号
     * @param $valid 图形验证码
     * @return string
     */
    public function sendCode() {
        $phone = I('request.phone', '', 'strip_tags,htmlspecialchars,trim');
        $valid = I('request.valid', '', 'strip_tags,htmlspecialchars,trim,strtolower');

        if (!validPhone($phone)) {
            $this->ajax(0, '手机号码错误');
        }

        $validateCode = session('validateCode');
        session('validateCode', null);

        // 验证码，手机不验证
        if (!$valid || $valid != $validateCode) {
            $this->ajax(0, '验证码错误');
        }

        // 生成验证码
        $code[] = rand(100000, 999999);
        $code[] = 10; // 多少分钟内使用

        // 发送到手机
        $result = sendYunSms($phone, $code, 1);
        if ($result) {
            $this->ajax(1, '发送成功');
        } else {
            $this->ajax(0, '发送失败');
        }
    }

    /**
     * 用户注册
     */
    public function reg()
    {
        $phone = I('request.phone', '', 'strip_tags,htmlspecialchars,trim');
        $passwd = I('request.passwd', '', 'strip_tags,htmlspecialchars,trim');
        $verify = I('request.verify', '', 'trim');

        // 验证手机号
        if (!validPhone($phone)) {
            $this->ajax(0, '手机号码错误');
        }
        // 检测手机是否已注册
        $member = MemberModel::getInstance()->getMemberByPhone($phone);
        if ($member) {
            $this->ajax(0, '该手机号已注册');
        }
        if (!$passwd) {
            $this->ajax(0, '密码为空');
        }
        if (!validPasswd($passwd)) {
            $this->ajax(0, '密码长度为6-32位');
        }
        // 检测验证码
        if (!SmsModel::getInstance()->checkSms($phone, $verify)) {
            $this->ajax(0, '手机验证码错误');
        }

        $data['mobile'] = $phone;
        $data['password'] = $this->makePasswd($passwd);
        $data['regtime'] = time();
        $data['regip'] = get_client_ip();
        $data['from'] = 1;
        $memberId = MemberModel::getInstance()->data($data)->add();
        /*$re['user_id'] = $memberId;
        $re['mobile'] = $data['mobile'];
        $re['lastlogin'] = $data['regip'];*/

        // 加session
        session("memberId", $memberId);

        $logintoken = MemberModel::getInstance()->getLogintoken($memberId, false); //设置logintoken
        //设置cookie信息
        setcookie('user_id', $memberId, time() + 604800, "/");
        setcookie('logintoken', $logintoken, time() + 604800, "/");

        $this->ajax(1, '登录成功', $memberId);
    }

    /**
     * 忘记密码-找回
     */
    public function findPasswd() {
        $phone = I('request.phone', '', 'strip_tags,htmlspecialchars,trim');
        $passwd = I('request.passwd', '', 'strip_tags,htmlspecialchars,trim');
        $verify = I('request.verify', '', 'trim');
        // 验证手机号
        if (!validPhone($phone)) {
            $this->ajax(0, '手机号码错误');
        }
        // 检测手机是否已注册
        $member = MemberModel::getInstance()->getMemberByPhone($phone);
        if (!$member) {
            $this->ajax(0, '该手机号未注册');
        }
        if (!$passwd) {
            $this->ajax(0, '密码为空');
        }
        if (!validPasswd($passwd)) {
            $this->ajax(0, '密码长度为6-32位');
        }
        // 检测验证码
        if (!SmsModel::getInstance()->checkSms($phone, $verify)) {
            $this->ajax(0, '手机验证码错误');
        }
        $data['password'] = $this->makePasswd($passwd);
        $data['updatetime'] = time();
        $re = MemberModel::getInstance()->where(array('id' => $member['id']))->save($data);
        if ($re) {
            $this->ajax(1, '找回密码成功，请登录');
        } else {
            $this->ajax(0, '找回密码失败');
        }
    }

    /**
     * 退出登录
     */
    public function loginOut() {
        $id = I('request.user_id', 0);
        MemberModel::getInstance()->emptyLogintoken($id);
        session('memberId', null);
        $this->ajax(1, '退出成功');

    }

    /**
     * 修改密码
     */
    public function changePasswd() {
        $user_id = I('request.user_id', '', 'strip_tags,htmlspecialchars,trim');
        $this->islogin($user_id);
        $passwd_old = I('request.passwd_old', '', 'strip_tags,htmlspecialchars,trim');
        $passwd_new1 = I('request.passwd_new1', '', 'strip_tags,htmlspecialchars,trim');
        $passwd_new2 = I('request.passwd_new2', '', 'strip_tags,htmlspecialchars,trim');

        if ($passwd_new1 != $passwd_new2) {
            $this->ajax(0, '两次输入的密码不一致');
        }
        if (!$passwd_new1) {
            $this->ajax(0, '新密码为空');
        }
        if (!validPasswd($passwd_new1)) {
            $this->ajax(0, '密码长度应为6-32位');
        }
        if (!$passwd_old) {
            $this->ajax(0, '旧密码为空');
        }
        // 验证旧密码
        $password = MemberModel::getInstance()->where(array('id' => $user_id))->getField('password');
        $passwd_old = $this->makePasswd($passwd_old);
        if ($password != $passwd_old) {
            $this->ajax(0, '旧密码错误');
        }
        
        $data['password'] = $this->makePasswd($passwd_new1);
        $data['updatetime'] = time();
        MemberModel::getInstance()->where(array('id' => $user_id))->save($data);
        $this->ajax(1, '修改密码成功');

    }

    /**
     * 查看个人资料/修改个人资料
     */
    public function personal_info()
    {
        $user_id = I('request.user_id', '', 'strip_tags,htmlspecialchars,trim');
        $this->islogin($user_id);
        $type = I('request.type', 0);
        if ($type == 1) { // 修改资料
            if (I('request.username', '', 'trim')) {
                $data['username'] = I('request.username', '', 'trim');
            }
            $data['sex'] = I('request.sex', 0);
            if (I('request.nickname', '', 'trim')) {
                $data['nickname'] = I('request.nickname', '', 'trim');
            }
            if (I('request.addr', '', 'trim')) {
                $data['addr'] = I('request.addr', '', 'trim');
            }
            if (I('request.email', '', 'trim')) {
                $data['email'] = I('request.email', '', 'trim');
            }
            if (I('request.id_num', '', 'trim')) {
                $data['id_type'] = I('request.id_type', 0);
                $data['id_num'] = I('request.id_num', '', 'trim');
            }
            $data['updatetime'] = time();
            $re = MemberModel::getInstance()->where(array('id' => $user_id))->save($data);
            if ($re) {
                $this->ajax(1, '修改成功');
            } else {
                $this->ajax(0, '修改失败');
            }
        } else { //显示
            $member = MemberModel::getInstance()->field('id,mobile,username,sex,nickname,addr,email,id_type,id_num')
                ->where(array('id' => $user_id))->find();
            if ($member) {
                $this->ajax(1, '获取成功', $member);
            } else {
                $this->ajax(0, '获取失败');
            }
        }
    }

    /**
     * 会员中心
     */
    public function member_center()
    {
        $user_id = I('request.user_id', '', 'strip_tags,htmlspecialchars,trim');
        $this->islogin($user_id);
        $result = array();
        $result['mobile'] = MemberModel::getInstance()->where(array('id' => $user_id))->getField('mobile');
        $result['total'] = 5;
        $result['not_confirm'] = 2;
        $result['not_pay'] = 1;
        $result['not_travel'] = 1;
        $result['cash'] = 1000;
        $result['back_cash'] = 300;
        $this->ajax(1, '获取成功', $result);
    }





}