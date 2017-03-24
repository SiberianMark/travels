<?php
/**
 * 线路图片模型
 * Created by myz.
 * Date: 2017/1/9
 * Time: 14:37
 */
namespace Admin\Model;

use Think\Model;

class LineImageModel extends Model {
    protected $trueTableName = 'mmm_line_image';


    /**
     * Single
     * @return LineImageModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }




}