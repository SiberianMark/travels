<?php
/**
 * 首页接口
 */
namespace Home\Controller;

use Admin\Model\LineDateModel;
use Admin\Model\LineImageModel;
use Admin\Model\LineLabelModel;
use Admin\Model\PlaceModel;
use \Admin\Model\WebInfoModel;
use \Admin\Model\AdModel;
use \Admin\Model\LineModel;

class APITravelController extends CommonController
{

    public function _initialize()
    {
        parent::_initialize();
    }

    /**
     * web信息
     */
    public function web_info() {
        $re =  WebInfoModel::getInstance()->field(true)->where(Array('id' => 1))->find();
        $this->ajax(1, '获取成功', $re);
    }

    /**
     * 首页幻灯片
     */
    public function slide() {
        $re =  AdModel::getInstance()->field('id,name,url,image')->where(Array('tid' => 1,'is_del' => 0, 'status' => 1))->order('sort ASC')->select();
        if ($re) {
            $this->ajax(1, '获取成功', $re);
        } else {
            $this->ajax(0, '获取失败');
        }

    }

    /**
     * 首页栏目板块
     */
    public function plate() {
        $lists = array();
        $lists['part1'][0]['name'] = '出境游';
        $lists['part1'][0]['img'] = 'lvyouxianlu';
        $lists['part1'][0]['url'] = '/abroad';
        $lists['part1'][1]['name'] = '国内游';
        $lists['part1'][1]['img'] = 'lvxing';
        $lists['part1'][1]['url'] = '/domestic';
        $lists['part1'][2]['name'] = '周边游';
        $lists['part1'][2]['img'] = 'jiaoyou';
        $lists['part1'][2]['url'] = '/around';
        $lists['part1'][3]['name'] = '港澳游';
        $lists['part1'][3]['img'] = 'xianggang';
        $lists['part1'][3]['url'] = '/gat';
        $lists['part2'][0]['name'] = '自由行';
        $lists['part2'][0]['img'] = 'zhoubianyou';
        $lists['part2'][0]['url'] = '/search?keyword=自由行';
        $lists['part2'][1]['name'] = '海岛游';
        $lists['part2'][1]['img'] = 'travel';
        $lists['part2'][1]['url'] = '/search?keyword=海岛游';
        $lists['part2'][2]['name'] = '亲子游';
        $lists['part2'][2]['img'] = 'qinziyou15';
        $lists['part2'][2]['url'] = '/search?keyword=亲子游';
        $lists['part2'][3]['name'] = '温泉季';
        $lists['part2'][3]['img'] = 'hotspring';
        $lists['part2'][3]['url'] = '/search?keyword=温泉季';
        $this->ajax(1, '获取成功', $lists);
    }

    /**
     * 首页精选选项1
     */
    public function first_tag1() {
        $lists[0]['id'] = 1;
        $lists[0]['name'] = '周边游';

        $lists[1]['id'] = 2;
        $lists[1]['name'] = '国内游';

        $lists[2]['id'] = 3;
        $lists[2]['name'] = '出境游';

        $lists[3]['id'] = 4;
        $lists[3]['name'] = '港澳游';
        $this->ajax(1, '获取成功', $lists);
    }

    /**
     * 首页精选选项2
     */
    public function first_tag2() {
        $tag1 = I('request.tag1', '', 'strip_tags,htmlspecialchars,trim');
        switch ($tag1) {
            case 1: // 周边
                $lists[0]['id'] = 1;
                $lists[0]['name'] = '漂流';
                $lists[1]['id'] = 2;
                $lists[1]['name'] = '温泉';
                $lists[2]['id'] = 3;
                $lists[2]['name'] = '赏花';
                $lists[3]['id'] = 4;
                $lists[3]['name'] = '亲子出游';
                $lists[4]['id'] = 5;
                $lists[4]['name'] = '漂流';
                $lists[5]['id'] = 6;
                $lists[5]['name'] = '自驾游';
                $lists[6]['id'] = 7;
                $lists[6]['name'] = '周末游';
                $lists[7]['id'] = 8;
                $lists[7]['name'] = '景点门票';
                break;
            case 2: // 国内
                $lists[0]['id'] = 1;
                $lists[0]['name'] = '云南';
                $lists[1]['id'] = 2;
                $lists[1]['name'] = '海南';
                $lists[2]['id'] = 3;
                $lists[2]['name'] = '广西';
                $lists[3]['id'] = 4;
                $lists[3]['name'] = '厦门';
                $lists[4]['id'] = 5;
                $lists[4]['name'] = '西藏';
                $lists[5]['id'] = 6;
                $lists[5]['name'] = '华东';
                $lists[6]['id'] = 7;
                $lists[6]['name'] = '东北';
                $lists[7]['id'] = 8;
                $lists[7]['name'] = '贵州';
                break;
            case 3: // 出境
                $lists[0]['id'] = 1;
                $lists[0]['name'] = '泰国';
                $lists[1]['id'] = 2;
                $lists[1]['name'] = '越南';
                $lists[2]['id'] = 3;
                $lists[2]['name'] = '日本';
                $lists[3]['id'] = 4;
                $lists[3]['name'] = '韩国';
                $lists[4]['id'] = 5;
                $lists[4]['name'] = '美国';
                $lists[5]['id'] = 6;
                $lists[5]['name'] = '欧洲';
                $lists[6]['id'] = 7;
                $lists[6]['name'] = '马来西亚';
                $lists[7]['id'] = 8;
                $lists[7]['name'] = '中东非';
                break;
            case 4: // 港澳
                $lists[0]['id'] = 1;
                $lists[0]['name'] = '香港';
                $lists[1]['id'] = 2;
                $lists[1]['name'] = '澳门';
                $lists[2]['id'] = 3;
                $lists[2]['name'] = '海洋公园';
                $lists[3]['id'] = 4;
                $lists[3]['name'] = '迪士尼';
                $lists[4]['id'] = 5;
                $lists[4]['name'] = '港澳';
                $lists[5]['id'] = 6;
                $lists[5]['name'] = '纯玩';
                $lists[6]['id'] = 7;
                $lists[6]['name'] = '蜡像馆';
                $lists[7]['id'] = 8;
                $lists[7]['name'] = '星光大道';
                break;
            default:
                $this->ajax(0, '参数错误');
                break;
        }
        $data['tag1'] = $tag1;
        $data['lists'] = $lists;
        $this->ajax(1, '获取成功', $data);
    }



    /**
     * 首页精选线路
     */
    public function first_lineselect() {
        $tag1 = I('request.tag1', '', 'strip_tags,htmlspecialchars,trim');
        $tag2 = I('request.tag2', '', 'strip_tags,htmlspecialchars,trim');
        $page = I('request.page', 1, 'strip_tags,htmlspecialchars,trim');

        if (!$tag1) {
            $tag1 = 1;
        }
        if (!$tag2) {
            $tag2 = 1;
        }
        if ($page > 1) {
            $page = ($page - 1) * $this->_pz;
            $limit = "{$page},{$this->_pz}";
        } else {
            $limit = "0,{$this->_pz}";
        }
        $lists = array();
        $where['des_type'] = $tag1;
        $where['status'] = 2;
        switch ($tag2) {
            case 1:
                break;
            case 2:
                $where['line_type'] = 1;
                break;
            case 3:
                $where['line_type'] = 2;
                break;
            case 4:
                break;
            case 5:
                break;
            case 6:
                break;
            case 7:
                break;
            case 8:
                break;
        }
        $lines = LineModel::getInstance()->field('id,start_palce,line_type,title,labelid,keywords')
            ->where($where)->limit($limit)->select();
        $lists = $this->deal_lines($lines);
        $data['tag1'] = $tag1;
        $data['tag2'] = $tag2;
        $data['lists'] = $lists;
        $this->ajax(1, '获取成功', $data);

    }

    /**
     * 对线路处理
     * @param $lines  线路信息
     * @return array 返回值
     */
    public function deal_lines($lines) {
        foreach ($lines as $k => $v) {
            list($lines[$k]['main_name'], $lines[$k]['sub_name']) = explode('•', $v['title']);
            unset($lines[$k]['title']);
            $start_place = explode(',', $v['start_palce']);
            if (count($start_place) > 1) {
                $lines[$k]['start_palce'] = '多地出发';
            } else {
                $lines[$k]['start_palce'] = PlaceModel::getInstance()->where(array('id' => $v['start_palce']))->getField('name');
            }
            $lines[$k]['price'] = LineDateModel::getInstance()->where(array('lineid' => $v['id'], 'status' => 1, 'line_date' => array('gt', date('Y-m-d H:i:s'))))->min('adult_price');
            $lines[$k]['img'] = LineImageModel::getInstance()->where(array('lineid' => $v['id'], 'is_cover' => 1,))->getField('url');
            $label = explode(',', $v['labelid']);
            foreach ($label as $lk => $lv) {
                $lines[$k]['label'][$lk] = LineLabelModel::getInstance()->where(array('id' => $lv))->getField('label_name');
            }
            unset($lines[$k]['labelid']);
            if ($v['line_type'] == 1) {
                $lines[$k]['line_type'] = '跟团游';
            } else {
                $lines[$k]['line_type'] = '自由行';
            }
        }
        return $lines;
    }

    /**
     * 板块轮播图
     * @param $type  广告类型
     * @return array 返回值
     */
    public function plate_slide() {
        $type = I('request.type', '', 'strip_tags,htmlspecialchars,trim');
        switch ($type) {
            case 1: // 周边
                $re =  AdModel::getInstance()->field('id,name,url,image')->where(Array('tid' => 2,'is_del' => 0, 'status' => 1))->order('sort ASC')->select();
                break;
            case 2: // 国内
                $re =  AdModel::getInstance()->field('id,name,url,image')->where(Array('tid' => 3,'is_del' => 0, 'status' => 1))->order('sort ASC')->select();
                break;
            case 3: // 出境
                $re =  AdModel::getInstance()->field('id,name,url,image')->where(Array('tid' => 4,'is_del' => 0, 'status' => 1))->order('sort ASC')->select();
                break;
            case 4: // 港澳
                $re =  AdModel::getInstance()->field('id,name,url,image')->where(Array('tid' => 5,'is_del' => 0, 'status' => 1))->order('sort ASC')->select();
                break;
            default:
                $this->ajax(0, '参数错误');
                break;
        }
        if ($re) {
            $this->ajax(1, '获取成功', $re);
        } else {
            $this->ajax(0, '获取失败');
        }
    }

    /**
     * 板块热门目的地和热门线路
     * @param $type
     * @return array 返回值
     */
    public function hot_place() {
        $type = I('request.type', '', 'strip_tags,htmlspecialchars,trim');
        $result = array();
        switch ($type) {
            case 1: // 周边
                $result[0]['name'] = '热门目的地';
                $result[0]['lists'][0] = '清远';
                $result[0]['lists'][1] = '韶关';
                $result[0]['lists'][2] = '珠海';
                $result[0]['lists'][3] = '惠州';
                $result[0]['lists'][4] = '清远';
                $result[0]['lists'][5] = '深圳';
                $result[0]['lists'][6] = '肇庆';
                $result[0]['lists'][7] = '广州';
                $result[0]['lists'][8] = '江门';
                $result[0]['lists'][9] = '阳江';
                $result[0]['lists'][10] = '河源';
                $result[1]['name'] = '热门线路';
                $lines = LineModel::getInstance()->field('id,start_palce,line_type,title,labelid,keywords')->where(array('des_type' => 1, 'status' => 2))->limit(0, 4)->select();
                $result[1]['lists'] = $this->deal_lines($lines);
                break;
            case 2: // 国内
                $result[0]['name'] = '热门目的地';
                $result[0]['lists'][0] = '桂林';
                $result[0]['lists'][1] = '厦门';
                $result[0]['lists'][2] = '海南';
                $result[0]['lists'][3] = '云南';
                $result[0]['lists'][4] = '华东';
                $result[0]['lists'][5] = '西藏';
                $result[0]['lists'][6] = '内蒙古';
                $result[0]['lists'][7] = '张家界';
                $result[0]['lists'][8] = '北京';
                $result[0]['lists'][9] = '山西';
                $result[0]['lists'][10] = '西安';
                $result[1]['name'] = '热门线路';
                $lines = LineModel::getInstance()->field('id,start_palce,line_type,title,labelid,keywords')->where(array('des_type' => 2, 'status' => 2))->limit(0, 4)->select();
                $result[1]['lists'] = $this->deal_lines($lines);
                break;
            case 3: // 出境
                $result[0]['name'] = '热门目的地';
                $result[0]['lists'][0] = '泰国';
                $result[0]['lists'][1] = '越南';
                $result[0]['lists'][2] = '马来西亚';
                $result[0]['lists'][3] = '新西兰';
                $result[0]['lists'][4] = '澳大利亚';
                $result[0]['lists'][5] = '马尔代夫';
                $result[0]['lists'][6] = '日本';
                $result[0]['lists'][7] = '韩国';
                $result[0]['lists'][8] = '欧洲';
                $result[0]['lists'][9] = '美洲';
                $result[0]['lists'][10] = '俄罗斯';
                $result[1]['name'] = '热门线路';
                $lines = LineModel::getInstance()->field('id,start_palce,line_type,title,labelid,keywords')->where(array('des_type' => 3, 'status' => 2))->limit(0, 4)->select();
                $result[1]['lists'] = $this->deal_lines($lines);
                break;
            case 4: // 港澳
                $result[0]['name'] = '热门目的地';
                $result[0]['lists'][0] = '迪士尼';
                $result[0]['lists'][1] = '星光大道';
                $result[0]['lists'][2] = '海洋世界';
                $result[0]['lists'][3] = '品质';
                $result[0]['lists'][4] = '澳门';
                $result[0]['lists'][5] = '香港';
                $result[0]['lists'][6] = '太平山';
                $result[0]['lists'][7] = '维多利亚';
                $result[0]['lists'][8] = '赛马场';
                $result[0]['lists'][9] = '纯玩';
                $result[0]['lists'][10] = '大三巴';
                $result[1]['name'] = '热门线路';
                $lines = LineModel::getInstance()->field('id,start_palce,line_type,title,labelid,keywords')->where(array('des_type' => 4, 'status' => 2))->limit(0, 4)->select();
                $result[1]['lists'] = $this->deal_lines($lines);
                break;
            default:
                $this->ajax(0, '参数错误');
                break;
        }
        if ($result) {
            $this->ajax(1, '获取成功', $result);
        } else {
            $this->ajax(0, '获取失败');
        }

    }

    /**
     * 板块线路选项1
     */
    public function plate_tag1() {
        $type = I('request.type', '', 'strip_tags,htmlspecialchars,trim');
        $lists = array();
        switch ($type) {
            case 1: // 周边
                $lists[0]['id'] = 1;
                $lists[0]['name'] = '周边线路';
                $lists[1]['id'] = 2;
                $lists[1]['name'] = '激情漂流';
                $lists[2]['id'] = 3;
                $lists[2]['name'] = '浪漫温泉';
                $lists[3]['id'] = 4;
                $lists[3]['name'] = '周末自驾';
                break;
            case 2: // 国内
                $lists[0]['id'] = 1;
                $lists[0]['name'] = '国内线路';
                $lists[1]['id'] = 2;
                $lists[1]['name'] = '活力海滨';
                $lists[2]['id'] = 3;
                $lists[2]['name'] = '民俗风情';
                $lists[3]['id'] = 4;
                $lists[3]['name'] = '江南水乡';
                break;
            case 3: // 出境
                $lists[0]['id'] = 1;
                $lists[0]['name'] = '出境线路';
                $lists[1]['id'] = 2;
                $lists[1]['name'] = '醉美海岛';
                $lists[2]['id'] = 3;
                $lists[2]['name'] = '风情亚洲';
                $lists[3]['id'] = 4;
                $lists[3]['name'] = '尊享欧美';
                break;
            case 4: // 港澳
                $lists[0]['id'] = 1;
                $lists[0]['name'] = '港澳线路';
                $lists[1]['id'] = 2;
                $lists[1]['name'] = '活力香港';
                $lists[2]['id'] = 3;
                $lists[2]['name'] = '多情澳门';
                $lists[3]['id'] = 4;
                $lists[3]['name'] = '港澳珠';
                break;
            default:
                $this->ajax(0, '参数错误');
                break;
        }
        $this->ajax(1, '获取成功', $lists);
    }

    /**
     * 板块线路选项2
     */
    public function plate_tag2() {
        $type = I('request.type', '', 'strip_tags,htmlspecialchars,trim');
        $tag1 = I('request.tag1', '', 'strip_tags,htmlspecialchars,trim');
        switch ($type) {
            case 1: // 周边
                switch ($tag1) {
                    case 1:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '漂流';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '温泉';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '赏花';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '亲子出游';
                        $lists[4]['id'] = 5;
                        $lists[4]['name'] = '漂流';
                        $lists[5]['id'] = 6;
                        $lists[5]['name'] = '自驾游';
                        $lists[6]['id'] = 7;
                        $lists[6]['name'] = '周末游';
                        $lists[7]['id'] = 8;
                        $lists[7]['name'] = '景点门票';
                        break;
                    case 2:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '清远';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '英德';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '河源';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '阳江';
                        break;
                    case 3:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '惠州';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '英德';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '河源';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '汕尾';
                        break;
                    case 4:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '东莞';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '深圳';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '中山';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '汕尾';
                        break;
                }
                break;
            case 2: // 国内
                switch ($tag1) {
                    case 1:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '云南';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '海南';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '广西';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '厦门';
                        $lists[4]['id'] = 5;
                        $lists[4]['name'] = '西藏';
                        $lists[5]['id'] = 6;
                        $lists[5]['name'] = '华东';
                        $lists[6]['id'] = 7;
                        $lists[6]['name'] = '东北';
                        $lists[7]['id'] = 8;
                        $lists[7]['name'] = '贵州';
                        break;
                    case 2:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '厦门';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '海南';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '青岛';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '北海';
                        break;
                    case 3:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '西安';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '河南';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '山西';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '北京';
                        break;
                    case 4:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '上海';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '杭州';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '苏州';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '南京';
                        break;
                }
                break;
            case 3: // 出境
                switch ($tag1) {
                    case 1:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '泰国';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '越南';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '日本';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '韩国';
                        $lists[4]['id'] = 5;
                        $lists[4]['name'] = '美国';
                        $lists[5]['id'] = 6;
                        $lists[5]['name'] = '欧洲';
                        $lists[6]['id'] = 7;
                        $lists[6]['name'] = '马来西亚';
                        $lists[7]['id'] = 8;
                        $lists[7]['name'] = '中东非';
                        break;
                    case 2:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '马尔代夫';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '巴厘岛';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '普吉塞班';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '长滩斐济';
                        break;
                    case 3:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '热门';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '泰国';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '越柬';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '新加坡';
                        break;
                    case 4:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '热门';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '法国';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '美国';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '加拿大';
                        break;
                }
                break;
            case 4: // 港澳
                switch ($tag1) {
                    case 1:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '香港';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '澳门';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '海洋公园';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '迪士尼';
                        $lists[4]['id'] = 5;
                        $lists[4]['name'] = '港澳';
                        $lists[5]['id'] = 6;
                        $lists[5]['name'] = '纯玩';
                        $lists[6]['id'] = 7;
                        $lists[6]['name'] = '蜡像馆';
                        $lists[7]['id'] = 8;
                        $lists[7]['name'] = '星光大道';
                        break;
                    case 2:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '热门';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '一天';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '两天';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '三天';
                        break;
                    case 3:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '热门';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '纯玩';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '威尼斯';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '大三巴';
                        break;
                    case 4:
                        $lists[0]['id'] = 1;
                        $lists[0]['name'] = '热门';
                        $lists[1]['id'] = 2;
                        $lists[1]['name'] = '六天';
                        $lists[2]['id'] = 3;
                        $lists[2]['name'] = '三天';
                        $lists[3]['id'] = 4;
                        $lists[3]['name'] = '台湾';
                        break;
                }
                break;
            default:
                $this->ajax(0, '参数错误');
                break;
        }
        $data['tag1'] = $tag1;
        $data['lists'] = $lists;
        $this->ajax(1, '获取成功', $data);
    }


    /**
     * 板块线路分类
     * @param $type
     * @return array 返回值
     */
    public function plate_lines() {
        $type = I('request.type', '', 'strip_tags,htmlspecialchars,trim');
        $tag1 = I('request.tag1', '', 'strip_tags,htmlspecialchars,trim');
        $tag2 = I('request.tag2', '', 'strip_tags,htmlspecialchars,trim');
        $page = I('request.page', 1, 'strip_tags,htmlspecialchars,trim');

        if (!$tag1) {
            $tag1 = 1;
        }
        if (!$tag2) {
            $tag2 = 1;
        }
        if ($page > 1) {
            $page = ($page - 1) * $this->_pz;
            $limit = "{$page},{$this->_pz}";
        } else {
            $limit = "0,{$this->_pz}";
        }

        $lists = array();
        switch ($type) {
            case 1: // 周边
                if ($tag1 != 1 && $tag2 != 1) {
                    $lines = LineModel::getInstance()->field('id,start_palce,line_type,title,labelid,keywords')->where(array('des_type' => 1, 'status' => 2, 'line_type' => 1))->limit($limit)->select();
                } else {
                    $lines = LineModel::getInstance()->field('id,start_palce,line_type,title,labelid,keywords')->where(array('des_type' => 1, 'status' => 2))->limit($limit)->select();
                }
                break;
            case 2: // 国内
                if ($tag1 != 1 && $tag2 != 1) {
                    $lines = LineModel::getInstance()->field('id,start_palce,line_type,title,labelid,keywords')->where(array('des_type' => 2, 'status' => 2, 'line_type' => 1))->limit($limit)->select();
                } else {
                    $lines = LineModel::getInstance()->field('id,start_palce,line_type,title,labelid,keywords')->where(array('des_type' => 2, 'status' => 2))->limit($limit)->select();
                }
                break;
            case 3: // 出境
                if ($tag1 != 1 && $tag2 != 1) {
                    $lines = LineModel::getInstance()->field('id,start_palce,line_type,title,labelid,keywords')->where(array('des_type' => 3, 'status' => 2, 'line_type' => 1))->limit($limit)->select();
                } else {
                    $lines = LineModel::getInstance()->field('id,start_palce,line_type,title,labelid,keywords')->where(array('des_type' => 3, 'status' => 2))->limit($limit)->select();
                }
                break;
            case 4: // 港澳
                if ($tag1 != 1 && $tag2 != 1) {
                    $lines = LineModel::getInstance()->field('id,start_palce,line_type,title,labelid,keywords')->where(array('des_type' => 4, 'status' => 2, 'line_type' => 1))->limit($limit)->select();
                } else {
                    $lines = LineModel::getInstance()->field('id,start_palce,line_type,title,labelid,keywords')->where(array('des_type' => 4, 'status' => 2))->limit($limit)->select();
                }
                break;
            default:
                $this->ajax(0, '参数错误');
                break;
        }
        $lists = $this->deal_lines($lines);
        if ($lists) {
            $data['tag1'] = $tag1;
            $data['tag2'] = $tag2;
            $data['lists'] = $lists;
            $this->ajax(1, '获取成功', $data);
        } else {
            $this->ajax(0, '获取失败');
        }


    }

    /**
     * 搜索页热门搜索地
     */
    public function hot_search() {
        $lists = array();
        $lists[0] = '厦门';
        $lists[1] = '三亚';
        $lists[2] = '云南';
        $lists[3] = '泰国';
        $lists[4] = '日本';
        $lists[5] = '巴厘岛';
        $lists[6] = '桂林';
        $lists[7] = '北京';
        $lists[8] = '西藏';
        $lists[9] = '哈尔滨';
        $lists[10] = '清远';
        $lists[11] = '丽江';
        $lists[12] = '马尔代夫';
        $lists[13] = '惠州';
        $lists[14] = '杭州';
        $lists[15] = '越南';
        $this->ajax(1, '获取成功', $lists);
    }

    /**
     * 搜索页特色标签列表
     */
    public function search_label() {
        $lists = LineLabelModel::getInstance()->field('id,label_name')->where(array('is_del' => 0))->select();
        $this->ajax(1, '获取成功', $lists);
    }

    /**
     * 搜索页结果
     */
    public function search() {
        $keyword = I('request.type', '', 'strip_tags,htmlspecialchars,trim');
        $type = I('request.type', 0); //返回类型，0-推荐，1-跟团游，2-自由行
        $order = I('request.order', 0); //排序，0-默认，1-价格升，2-价格降，3-好评率
        $month = I('request.month', 0); //出游月份2017-04
        if (!$month) {
            $sdate = I('request.sdate', '');
            $edate = I('request.edate', '');
        }
        $label = I('request.label', 0);
        $price = I('request.price', 0);
        $day_num = I('request.day_num', 0);

        $lines = LineModel::getInstance()->field('id,start_palce,line_type,title,labelid,keywords')->where(array('des_type' => 1, 'status' => 2))->select();
        $lists = $this->deal_lines($lines);
        foreach ($lists as $k => $v) {
            $lists[$k]['date'] = LineDateModel::getInstance()->field("id,DATE_FORMAT(line_date,'%m/%d') AS line_date")->where(array('lineid' => $v['id'], 'line_date' => array('gt', date('Y-m-d'))))
                ->order('line_date ASC')->limit(0, 4)->select();
            $lists[$k]['travel_sum'] = 1235;
            $lists[$k]['hot_level'] = 98;
        }
        $this->ajax(1, '获取成功', $lists);

    }

    /**
     * 猜你喜欢
     * @param lineid 线路编号
     */
    public function guess_like() {
        $lineid = I('request.lineid', '', 'strip_tags,htmlspecialchars,trim');
        $line = LineModel::getInstance()->field('line_type,des_type,day_num')->where(array('id' => $lineid))->find();
        if ($line) {
            $lines = LineModel::getInstance()->field('id,start_palce,line_type,title,labelid,keywords')->where(array('des_type' => $line['des_type'], 'status' => 2))->limit(0, 4)->select();
            $lists = $this->deal_lines($lines);
            $this->ajax(1, '获取成功', $lists);
        } else {
            $this->ajax(0, '获取失败');
        }
    }


}