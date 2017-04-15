<?php
/**
 * 广告位置模型
 * Created by myz.
 * Date: 2016/11/22
 * Time: 14:37
 */
namespace Admin\Model;

use Think\Model;

class AdTypeModel extends Model {
    protected $trueTableName = 'mmm_ad_type';


    /**
     * Single
     * @return AdTypeModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }


}