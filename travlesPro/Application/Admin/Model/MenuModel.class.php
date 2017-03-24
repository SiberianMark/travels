<?php
namespace Admin\Model;

use Think\Model;

class MenuModel extends Model
{
	protected $trueTableName = 'mmm_menu';

	protected $fields = array('id', 'title', 'addr', 'pid', 'deep', 'isshow', 'orderid',
		'controller', 'action', 'type', 'status', '_pk' => 'id', );

	/**
	 * Single
	 *
	 * @return MenuModel
	 */
	public static function getInstance()
	{
		return parent::getInstance(__CLASS__);
	}



	/**
	 * 根据父id递归遍历获取当前及子菜单
	 * @param int $pid 父id
	 * @param int $type 菜单类型
	 * @param string $name 子级健名
	 * @return mixed
	 */
	public function getMenu($pid = 0, $type = 1, $name = 'child')
	{
		$menu = $this->where(array('pid' => $pid, 'isshow' => 1, 'type' => 1))->order('orderid ASC')->select();
		if ($menu) {
			foreach ($menu as $k => $v) {
				$sub = $this->getMenu($pid = $v['id'], $type = 1, $name = 'child');
				if ($sub) {
					$menu[$k][$name] = $sub;
				}
			}
			return $menu;
		} else {
			return false;
		}
	}



}