<?php
/**
 * 线路相关接口
 */
namespace Home\Controller;

use Admin\Model\LineDateModel;
use Admin\Model\LineJourneyModel;
use Admin\Model\LineImageModel;
use Admin\Model\LineLabelModel;
use Admin\Model\PlaceModel;
use \Admin\Model\LineModel;
use Admin\Model\AdminModel;
use Common\Model\OrderModel;

class APILineController extends CommonController
{

    public function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 线路详情
     */
    public function line() {
        $id = I('request.id', '', 'strip_tags,htmlspecialchars,trim');
        if (!$id) {
            $this->ajax(0, '线路id不正确');
        }
        $base_info = S('line_base_info' . $id);
        if (empty($base_info)) {
            $base_info = LineModel::getInstance()->field('id,line_type,title,day_num,start_palce,des,labelid,special,counselor,keywords,
        include,not_include,notice,reference')->where(array('id' => $id))->find();
            if (!$base_info) {
                $this->ajax(0, '未找到对应线路');
            }
            list($base_info['main_name'], $base_info['sub_name']) = explode('•', $base_info['title']);
            $base_info['special'] = html_entity_decode($base_info['special']);
            $base_info['include'] = $this->deal_include($base_info['include']);
            $base_info['not_include'] = $this->deal_not_include($base_info['not_include']);
            $base_info['notice'] = html_entity_decode($base_info['notice']);
            $base_info['reference'] = html_entity_decode($base_info['reference']);
            if ($base_info['line_type'] == 1) {
                $base_info['line_type'] = '跟团游';
            } else {
                $base_info['line_type'] = '自由行';
            }
            $start_palce = explode(',', $base_info['start_palce']);
            unset($base_info['start_palce']);
            foreach ($start_palce as $v) {
                $base_info['start_palce'][] = PlaceModel::getInstance()->where(array('id' => $v))->getField('name');
            }
           /* $dest = explode(',', $base_info['des']);
            unset($base_info['des']);
            foreach ($dest as $v) {
                $base_info['des_palce'][] = PlaceModel::getInstance()->where(array('id' => $v))->getField('name');
            }*/
            $labelid = explode(',', $base_info['labelid']);
            unset($base_info['labelid']);
            foreach ($labelid as $v) {
                $base_info['label'][] = LineLabelModel::getInstance()->where(array('id' => $v))->getField('label_name');
            }
            $counselor = AdminModel::getInstance()->field('name,phone,qq,weixin')->where(array('id' => $base_info['counselor']))->find();
            $base_info['counselor_name'] = $counselor['name'];
            $base_info['counselor_phone'] = $counselor['phone'];
            $base_info['counselor_qq'] = $counselor['qq'];
            $base_info['counselor_weixin'] = $counselor['weixin'];
            // 轮播图片
            $base_info['image'] = LineImageModel::getInstance()->field('id,url')->where(array('lineid' => $id))->order('is_cover DESC')->select();
            // 行程
            $base_info['journey'] = LineJourneyModel::getInstance()->field('day,name,spot,detail,hotel,breakfast,lunch,dinner')->where(array('lineid' => $id))->order('day ASC')->select();
            foreach ($base_info['journey'] as $k => $v) {
                $base_info['journey'][$k]['detail'] = html_entity_decode($v['detail']);
            }
            // 日期价格
            $base_info['line_date'] = LineDateModel::getInstance()->field("id,DATE_FORMAT(line_date,'%Y-%m-%d') AS line_date,adult_price,child_price,single_room")->where(array('lineid' => $id, 'line_date' => array('egt', date('Y-m-d')), 'status' => 1))->order('line_date ASC')->limit(0, 8)->select();

            $weekarray = array("日","一","二","三","四","五","六");
            if ($base_info['line_date']) {
                foreach ($base_info['line_date'] as $k => $v) {
                    $base_info['line_date'][$k]['week'] = '星期' . $weekarray[date("w", strtotime($v['line_date']))];
                }
            }
            S('line_base_info' . $id, $base_info, C('cache_time'));
        }
        $this->ajax(1, '获取成功', $base_info);
    }

    /**
     * 线路日期
     * @param month 参数格式：2017-02
     * @param lineid 线路编号
     */
    public function line_date() {
        $month = I("request.month", '');
        $lineid = I('request.lineid', '', 'strip_tags,htmlspecialchars,trim');

        $stime = date('Y-m-01', strtotime($month));
        $ntime = date('Y-m-01');

        $yy = date('Y', strtotime($month));
        $mm = date('m', strtotime($month));
        if ($stime < $ntime) {
            $this->ajax(0, '参数月份需不小于当月');
        } elseif ($stime == $ntime) {
            $nday = date('d');
        }
        $eday = date('d', strtotime("{$stime} + 1 month - 1 day"));
        $result = array();
        for ($i = 1; $i <= $eday; $i++) {
            $result[$i - 1]['day'] = $i;
            $result[$i - 1]['detail'] = '';
            if (!$nday) { //不是当月
                $line_date = LineDateModel::getInstance()->field("id,DATE_FORMAT(line_date,'%Y-%m-%d') AS line_date,adult_price,child_price,single_room")
                    ->where(array(
                        'lineid' => $lineid,
                        'status' => 1,
                        'line_date' => $yy . '-' . $mm . '-' . $i
                    ))->find();
                if ($line_date) {
                    $result[$i - 1]['detail'] = $line_date;
                }
            } else { // 当月
                if ($i >= $nday) {
                    $line_date = LineDateModel::getInstance()->field("id,DATE_FORMAT(line_date,'%Y-%m-%d') AS line_date,adult_price,child_price,single_room")
                        ->where(array(
                            'lineid' => $lineid,
                            'status' => 1,
                            'line_date' => $yy . '-' . $mm . '-' . $i
                        ))->find();
                    if ($line_date) {
                        $result[$i - 1]['detail'] = $line_date;
                    }
                }
            }
        }
        $this->ajax(1, '获取成功', $result);
    }

    /**
     * 费用说明
     * @param lineid 线路编号
     */
    public function money_detail() {
        $lineid = I('request.lineid', '', 'strip_tags,htmlspecialchars,trim');
        $line = LineModel::getInstance()->field('include,not_include')->where(array('id' => $lineid))->find();
        if ($line) {
            $line['not_include'] = html_entity_decode($line['not_include']);
            $line['include'] = html_entity_decode($line['include']);
            $this->ajax(1, '获取成功', $line);
        } else {
            $this->ajax(0, '获取失败');
        }
    }

    /**
     * 创建订单
     * @param user_id 用户id
     * @param lineid 线路编号
     * @param dateid 价格日期编号
     * @param adult_num 成人数量
     * @param child_num 儿童数量
     * @param single_num 单房差数量
     * @param note 客户备注
     */
    public function create_order() {
        $user_id = I('request.user_id', '', 'strip_tags,htmlspecialchars,trim');
//        $this->islogin($user_id);
        $lineid = I('request.lineid', '', 'strip_tags,htmlspecialchars,trim');
        $dateid = I('request.dateid', '', 'strip_tags,htmlspecialchars,trim');
        $adult_num = I('request.adult_num', '', 'strip_tags,htmlspecialchars,trim');
        $child_num = I('request.child_num', '', 'strip_tags,htmlspecialchars,trim');
        $single_num = I('request.single_num', '', 'strip_tags,htmlspecialchars,trim');
        $note = I('request.note', '', 'trim');
        if (!$lineid || !$dateid) {
            $this->ajax(0, '参数错误');
        }
        $line_date = LineDateModel::getInstance()->field('line_date,adult_price,child_price,single_room')->where(array('id' => $dateid))->find();
        if (!$line_date) {
            $this->ajax(0, '预订日期错误');
        }
        if (!$adult_num) {
            $adult_num = 2;
        }
        $data['user_id'] = $user_id;
        $data['order_no'] = orderNum();
        $data['lineid'] = $lineid;
        $data['dateid'] = $dateid;
        $data['pay_amount'] = $line_date['adult_price'] * $adult_num + $line_date['child_price'] * $child_num + $line_date['single_room'] * $single_num;
        $data['adult_price'] = $line_date['adult_price'];
        $data['adult_num'] = $adult_num;
        $data['child_price'] = $line_date['child_price'];
        $data['child_num'] = $child_num;
        $data['single_price'] = $line_date['single_room'];
        $data['single_num'] = $single_num;
        $data['note'] = $note;
        $data['create_time'] = date('Y-m-d H:i:s');
        $result['order_id'] = OrderModel::getInstance()->data($data)->add();
        if ($result['order_id']) {
            $result['order_no'] = $data['order_no'];
            $this->ajax(0, '下单成功', $result);
        } else {
            $this->ajax(0, '下单失败，请您重试或联系客服');
        }

    }

    /**
     * 对费用包含处理，返回数组
     * @param $include
     * @return array
     */
    public function deal_include($include) {
        $include = unserialize($include);
        $re_include = array();
        if ($include['traffic']['交通']) {
            $re_include['交通'] = $include['traffic']['交通'];
        }
        if ($include['small_traffic']['小交通']) {
            $re_include['小交通'] = $include['small_traffic']['小交通'];
        }
        if ($include['hotel']['住宿']) {
            $re_include['住宿'] = $include['hotel']['住宿'];
        }
        if ($include['food']['用餐']) {
            $re_include['用餐'] = $include['food']['用餐'];
        }
        if ($include['service']['导服']) {
            $re_include['导服'] = $include['service']['导服'];
        }
        if ($include['insurance']['保险']) {
            $re_include['保险'] = $include['insurance']['保险'];
        }
        if ($include['other']['其它费用']) {
            $re_include['其它费用'] = $include['other']['其它费用'];
        }
        if ($include['child']['儿童价标准']) {
            $re_include['儿童价标准'] = $include['child']['儿童价标准'];
        }
        return $re_include;
    }

    /**
     * 对费用不含处理，返回数组
     * @param $include
     * @return array
     */
    public function deal_not_include($not_include) {
        $include = unserialize($not_include);
        $re_include = array();
        if ($include['foreign']['外宾附加费']) {
            $re_include['外宾附加费'] = $include['foreign']['外宾附加费'];
        }
        if ($include['room']['单房差']) {
            $re_include['单房差'] = $include['room']['单房差'];
        }
        if ($include['other']['其它']) {
            $re_include['其它'] = $include['other']['其它'];
        }
        if ($include['extra']['补充']) {
            $re_include['补充'] = $include['extra']['补充'];
        }
        return $re_include;
    }


}