<?php
/**
 * 员工工资管理模型
 * Created by myz.
 * Date: 2016/11/8
 * Time: 14:37
 */
namespace Admin\Model;

use Think\Model;

class EmployeeSalaryModel extends Model {
    protected $trueTableName = 'mmm_employee_salary';


    /**
     * Single
     * @return EmployeeSalaryModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }


}