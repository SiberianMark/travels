<?php
/**
 * 部门管理模型
 * Created by myz.
 * Date: 2016/10/8
 * Time: 14:37
 */
namespace Admin\Model;

use Think\Model;

class AdminDepaModel extends Model {
    protected $trueTableName = 'mmm_employee_depa';


    /**
     * Single
     * @return AdminDepaModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }

    /**
     * 获取部门列表
     */
    public function getDepaLists() {
        return $this->field('id,name')->where(array('is_del' => 0))->select();
    }
}