<?php
/**
 * 会员模型
 * Created by myz.
 * Date: 2017/02/05
 * Time: 14:37
 */
namespace Common\Model;

use Think\Model;

class MemberModel extends Model {
    protected $trueTableName = 'mmm_member';


    /**
     * Single
     * @return MemberModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }

    /**
     * 获取会员信息
     * @param string $phone
     * @return mixed
     */
    public function getMemberByPhone($phone)
    {
        return $this->field('id,username,password,mobile,status,is_del,lastlogin,lastip')->where(array('mobile' => $phone, 'status' => 1))->find();
    }

    /**
     * 设置用户logintoken
     * @param $id  用户id
     * @return bool|string
     */
    public function getLogintoken($id, $auto = false) {
        if ($auto) {
            $logintoken = S($id . '_logintoken'); //读取缓存里的logintoken�?
            if (empty($logintoken)) {
                $logintoken = $this->where('id=' . $id)->getField('logintoken');
                if (!empty($logintoken)) {
                    S($id . '_logintoken', $logintoken, 86400);
                    return $logintoken;
                }
            } else {
                return $logintoken;
            }
        }
        $logintoken = md5('zym' . $id . time());  //登录令牌
        $result = $this->where('id=' . $id)->setField('logintoken', $logintoken);
        if (false !== $result) {
            S($id . '_logintoken', $logintoken, 86400);
            return $logintoken;
        } else {
            return '';
        }
    }

    /**
     * 清空用户logintoken
     * @param $id
     * @return bool
     */
    public function emptyLogintoken($id) {
        $result = $this->where('id=' . $id)->setField('logintoken', '');
        if (false !== $result) {
            S($id . '_logintoken', null);
            return true;
        } else {
            return false;
        }
    }



}

/*
 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(200) NOT NULL DEFAULT '' COMMENT '用户�?,
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别 ;  0保密;  1�? 2�?,
  `nickname` varchar(100) DEFAULT '' COMMENT '昵称',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号码',
  `addr` varchar(250) NOT NULL DEFAULT '' COMMENT '收货地址',
  `email` varchar(100) DEFAULT '' COMMENT '邮箱',
  `emailverified` tinyint(1) DEFAULT '0' COMMENT '邮箱认证0未认证，1未激活，2已认�?,
  `birthday` date DEFAULT NULL COMMENT '生日',
  `photo` varchar(200) DEFAULT '' COMMENT '头像',
  `status` tinyint(1) DEFAULT '1' COMMENT '状�?0禁用/1启用',
  `regtime` int(11) DEFAULT NULL COMMENT '注册时间',
  `regip` varchar(20) DEFAULT '' COMMENT '注册IP',
  `lastlogin` int(11) DEFAULT NULL COMMENT '最后登录时�?,
  `lastip` varchar(20) DEFAULT '' COMMENT '最后登录的ip',
  `updatetime` int(11) DEFAULT NULL COMMENT '最后修改数据的时间',
  `stopreason` varchar(200) DEFAULT '' COMMENT '停用理由',
  `stoptime` bigint(20) DEFAULT NULL COMMENT '停用时间',
  `id_type` varchar(255) DEFAULT NULL COMMENT '证件类型id，关联mmm_id_type表主�?,
  `id_num` varchar(32) DEFAULT '' COMMENT '证件号码',
  `from` tinyint(4) DEFAULT '0' COMMENT '来源�?-pc注册 �?1-wap注册',
  `openid` varchar(120) DEFAULT '' COMMENT '微信id',
  `is_del` tinyint(1) DEFAULT '0' COMMENT '是否删除 0 �?1 �?,
  `logintoken` varchar(64) DEFAULT '' COMMENT '最后登录的TOKEN',
*/