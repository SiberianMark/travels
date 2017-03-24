<?php
namespace Admin\Controller;

/**
 * 供应商管理类
 * Date：2016-12-24
 * Created：myz
 */

use Admin\Model\PlaceModel;
use \Admin\Model\SupplierModel;
use \Admin\Model\SupplierOpModel;

class SupplierController extends CommonController
{
    /**
     * 供应商列表
     */
    public function lists()
    {
        if (I('get.company_name', '')) {
            $company_name = I('get.company_name', '');
            $where['company_name'] = array('like', "%{$company_name}%");
            $this->assign('company_name', $company_name);
        }
        if (I('get.boss_phone', '')) {
            $boss_phone = I('get.boss_phone', '');
            $where['boss_phone'] = array('like', "%{$boss_phone}%");
            $this->assign('boss_phone', $boss_phone);
        }

        $score = I('get.score', '');
        $this->assign('score', $score);
        if ($score != '-1' && $score !== '') {
            $where['score'] = $score;
        }

        $type = I('get.type', 0);
        $this->assign('type', $type);
        if ($type) {
            $where['type'] = $type;
        }
        $status = I('get.status', '');
        $this->assign('status', $status);
        if ($status != '-1' && $status !== '') {
            $where['status'] = $status;
        }

        $nowpage = I('get.nowpage', 1, 'intval');
        $count = 0;
        $count = SupplierModel::getInstance()->where($where)->count();
        $lists = SupplierModel::getInstance()->field(true)->where($where)->limit(($nowpage - 1) * $this->_pz, $this->_pz)->select();
        foreach ($lists as $k => $v) {
            $des = explode(',', $v['des']);
            if (count($des) > 1) {
                foreach ($des as $key => $val) {
                    $place[$key] = PlaceModel::getInstance()->where(array('id' => $val['id']))->getField('name');
                }
                $lists[$k]['place'] = implode(',', $place);
            } else {
                $lists[$k]['place'] = PlaceModel::getInstance()->where(array('id' => $v['des']))->getField('name');
            }
        }
        $this->assign('lists', $lists);
        $pages = ceil($count / $this->_pz);
        $this->assign('pages', $pages);
        $this->assign('count', $count);
        $this->assign('nowpage', $nowpage);
        $this->display();
    }

    /**
     * 新增供应商
     */
    public function addSupplier()
    {
        $ac = I('get.ac', 0);
        if ($ac === 'add') {
            $data['company_name'] = I('request.company_name', '', 'trim');
            $data['addr'] = I('request.addr', '');
            $data['boss'] = I('request.boss', '', 'trim');
            $data['tel'] = I('request.tel', '');
            $data['boss_phone'] = I('request.boss_phone', '');
            $data['boss_wx'] = I('request.boss_wx', '');
            $data['boss_qq'] = I('request.boss_qq', '');
            $data['note'] = I('request.note', '');
            $data['score'] = I('request.score', 0);
            $data['type'] = I('request.type', 0);
            $data['addtime'] = date("Y-m-d H:i:s");
            $data['des'] = implode(',', I('request.des_selected', 0));
            if (SupplierModel::getInstance()->where(array('company_name' => $data['company_name']))->getField('id')) {
                $this->error(L('添加失败,已经存在同名公司'), U("/Admin/Supplier/lists"), 3);
            } else {
                $res = SupplierModel::getInstance()->data($data)->add();
                if ($res > 0 && $res != false) {
                    $this->success(L('添加成功'), U("/Admin/Supplier/lists"), 2);
                } else {
                    $this->error(L('添加失败'), U("/Admin/Supplier/lists"), 3);
                }
            }
        } else {
            $this->display();
        }

    }

    /**
     * 查看
     */
    public function view()
    {
        $id = I('get.id', 0);
        $supplier = SupplierModel::getInstance()->field('id,company_name')->where(array('id' => $id))->find();
        $this->assign("supplier", $supplier);

        //查询数据
        $lists = SupplierOpModel::getInstance()->alias('o')->field('o.*')
            ->join(array("LEFT JOIN __SUPPLIER__ s ON s.id = o.sid"))->where(" s.id={$id}")->select();
        $this->assign('lists', $lists);
        $this->display();
    }

    /**
     * 编辑
     */
    public function editSupplier()
    {
        $id = I('get.id', 0);
        $ac = I('get.ac', '');
        $list = SupplierModel::getInstance()->field(true)->where(array('id' => $id))->find();
        if ($ac === 'edit') {
            $id = I('post.id', 0);
            $data['company_name'] = I('request.company_name', '', 'trim');
            $where['company_name'] = $data['company_name'];
            $where['id'] = array('neq', $id);
            if (SupplierModel::getInstance()->where($where)->find()) {
                $this->error(L('编辑失败,已经存在同名公司'), U("/Admin/Supplier/lists"), 3);
            } else {
                $data['addr'] = I('request.addr', '');
                $data['boss'] = I('request.boss', '', 'trim');
                $data['tel'] = I('request.tel', '');
                $data['boss_phone'] = I('request.boss_phone', '');
                $data['boss_wx'] = I('request.boss_wx', '');
                $data['boss_qq'] = I('request.boss_qq', '');
                $data['note'] = I('request.note', '');
                $data['score'] = I('request.score', 0);
                $data['type'] = I('request.type', 0);
                $data['status'] = I('request.status', 0);
                $data['addtime'] = date("Y-m-d H:i:s");
                $data['des'] = implode(',', I('request.des_selected', 0));
                $res = SupplierModel::getInstance()->where(array('id' => $id))->save($data);
                if ($res > 0 && $res != false) {
                    $this->success(L('编辑成功'), U("/Admin/Supplier/lists"), 2);
                } else {
                    $this->error(L('编辑失败'), U("/Admin/Supplier/lists"), 3);
                }
            }
        } else {
            $list['place'] = '';
            $des = explode(',', $list['des']);
            if (count($des) > 1) {
                foreach ($des as $k => $v) {
                    $place = PlaceModel::getInstance()->field('id,name')->where(array('id' => $v['id']))->find();
                    $list['place'] .= '<span style="margin-right: 1em;font-size: 1.125em">';
                    $list['place'] .= '<input type="hidden" name="des_selected[]" value="'.$place['id'].'"/>' .$place['name'];
                    $list['place'] .= '<i class="Hui-iconfont" onclick="del_place(this)" style="cursor:pointer">&#xe6a6;</i></span>';
                }
            } else {
                $place = PlaceModel::getInstance()->field('id,name')->where(array('id' => $des[0]['id']))->find();
                $lists['place'] =  $list['place'] .= '<span style="margin-right: 1em;font-size: 1.125em">';
                $list['place'] .= '<input type="hidden" name="des_selected[]" value="'.$place['id'].'"/>' .$place['name'];
                $list['place'] .= '<i class="Hui-iconfont" onclick="del_place(this)" style="cursor:pointer">&#xe6a6;</i></span>';
            }
            $this->assign("list", $list);
            $this->display();
        }

    }

    /**
     * 供应商OP-添加操作
     */
    public function addOp()
    {
        $ac = I('get.ac', 0);
        $sid = I('sid', 0);
        if ($ac === 'add') {
            $data['name'] = I('request.name', '', 'trim');
            if (SupplierOpModel::getInstance()->field('id')->where(array('sid' => $sid, 'name' => $data['name']))->find()) {
                $this->error(L('添加失败, 员工名字已经存在'), U("/Admin/Supplier/view/id/{$sid}"), 3);
            }
            $data['tel'] = I('request.tel', '');
            $data['phone'] = I('request.phone', '');
            $data['wx'] = I('request.wx', '');
            $data['qq'] = I('request.qq', '');
            $data['note'] = I('request.note', '');
            $data['addtime'] = date('Y-m-d H:i:s');
            $data['sid'] = $sid;
            $res = SupplierOpModel::getInstance()->data($data)->add();
            if ($res > 0 && $res != false) {
                $this->success(L('添加成功'), U("/Admin/Supplier/view/id/{$sid}"), 2);
            } else {
                $this->error(L('添加失败'), U("/Admin/Supplier/view/id/{$sid}"), 3);
            }
        } else {
            $this->assign("sid", $sid);
            $this->display();
        }
    }

    /**
     * 供应商OP-编辑操作
     */
    public function editOp()
    {
        $ac = I('get.ac', 0);
        $sid = I('sid', 0);
        $id = I('id', 0);
        $list = SupplierOpModel::getInstance()->field(true)->where(array('id' => $id))->find();
        if ($ac === 'edit') {
            $data['name'] = I('request.name', '', 'trim');
            if (SupplierOpModel::getInstance()->field('id')->where(array('sid' => $sid, 'name' => $data['name'], 'id' => array('neq', $id)))->find()) {
                $this->error(L('修改失败, OP名字已经存在'), U("/Admin/Supplier/view/id/{$sid}"), 3);
            }
            $data['tel'] = I('request.tel', '');
            $data['phone'] = I('request.phone', '');
            $data['wx'] = I('request.wx', '');
            $data['qq'] = I('request.qq', '');
            $data['note'] = I('request.note', '');
            $data['addtime'] = date('Y-m-d H:i:s');
            $res = SupplierOpModel::getInstance()->where(array('id' => $id))->save($data);
            if ($res > 0 && $res != false) {
                $this->success(L('修改成功'), U("/Admin/Supplier/view/id/{$sid}"), 2);
            } else {
                $this->error(L('修改失败'), U("/Admin/Supplier/view/id/{$sid}"), 3);
            }
        } else {
            $this->assign("list", $list);
            $this->assign("sid", $sid);
            $this->display();
        }
    }

    /**
     * 供应商OP-删除操作
     */
    public function delOp()
    {
        $id = I('id', 0);
        //TODO 如果有线路在负责，需要先修改线路OP后才能删除。

        $result = SupplierOpModel::getInstance()->where(array('id' => $id))->delete();
        if ($result) {
            $this->ajaxReturn(array('status' => 1, 'info' => '删除成功'));
        } else {
            $this->ajaxReturn(array('status' => 0, 'info' => '删除失败'));
        }
    }

    /**
     * 供应商OP列表
     */
    public function OPList()
    {
        $id = I('id', 0);
        $result = SupplierOpModel::getInstance()->field('id,name')->where(array('sid' => $id))->select();
        $this->ajaxReturn($result);
    }



}