<?php
/**
 * 订单模型
 * Created by myz.
 * Date: 2017/03/08
 * Time: 14:37
 */
namespace Common\Model;

use Think\Model;

class OrderModel extends Model {
    protected $trueTableName = 'mmm_order';


    /**
     * Single
     * @return OrderModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }



}

