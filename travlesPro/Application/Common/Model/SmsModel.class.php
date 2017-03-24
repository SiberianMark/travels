<?php
/**
 * 短信记录模型
 * Created by myz.
 * Date: 2017/02/13
 * Time: 14:37
 */
namespace Common\Model;

use Think\Model;

class SmsModel extends Model {
    protected $trueTableName = 'mmm_sms';


    /**
     * Single
     * @return SmsModel
     */
    public static function getInstance() {
        return parent::getInstance(__CLASS__);
    }

    /**
     * 验证短信验证码
     * @param $mobile
     * @param $verify
     * @return bool
     */
    public function checkSms($mobile, $verify) {
        $verifyCode = $this->where("status=0 and type=1 and mobile='" . $mobile . "' and verify!=''")->order('id desc')->getField('verify');
        if ($verifyCode != $verify) {
            return false;
        } else {
            return true;
        }
    }



}