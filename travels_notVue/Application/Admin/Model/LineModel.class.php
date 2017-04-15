<?php
/**
 * 线路模型
 * Created by myz.
 * Date: 2016/12/24
 * Time: 14:37
 */
namespace Admin\Model;

use Think\Model;

class LineModel extends Model {
    protected $trueTableName = 'mmm_line';


    /**
     * Single
     * @return LineModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }

    /**
     * 获取所有线路的目的地
     * @param  $des_type 目的地类型
     * @return array
     */
    public function getDes($des_type = 0) {
        if ($des_type) {
            $where['des_type'] = $des_type;
        }
        $where['status'] = array('neq', 4);
        $des = $this->field('des')->where($where)->select();
        $place = '';
        foreach ($des as $k => $v) {
            $place .= $v['des'];
            if ($k != count($des) - 1) {
                $place .= ',';
            }
        }
        $place = explode(',', $place);
        $place = array_unique($place);
        $place = array_values($place);
        $des = array();
        foreach ($place as $k => $v) {
            $des[$k]['id'] = $v;
            $des[$k]['name'] = PlaceModel::getInstance()->where(array('id' => $v))->getField('name');
        }
        return $des;
    }

    /**
     * 获取所有线路的供应商
     * @param  $des_type 目的地类型
     * @return array
     */
    public function getSupplier($des_type = 0) {
        if ($des_type) {
            $where['des_type'] = $des_type;
        }
        $where['status'] = array('neq', 4);
        $suppliers = $this->alias('l')->field('o.sid')
            ->join(array('LEFT JOIN __SUPPLIER_OP__ AS o ON o.id = l.supplier_op'))
            ->where($where)->group('o.sid')->select();
        $result = array();
        foreach ($suppliers as $k => $v) {
            $result[$k] = SupplierModel::getInstance()->field('id,company_name')
                ->where(array('id' => $v['sid']))->find();
        }
        return $result;
    }

}