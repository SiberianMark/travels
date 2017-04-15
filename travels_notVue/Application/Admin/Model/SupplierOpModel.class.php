<?php
/**
 * 供应商OP模型
 * Created by myz.
 * Date: 2016/12/24
 * Time: 14:37
 */
namespace Admin\Model;

use Think\Model;

class SupplierOpModel extends Model {
    protected $trueTableName = 'mmm_supplier_op';


    /**
     * Single
     * @return SupplierOpModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }


}