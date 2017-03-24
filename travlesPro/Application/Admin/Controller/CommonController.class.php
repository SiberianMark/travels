<?php
/**
 * Created by PhpStorm.
 * User: myz
 * Date: 2016/8/4
 * Time: 12:08
 */
namespace Admin\Controller;
use Think\Controller;

class CommonController extends Controller
{

    public $_pz;  //分页数
    public $upload_rootpath; //上传图片根目录


    /**
     * 管理员id
     * @var AdminModel
     */
    protected $admin;


    /**
     * 检测登录，权限控制等
     */
    public function _initialize()
    {
        $this->_pz = 10;
        $this->upload_rootpath = C('upload_rootpath');
        // 限制访问
        $ip = get_client_ip();
//         if (!in_ipList($ip, C('ipList'))) {
//             header("Http/1.1 404 Not Found");
//             exit;
//         }
        $this->is_login();
        $this->checkAdminSession();
    }



    /**
     * 判断登录
     */
    public function is_login()
    {
        if (!session('user')) {
            if (ACTION_NAME !== 'login' && ACTION_NAME !== 'dologin') {
//            redirect('/Admin/Index/login', 0, '页面跳转中...');
                echo "<script> top.location.href = '/Admin/Index/login'; </script>";
            }
        }
        $this->admin = session('user');
    }

    /**
     * 检测超时
     */
    public function checkAdminSession() {
        if (ACTION_NAME !== 'login' && ACTION_NAME !== 'dologin') {
            //设置超时为2h
            $nowtime = time();
            $s_time = session('logintime');
            if (($nowtime - $s_time) > 7200) {
                session('logintime', null);
                echo "<script> top.location.href = '/Admin/Index/login'; </script>";
            } else {
                session('logintime',$nowtime);
            }
        }

    }


    /**
     * 上传单张原图片
     */
    public function upload_img_one($filename, $savepath, $newname = "", $subName = false)
    {
        $upload = new \Think\Upload(); // 实例化上传类
        $upload->maxSize = 3145728; // 设置附件上传大小
        $upload->exts = array('jpg', 'gif', 'png', 'jpeg'); //上传类型
        $upload->rootPath = $this->upload_rootpath;//设置上传根目录
        $upload->savePath = $savepath . '/'; //上传目录,单个文件
        if ($subName) { //判断是否生成日期子文件夹
            $upload->subName = "";
        }
        if (!empty($newname))
            $upload->saveName = $newname;
        $info = $upload->uploadOne($filename);
        //echo $upload->getError();
        //var_dump($upload);exit;
        if ($info) {
            $source = $upload->rootPath . $info['savepath'] . $info['savename']; //原图位置
            return substr($source, 1); //去掉./Source 中的.
        }
    }

}