<?php
/**
 * 线路团期价格模型
 * Created by myz.
 * Date: 2017/02/05
 * Time: 14:37
 */
namespace Admin\Model;

use Think\Model;

class LineDateModel extends Model {
    protected $trueTableName = 'mmm_line_date';


    /**
     * Single
     * @return LineDateModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }


}