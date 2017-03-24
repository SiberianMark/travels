<?php
namespace Admin\Model;

use Think\Model;

class AdminModel extends Model
{
	protected $trueTableName = 'mmm_employee';

	protected $fields = array('id', 'name', 'phone', 'password', 'department', 'qq', 'weixin', 'email', 'sex', 'nativeplace', 'address', 'entrytime', 'status', 'addtime', 'note', 'is_del', 'loginip', 'lastlogintime', '_pk' => 'id', );

	/**
	 * Single
	 *
	 * @return AdminModel
	 */
	public static function getInstance()
	{
		return parent::getInstance(__CLASS__);
	}

	/**
	 * 部门： 1-OP
	 */
	const DEPT_OP = 1;

	/**
	 * 部门： 2-财务部
	 */
	const DEPT_CW = 2;


	/**
	 * @param string $name
	 * @return mixed
	 */
	public function getUserByName($name)
	{
		return $this->field(true)->where(array('name' => $name, 'is_del' => 0, 'status' => 0))->find();
	}

	/**
	 * @param string $phone
	 * @return mixed
	 */
	public function getUserByPhone($phone)
	{
		return $this->field(true)->where(array('phone' => $phone, 'is_del' => 0, 'status' => 0))->find();
	}


	/**
	 * @param int $id
	 * @return mixed
	 */
	public function getUserById($id)
	{
		return $this->field(true)->where(array('id' => $id, 'is_del' => 0, 'status' => 0))->find();
	}
}