<?php
namespace Admin\Controller;

use Think\Controller;
use Admin\Model\AdminModel;
use Admin\Service\LoginService;

/**
 * 后台管理基类
 *
 * @author mayongzhen
 * @date 2016-06-02
 */
abstract class AdminController extends Controller {

    /**
     * 管理员id
     *
     * @var AdminModel
     */
    protected $admin;

    /**
     * 限制ip等
     */
    public function _initialize()
    {
        // 限制访问
        $ip = get_client_ip();
//         if (!in_ipList($ip, C('ipList'))) {
//             header("Http/1.1 404 Not Found");
//             exit;
//         }

        // 检测登录
        $loginSrv = new LoginService();
        $adminId = $loginSrv->getLoginUser();
        if (!$adminId) {
            redirect('/Login/login', 0, '页面跳转中...');
            return;
        }
        $this->admin = AdminModel::getInstance()->getUserById($adminId);
    }



}