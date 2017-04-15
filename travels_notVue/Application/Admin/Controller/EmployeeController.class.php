<?php
namespace Admin\Controller;

use Think\Image;
use Admin\Model\AdminDepaModel;
use Admin\Model\MenuModel;
use Admin\Model\AdminModel;

/**
 * 员工管理类
 * Date：2016-09-30
 * Created：myz
 */

class EmployeeController extends CommonController
{
    /**
     * 部门管理
     */
    public function index()
    {
        $this->display();
    }

    /**
     * 部门列表
     */
    public function adminDepa()
    {
        $lists = AdminDepaModel::getInstance()->alias('d')->field('d.id,d.name,d.detail,d.rules,d.addtime,count(a.department) as num')
            ->join('LEFT JOIN mmm_employee as a ON a.department = d.id')->where(array('d.is_del' => 0))->group('d.id')->select();
        $this->assign('lists', $lists);
        //var_dump($lists);
        $this->display();
    }

    /**
     * 部门新增
     */
    public function adminDepaAdd()
    {
        $lists = MenuModel::getInstance()->getMenu(0);
        $this->assign('lists', $lists);
        if ($_POST) {
            $data['name'] = I('name', '', 'trim');
            $data['detail'] = I('detail', '');
            $data['rules'] = implode(',', I('rules', ''));
            $data['addtime'] = date('Y-m-d H:i:s');
            if (AdminDepaModel::getInstance()->where(array('name' => $data['name']))->getField('id')) {
                $this->error(L('部门名字已经存在'), U('Employee/adminDepaAdd'), 3);
            }
            if (AdminDepaModel::getInstance()->data($data)->add()) {
                //echo 'parent.location.href="/Admin/Employee/adminDepa";</script>';
                $this->success(L('添加成功'), U('Employee/adminDepa'), 2);
            } else {
                $this->error(L('添加失败'), U('Employee/adminDepaAdd'), 3);
            }
        } else {
            $this->display();
        }
    }

    /**
     * 部门编辑
     */
    public function adminDepaEdit()
    {
        $id = I('id', 0);
        if ($_POST) {
            $id = I('id', 0);
            $data['name'] = I('name', '', 'trim');
            $data['detail'] = I('detail', '');
            $data['rules'] = implode(',', I('rules', ''));
            $data['addtime'] = date('Y-m-d H:i:s');
            if (AdminDepaModel::getInstance()->where(array('name' => $data['name'], 'id' =>array('neq', $id)))->find()) {
                $this->error(L('部门名字已经存在'), U('Employee/adminDepa'), 3);
            }
            if (AdminDepaModel::getInstance()->where(array('id' => $id))->save($data)) {
                //echo '<script>parent.location.href="/Admin/Employee/adminDepa";</script>';
                $this->success(L('修改成功'), U('Employee/adminDepa'), 2);
            } else {
                $this->error(L('修改失败'), U('Employee/adminDepa'), 3);
            }
        } else {
            $depa = AdminDepaModel::getInstance()->field(true)->where(array('id' => $id))->find();
            $lists = MenuModel::getInstance()->getMenu(0);
            $rules = explode(',', $depa['rules']);
            $lists = $this->getChecked($lists, $rules);
            $this->assign('depa', $depa);
            $this->assign('lists', $lists);
            $this->display();
        }
    }

    /**
     * 递归获得checked
     */
    public function getChecked($lists, $rules)
    {
        foreach ($lists as $k => $v) {
            if ($v['child']) {
                $lists[$k]['child'] = $this->getChecked($v['child'], $rules);
            }
            if (in_array($v['id'], $rules)) {
                $lists[$k]['checked'] = 'checked';
            }
        }
        return $lists;
    }

    /**
     * 部门删除
     */
    public function depaDel()
    {
        $id = I('id', 0);
        $result = AdminDepaModel::getInstance()->where(array('id' => $id))->setField(array('is_del' => 1));
        $this->ajaxReturn($result);
    }

    /**
     * 员工列表
     */
    public function emplList()
    {
        $depa = AdminDepaModel::getInstance()->getDepaLists();
        $this->assign('depa', $depa);
        if(I('get.depa')) {
            $where['a.department'] = I('get.depa', '');
            $this->assign('depaid', I('get.depa'));
        }
        if(I('get.status') === '0' || I('get.status') == 1) {
            $where['a.status'] = I('get.status', '');
            $this->assign('status', I('get.status'));
        }
        if(I('get.keyword')) {
            $keyword = I('get.keyword');
            $this->assign('keyword', I('get.keyword'));
            $map['a.name'] = array('like', "%{$keyword}%");
            $map['a.phone'] = array('like', "%{$keyword}%");
            $map['a.email'] = array('like', "%{$keyword}%");
            $map['_logic'] = 'or';
            $where['_complex'] = $map;
        }
        $where['a.is_del'] = 0;
        $nowpage = I('get.nowpage', 1, 'intval');
        $count = 0;
        $count = AdminModel::getInstance()->alias('a')->field("a.id,a.name,d.name AS department,a.phone,a.qq,a.weixin,a.email,a.sex,a.nativeplace,
        a.address,DATE_FORMAT(a.entrytime, '%Y-%m-%d') AS entrytime,a.status,a.note,a.qq")
            ->join('LEFT JOIN mmm_employee_depa AS d ON d.id = a.department')->where($where)->count();
        $lists = AdminModel::getInstance()->alias('a')->field("a.id,a.name,d.name AS department,a.phone,a.qq,a.weixin,a.email,a.sex,a.nativeplace,
        a.address,DATE_FORMAT(a.entrytime, '%Y-%m-%d') AS entrytime,a.status,a.note,a.qq")
        ->join('LEFT JOIN mmm_employee_depa AS d ON d.id = a.department')->where($where)->order('a.id DESC')->limit(($nowpage - 1) * 15, 15)->select();
        $this->assign('lists', $lists);
        $pages = ceil($count / 15);
        $this->assign('pages', $pages);
        $this->assign('count', $count);
        $this->assign('nowpage', $nowpage);
        $this->display();
    }

    /**
     * 员工增加
     */
    public function emplAdd()
    {
        $depa = AdminDepaModel::getInstance()->getDepaLists();
        $this->assign('depa', $depa);
        if ($_POST) {
            $data['name'] = I('name', '');
            $data['phone'] = I('phone', '');
            $data['department'] = I('department', '');
            $data['sex'] = I('sex', 0);
            $data['weixin'] = I('weixin', '');
            $data['qq'] = I('qq', '');
            $data['email'] = I('email', '');
            $data['entrytime'] = I('entrytime', '');
            $data['nativeplace'] = I('nativeplace', '');
            $data['address'] = I('address', '');
            $data['note'] = I('note', '');
            $data['password'] = makePasswd('123456'); //初始密码
            if (!$data['name'] || !$data['phone'] || !$data['department']) {
                $this->assign('data', $data);
                $this->display();
                echo '<script>layer.msg("名字，电话，部门不能为空");</script>';
                exit;
            }
            if (AdminModel::getInstance()->data($data)->add()) {
                echo '<script>parent.location.href="/Admin/Employee/emplList";</script>';
                //$this->display();
                //$this->redirect('emplList', '', 2, '添加成功');
                //echo '<script>layer.msg("添加成功");</script>';
            } else {
                $this->assign('data', $data);
                $this->display();
                echo '<script>layer.msg("添加失败");</script>';
                exit;
            }
        } else {
            $this->display();
        }

    }

    /**
     * 员工编辑
     */
    public function emplEdit()
    {
        if ($_POST) {
            $id = I('id', 0);
            $data['name'] = I('name', '');
            $data['phone'] = I('phone', '');
            $data['department'] = I('department', '');
            $data['sex'] = I('sex', 0);
            $data['weixin'] = I('weixin', '');
            $data['qq'] = I('qq', '');
            $data['email'] = I('email', '');
            $data['entrytime'] = I('entrytime', '');
            $data['nativeplace'] = I('nativeplace', '');
            $data['address'] = I('address', '');
            $data['note'] = I('note', '');
            if (!$data['name'] || !$data['phone'] || !$data['department']) {
                $depa = AdminDepaModel::getInstance()->getDepaLists();
                $this->assign('depa', $depa);
                $data['id'] = $id;
                $this->assign('lists', $data);
                $this->display();
                echo '<script>layer.msg("名字，电话，部门不能为空");</script>';
                exit;
            }
            if (AdminModel::getInstance()->where(array('id' => $id))->save($data)) {
                echo '<script>parent.location.href="/Admin/Employee/emplList";</script>';
            } else {
                $depa = AdminDepaModel::getInstance()->getDepaLists();
                $this->assign('depa', $depa);
                $data['id'] = $id;
                $this->assign('lists', $data);
                $this->display();
                echo '<script>layer.msg("修改失败");</script>';
                exit;
            }
        } else {
            $id = I('id', 0);
            $depa = AdminDepaModel::getInstance()->getDepaLists();
            $this->assign('depa', $depa);
            $lists = AdminModel::getInstance()->field("id,name,phone,qq,weixin,email,password,department,sex,nativeplace,address,DATE_FORMAT(entrytime, '%Y-%m-%d') AS entrytime,addtime,status,note,is_del")->where(array('id' => $id))->find();
            $this->assign('lists', $lists);
            $this->display();
        }
    }

    /**
     * 修改员工状态
     */
    public function changeStatus()
    {
        $status = I('status');
        $where['id'] = I('id', 0);
        $result = AdminModel::getInstance()->field('status')->where($where)->save(array('status' => $status));
        if($result) $this->ajaxReturn($result);
    }

    /**
     * 修改员工登录后台密码
     */
    public function changePassword()
    {
        $id = I('id', 0);
        $password = I('password', 0, 'trim');
        if (!$password) {
            $this->ajaxReturn(0);
        }
        $data['password'] = makePasswd($password);
        $result = AdminModel::getInstance()->field('password')->where(array('id' => $id))->save($data);
        if ($result !== false) {
            $this->ajaxReturn(1);
        } else {
            $this->ajaxReturn(0);
        }
    }

    /**
     * 员工删除
     */
    public function emplDel()
    {
        $where['id'] = I('id', 0);
        $result = AdminModel::getInstance()->field('is_del')->where($where)->save(array('is_del' => 1));
        if ($result !== false) {
            $this->ajaxReturn(1);
        } else {
            $this->ajaxReturn(0);
        }
    }

    /**
     * 员工工资详情
     */
    public function emplSalary()
    {
        $this->display();
    }









    public function lists()
    {
       $a = $_SERVER['PHP_SELF'];
        var_dump($a);

        $ip = '183.232.90.65';
        $url = 'http://api.map.baidu.com/location/ip?ak=F454f8a5efe5e577997931cc01de3974&ip='.$ip;
        $result = $this->httpGet($url,null,2000);
        $result = json_decode($result,true);
        if(!$result){
            $a= false;
        }elseif($result['status']){
            $a=  false;
        }else{
            $a=  $result['content']['address_detail'];//数组
        }
        var_dump($a);


        exit;
//       echo phpinfo();
//        $this->display();
    }

    /**
     * 员工管理
     */
    public function manage()
    {
        $name[] = '生成二维码';
        $name[] = '添加水印';
        $this->assign('name', $name);
        $this->display();
    }

    /**
     * 生成二维码
     */
    public function makeQRcode()
    {
        vendor('phpqrcode.phpqrcode');
        $url = 'www.baidu.com'; //二维码内容
        $image = './Public/image/1.png';
        $errorCorrectionLevel = 'H';//纠错级别：L、M、Q、H，值越大，越容易扫描
        $matrixPointSize = 8;//二维码点的大小：1到10,值越大，生成的尺寸越大
        \QRcode::png($url, $image, $errorCorrectionLevel, $matrixPointSize, 2);
        $logo = './Public/image/logo.png'; //准备好的logo图片
        $QR = './Public/image/1.png'; //已经生成的原始二维码图
        if ($logo !== false) {
            $QR = imagecreatefromstring(file_get_contents($QR));
            $logo = imagecreatefromstring(file_get_contents($logo));
            $QR_width = imagesx($QR); //二维码图片宽度
            $QR_height = imagesy($QR); //二维码图片高度
            $logo_width = imagesx($logo); //logo图片宽度
            $logo_height = imagesy($logo); //logo图片高度
            $logo_qr_width = $QR_width / 5;
            $scale = $logo_width/$logo_qr_width;
            $logo_qr_height = $logo_height/$scale;
            $from_width = ($QR_width - $logo_qr_width) / 2;
            //重新组合图片并调整大小
            imagecopyresampled($QR, $logo, $from_width, $from_width, 0, 0, $logo_qr_width, $logo_qr_height, $logo_width, $logo_height);
        }
        //输出图片
        imagepng($QR, './Public/image/helloweixin.png');
        echo '生成二维码成功';
    }

    /**
     * 添加水印
     */
    public function addWaterMark()
    {
        $image = new Image();
        // 打开底图像
        $img = $image->open('./Public/image/default.png');
        // 添加图片水印
        $img = $img->water('./Public/image/logo.png', $image::IMAGE_WATER_SOUTH, 70);
        // 添加文字水印
        $text = '神马123456789'; //添加的文字
        $font = './Public/font/simhei.ttf'; // 字体路径
        $size = 16; // 字号
        $color = '#00ff00';  // 文字颜色
        $locate = array(100, 100); // 文字写入位置
        $offset = 0; // 文字相对当前位置的偏移量
        $angle = 15;   // 文字倾斜角度
        $img = $img->text($text, $font, $size, $color, $locate, $offset, $angle);
        // 保存图像
        $img ->save('./Public/image/water.png');
        echo '生成水印成功';
    }



    /**
     * http get请求
     *
     * @param string $url
     * @param mixed $param
     * @param int $time
     * @author yeweihua
     * @return mixed
     */
    public function httpGet ($url,$param = null,$time = 5000)
    {
        $url = empty($param) ? $url : $url .'?'. http_build_query($param);
        /*if(defined('LOGGING') && LOGGING){
            $log = date('Y-m-d H:i:s',time())."  ";
            $log .= defined('REQUESTID') ? REQUESTID."\r\n" : "\r\n";
            $log .= $url."  --httpGet-- \r\n\r\n";
            file_put_contents(APP_PATH.'/Runtime/Logs/httpget'.date('m-d').'.log',$log,FILE_APPEND);
        }*/

        $ch = curl_init();
        // set URL and other appropriate options
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);//不验证证书
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);//不验证host
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT_MS,500);//设置时间
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_USERAGENT,$_SERVER['HTTP_USER_AGENT']);
        curl_setopt($ch, CURLOPT_NOSIGNAL, 1);    //注意，毫秒超时一定要设置这个
        curl_setopt($ch, CURLOPT_TIMEOUT_MS, $time);
        //curl_setopt($ch, CURLOPT_TIMEOUT, $time);//设置时间
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);//不直接输出
        // grab URL and pass it to the browser
        $result = curl_exec($ch);
        if (curl_errno($ch)) {
            //echo 'Errno2'.curl_error($ch);//捕抓异常
            return false;
        }
        // close cURL resource, and free up system resources
        curl_close($ch);
        return $result;
    }


}