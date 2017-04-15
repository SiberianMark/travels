<?php
namespace Admin\Service;

use Think\Single;

/**
 * 登录逻辑类
 *
 * @author mayongzhen
 * $date 2016-06-01
 */
class LoginService extends Single
{
	/**
	 * Single
	 *
	 * @return LoginService
	 */
	public static function getInstance()
	{
		return parent::getInstance(__CLASS__);
	}

	/**
	 * 获取登录ID
	 *
	 * @return int
	 */
	public function getLoginUser()
	{
		return I('session.adminId', 0);
	}

	/**
	 * 根据输入密码生成加密串
	 *
	 * @param string $password
	 *
	 * @return string
	 */
	public function makePassword($password)
	{
		return md5("ma" . $password . "tu");
	}


}