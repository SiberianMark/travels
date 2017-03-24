<?php
namespace Admin\Controller;

use Admin\Model\AdminDepaModel;
use Admin\Model\AdminModel;
use Admin\Model\WebInfoModel;
use Admin\Service\LoginService;

/**
 * 后台登录菜单控制类
 * Date：2016-09-30
 * Created：myz
 */
class IndexController extends CommonController
{
    /**
     * 后台首页
     */
    public function index()
    {
        $pmenu = M('menu')->where(array('pid' => 0, 'type' => 1, 'isshow' => 1, 'deep' => 1))->order('orderid asc')->select();
        if ($pmenu) {
            $rule = AdminDepaModel::getInstance()->where(array('id' => session('user.department')))->getField('rules');
            if ($rule) {
                $rule = explode(',', $rule);
                foreach ($pmenu as $k => $v) {
                    if (in_array($v['id'], $rule)) {
                        $smenu = M('menu')->where(array('pid' => $v['id'], 'type' => 1, 'isshow' => 1, 'deep' => 2))->order('orderid asc')->select();
                        foreach ($smenu as $sk => $sv) {
                            if (! in_array($sv['id'], $rule)) {
                                unset($smenu[$sk]);
                            }
                        }
                        $pmenu[$k]['smenu'] = array_values($smenu);
                    } else {
                        unset($pmenu[$k]);
                    }
                }
                $pmenu = array_values($pmenu);
            } else {
                return $this->error(L('您无任何权限，请联系公司客服'), '/admin/index/login', 3);
            }
        } else {
            return $this->error(L('您无任何权限，请联系公司客服'), '/admin/index/login', 3);
        }
        $this->assign('pmenu', $pmenu);
        $this->display();
    }

    /**
     * 欢迎统计页
     */
    public function welcome()
    {
        $this->display();
    }

    /**
     * 登录页面
     */
    public function login()
    {
        $token = md5(microtime() . rand(1, 10000));
        session('_token', $token);
        $this->assign('token', $token);
        $this->display();
    }

    /**
     * 执行登录
     */
    public function doLogin()
    {
        $token = I('token', '');
        $_token = session('_token');
        $phone = I('phone', '');
        $psd = I('psd', '');
        $validateCode = I('request.validateCode', '');
        $remember_pwd = I('post.online', 0);
        if (!$token || $token != $_token) {
            return $this->error(L('登录错误'), '/admin/index/login', 3);
        }

        $validate = session('validateCode');
        session('validateCode', null);
        if (!$validateCode || $validate != $validateCode) {
            //return $this->error(L('验证码错误'), '/admin/index/login', 3);
        }

        if (!$phone || !$psd) {
            return $this->error(L('账号或密码为空'), '/admin/index/login', 3);
        }

        $user = AdminModel::getInstance()->getUserByPhone($phone);
        if (! $user) {
            return $this->error(L('账号或密码错误'), '/admin/index/login', 3);
        }
        if (makePasswd($psd) != $user['password']) {
            return $this->error(L('账号或密码错误'), '/admin/index/login', 3);
        } else {
            if ($remember_pwd == 1) {
                cookie('phone', $phone, 3600);
                cookie('psd', $psd, 3600);
            }else{
                cookie(null);
            }
            $user['password'] = null;
            session('user', $user);
            //session('adminName', $user['name']);
            //session('adminDept', $user['department']);
            session(array('name' => 'user', 'expire' => 60)); //1小时自动退出
            session('adminName', session('user')['name']);
            session('adminDept', session('user')['department']);
            session('logintime',time());
            $result['loginip'] = get_client_ip();
            $result['lastlogintime'] = date("Y-m-d H:i:s");
            AdminModel::getInstance()->where(array('id' => session('user')['id']))->save($result); //更新登陆信息
            return $this->success(L('登录成功'), '/admin/index/index', 3);
        }

    }

    /**
     * 修改当前管理员的密码
     */
    public function modifyPassword()
    {
        $id = I('request.id', 0);
        $password_old = I('request.password_old', '', 'strip_tags,htmlspecialchars,trim');
        $password_new = I('request.password_new', '', 'strip_tags,htmlspecialchars,trim');
        $password_newr =  I('request.password_newr', '', 'strip_tags,htmlspecialchars,trim');
        if( makePasswd($password_old) != AdminModel::getInstance()->where(array('id' => $id))->getField('password')) $this->ajaxReturn(array('status' => 0, 'msg' => '旧密码不正确！'));
        if(!$password_new || !$password_newr ) $this->ajaxReturn(array('status' => 0, 'msg' => '密码或者确认密码不能为空！'));
        if($password_new !== $password_newr) $this->ajaxReturn(array('status' => 0, 'msg' => '两次输入的密码不一致！'));
        $data['password'] = makePasswd($password_new);
        $result = AdminModel::getInstance()->where(array('id' => $id))->save($data);
        if ($result !== false) {
            $this->ajaxReturn(array('status' => 1, 'msg' => '修改成功'));
        } else {
            $this->ajaxReturn(array('status' => 0, 'msg' => '修改失败'));
        }
    }

    /**
     * 退出登录
     */
    public function loginout ()
    {
        session('user', null);
        echo "<script>top.location.href='/admin/index/login';</script>";
    }

    /**
     * 网站信息
     */
    public function web_info()
    {
        $ac = I('get.ac', 0);
        if ($ac === 'add') {
            $data['id'] = I('id', 0);
            $data['web_title']= I('request.web_title', '');
            $data['web_keywords']= I('request.web_keywords', '');
            $data['main_color'] = I('request.main_color', '');
            $data['company_name'] = I('request.company_name', '');
            $data['company_addr'] = I('request.company_addr', '');
            $data['web_id'] = I('request.web_id', '');
            $data['web_tel'] = I('request.web_tel', '');
            $pc_logo = $_FILES['pc_logo'];
            if ($pc_logo['size'] > 0) {
                $pc = WebInfoModel::getInstance()->where(Array('id' => $data['id']))->getField('pc_logo');
                if ($pc) {
                    del_img($pc);
                }
                $data['pc_logo'] = $this->upload_img_one($pc_logo, 'image'); //更新图片
            }
            $mobile_logo = $_FILES['mobile_logo'];
            if ($mobile_logo['size'] > 0) {
                $mob = WebInfoModel::getInstance()->where(Array('id' => $data['id']))->getField('mobile_logo');
                if ($mob) {
                    del_img($mob);
                }
                $data['mobile_logo'] = $this->upload_img_one($mobile_logo, 'image'); //更新图片
            }
            if ($data['id']) {
                WebInfoModel::getInstance()->where(Array('id' => $data['id']))->save($data);
            } else {
                $data['id'] = WebInfoModel::getInstance()->data($data)->add();
            }
        } else {
            $data = WebInfoModel::getInstance()->field(true)->find();
        }
        $this->assign("list", $data);
        $this->display();
    }




}