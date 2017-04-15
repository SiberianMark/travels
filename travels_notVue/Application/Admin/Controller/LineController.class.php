<?php
namespace Admin\Controller;
use Admin\Model\AdminModel;
use Admin\Model\LineDateModel;
use Admin\Model\LineImageModel;
use Admin\Model\LineJourneyModel;
use Admin\Model\LineLabelModel;
use Admin\Model\LineModel;
use Admin\Model\PlaceModel;
use Admin\Model\SupplierModel;
use Admin\Model\SupplierOpModel;

/**
 * 线路管理类
 * Date：2016-12-13
 * Created：myz
 */
class LineController extends CommonController
{
    /**
     * 线路列表
     */
    public function linelist()
    {
        $des_type = I('request.type', 0); //目的地
        $this->assign('des_type', $des_type);
        switch ($des_type) {
            case 1:
                $this->assign('des_type_name', '周边');
                break;
            case 2:
                $this->assign('des_type_name', '国内');
                break;
            case 3:
                $this->assign('des_type_name', '出境');
                break;
            case 4:
                $this->assign('des_type_name', '港澳');
                break;
        }
        $where['l.des_type'] = $des_type;
        $des = LineModel::getInstance()->getDes($des_type);
        $this->assign('des', $des);

        $op = AdminModel::getInstance()->field('id,name')->where(array('department' => 1, 'status' => 0, 'is_del' => 0))->select();
        $this->assign('op', $op); //专属OP

        $supplier =  LineModel::getInstance()->getSupplier($des_type);
        $this->assign('supplier', $supplier); //供应商

        $nowpage = I('get.nowpage', 1, 'intval');
        $count = 0;

        $lineid = I('request.lineid', 0);
        if ($lineid) {
            $where['l.id'] = $lineid;
            $this->assign('lineid', $lineid);
            $count = LineModel::getInstance()->alias('l')
                ->join(array(
                    "LEFT JOIN __SUPPLIER_OP__ AS o ON o.id = l.supplier_op",
                    "LEFT JOIN __SUPPLIER__ AS s ON s.id = o.sid",
                    "LEFT JOIN __EMPLOYEE__ AS e ON e.id = l.counselor"
                ))->where($where)->count();
            $lists = LineModel::getInstance()->alias('l')->field('l.id,l.line_type,l.title,l.day_num,l.start_palce,l.des,e.name AS op,o.name AS sop,l.status,l.supplier_title,s.company_name')
                ->join(array(
                    "LEFT JOIN __SUPPLIER_OP__ AS o ON o.id = l.supplier_op",
                    "LEFT JOIN __SUPPLIER__ AS s ON s.id = o.sid",
                    "LEFT JOIN __EMPLOYEE__ AS e ON e.id = l.counselor"
                ))
                ->where($where)->limit(($nowpage - 1) * $this->_pz, $this->_pz)
                ->order('l.edittime DESC,l.id DESC')->select();
        } else {
            if (I('request.line_type', 0)) {
                $this->assign('line_type', I('request.line_type', 0));
                $where['l.line_type'] = I('request.line_type', 0);
            }
            if (I('request.des', 0)) {
                $this->assign('desid', I('request.des', 0));
                $des = I('request.des', 0);
                $where['_string'] = 'FIND_IN_SET('.$des.', l.des)';
            }
            if (I('request.status', 0)) {
                $this->assign('status', I('request.status', 0));
                $where['l.status'] = I('request.status', 0);
            }
            if (I('request.day_num', 0)) {
                $this->assign('day_num', I('request.day_num', 0));
                $where['l.day_num'] = I('request.day_num', 0);
            }
            if (I('request.title', '')) {
                $title = I('request.title', '');
                $this->assign('title', $title);
                $where['l.title'] = array('like', "%{$title}%");
            }
            if (I('request.counselor', 0)) {
                $this->assign('counselor', I('request.counselor', 0));
                $where['l.counselor'] = I('request.counselor', 0);
            }
            if (I('request.supplier', 0)) {
                $this->assign('supplierid', I('request.supplier', 0));
                $where['s.id'] = I('request.supplier', 0);
            }

            $count = LineModel::getInstance()->alias('l')->field('l.id,l.line_type,l.title,l.day_num,l.start_palce,l.des,e.name AS op,o.name AS sop,l.status,l.supplier_title,s.company_name')
                ->join(array(
                    "LEFT JOIN __SUPPLIER_OP__ AS o ON o.id = l.supplier_op",
                    "LEFT JOIN __SUPPLIER__ AS s ON s.id = o.sid",
                    "LEFT JOIN __EMPLOYEE__ AS e ON e.id = l.counselor"
                ))->where($where)->count();
            $lists = LineModel::getInstance()->alias('l')->field('l.id,l.line_type,l.title,l.day_num,l.start_palce,l.des,e.name AS op,o.name AS sop,l.status,l.supplier_title,s.company_name')
                ->join(array(
                    "LEFT JOIN __SUPPLIER_OP__ AS o ON o.id = l.supplier_op",
                    "LEFT JOIN __SUPPLIER__ AS s ON s.id = o.sid",
                    "LEFT JOIN __EMPLOYEE__ AS e ON e.id = l.counselor"
                    ))
                ->where($where)->limit(($nowpage - 1) * $this->_pz, $this->_pz)
                ->order('l.edittime DESC,l.id DESC')->select();
        }

        foreach ($lists as $k => &$v) {
            $v['start_palce'] = PlaceModel::getInstance()->getNameString($v['start_palce']);
            $v['des'] = PlaceModel::getInstance()->getNameString($v['des']);
            $v['line_date'] = LineDateModel::getInstance()->where(array('lineid' => $v['id'], 'status' => 1))->max('line_date');
        }

        $this->assign('lists', $lists);
        $pages = ceil($count / $this->_pz);
        $this->assign('pages', $pages);
        $this->assign('count', $count);
        $this->assign('nowpage', $nowpage);
        $this->display();
    }

    /**
     * 新增线路
     */
    public function addline()
    {
        $ac = I('get.ac', 0);
        if ($ac === 'add') {
            $data['line_type'] = I('request.line_type', 0);
            $data['des_type'] = I('request.des_type', 0);
            $data['start_palce'] = implode(',', I('request.start_selected', ''));
            $data['des'] = implode(',', I('request.des_selected', ''));
            $data['labelid'] = implode(',', I('request.label_selected', ''));
            $data['day_num'] = I('request.day_num', 1);
            $main_name = I('request.main_name', '');
            $sub_name = I('request.sub_name', '');
            $data['title'] = $main_name . '•' . $sub_name;
            $data['counselor'] = I('request.counselor', 0);
            $data['supplier_title'] = I('request.supplier_title', '');
            $data['supplier_op'] = I('request.supplier_op', 0);
            $data['special'] = I('request.special', '');
            $data['add_by'] = session('user.id');
            $data['addtime'] = date('Y-m-d H:i:s');
            if (I('request.keywords', '')) {
                $data['keywords'] = I('request.keywords', '');
            } else {
                $data['keywords'] = $data['title'];
            }
            $id = LineModel::getInstance()->data($data)->add();
            if ($id) {
                $this->success(L('添加成功'), U("/Admin/Line/linelist/type/{$data['des_type']}"), 2);
            } else {
                $this->error("添加失败");
            }
        } else {
            $lists = LineLabelModel::getInstance()->field(true)->where(array('is_del' => 0))->select();
            $op = AdminModel::getInstance()->field('id,name')->where(array('department' => 1, 'status' => 0, 'is_del' => 0))->select();
            $supplier = SupplierModel::getInstance()->field('id,company_name')->where(array('status' => 0))->select();
            $this->assign('lists', $lists);
            $this->assign('op', $op);
            $this->assign('supplier', $supplier);
            $this->display();
        }


    }

    /**
     * 编辑线路-上线或者下线
     */
    public function line_status()
    {
        $id = I('id', 0);
        $status = I('status', '');
        $re = LineModel::getInstance()->where(array('id' => $id))->setField(array('status' => $status));
        if ($re) {
            $this->ajaxReturn(1);
        } else {
            $this->ajaxReturn(0);
        }
    }

    /**
     * 编辑线路-团期价格
     */
    public function time_price()
    {
        $id = I('id', 0);
        $this->assign('lineid', $id);

        $month[0] = date('Y-m');
        for ($i=1; $i<=11; $i++) {
            $month[$i] = date('Y-m', strtotime("{$month[$i-1]} +1 month"));
        }
        $this->assign('month', $month);
        $this->display();
    }

    /**
     * 编辑线路-根据月份获取团期价格
     */
    public function get_price()
    {
        $id = I('id', 0);
        $month = I('month', '');
        $eday = date('d', strtotime("{$month} +1 month -1 day"));
        $todaty = date('Y-m-d');
        $weekarray = array("日","一","二","三","四","五","六");
        $str = '';
        for ($i = 1; $i <= $eday;  $i++) {
            if ($i <10) {
                $current_date = $month . '-0' . $i;
            } else {
                $current_date = $month . '-' . $i;
            }
            $week = '&nbsp;&nbsp;星期' . $weekarray[date("w", strtotime($current_date))];
            $price = LineDateModel::getInstance()->field('id,adult_price,child_price,single_room,status')->where(array('lineid' => $id, 'line_date' => $current_date))->find();
            if ($todaty <= $current_date) { //大于今天
                $str .= '<tr>';
                $str .= '<td>'. $i .$week . '</td>';
                if ($price) {
                    if ($price['status'] == 1) {
                        $str .= '<td style="color:#090">'. $price['adult_price'] . '</td>';
                        $str .= '<td style="color:#090">'. $price['child_price'] . '</td>';
                        $str .= '<td style="color:#090">'. $price['single_room'] . '</td>';
                    } else {
                        $str .= '<td style="color:#bbb">'. $price['adult_price'] . '</td>';
                        $str .= '<td style="color:#bbb">'. $price['child_price'] . '</td>';
                        $str .= '<td style="color:#bbb">'. $price['single_room'] . '</td>';
                    }

                    if ($price['status'] == 1) {
                        $str .= '<td><a href="javascript:;" onclick="change('.$price['id'].',\''.$current_date.'\',\''. $week. '\',\'' . $price['adult_price']. '\',\''. $price['child_price']. '\',\''. $price['single_room'] . '\')">修改</a>&nbsp;&nbsp;<a href="javascript:;" onclick="change_status('.$price['id'].', 2)">关闭</a></td>';
                    } else {
                        $str .= '<td><a href="javascript:;" onclick="change('.$price['id'].',\''.$current_date.'\',\''. $week. '\',\'' . $price['adult_price']. '\',\''. $price['child_price']. '\',\''. $price['single_room'] . '\')">修改</a>&nbsp;&nbsp;<a href="javascript:;" onclick="change_status('.$price['id'].', 1)">开启</a></td>';
                    }
                    $list[$i-1]['id'] = $price['id'];
                    $list[$i-1]['adult_price'] = $price['adult_price'];
                    $list[$i-1]['child_price'] = $price['child_price'];
                    $list[$i-1]['single_room'] = $price['single_room'];
                    $list[$i-1]['status'] = $price['status'];
                } else {
                    $str .= '<td></td>';
                    $str .= '<td></td>';
                    $str .= '<td></td>';
                    $str .= '<td><a href="javascript:;" onclick="add_price('.$id.',\''.$current_date.'\',\''. $week.'\')">添加</a></td>';
                }
                $str .= '</tr>';
            } else { //小于今天
                $str .= '<tr>';
                $str .= '<td>'. $i .$week . '</td>';
                if ($price) {
                    $str .= '<td style="color:#bbb">'. $price['adult_price'] . '</td>';
                    $str .= '<td style="color:#bbb">'. $price['child_price'] . '</td>';
                    $str .= '<td style="color:#bbb">'. $price['single_room'] . '</td>';
                } else {
                    $str .= '<td></td>';
                    $str .= '<td></td>';
                    $str .= '<td></td>';
                }
                $str .= '<td></td>';
                $str .= '</tr>';
            }
        }
        $this->ajaxReturn($str);
    }

    /**
     * 编辑线路-关闭或者开启价格
     */
    public function change_status()
    {
        $id = I('id', 0);
        $status = I('status', '');
        $re = LineDateModel::getInstance()->where(array('id' => $id))->setField(array('status' => $status));
        if ($re) {
            $lineid = LineDateModel::getInstance()->where(array('id' => $id))->getField('lineid');
            $this->ajaxReturn($lineid);
        } else {
            $this->ajaxReturn(0);
        }
    }

    /**
     * 编辑线路-判断价格是否已经存在
     */
    public function if_price()
    {
        $lineid = I('lineid', 0);
        $line_date = I('line_date', '');
        $re = LineDateModel::getInstance()->where(array('lineid' => $lineid, 'line_date' => $line_date))->getField('id');
        if ($re) {
            $this->ajaxReturn(1);
        } else {
            $this->ajaxReturn(0);
        }
    }

    /**
     * 编辑线路-批量添加价格
     */
    public function price_add()
    {
        $lineid = I('lineid', 0);
        $this->assign('lineid', $lineid);
        $this->display();
    }

    /**
     * 编辑线路-批量添加价格执行
     */
    public function many_price()
    {
        $line_date = I('date_selected', '');
        $data['adult_price'] = I('adult_price', 0);
        $data['child_price']= I('child_price', 0);
        $data['single_room'] = I('single_room', 0);
        $data['lineid'] = I('lineid', 0);
        $data['status'] = 1;
        $data['addtime'] = date('Y-m-d H:i:s');
        $data['add_by'] = session('user.id');
        foreach ($line_date as $v) {
            $data['line_date'] = $v;
            $re = LineDateModel::getInstance()->data($data)->add();
        }
        echo '<script>parent.location.href="/Admin/Line/time_price/id/'.$data['lineid'].'";</script>';
    }

    /**
     * 编辑线路-根据月份获取团期价格
     */
    public function change_price()
    {
        $id = I('id', 0);
        $lineid = I('lineid', 0);
        $line_date = I('line_date', 0);
        $data['adult_price'] = I('adult_price', 0);
        $data['child_price']= I('child_price', 0);
        $data['single_room'] = I('single_room', 0);
        $data['addtime'] = date('Y-m-d H:i:s');
        $data['add_by'] = session('user.id');
        if ($id && !$lineid) {
            $re = LineDateModel::getInstance()->where(array('id' => $id))->save($data);
            $lineid = LineDateModel::getInstance()->where(array('id' => $id))->getField('lineid');
        } else {
            $data['lineid'] = $lineid;
            $data['line_date'] = $line_date;
            $data['status'] = 1;
            $re = LineDateModel::getInstance()->data($data)->add();
        }
        if ($re) {
            $this->ajaxReturn($lineid);
        } else {
            $this->ajaxReturn(0);
        }
    }

    /**
     * 编辑线路-基本信息
     */
    public function base_info()
    {
        $id = I('id', 0);
        $this->assign('lineid', $id);
        $ac = I('get.ac', 0);
        if ($ac === 'edit') {
            $data['line_type'] = I('request.line_type', 0);
            $data['des_type'] = I('request.des_type', 0);
            $data['start_palce'] = implode(',', I('request.start_selected', ''));
            $data['des'] = implode(',', I('request.des_selected', ''));
            $data['labelid'] = implode(',', I('request.label_selected', ''));
            $main_name = I('request.main_name', '');
            $sub_name = I('request.sub_name', '');
            $data['title'] = $main_name . '•' . $sub_name;
            $data['counselor'] = I('request.counselor', 0);
            $data['supplier_title'] = I('request.supplier_title', '');
            $data['supplier_op'] = I('request.supplier_op', 0);
            $data['special'] = I('request.special', '');
            $data['edit_by'] = session('user.id');
            $data['edittime'] = date('Y-m-d H:i:s');
            if (I('request.keywords', '')) {
                $data['keywords'] = I('request.keywords', '');
            } else {
                $data['keywords'] = $data['title'];
            }
            $re = LineModel::getInstance()->where(array('id' => $id))->save($data);
        }

        $base_info = LineModel::getInstance()->field('id,line_type,des_type,title,day_num,start_palce,des,labelid,special,counselor,status,keywords,supplier_title,supplier_op')
            ->where(array('id' => $id))->find();
        list($base_info['main_name'], $base_info['sub_name']) = explode('•', $base_info['title']);
        $base_info['supplier'] = SupplierOpModel::getInstance()->where(array('id' => $base_info['supplier_op']))->getField('sid');
        $base_info['special'] = html_entity_decode($base_info['special']);

        $start_palce = explode(',', $base_info['start_palce']);
        foreach ($start_palce as $k => $v) {
            $start[$k]['id'] = $v;
            $start[$k]['name'] = PlaceModel::getInstance()->where(array('id' => $v))->getField('name');
        }
        $this->assign('start', $start);
        $dest = explode(',', $base_info['des']);
        foreach ($dest as $k => $v) {
            $des[$k]['id'] = $v;
            $des[$k]['name'] = PlaceModel::getInstance()->where(array('id' => $v))->getField('name');
        }
        $this->assign('des', $des);
        $labelid = explode(',', $base_info['labelid']);
        foreach ($labelid as $k => $v) {
            $label[$k]['id'] = $v;
            $label[$k]['name'] = LineLabelModel::getInstance()->where(array('id' => $v))->getField('label_name');
        }
        $this->assign('label', $label);
        $op = AdminModel::getInstance()->field('id,name')->where(array('department' => 1, 'status' => 0, 'is_del' => 0))->select();
        $this->assign('op', $op);
        $supplier = SupplierModel::getInstance()->field('id,company_name')->where(array('status' => 0))->select();
        $this->assign('supplier', $supplier);
        $base_info['supplier_id'] = SupplierOpModel::getInstance()->where(array('id' => $base_info['supplier_op']))->getField('sid');
        $supplier_op = SupplierOpModel::getInstance()->field('id,name')->where(array('sid' => $base_info['supplier_id']))->select();
        $this->assign('supplier_op', $supplier_op);
        $this->assign('base_info', $base_info);
        $this->display();
    }

    /**
     * 编辑线路-图片
     */
    public function line_image()
    {
        $id = I('id', 0);
        $this->assign('lineid', $id);
        $image = LineImageModel::getInstance()->field(true)->where(array('lineid' => $id))->select();
        $this->assign('image', $image);
        $this->display();
    }

    /**
     * 编辑线路-行程
     */
    public function line_journey()
    {
        $lineid = I('id', 0);
        $this->assign('lineid', $lineid);
        $ac = I('get.ac', 0);
        if ($ac === 'edit') {
            $dayid = I('request.dayid', 0);
            $data['lineid'] = I('request.lineid', 0);
            $data['name'] = I('request.name', '');
            $data['day'] = I('request.day', 0);
            $data['spot'] = I('request.spot', '');
            $data['detail'] = I('request.detail', '');
            $data['hotel'] = I('request.hotel', '');
            $data['breakfast'] = I('request.breakfast', '');
            $data['lunch'] = I('request.lunch', '');
            $data['dinner'] = I('request.dinner', '');
            $re = LineJourneyModel::getInstance()->where(array('id' => $dayid))->getField('lineid');
            if ($re) { //编辑
                $data['edittime'] = date('Y-m-d H:i:s');
                $data['edit_by'] = session('user.id');
                $result = LineJourneyModel::getInstance()->where(array('id' => $dayid))->save($data);
            } else { //新增
                $data['addtime'] = date('Y-m-d H:i:s');
                $data['add_by'] = session('user.id');
                $result = LineJourneyModel::getInstance()->data($data)->add();
            }
            if ($result) {
                $this->success('保存成功');
            } else {
                $this->error("保存失败");
            }
        } else {
            $day_num = LineModel::getInstance()->where(array('id' => $lineid))->getField('day_num');
            $journey1 = LineJourneyModel::getInstance()->field(true)->where(array('lineid' => $lineid))->select();
            if ($journey1) {
                foreach ($journey1 as $k => $v) {
                    $v['detail'] = html_entity_decode($v['detail']);
                    $journey[$v['day']] = $v;
                }
            }
            $this->assign('day_num', $day_num);
            $this->assign('journey', $journey);
            $this->display();
        }
    }

    /**
     * 编辑线路-费用包含
     */
    public function money_include()
    {
        $lineid = I('id', 0);
        $this->assign('lineid', $lineid);
        $ac = I('get.ac', 0);
        if ($ac === 'edit') {
            $include = array();
            // 交通
            $include['traffic']['plane'] = I('plane', 0);
            $include['traffic']['交通'] = '';
            if ($include['traffic']['plane']) {
                $include['traffic']['plane_type'] = I('plane_type', '');
                $include['traffic']['plane_fee'] = I('plane_fee', '');
                $include['traffic']['交通'] .= $include['traffic']['plane_type'] . $include['traffic']['plane_fee'];
            }
            $include['traffic']['train'] = I('train', 0);
            if ($include['traffic']['train']) {
                if ($include['traffic']['交通']) {
                    $include['traffic']['交通'] .= '、';
                }
                $include['traffic']['train_type'] = I('train_type', '');
                $include['traffic']['train_seat_type'] = I('train_seat_type', '');
                $include['traffic']['交通'] .= $include['traffic']['train_type'] . $include['traffic']['train_fee'];
                if ($include['traffic']['train_seat_type']) {
                    $include['traffic']['交通'] .=  $include['traffic']['train_seat_type'];
                }
            }
            $include['traffic']['bus']= I('bus', 0);
            if ($include['traffic']['bus']) {
                if ($include['traffic']['交通']) {
                    $include['traffic']['交通'] .= '、';
                }
                $include['traffic']['bus_type'] = I('bus_type', '');
                $include['traffic']['bus_fee'] = I('bus_fee', '');
                $include['traffic']['交通'] .= $include['traffic']['bus_type'] . $include['traffic']['bus_fee'];
            }
            $include['traffic']['local_bus'] = I('local_bus', 0);
            if ($include['traffic']['local_bus']) {
                if ($include['traffic']['交通']) {
                    $include['traffic']['交通'] .= '、';
                }
                $include['traffic']['local_bus_fee'] = I('local_bus_fee', '');
                $include['traffic']['交通'] .= $include['traffic']['local_bus_fee'];
            }
            $include['traffic']['ship'] = I('ship', 0);
            if ($include['traffic']['ship']) {
                if ($include['traffic']['交通']) {
                    $include['traffic']['交通'] .= '、';
                }
                $include['traffic']['ship_type'] = I('ship_type', '');
                $include['traffic']['ship_fee'] = I('ship_fee', '');
                $include['traffic']['ship_note'] = I('ship_note', '');
                $include['traffic']['交通'] .= $include['traffic']['ship_type'] . $include['traffic']['ship_fee'];
                if ($include['traffic']['ship_note']) {
                    $include['traffic']['交通'] .= '，' . $include['traffic']['ship_note'];
                }
            }

            $include['traffic']['traffic_other'] = I('traffic_other', 0);
            if ($include['traffic']['traffic_other']) {
                $include['traffic']['traffic_other1'] = I('traffic_other1', '');
                if ($include['traffic']['traffic_other1']) {
                    if ($include['traffic']['交通']) {
                        $include['traffic']['交通'] .= '、';
                    }
                    $include['traffic']['交通'] .= $include['traffic']['traffic_other1'];
                }
            }

            $include['traffic']['united_plane'] = I('united_plane', 0);
            if ($include['traffic']['united_plane']) {
                $include['traffic']['united_plane_fee'] = I('united_plane_fee', '');
                if ($include['traffic']['交通']) {
                    $include['traffic']['交通'] .= '、';
                }
                $include['traffic']['交通'] .= $include['traffic']['united_plane_fee'];
            }
            // 小交通
            $include['small_traffic']['scenic'] = I('scenic', 0);
            $include['small_traffic']['小交通'] = '';
            if ($include['small_traffic']['scenic']) {
                $include['small_traffic']['scenic_fee'] = I('scenic_fee', '');
                $include['small_traffic']['scenic_note'] = I('scenic_note', '');
                $include['small_traffic']['小交通'] .= $include['small_traffic']['scenic_fee'];
                if ($include['small_traffic']['scenic_note']) {
                    $include['small_traffic']['小交通'] .= '，' . $include['small_traffic']['scenic_note'];
                }
            }
            $include['small_traffic']['shuttle'] = I('shuttle', 0);
            if ($include['small_traffic']['shuttle']) {
                $include['small_traffic']['shuttle_where'] = I('shuttle_where', '');
                $include['small_traffic']['shuttle_fee'] = I('shuttle_fee', '');
                $include['small_traffic']['shuttle_type'] = I('shuttle_type', '');
                $include['small_traffic']['shuttle_service'] = I('shuttle_service', '');
                if ($include['small_traffic']['小交通']) {
                    $include['small_traffic']['小交通'] .= '、';
                }
                if ($include['small_traffic']['shuttle_where']) {
                    $include['small_traffic']['小交通'] .= $include['small_traffic']['shuttle_where'];
                }
                $include['small_traffic']['小交通'] .= $include['small_traffic']['shuttle_fee'] . $include['small_traffic']['shuttle_type'] . $include['small_traffic']['shuttle_service'];
            }
            // 住宿
            $include['hotel']['hotel'] = I('hotel', 0);
            $include['hotel']['住宿'] = '';
            if ($include['hotel']['hotel']) {
                $include['hotel']['hotel_fee'] = I('hotel_fee', '');
                $include['hotel']['住宿'] .= $include['hotel']['hotel_fee'];
            }
            $include['hotel']['hotel1'] = I('hotel1', 0);
            if ($include['hotel']['hotel1']) {
                $include['hotel']['hotel_note'] = I('hotel_note', '');
                if ($include['hotel']['住宿']) {
                    $include['hotel']['住宿'] .= '、';
                }
                $include['hotel']['住宿'] .= $include['hotel']['hotel_note'];
            }
            // 用餐
            $include['food']['food'] = I('food', 0);
            $include['food']['用餐'] = '';
            if ($include['food']['food']) {
                $include['food']['food_fee'] = I('food_fee', '');
                $include['food']['用餐'] .= $include['food']['food_fee'];
            }
            $include['food']['food1'] = I('food1', 0);
            if ($include['food']['food1']) {
                $include['food']['food_note'] = I('food_note', '');
                if ($include['food']['用餐']) {
                    $include['food']['用餐'] .= '、';
                }
                $include['food']['用餐'] .= $include['food']['food_note'];
            }
            // 门票
            $include['ticket']['ticket'] = I('ticket', 0);
            $include['ticket']['门票'] = '';
            if ($include['ticket']['ticket']) {
                $include['ticket']['ticket_fee'] = I('ticket_fee', '');
                $include['ticket']['门票'] .= $include['ticket']['ticket_fee'];
            }
            $include['ticket']['ticket_note'] = I('ticket_note', 0);
            if ($include['ticket']['ticket_note']) {
                $include['ticket']['门票'] .= '，';
                $include['ticket']['门票'] .= $include['ticket']['ticket_note'];
            }

            // 导服
            $include['service']['service1'] = I('service1', 0);
            $include['service']['导服'] = '';
            if ($include['service']['service1']) {
                $include['service']['service1_fee'] = I('service1_fee', '');
                $include['service']['导服'] .= $include['service']['service1_fee'];
            }
            $include['service']['service2'] = I('service2', 0);
            if ($include['service']['service2']) {
                $include['service']['service2_fee'] = I('service2_fee', '');
                if ($include['service']['导服']) {
                    $include['service']['导服'] .= '、';
                }
                $include['service']['导服'] .= $include['service']['service2_fee'];
            }
            $include['service']['service3'] = I('service3', 0);
            if ($include['service']['service3']) {
                $include['service']['service3_fee'] = I('service3_fee', '');
                if ($include['service']['导服']) {
                    $include['service']['导服'] .= '、';
                }
                $include['service']['导服'] .= $include['service']['service3_fee'];
            }
            $include['service']['service4'] = I('service4', 0);
            if ($include['service']['service4']) {
                $include['service']['service4_fee'] = I('service4_fee', '');
                if ($include['service']['导服']) {
                    $include['service']['导服'] .= '、';
                }
                $include['service']['导服'] .= $include['service']['service4_fee'];
            }
            // 保险
            $include['insurance']['insurance'] = I('insurance', 0);
            $include['insurance']['保险'] = '';
            if ($include['insurance']['insurance']) {
                $include['insurance']['insurance_fee'] = I('insurance_fee', '');
                $include['insurance']['保险'] .= $include['insurance']['insurance_fee'];
            }
            // 其它费用
            $include['other']['other'] = I('other', 0);
            $include['other']['其它费用'] = '';
            if ($include['other']['other']) {
                $include['other']['other_fee'] = I('other_fee', '');
                $include['other']['其它费用'] .= $include['other']['other_fee'];
            }
            // 儿童价标准
            $include['child']['child'] = I('child', 0);
            $include['child']['儿童价标准'] = '';
            switch ($include['child']['child']) {
                case 1:
                    $include['child']['age'] = I('age', '');
                    $include['child']['age_min'] = I('age_min', '');
                    $include['child']['age1'] = I('age1', '');
                    $include['child']['age_max'] = I('age_max', '');
                    $include['child']['age2'] = I('age2', '');
                    $include['child']['age_type'] = I('age_type', '');
                    $include['child']['age_note'] = I('age_note', '');
                    $include['child']['儿童价标准'] .= $include['child']['age'] . $include['child']['age_min'] . $include['child']['age1']
                        . $include['child']['age_max'] . $include['child']['age2'] . $include['child']['age_type'];
                    if ($include['child']['age_note']) {
                        $include['child']['儿童价标准'] .= '，' . $include['child']['age_note'];
                    }
                    break;
                case 2:
                    $include['child']['height'] = I('height', '');
                    $include['child']['height_min'] = I('height_min', '');
                    $include['child']['height1'] = I('height1', '');
                    $include['child']['height_max'] = I('height_max', '');
                    $include['child']['height2'] = I('height2', '');
                    $include['child']['height_type'] = I('height_type', '');
                    $include['child']['height_note'] = I('height_note', '');
                    $include['child']['儿童价标准'] .= $include['child']['height'] . $include['child']['height_min'] . $include['child']['height1']
                        . $include['child']['height_max'] . $include['child']['height2'] . $include['child']['height_type'];
                    if ($include['child']['height_note']) {
                        $include['child']['儿童价标准'] .= '，' . $include['child']['height_note'];
                    }
                    break;
                case 3:
                    $include['child']['child_note'] = I('child_note', '');
                    $include['child']['儿童价标准'] .= $include['child']['child_note'];
                    break;
            }
            $this->assign('include', $include);
            $include = serialize($include);
            $re = LineModel::getInstance()->where(array('id' => $lineid))->setField(array('include' => $include));
            $this->display();
        } else {
            $include = LineModel::getInstance()->where(array('id' => $lineid))->getField('include');
            $include = unserialize($include);
            $this->assign('include', $include);
            $this->display();
        }
    }

    /**
     * 编辑线路-费用不含
     */
    public function not_include()
    {
        $lineid = I('id', 0);
        $des_type = LineModel::getInstance()->where(array('id' => $lineid))->getField('des_type');
        $this->assign('lineid', $lineid);
        $this->assign('des_type', $des_type);
        $ac = I('get.ac', 0);
        if ($ac === 'edit') {
            $not_include = array();
            // 外宾附加费
            $not_include['foreign']['foreign'] = I('foreign', 0);
            $not_include['foreign']['外宾附加费'] = '';
            if ($not_include['foreign']['foreign']) {
                $not_include['foreign']['foreign_fee'] = I('foreign_fee', '');
                $not_include['foreign']['foreign_note'] = I('foreign_note', '');
                $not_include['foreign']['foreign_fee1'] = I('foreign_fee1', '');
                $not_include['foreign']['外宾附加费'] .= $not_include['foreign']['foreign_fee'] . $not_include['foreign']['foreign_note'] . $not_include['foreign']['foreign_fee1'];
            }
            $not_include['foreign']['foreign1'] = I('foreign1', 0);
            if ($not_include['foreign']['foreign1']) {
                $not_include['foreign']['foreign1_fee'] = I('foreign1_fee', '');
                $not_include['foreign']['foreign1_note'] = I('foreign1_note', '');
                $not_include['foreign']['foreign1_fee1'] = I('foreign1_fee1', '');
                if ($not_include['foreign']['外宾附加费']) {
                    $not_include['foreign']['外宾附加费'] .= '、';
                }
                $not_include['foreign']['外宾附加费'] .= $not_include['foreign']['foreign1_fee'] . $not_include['foreign']['foreign1_note'] . $not_include['foreign']['foreign1_fee1'];
            }
            $not_include['foreign']['foreign2'] = I('foreign2', 0);
            if ($not_include['foreign']['foreign2']) {
                $not_include['foreign']['foreign2_fee'] = I('foreign2_fee', '');
                if ($not_include['foreign']['外宾附加费']) {
                    $not_include['foreign']['外宾附加费'] .= '、';
                }
                $not_include['foreign']['外宾附加费'] .= $not_include['foreign']['foreign2_fee'];
            }
            // 单房差
            $not_include['room']['room'] = I('room', 0);
            $not_include['room']['单房差'] = '';
            if ($not_include['room']['room']) {
                $not_include['room']['room_fee'] = I('room_fee', '');
                $not_include['room']['room_note'] = I('room_note', '');
                $not_include['room']['单房差'] .= $not_include['room']['room_fee'];
                if ($not_include['room']['room_note']) {
                    $not_include['room']['单房差'] .= '，' . $not_include['room']['room_note'];
                }
            }
            // 其它
            $not_include['other']['other'] = I('other', 0);
            $not_include['other']['其它'] = '';
            if ($not_include['other']['other']) {
                $not_include['other']['other_fee'] = I('other_fee', '');
                $not_include['other']['其它'] .= $not_include['other']['other_fee'];
            }
            // 补充
            $not_include['extra']['extra5'] = I('extra5', 0);
            $not_include['extra']['补充'] = '';
            if ($not_include['extra']['extra5']) {
                $not_include['extra']['extra5_fee'] = I('extra5_fee', '');
                $not_include['extra']['补充'] .= $not_include['extra']['extra5_fee'];
            }
            $not_include['extra']['extra1'] = I('extra1', 0);
            if ($not_include['extra']['extra1']) {
                $not_include['extra']['extra1_fee'] = I('extra1_fee', '');
                if ($not_include['extra']['补充']) {
                    $not_include['extra']['补充'] .= '、';
                }
                $not_include['extra']['补充'] .= $not_include['extra']['extra1_fee'];
            }
            $not_include['extra']['extra2'] = I('extra2', 0);
            if ($not_include['extra']['extra2']) {
                $not_include['extra']['extra2_fee'] = I('extra2_fee', '');
                if ($not_include['extra']['补充']) {
                    $not_include['extra']['补充'] .= '、';
                }
                $not_include['extra']['补充'] .= $not_include['extra']['extra2_fee'];
            }
            $not_include['extra']['extra3'] = I('extra3', 0);
            if ($not_include['extra']['extra3']) {
                $not_include['extra']['extra3_fee'] = I('extra3_fee', '');
                if ($not_include['extra']['补充']) {
                    $not_include['extra']['补充'] .= '、';
                }
                $not_include['extra']['补充'] .= $not_include['extra']['extra3_fee'];
            }
            $not_include['extra']['extra4'] = I('extra4', 0);
            if ($not_include['extra']['extra4']) {
                $not_include['extra']['extra4_fee'] = I('extra4_fee', '');
                if ($not_include['extra']['补充']) {
                    $not_include['extra']['补充'] .= '、';
                }
                $not_include['extra']['补充'] .= $not_include['extra']['extra4_fee'];
            }
            $this->assign('not_include', $not_include);
            $not_include = serialize($not_include);
            $re = LineModel::getInstance()->where(array('id' => $lineid))->setField(array('not_include' => $not_include));
            $this->display();
        } else {
            $not_include = LineModel::getInstance()->where(array('id' => $lineid))->getField('not_include');
            $not_include = unserialize($not_include);
            $this->assign('not_include', $not_include);
            $this->display();
        }
    }


    /**
     * 编辑线路-预订须知
     */
    public function notice()
    {
        $lineid = I('id', 0);
        $this->assign('lineid', $lineid);
        $ac = I('get.ac', 0);
        if ($ac === 'edit') {
            $notice = I('request.notice', '');
            if ($notice) {
                $re = LineModel::getInstance()->where(array('id' => $lineid))->setField(array('notice' => $notice));
            }
            $notice = html_entity_decode($notice);
            $this->assign('notice', $notice);
            $this->display();
        } else {
            $notice = LineModel::getInstance()->where(array('id' => $lineid))->getField('notice');
            $notice = html_entity_decode($notice);
            $this->assign('notice', $notice);
            $this->display();
        }
    }

    /**
     * 编辑线路-参考项目
     */
    public function reference()
    {
        $lineid = I('id', 0);
        $this->assign('lineid', $lineid);
        $ac = I('get.ac', 0);
        if ($ac === 'edit') {
            $reference = I('request.reference', '');
            if ($reference) {
                $re = LineModel::getInstance()->where(array('id' => $lineid))->setField(array('reference' => $reference));
            }
            $reference = html_entity_decode($reference);
            $this->assign('reference', $reference);
            $this->display();
        } else {
            $reference = LineModel::getInstance()->where(array('id' => $lineid))->getField('reference');
            $reference = html_entity_decode($reference);
            $this->assign('reference', $reference);
            $this->display();
        }
    }

    /**
     * 上传图片
     */
    public function upload() {
        $file = $_FILES['file'];
        $url = $this->upload_img_one($file, 'line'); //更新图片
        if ($url) {
            $data['url'] = $url;
            $data['lineid'] = $_POST['lineid'];
            $res = M('line_image', 'mmm_')->data($data)->add();
            if ($res) {
                echo $res;
            } else {
                echo false;
            }
        } else {
            echo false;
        }
    }

    /**
     * 删除图片
     */
    public function delImage()
    {
        $id = I('id', 0);
        $result = LineImageModel::getInstance()->where(array('id' => $id))->delete();
        if ($result) {
            $this->ajaxReturn(array('status' => 1, 'info' => '删除成功'));
        } else {
            $this->ajaxReturn(array('status' => 0, 'info' => '删除失败'));
        }
    }

    /**
     * 设为封面图片
     */
    public function isCover()
    {
        $lineid = I('lineid', 0);
        $id = I('id', 0);
        $data['is_cover'] = 0;
        LineImageModel::getInstance()->where(array('lineid' => $lineid))->setField($data);
        $result = LineImageModel::getInstance()->where(array('id' => $id))->setField(array('is_cover' => 1));
        if ($result) {
            $this->ajaxReturn(array('status' => 1, 'info' => '设置成功'));
        } else {
            $this->ajaxReturn(array('status' => 0, 'info' => '设置失败'));
        }
    }



    /**
     * 线路标签
     */
    public function label()
    {
        $lists = LineLabelModel::getInstance()->field(true)->select();
        $this->assign('lists', $lists);
        $this->display();
    }

    /**
     * 线路标签添加
     */
    public function addLabel()
    {
        $name = I('name', '', 'trim');
        if ($name) {
            $data['label_name'] = $name;
            if (LineLabelModel::getInstance()->where($data)->find()) {
                $this->ajaxReturn(array('status' => 0, 'info' => '标签已经存在'));
            } else {
                $result = LineLabelModel::getInstance()->data($data)->add();
                if ($result) {
                    $this->ajaxReturn(array('status' => 1, 'info' => '添加成功'));
                } else {
                    $this->ajaxReturn(array('status' => 0, 'info' => '添加失败'));
                }
            }
        } else {
            $this->ajaxReturn(array('status' => 0, 'info' => '标签名称为空'));
        }
    }

    /**
     * 线路标签-编辑操作
     */
    public function editLabel()
    {
        $id = I('id', 0);
        $name = I('name', '', 'trim');
        if ($name) {
            $data['label_name'] = $name;
            $data['id'] = array('neq', $id);
            if (LineLabelModel::getInstance()->where($data)->find()) {
                $this->ajaxReturn(array('status' => 0, 'info' => '标签名称已经存在'));
            } else {
                $result = LineLabelModel::getInstance()->where(array('id' => $id))->save(array('label_name' => $name));
                if ($result) {
                    $this->ajaxReturn(array('status' => 1, 'info' => '修改成功'));
                } else {
                    $this->ajaxReturn(array('status' => 0, 'info' => '修改失败'));
                }
            }
        } else {
            $this->ajaxReturn(array('status' => 0, 'info' => '标签名称为空'));
        }
    }

    /**
     * 线路标签-删除操作
     */
    public function delLabel()
    {
        $id = I('id', 0);
        $status = I('status', 0);
        if ($status == 1) {
            $line = LineModel::getInstance()->where(array('FIND_IN_SET('.$id.', labelid)'))->select();
            if ($line) {
                $this->ajaxReturn(array('status' => 0, 'info' => '有线路再使用此标签，需要先修改线路去除标签才能删除'));
            }
        }
        $result = LineLabelModel::getInstance()->where(array('id' => $id))->setField(array('is_del' => $status));
        if ($result) {
            $this->ajaxReturn(array('status' => 1, 'info' => '修改成功'));
        } else {
            $this->ajaxReturn(array('status' => 0, 'info' => '修改失败'));
        }

    }

    /**
     * 标签选择
     */
    public function labelSelect() {
        $lists = LineLabelModel::getInstance()->field(true)->where(array('is_del' => 0))->select();
        $str = '<div style="margin-left: 2.5em; margin-top: 1em">';
        if ($lists) {
            foreach ($lists as $v) {
                $str .= '<label><input type="checkbox" value="'.$v['id'].'" label="'.$v['label_name'].'" name="label[]"/>';
                $str .= '<span style="font-size: 1.125em; margin-right: 1em">'.$v['label_name'].'</span></label>';
            }
        }
        $str .= '</div>';
        $this->ajaxReturn($str);
    }


}