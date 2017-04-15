<?php
/**
 * 目的地管理类
 * Date：2016-12-19
 * Created：myz
 */
namespace Admin\Controller;

use Admin\Model\PlaceModel;

class PlaceController extends CommonController
{
    /**
     * 线路出发地，目的地列表
     */
    public function placelist()
    {
        $place = PlaceModel::getInstance()->field(true)->where(array('parentid' => 0))->select();
        $this->assign('place', $place);

        $status = I('status', 0) ? I('status', 0) : 1; //顶级id
        $one_id = I('one_id', 0); //一级地址id
        $two_id = I('two_id', 0); //二级地址id

        $place1 = PlaceModel::getInstance()->field(true)->where(array('parentid' => $status))->order(array('order'=>'DESC','first_letter'))->select(); //一级地址
        $top_name = PlaceModel::getInstance()->where(array('id' => $status))->getField('name');
        if ($one_id) {
            $place2 = PlaceModel::getInstance()->field(true)->where(array('parentid' => $one_id))->order(array('order'=>'DESC','first_letter'))->select(); //二级地址
            $one_name = PlaceModel::getInstance()->where(array('id' => $one_id))->getField('name');
        }
        if ($one_id && $two_id) {
            $place3 = PlaceModel::getInstance()->field(true)->where(array('parentid' => $two_id))->order(array('order'=>'DESC','first_letter'))->select(); //三级地址
            $two_name = PlaceModel::getInstance()->where(array('id' => $two_id))->getField('name');
        }

        $this->assign('status', $status);
        $this->assign('one_id', $one_id);
        $this->assign('two_id', $two_id);

        $this->assign('top_name', $top_name);
        $this->assign('one_name', $one_name);
        $this->assign('two_name', $two_name);

        $this->assign('place1', $place1);
        $this->assign('place2', $place2);
        $this->assign('place3', $place3);

        $this->display();
    }

    /**
     * 新增地址
     */
    public function addplace() {
        $data['parentid'] = I('pid', 0);
        $data['name'] = I('name', '', 'trim');
        $data['order'] = I('order', 0);
        $data['first_letter'] = I('first_letter', '');
        $data['is_island'] = I('is_island', 0);
        $data['type'] = I('type', 0);
        if (!$data['parentid'] || !$data['name']) {
            $this->ajaxReturn(array('status' => 0, 'info' => '添加失败，地址名字空或者上级id为0'));
        }
        if (PlaceModel::getInstance()->field('id')->where(array('name' => $data['name'], 'parentid' => $data['parentid']))->find()) {
            $this->ajaxReturn(array('status' => 0, 'info' => '添加失败，该级已经有同名地址'));
        }
        $re = PlaceModel::getInstance()->data($data)->add();
        if ($re) {
            $this->ajaxReturn(array('status' => 1, 'info' => '添加成功'));
        } else {
            $this->ajaxReturn(array('status' => 0, 'info' => '添加失败'));
        }
    }

    /**
     * 修改地址
     */
    public function editplace() {
        $id = I('id', 0);
        $data['name'] = I('name', '', 'trim');
        $data['order'] = I('order', 0);
        $data['first_letter'] = I('first_letter', '');
        $data['is_island'] = I('is_island', 0);
        if (!$id || !$data['name']) {
            $this->ajaxReturn(array('status' => 0, 'info' => '修改失败，地址名字空或者id为0'));
        }
        $pid = PlaceModel::getInstance()->where(array('id' => $id))->getField('parentid');
        if (PlaceModel::getInstance()->field('id')->where(array('name' => $data['name'], 'parentid' => $pid, 'id' => array('neq', $id)))->find()) {
            $this->ajaxReturn(array('status' => 0, 'info' => '修改失败，该级已经有同名地址'));
        }
        $re = PlaceModel::getInstance()->where(array('id' => $id))->save($data);
        if ($re) {
            $this->ajaxReturn(array('status' => 1, 'info' => '修改成功'));
        } else {
            $this->ajaxReturn(array('status' => 0, 'info' => '修改失败'));
        }
    }

    /**
     * 地址-删除操作
     */
    public function delplace()
    {
        $id = I('id', 0);
        if (PlaceModel::getInstance()->field('id')->where(array('parentid' => $id))->select()) {
            $this->ajaxReturn(array('status' => 0, 'info' => '需要先删除下级地址才能删除'));
        } else {
            $result = PlaceModel::getInstance()->where(array('id' => $id))->delete();
            if ($result) {
                $this->ajaxReturn(array('status' => 1, 'info' => '删除成功'));
            } else {
                $this->ajaxReturn(array('status' => 0, 'info' => '删除失败'));
            }
        }
    }

    /**
     * 获取地址
     */
    public function getplace(){
        $id = I('id', 0);
        $result = PlaceModel::getInstance()->field(true)->where(array('id' => $id))->find();
        if ($result) {
            $this->ajaxReturn(array('status' => 1, 'info' => $result));
        } else {
            $this->ajaxReturn(array('status' => 0, 'info' => '获取地址失败'));
        }
    }

    /**
     * 根据父级id获取地址,选择页面
     */
    public function placeSelect(){
        $parentid = I('parentid', 0);
        $data['parentname'] = PlaceModel::getInstance()->where(array('id' => $parentid ))->getField('name');
        $lists = PlaceModel::getInstance()->getMenu($parentid, 'child');
        $str = '<div style="margin-left: 2.5em">';
        foreach ($lists as $v) {
            $str .= '<dl><dt style="margin: 0.3em"><label><input type="checkbox" value="'.$v['id'].'" place="'.$v['name'].'" name="rules[]">';
            $str .= '<span style="background-color: lightgrey;font-size: 1.125em">'.$v['name'].'</span></label></dt>';
            if ($v['child']) {
                foreach ($v['child'] as $v1) {
                    $str .= '<dd style="margin-left: 1.25em">';
                    $str .= '<dl>';
                    $str .= '<dt style="margin: 0.3em">';
                    $str .= '<label><input type="checkbox" value="'.$v1['id'].'" place="'.$v1['name'].'" name="rules[]"><span style="background-color: lightgreen;font-size: 1.125em">'.$v1['name'].'</span></label>';
                    $str .= '</dt>';
                    if ($v1['child']) {
                        foreach ($v1['child'] as $v2) {
                            $str .= '<span style="margin-left: 1.25em">';
                            $str .= '<label style="padding-right:0.625em;"><input type="checkbox" value="'.$v2['id'].'" place="'.$v2['name'].'" name="rules[]">'.$v2['name'].'</label>';
                            $str .= '</span>';
                        }
                    }
                    $str .= '</dl>';
                    $str .= '</dd>';
                }
            }
            $str .= '</dl>';
        }
        $str .= '</div>';
        $data['str'] = $str;
        $this->ajaxReturn($data);
    }

}