<?php
/**
 * 线路目的地模型
 * Created by myz.
 * Date: 2016/12/19
 * Time: 14:37
 */
namespace Admin\Model;

use Think\Model;

class PlaceModel extends Model {
    protected $trueTableName = 'mmm_line_place';


    /**
     * Single
     * @return PlaceModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }

    /**
     * 根据父id递归遍历获取当前及子地址
     * @param int $pid 父id
     * @param string $name 子级健名
     * @return mixed
     */
    public function getMenu($pid, $name = 'child')
    {
        $re = $this->where(array('parentid' => $pid))->order('first_letter ASC')->select();
        if ($re) {
            foreach ($re as $k => $v) {
                $sub = $this->getMenu($v['id'], 'child');
                if ($sub) {
                    $re[$k][$name] = $sub;
                }
            }
            return $re;
        } else {
            return false;
        }
    }

    /**
     * 根据以逗号分隔的id字符串获得逗号分隔的对应名字
     * @param string $id 以逗号分隔的id字符串
     * @return string 逗号分隔的对应名字
     */
    public function getNameString($id) {
        $id = explode(',', $id);
        $str = array();
        foreach ($id as $k => $v) {
            $str[] = $this->where(array('id' => $v))->getField('name');
        }
        $str = implode(',', $str);
        return $str;
    }

}