<?php
namespace Home\Controller;

class IndexController extends CommonController
{

    public function _initialize()
    {
        parent::_initialize();
        if(isMobile()) {
            C('DEFAULT_THEME', 'mobile');
        }

    }

    public function index(){
        //$key = md5(time() . rand(1,1000));
        //echo $key;
        $a = '1';
        //$file = $_FILES['file'];
        //var_dump($file);
        //echo phpinfo();
        //exit;
        $this->display();
    }


}