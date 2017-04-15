<?php
/**
 * 线路行程模型
 * Created by myz.
 * Date: 2017/1/9
 * Time: 14:37
 */
namespace Admin\Model;

use Think\Model;

class LineJourneyModel extends Model {
    protected $trueTableName = 'mmm_line_journey';


    /**
     * Single
     * @return LineJourneyModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }




}