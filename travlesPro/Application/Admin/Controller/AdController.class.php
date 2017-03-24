<?php
/**
 * 广告管理类
 * Created by myz
 * Date: 2016/11/22
 * Time: 17:46
 */
namespace Admin\Controller;


use Admin\Model\AdTypeModel;
use Admin\Model\AdModel;
use Think\Page;

class AdController extends CommonController
{
    public function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 广告位置列表
     */
    public function adtype()
    {
        //分页
        $Count = AdTypeModel::getInstance()->field(true)->count();
        $Page = new Page($Count, $this->_pz);
        $show = $Page->showHui();
        $mod_list = AdTypeModel::getInstance()->field(true)->order('id ASC')->limit($Page->firstRow . ',' . $Page->listRows)->select();

        //显示
        $this->assign('page', $show); // 赋值分页输出
        $this->assign('mod_list', $mod_list);
        $this->display();
    }

    /**
     * 广告位置添加
     */
    public function addadtype()
    {
        $name = I('name', '', 'trim');
        if ($name) {
            $data['name'] = $name;
            if (AdTypeModel::getInstance()->where($data)->find()) {
                $this->ajaxReturn(array('status' => 0, 'info' => '广告位名称已经存在'));
            } else {
                $result = AdTypeModel::getInstance()->data($data)->add();
                if ($result) {
                    $this->ajaxReturn(array('status' => 1, 'info' => '添加成功'));
                } else {
                    $this->ajaxReturn(array('status' => 0, 'info' => '添加失败'));
                }
            }
        } else {
            $this->ajaxReturn(array('status' => 0, 'info' => '广告位名称为空'));
        }
    }

    /**
     * 改变广告位置启动/暂停的状态
     */
    public function changeStatus()
    {
        $id = I('request.id', 0);
        $status = I('request.status', false);
        if ($status == 1) {
            $res = AdTypeModel::getInstance()->where(array('id' => $id))->save(array('status' => 1));
        } else {
            $res = AdTypeModel::getInstance()->where(array('id' => $id))->save(array('status' => 0));
        }
        if ($res) {
            $this->ajaxReturn(1);
        } else {
            $this->ajaxReturn(0);
        }
    }

    /**
     * 广告位置-编辑操作
     */
    public function editadtype()
    {
        $id = I('id', 0);
        $name = I('name', '', 'trim');
        if ($name) {
            $data['name'] = $name;
            $data['id'] = array('neq', $id);
            if (AdTypeModel::getInstance()->where($data)->find()) {
                $this->ajaxReturn(array('status' => 0, 'info' => '广告位名称已经存在'));
            } elseif (AdTypeModel::getInstance()->where(array('id' => $id))->getField('status')) {
                $this->ajaxReturn(array('status' => 0, 'info' => '需要先停用才能修改'));
            } else {
                $result = AdTypeModel::getInstance()->where(array('id' => $id))->save(array('name' => $name));
                if ($result) {
                    $this->ajaxReturn(array('status' => 1, 'info' => '修改成功'));
                } else {
                    $this->ajaxReturn(array('status' => 0, 'info' => '修改失败'));
                }
            }
        } else {
            $this->ajaxReturn(array('status' => 0, 'info' => '广告位名称为空'));
        }
    }

    /**
     * 广告位置-删除操作
     */
    public function deladtype()
    {
        $id = I('id', 0);
        if (AdTypeModel::getInstance()->where(array('id' => $id))->getField('status')) {
            $this->ajaxReturn(array('status' => 0, 'info' => '需要先停用才能修改'));
        }
        if (AdModel::getInstance()->where(array('tid' => $id))->find()) {
            $this->ajaxReturn(array('status' => 0, 'info' => '改广告类型下还有广告存在，不能删除'));
        }

        $result = AdTypeModel::getInstance()->where(array('id' => $id))->delete();
        if ($result) {
            $this->ajaxReturn(array('status' => 1, 'info' => '删除成功'));
        } else {
            $this->ajaxReturn(array('status' => 0, 'info' => '删除失败'));
        }

    }

    /**
     * 查看广告列表
     */
    public function ad()
    {
        $tid = I('request.id', 0);
        $adtype = AdTypeModel::getInstance()->field('id,name')->where(array('id' => $tid))->find();
        $this->assign("adtype", $adtype);

        //查询数据
        $lists = AdModel::getInstance()->alias('a')->field('a.*')
            ->join(array("LEFT JOIN __AD_TYPE__ t ON a.tid = t.id"))->where(" t.id={$tid} and a.is_del=0")->order('a.sort ASC')->select();

        $this->assign('lists', $lists);
        $this->display();
    }

    /**
     * 广告-添加操作
     */
    public function adadd()
    {
        $ac = I('get.ac', 0);
        $tid = I('tid', 0);
        if ($ac === 'add') {
            $data['name']= I('request.name', '');
            $data['detail']= I('request.detail', '');
            $data['sort'] = I('request.sort', 0);
            $data['url'] = I('request.url', '');
            $data['url'] = str_replace('&amp;', '&', urldecode($data['url']));
            $file = $_FILES['image'];
            if ($file['size'] > 0) {
                $logo = $this->upload_img_one($file, 'ad'); //更新图片
            }
            $data['image'] = $logo;
            $data['tid'] = $tid;
            $res = AdModel::getInstance()->data($data)->add();
            if ($res > 0 && $res != false) {
                $this->success(L('添加成功'), U("/Admin/Ad/ad/id/{$tid}"), 2);
            } else {
                $this->error(L('添加失败'), U("/Admin/Ad/ad/id/{$tid}"), 3);
            }
        } else {
            $this->assign("tid", $tid);
            $this->display();
        }
    }

    /**
     * 改变广告启动/暂停的状态
     */
    public function changeStatus1()
    {
        $id = I('request.id', 0);
        $status = I('request.status', false);
        if ($status == 1) {
            $res = AdModel::getInstance()->where(array('id' => $id))->save(array('status' => 1));
        } else {
            $res = AdModel::getInstance()->where(array('id' => $id))->save(array('status' => 0));
        }
        if ($res) {
            $this->ajaxReturn(1);
        } else {
            $this->ajaxReturn(0);
        }
    }

    /**
     * 编辑广告
     */
    public function adedit()
    {
        $ac = I('get.ac', 0);
        $tid = I('tid', 0);
        $id = I('id', 0);
        $list = AdModel::getInstance()->field(true)->where(array('id' => $id))->find();
        if ($ac === 'edit') {
            $data['name']= I('request.name', '');
            $data['detail']= I('request.detail', '');
            $data['sort'] = I('request.sort', 0);
            $data['url'] = I('request.url', '');
            $data['url'] = str_replace('&amp;', '&', urldecode($data['url']));
            $file = $_FILES['image'];
            if ($file['size'] > 0) {
                $logo = $this->upload_img_one($file, 'ad'); //更新图片
                $data['image'] = $logo;
            }
            del_img($list['image']);
            $res = AdModel::getInstance()->where(array('id' => $id, 'tid' => $tid))->save($data);
            if ($res > 0 && $res != false) {
                $this->success(L('修改成功'), U("/Admin/Ad/ad/id/{$tid}"), 2);
            } else {
                $this->error(L('修改失败'), U("/Admin/Ad/ad/id/{$tid}"), 3);
            }
        } else {
            $this->assign("list", $list);
            $this->assign("tid", $tid);
            $this->display();
        }
    }

    /**
     * 广告-删除操作
     */
    public function delad()
    {
        $id = I('id', 0);
        if (AdModel::getInstance()->where(array('id' => $id))->getField('status')) {
            $this->ajaxReturn(array('status' => 0, 'info' => '需要先停用才能修改'));
        } else {
            $image = AdModel::getInstance()->where(array('id' => $id))->getField('image');
            del_img($image);
            $result = AdModel::getInstance()->where(array('id' => $id))->delete();
            if ($result) {
                $this->ajaxReturn(array('status' => 1, 'info' => '删除成功'));
            } else {
                $this->ajaxReturn(array('status' => 0, 'info' => '删除失败'));
            }
        }
    }





}