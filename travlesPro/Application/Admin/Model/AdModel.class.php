<?php
/**
 * 广告模型
 * Created by myz.
 * Date: 2016/11/22
 * Time: 14:37
 */
namespace Admin\Model;

use Think\Model;

class AdModel extends Model {
    protected $trueTableName = 'mmm_ad';


    /**
     * Single
     * @return AdModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }


}