<?php
namespace Home\Controller;

use \Common\Model\MemberModel;

class UserController extends CommonController
{

    public function _initialize()
    {
        parent::_initialize();
    }

    public function index(){
        $phone = I('request.phone', 0);
		$data = MemberModel::getInstance()->where(array('mobile' => $phone))->find();
        $this->ajax(1, '成功', $data);
    }



}