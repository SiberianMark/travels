<?php
/**
 * 供应商模型
 * Created by myz.
 * Date: 2016/12/24
 * Time: 14:37
 */
namespace Admin\Model;

use Think\Model;

class SupplierModel extends Model {
    protected $trueTableName = 'mmm_supplier';


    /**
     * Single
     * @return AdTypeModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }


}