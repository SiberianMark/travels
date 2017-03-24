<?php
/**
 * 网站信息模型
 * Created by myz.
 * Date: 2017/1/20
 * Time: 14:37
 */
namespace Admin\Model;

use Think\Model;

class WebInfoModel extends Model {
    protected $trueTableName = 'mmm_web_info';


    /**
     * Single
     * @return WebInfoModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }




}