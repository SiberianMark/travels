<?php
namespace Admin\Model;

use Think\Model;

class TravelInfoModel extends Model
{
	protected $trueTableName = 'travel_info';

	protected $fields = array('id', 'adminId', 'visitorType', 'lineType', 'lineName',
			'startDate', 'endDate', 'visitorNum', 'guideCollection', 'visitorNote',
			'deposit', 'agency', 'agencyLinkman', 'agencyPhone', 'orderCode',
			'source', 'payType', 'contractId', 'systemId', 'receiptId',
			'remark', 'time', 'insurance', '_pk' => 'id', );

	/**
	 * Single
	 *
	 * @return TravelInfoModel
	 */
	public static function getInstance()
	{
		return parent::getInstance(__CLASS__);
	}

	/**
	 * 客人类型： 1-散客
	 */
	const VISITOR_TYPE_SK = 1;

	/**
	 * 客人类型： 2-包团
	 */
	const VISITOR_TYPE_BT = 2;

	/**
	 * 线路类型: 1-周边
	 */
	const LINE_TYPE_ZB = 1;

	/**
	 * 线路类型: 2-国内
	 */
	const LINE_TYPE_GN = 2;

	/**
	 * 线路类型: 3-出境
	 */
	const LINE_TYPE_CJ = 3;

	/**
	 * 线路类型: 4港澳台
	 */
	const LINE_TYPE_GAT = 4;

	/**
	 * 结算方式：1总部系统
	 */
	const PAY_TYPE_ZBXT = 1;

	/**
	 * 结算方式：2月结
	 */
	const PAY_TYPE_YJ = 2;

	/**
	 * 结算方式：3周结
	 */
	const PAY_TYPE_ZJ = 3;

	/**
	 * 结算方式：4现结
	 */
	const PAY_TYPE_XJ = 4;

	/**
	 * 结算方式：5其它
	 */
	const PAY_TYPE_QT = 5;


	/**
	 * 通过用户ID查找
	 * @param string $userId
	 * @return mixed
	 */
	public function getTravelInfoByUserId($userId)
	{
		return $this->where(array('userId' => $userId))->select();
	}

	/**
	 * 通过用户ID和日期等查找
	 * @param string $conditions
	 * @return mixed
	 */
	public function getTravelInfoByConditions($conditions)
	{
		return $this->where($conditions)->select();
	}

	/**
	 * 增加出游信息
	 */
	public function addTravelInfo($data)
	{
		return $this->add($data);
	}


}