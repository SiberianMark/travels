<?php
namespace Admin\Controller;

use Admin\Model\TravelInfoModel;
use Admin\Model\TravelMemberModel;
use Admin\Model\AdminModel;

/**
 * 出游登记管理类
 * Date：2016-09-30
 * Created：myz
 */
class TravelInfoController extends CommonController
{

	/**
	 * 添加出游客人
	 */
	public function add()
	{
		$this->display();
	}

	/**
	 * 处理添加的出游客人信息
	 */
	public function doadd()
	{
		$travelInfo['adminId'] = session('user.id');
		$travelInfo['visitorType'] = I('visitorType');
		$travelInfo['lineType'] = I('lineType');
		$travelInfo['lineName'] = I('lineName', '', 'trim');
		$travelInfo['startDate'] = I('startDate');
		$travelInfo['endDate'] = I('endDate');
		$travelInfo['visitorNum'] = I('visitorNum', 0, 'intval,abs');
		$travelInfo['guideCollection'] = I('guideCollection', '', 'trim');
		$travelInfo['visitorNote'] = I('visitorNote');
		$travelInfo['deposit'] = I('deposit', '', 'trim');
		$travelInfo['agency'] = I('agency', '', 'trim');
		$travelInfo['agencyLinkman'] = I('agencyLinkman', '', 'trim');
		$travelInfo['agencyPhone'] = I('agencyPhone', '', 'trim');
		$travelInfo['orderCode'] = I('orderCode', '', 'trim');
		$travelInfo['source'] = I('source');
		$travelInfo['payType'] = I('payType');
		$travelInfo['contractId'] = I('contractId', '', 'trim');
		$travelInfo['systemId'] = I('systemId', '', 'trim');
		$travelInfo['receiptId'] = I('receiptId', '', 'trim');
		$travelInfo['remark'] = I('remark', '', 'trim');
		$travelInfo['time'] = time();
		$travelInfo['insurance'] = I('insurance');

		if ($travelInfo['lineType'] == TravelInfoModel::LINE_TYPE_GAT) {
			$travelMember['trueName'] = I('trueName');
			$travelMember['phone'] = I('phone');
			$travelMember['idNumber'] = I('idNumber');
			$travelMember['musterAddr'] = I('musterAddr');
			$travelMember['birthDate'] = I('birthDate');
			$travelMember['birthAddr'] = I('birthAddr');
			$travelMember['signAddr'] = I('signAddr');
			$travelMember['agencyPrice'] = I('agencyPrice');
			$travelMember['payPrice'] = I('payPrice');
			$travelMember['settlementPrice'] = I('settlementPrice');
		} else {
			$travelMember['trueName'] = I('trueName');
			$travelMember['phone'] = I('phone');
			$travelMember['idNumber'] = I('idNumber');
			$travelMember['musterAddr'] = I('musterAddr');
			$travelMember['agencyPrice'] = I('agencyPrice');
			$travelMember['payPrice'] = I('payPrice');
			$travelMember['settlementPrice'] = I('settlementPrice');
		}

		if ($travelMember) {
			foreach ($travelMember as $name => $val) {
				foreach ($val as $k=> $v) {
					$member[$k][$name] = $v;
				}
			}
		}

		if (!$travelInfo['visitorType'] || !$travelInfo['lineType'] || !$travelInfo['lineName']
			|| !$travelInfo['startDate'] || !$travelInfo['endDate'] || ($travelInfo['guideCollection'] === '')
			|| !$travelInfo['visitorNum'] || $travelInfo['deposit'] === '' || !$travelMember) {
			$this->assign('travelInfo', $travelInfo);
			$this->assign('member', $member);
			$this->display('add');
			echo '<script>layer.msg("必填项未填全");</script>';
		} else {
			$travelInfo['startDate'] = strtotime($travelInfo['startDate']);
			$travelInfo['endDate'] = strtotime($travelInfo['endDate'] . ' 20:00:00');
			// 添加出游信息
			$travelInfoId = TravelInfoModel::getInstance()->add($travelInfo);

			// 添加出游客人
			$memModel = TravelMemberModel::getInstance();
			foreach ($member as $k => $v) {
				if ($k == 0) {
					$member[$k]['ifLeader'] = 1;
				}
				$member[$k]['travelInfoId'] = $travelInfoId;
				$memModel->add($member[$k]);
			}
			$this->success(L('添加成功'), U('TravelInfo/travelinfo'), 2);
		}
	}

	/**
	 * 出游信息列表 8月27日改
	 */
	public function travelinfo()
	{
		$isCW = session('adminDept') == AdminModel::DEPT_CW; // 如果是财务部门
		if ($isCW) {
			$AdminModel = AdminModel::getInstance();
			$admin = $AdminModel->where(array('department' => AdminModel::DEPT_OP))
				->select();
			$this->assign('admin', $admin);
		}

		if (I('visitorType', 0)) {
			$where['i.visitorType'] = I('visitorType', 0);
			$this->assign('visitorType', I('visitorType', 0));
		}
		if (I('lineType', 0)) {
			$where['i.lineType'] = I('lineType', 0);
			$this->assign('lineType', I('lineType', 0));
		}
		$lineName = I('lineName', '', 'trim');
		if ($lineName) {
			$where['i.lineName'] = array('like', "%{$lineName}%");
			$this->assign('lineName', $lineName);
		}

		if (I('op', 0)) {
			$where['i.adminId'] = I('op', 0);
			$this->assign('op', I('op', 0));
		}

		if(I('startDate1', '') !== '' && I('startDate2', '') !== '') {
			$where['i.startDate'] = array(
				array('egt', strtotime(I('startDate1', ''))),
				array('elt', strtotime(I('startDate2', '') . ' 23:59:59'))
			);
			$this->assign('startDate1', I('startDate1', ''));
			$this->assign('startDate2', I('startDate2', ''));
		}
		if(I('startDate1', '') === '' && I('startDate2', '') !== '') {
			$where['i.startDate'] = array(
				'elt', strtotime(I('startDate2', '') . ' 23:59:59')
			);
			$this->assign('startDate2', I('startDate2', ''));
		}
		if(I('startDate1', '') !== '' && I('startDate2', '') === '') {
			$where['i.startDate'] = array(
				'egt', strtotime(I('startDate1', ''))
			);
			$this->assign('startDate1', I('startDate1', ''));
		}

		$trueName = I('trueName', '', 'trim');
		if ($trueName) {
			$this->assign('trueName', $trueName);
			$where['m.trueName'] = array('like', "%{$trueName}%");
			$where['m.ifLeader'] = TravelMemberModel::IF_LEADER_YES;
		}
		$nowpage = I('get.nowpage', 1, 'intval');
		$count = 0;

		if ($where) {
			if ($where['m.trueName']) { //如果是按照领队名字查找
				$count = D('TravelInfo')
					->alias('i')
					->join('left join travel_member as m on i.id=m.travelInfoId')
					->where($where)->count();
				$travelInfo = D('TravelInfo')
					->alias('i')
					->field('i.id as iid,i.adminId,i.visitorType,i.lineType,i.lineName,i.startDate,i.endDate,i.visitorNum,
			i.guideCollection,i.visitorNote,i.deposit,i.agency,i.agencyLinkman,i.agencyPhone,i.orderCode,i.source,
			i.payType,i.contractId,i.systemId,i.receiptId,i.remark,i.time,i.insurance')
					->join('left join travel_member as m on i.id=m.travelInfoId')
					->where($where)->order('i.startDate DESC')->limit(($nowpage-1) * 10, 10)->select();
			} else { //查询条件里没有领队名字
				$count = D('TravelInfo')
					->alias('i')
					->where($where)->count();
				$travelInfo = D('TravelInfo')
					->alias('i')
					->field('i.id as iid,i.adminId,i.visitorType,i.lineType,i.lineName,i.startDate,i.endDate,i.visitorNum,
			i.guideCollection,i.visitorNote,i.deposit,i.agency,i.agencyLinkman,i.agencyPhone,i.orderCode,i.source,
			i.payType,i.contractId,i.systemId,i.receiptId,i.remark,i.time,i.insurance')
					->where($where)->order('i.startDate DESC')->limit(($nowpage-1) * 10, 10)->select();
			}
		} else {  // 默认显示本月的记录
			$mintime = date('Y-m', time());
			$where['i.startDate'] = array('egt', strtotime($mintime));
			$count = D('TravelInfo')
				->alias('i')
				->where($where)->count();
			$travelInfo = D('TravelInfo')
				->alias('i')
				->field('i.id as iid,i.adminId,i.visitorType,i.lineType,i.lineName,i.startDate,i.endDate,i.visitorNum,
			i.guideCollection,i.visitorNote,i.deposit,i.agency,i.agencyLinkman,i.agencyPhone,i.orderCode,i.source,
			i.payType,i.contractId,i.systemId,i.receiptId,i.remark,i.time,i.insurance')
				->where($where)->order('i.startDate DESC')->limit(($nowpage-1) * 10, 10)->select();
		}
		$lists = array();
		foreach ($travelInfo as $k => $v) {
			if ($isCW) { // 如果是财务部门
				$admin = $AdminModel->where(array('id' => $v['adminId']))->find();
				$travelInfo[$k]['adminName'] = $admin['name'];
			}
			$aveage = sprintf('%.2f', $v['insurance'] / $v['visitorNum']); //平均每个人的保险金额
			$members = TravelMemberModel::getInstance()->getMembersByTravelInfoId($v['iid']);
			if ($members) {
				$sum = count($members);
				foreach ($members as &$n) {
					if ($n['ifLeader'] == 1 && $sum > 1) {
						$n['sum'] = $sum;
					}
					if ($v['visitorType'] == 2) {
						if ($n['ifLeader'] == 1) {
							$n['profit'] = $n['settlementPrice'] - $n['agencyPrice'] - $v['insurance']; //包团利润
						}
					} else {
						$n['profit'] = $n['settlementPrice'] - $n['agencyPrice'] - $aveage; //散客利润
					}
					$lists[] = array_merge($travelInfo[$k], $n);
				}
			}
		}
		$this->assign('lists', $lists);
		$pages = ceil($count/10);
		$this->assign('pages', $pages);
		$this->assign('count', $count);
		$this->assign('nowpage', $nowpage);
		$this->display();
	}


	/**
	 * 修改出游信息界面
	 */
	public function modifyinfo()
	{
		$travelInfoId = I('iid');
		$Model = TravelInfoModel::getInstance();
		$menModel = TravelMemberModel::getInstance();
		$travelInfo = $Model->where(array('id' => $travelInfoId))->find();
		$travelInfo['startDate'] = date('Y-m-d', $travelInfo['startDate']);
		$travelInfo['endDate'] = date('Y-m-d', $travelInfo['endDate']);
		$member = $menModel->where(array('travelInfoId' => $travelInfoId))->select();
		$this->assign('iid', $travelInfoId);
		$this->assign('travelInfo', $travelInfo);
		$this->assign('member', $member);
		$this->display();
	}

	/**
	 *
	 */
	public function domodifyinfo()
	{
		$id = I('iid', 0);
		$travelInfo['adminId'] = session('user.id');
		$travelInfo['visitorType'] = I('visitorType');
		$travelInfo['lineType'] = I('lineType');
		$travelInfo['lineName'] = I('lineName', '', 'trim');
		$travelInfo['startDate'] = I('startDate');
		$travelInfo['endDate'] = I('endDate');
		$travelInfo['visitorNum'] = I('visitorNum', 0, 'intval,abs');
		$travelInfo['guideCollection'] = I('guideCollection', '', 'trim');
		$travelInfo['visitorNote'] = I('visitorNote');
		$travelInfo['deposit'] = I('deposit', '', 'trim');
		$travelInfo['agency'] = I('agency', '', 'trim');
		$travelInfo['agencyLinkman'] = I('agencyLinkman', '', 'trim');
		$travelInfo['agencyPhone'] = I('agencyPhone', '', 'trim');
		$travelInfo['orderCode'] = I('orderCode', '', 'trim');
		$travelInfo['source'] = I('source');
		$travelInfo['payType'] = I('payType');
		$travelInfo['contractId'] = I('contractId', '', 'trim');
		$travelInfo['systemId'] = I('systemId', '', 'trim');
		$travelInfo['receiptId'] = I('receiptId', '', 'trim');
		$travelInfo['remark'] = I('remark', '', 'trim');
		$travelInfo['insurance'] = I('insurance');

		if ($travelInfo['lineType'] == TravelInfoModel::LINE_TYPE_GAT) {
			$travelMember['id'] = I('memberid');
			$travelMember['trueName'] = I('trueName');
			$travelMember['phone'] = I('phone');
			$travelMember['idNumber'] = I('idNumber');
			$travelMember['musterAddr'] = I('musterAddr');
			$travelMember['birthDate'] = I('birthDate');
			$travelMember['birthAddr'] = I('birthAddr');
			$travelMember['signAddr'] = I('signAddr');
			$travelMember['agencyPrice'] = I('agencyPrice');
			$travelMember['payPrice'] = I('payPrice');
			$travelMember['settlementPrice'] = I('settlementPrice');
		} else {
			$travelMember['id'] = I('memberid');
			$travelMember['trueName'] = I('trueName');
			$travelMember['phone'] = I('phone');
			$travelMember['idNumber'] = I('idNumber');
			$travelMember['musterAddr'] = I('musterAddr');
			$travelMember['agencyPrice'] = I('agencyPrice');
			$travelMember['payPrice'] = I('payPrice');
			$travelMember['settlementPrice'] = I('settlementPrice');
		}

		if ($travelMember) {
			foreach ($travelMember as $name => $val) {
				foreach ($val as $k=> $v) {
					$member[$k][$name] = $v;
				}
			}
		}

		if (!$travelInfo['visitorType'] || !$travelInfo['lineType'] || !$travelInfo['lineName']
			|| !$travelInfo['startDate'] || !$travelInfo['endDate'] || ($travelInfo['guideCollection'] === '')
			|| !$travelInfo['visitorNum'] || $travelInfo['deposit'] === '' || !$travelMember) {

			$this->assign('travelInfo', $travelInfo);
			$this->assign('member', $member);
			$this->display('modifyinfo');
			echo '<script>layer.msg("必填项未填全");</script>';
		} else {
			$travelInfo['startDate'] = strtotime($travelInfo['startDate']);
			$travelInfo['endDate'] = strtotime($travelInfo['endDate'] . ' 20:00:00');
			$travelInfo['time'] = time();
			$type = TravelInfoModel::getInstance()->where(array('id' => $id))->getField('lineType');
			// 更改出游信息
			$travelInfoId = TravelInfoModel::getInstance()->where(array('id' => $id))->save($travelInfo);
			$memModel = TravelMemberModel::getInstance();
			$mem = $memModel->where(array('travelInfoId' => $id))->select();
			if (TravelInfoModel::LINE_TYPE_GAT == $type && TravelInfoModel::LINE_TYPE_GAT != $travelInfo['lineType']) {
				foreach ($mem as $v) {
					$memModel->where(array('id' => $v['id']))->delete();
				}
				foreach ($member as $k => $v) {
					if ($k == 0) {
						$member[$k]['ifLeader'] = 1;
					}
					$member[$k]['travelInfoId'] = $id;
					$memModel->data($member[$k])->add();
				}
			} else {  //不是由港澳台类型改为其它类型情况
				$sum = count($mem);
				$sumf = count($member);
				if ($sum == $sumf) { //旅客数量无增减
					foreach ($member as $k => $v) {
						$memModel->where(array('id' => $mem[$k]['id']))->save($v);
					}
				} elseif ($sum < $sumf) { //增加旅客
					foreach ($member as $k => $v) {
						if ($sum > $k) {
							$memModel->where(array('id' => $mem[$k]['id']))->save($v);
						} else {
							$member[$k]['travelInfoId'] = $id;
							$memModel->data($member[$k])->add();
						}
					}
				} else { //减少旅客
					foreach ($mem as $k => $v) {
						if ($sumf > $k) {
							$memModel->where(array('id' => $mem[$k]['id']))->save($member[$k]);
						} else {
							$memModel->where(array('id' => $mem[$k]['id']))->delete();
						}
					}
				}

			}
//			$this->display('TravelInfo:travelinfo');
//			echo '<script>layer.msg("修改成功",{time:2000},function(){window.location.href="/Admin/TravelInfo/travelinfo";});</script>';
			$this->success(L('修改成功'), U('TravelInfo/travelinfo'), 2);
		}
	}

	/**
	 * 删除出游人
	 */
	public function del()
	{
		$id = I('id', 0);
		$Model = TravelInfoModel::getInstance();
		$menModel = TravelMemberModel::getInstance();
		$member = $menModel->where(array('travelInfoId' => $id))->select();
		$info = $Model->where(array('id' => $id))->delete();
		if ($info) {
			foreach ($member as $v) {
				$menModel->where(array('id' => $v['id']))->delete();
			}
			$this->ajaxReturn(1);
		} else {
			$this->ajaxReturn(0);
		}
	}

	/**
	 * 根据条件导出出游信息展示
	 */
	public function infoSelect()
	{
		if (session('adminDept') == AdminModel::DEPT_CW) { // 如果是财务部门
			$ops = AdminModel::getInstance()->where(array('department' => AdminModel::DEPT_OP))
					 ->select();
			$this->assign('ops', $ops);
		}
		$this->display();
	}

	/**
	 * 导出出游信息(出发日期)
	 */
	public function exportInfo()
	{
		$isCW = session('adminDept') == AdminModel::DEPT_CW;
		if ($isCW) { // 如果是财务部门
			$AdminModel = AdminModel::getInstance();
			$adminId = I('op');
			if ($adminId) {
				$conditions['adminId'] = $adminId;
			}
		} else {
			$conditions['adminId'] = session('adminId');
		}

		$dateType = I('dateTyp');
		$visitorType = I('visitorType');
		$lineType = I('lineType');
		$lineName = I('lineName', '', 'trim');
		$date1 = I('date1');
		$date2 = I('date2');

		if (!$visitorType && !$lineType && !$lineName) {
			if(!$date1 && !$date2){
				return $this->error(L('选择内容为空'), '', 2);
			}
			if(!$date1 || !$date2){
				return $this->error(L('开始日期和截止日期需同时选择'), '', 2);
			}
		}

		if ($date1 && $date2) {
			if ($dateType == 1) {
				$conditions['startDate'] = array('between', array(strtotime($date1), strtotime($date2. ' 23:59:59')));
			} else {
				$conditions['endDate'] = array('between', array(strtotime($date1), strtotime($date2. ' 23:59:59')));
			}
		}
		if ($visitorType) {
			$conditions['visitorType'] = $visitorType;
		}
		if ($lineType) {
			$conditions['lineType'] = $lineType;
		}
		if ($lineName) {
			$conditions['lineName'] = array('like', "%{$lineName}%");
		}

		$TravelInfo = TravelInfoModel::getInstance()->getTravelInfoByConditions($conditions);

		$lists = array();
		foreach ($TravelInfo as &$v) {
			if ($isCW) { // 如果是财务部门
				$admin = $AdminModel->where(array('id' => $v['adminId']))->find();
				$v['adminName'] = $admin['name'];
			}
			$aveage = $v['insurance']/$v['visitorNum'];
			$members = TravelMemberModel::getInstance()->getMembersByTravelInfoId($v['id']);
			foreach ($members as &$vm) {
				$vm['profit'] = $vm['settlementPrice'] - $vm['agencyPrice'] - $aveage;
				$lists[] = array_merge($v, $vm);
			}
		}

		$date = date("mdHi", time());
		header("Pragma: public");
		header("Expires: 0");
		header("Cache-Control:must-revalidate, post-check=0, pre-check=0");
		header("Content-Type:application/force-download");
		header("Content-Type:application/vnd.ms-execl");
		header("Content-Type:application/octet-stream");
		header("Content-Type:application/download");;
		header('Content-Disposition:attachment;filename="' . session('adminName') . $date . '.xls"');
		header("Content-Transfer-Encoding:binary");

		echo '<table>';
		echo '<tr>';
		if ($isCW) { // 如果是财务部门
			echo '<td>OP</td>';
		}
		echo '<td>客人类型</td><td>线路类型</td><td>线路名称(价格)</td><td>出游日期</td><td>参团人数</td><td>领队</td>
			<td>真实姓名</td><td>电话</td><td>证件号码</td><td>上车地点</td><td>导游代收</td><td>出游备注</td><td>出生年月日</td>
			<td>出生地</td><td>签发地</td><td>定金</td><td>地接/专线名称</td><td>地接负责人</td><td>地接联系方式</td>
            <td>地接结算价</td><td>网站来源</td><td>订单号/券号/验证码</td><td>收客价</td><td>网站结算价</td><td>结算方式</td>
            <td>合同号</td><td>系统号</td><td>收据号</td><td>备注/说明</td><td>保险总金额</td><td>利润</td>';
		echo '</tr>';
		foreach ($lists as $list) {
			echo "<tr>";
			if ($isCW) { // 如果是财务部门
				echo "<td>{$list['adminName']}</td>";
			}
			echo "<td>";
			echo $list['visitorType'] == 1 ? '散客' : '包团';
			echo "</td>
			      <td>";
				switch ($list['lineType']) {
					case "1":
						echo '周边';
						break;
					case "2":
						echo '国内';
						break;
					case "3":
						echo '出境';
						break;
					case "4":
						echo '港澳台';
						break;
				}
			echo "</td>
			      <td>{$list['lineName']}</td>
			<td>" . date("Y-m-d", $list['startDate']) . "</td>";
			if ($list['ifLeader'] == 1) {
			echo "<td rowspan='{$list['visitorNum']}'>{$list['visitorNum']}</td>";
			}
			if ($list['ifLeader'] == 1) {
			echo "<td rowspan='{$list['visitorNum']}'>{$list['trueName']}</td>";
			}
			echo "<td>{$list['trueName']}</td>
			<td>{$list['phone']}</td>
			<td>'{$list['idNumber']}</td>
			<td>{$list['musterAddr']}</td>";
			if ($list['ifLeader'] == 1) {
			echo "<td rowspan='{$list['visitorNum']}'>{$list['guideCollection']}</td>";
			}
			if ($list['ifLeader'] == 1) {
			echo "<td rowspan='{$list['visitorNum']}'>{$list['visitorNote']}</td>";
			}
			echo "<td>{$list['birthDate']}</td>
			<td>{$list['birthAddr']}</td>
			<td>{$list['signAddr']}</td>";
			if ($list['ifLeader'] == 1) {
			echo "<td rowspan='{$list['visitorNum']}'>{$list['deposit']}</td>";
			}
			if ($list['ifLeader'] == 1) {
			echo "<td rowspan='{$list['visitorNum']}'>{$list['agency']}</td>";
			}
			if ($list['ifLeader'] == 1) {
			echo "<td rowspan='{$list['visitorNum']}'>{$list['agencyLinkman']}</td>";
			}
			if ($list['ifLeader'] == 1) {
				echo "<td rowspan='{$list['visitorNum']}'>{$list['agencyPhone']}</td>";
			}
			echo "<td>{$list['agencyPrice']}</td>
				<td>{$list['source']}</td>
				<td>'{$list['orderCode']}</td>
				<td>{$list['payPrice']}</td>
				<td>{$list['settlementPrice']}</td>";
			if ($list['ifLeader'] == 1) {
				echo "<td rowspan='{$list['visitorNum']}'>";
				switch ($list['payType']) {
					case "1":
						echo '总部系统';
						break;
					case "2":
						echo '月结';
						break;
					case "3":
						echo '周结';
						break;
					case "4":
						echo '现结';
						break;
					case "5":
						echo '其它';
						break;
				}
				echo "</td>";
			}
			if ($list['ifLeader'] == 1) {
			echo "<td rowspan='{$list['visitorNum']}'>'{$list['contractId']}</td>";
			}
			if ($list['ifLeader'] == 1) {
			echo "<td rowspan='{$list['visitorNum']}'>'{$list['systemId']}</td>";
			}
			if ($list['ifLeader'] == 1) {
			echo "<td rowspan='{$list['visitorNum']}'>'{$list['receiptId']}</td>";
			}
			if ($list['ifLeader'] == 1) {
			echo "<td rowspan='{$list['visitorNum']}'>{$list['remark']}</td>";
			}
			if ($list['ifLeader'] == 1) {
			echo "<td rowspan='{$list['visitorNum']}'>{$list['insurance']}</td>";
			}
			echo "<td>{$list['profit']}</td>";
			echo "</tr>";
		}
		echo '</table>';
		exit();
	}



}