<?php
namespace Admin\Model;

use Think\Model;

class TravelMemberModel extends Model
{
	protected $trueTableName = 'travel_member';

	protected $fields = array('id', 'travelInfoId', 'ifLeader', 'trueName', 'phone',
			'idNumber', 'musterAddr', 'birthDate', 'birthAddr', 'signAddr',
			'agencyPrice', 'payPrice', 'settlementPrice', '_pk' => 'id', );

	/**
	 * Single
	 *
	 * @return TravelMemberModel
	 */
	public static function getInstance()
	{
		return parent::getInstance(__CLASS__);
	}

	/**
	 * 是否领队：1是领队
	 */
	const IF_LEADER_YES = 1;

	/**
	 * 是否领队：0不是
	 */
	const IF_LEADER_NO = 0;


	/**
	 * 根据出游信息ID查询出行人
	 * @param string $travelInfoId
	 * @return mixed
	 */
	public function getMembersByTravelInfoId($travelInfoId)
	{
		return $this->field(true)->where(array('travelInfoId' => $travelInfoId))->order('ifLeader DESC')->select();
	}



}