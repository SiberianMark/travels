<?php
namespace Home\Controller;
use Common\Model\MemberModel;
use Think\Controller;

class CommonController extends Controller
{

	public $_debug;  //调试模式
	public $_empty;  //空操作
	public $_pz;  //分页数
	public function _initialize()
	{
		$this->_empty = '404 Not Found';
		$this->_debug = 0;  //1 开发调试模式  0 上线模式
		$this->_pz = 3;
		/*if(isMobile()) {
			C('DEFAULT_THEME', 'wap');
		}*/

	}

	public function _empty() {
		$this->ajax(0, $this->_empty);
	}

	/**
	 * 根据输入密码生成加密窜
	 * @param string $passwd
	 * @return string
	 */
	function makePasswd($passwd)
	{
		if (!$passwd) return '';
		return md5($passwd . "zym");
	}

	/**
	 * ajax return
	 * @param mixed $data
	 * @param string $info
	 * @param int $status
	 */
	protected function ajax($status = 1, $info = '', $data = '') {
		$numargs = func_num_args();
		$data = array('status' => $status, 'now' => time(), 'info' => $info, 'data' => $data);
		//参数个数超过3个时，若参数为数组则进行合并
		if ($numargs > 3) {
			$args = func_get_args();
			unset($args[0], $args[1], $args[2]);
			foreach ($args as $id => $v) {
				if (is_array($v)) $data = array_merge($data, $v);
			}
		}
		if (isset($_REQUEST["callback"]) && !empty($_REQUEST["callback"])) {
			$this->ajaxReturn($data, 'JSONP');
		} else {
			$this->ajaxReturn($data, 'JSON');
		}
	}

	/**
	 * 验证是否登录
	 * @param $id
	 */
	public function islogin($id) {
		if ($this->_debug) {
			return true;
		}
		$id = intval($id);
		if ($id <= 0) {
			$this->ajax(-1, '自动登录失效,请重新登录');
		}
		$logintoken = I('request.logintoken', '');
		$Ulogintoken = S($id . '_logintoken'); //读取缓存里的logintoken值
		if (empty($Ulogintoken)) { //缓存不存在
			$Ulogintoken = MemberModel::getInstance()->where("id={$id}")->getField('logintoken');  //查找用户logintoken值
			if (!empty($Ulogintoken)) {
				S($id . '_logintoken', $logintoken, 86400);  //写入缓存
			} else {
				$this->ajax(-1, '自动登录失效,请重新登录');
			}
		}
		if ($Ulogintoken != $logintoken) {
			//清空用户的登录令牌
			MemberModel::getInstance()->emptyLogintoken($id);
			$this->ajax(-1, '自动登录失效,请重新登录');
		}
		//延期logintoken的缓存时间
		S($id . '_logintoken', $logintoken, 86400);  //写入缓存
		return true;
	}




}
