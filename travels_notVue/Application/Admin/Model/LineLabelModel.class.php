<?php
/**
 * 线路标签模型
 * Created by myz.
 * Date: 2016/12/24
 * Time: 14:37
 */
namespace Admin\Model;

use Think\Model;

class LineLabelModel extends Model {
    protected $trueTableName = 'mmm_line_label';


    /**
     * Single
     * @return LineLabelModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }


}