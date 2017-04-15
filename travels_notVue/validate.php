<?php
$a = session_start();

/*++++++++++++++++++++++IP访问限制++++++++++++++++++++++*/
/*require './Application/Home/Controller/CheckIPController.class.php';
$check = new CheckIPController();
if (!$check->check_ip()) {
    header("Http/1.1 404 Not Found");
    echo '404 Not Found';
    exit;
}*/
/*++++++++++++++++++++++IP访问限制++++++++++++++++++++++*/

require './ThinkPHP/Library/Extra/Validate.class.php';

$_vc = new Validate();
$_vc->doimg();
$_SESSION['validateCode'] = $_vc->getCode();

