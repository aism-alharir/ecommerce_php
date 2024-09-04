<?php
include "../connect.php";

$copunName = filterRequest("couponname");
$now = date("Y-m-d H:i:s");

getData("coupon","coupon_name = '$copunName' AND coupon_expiredata > '$now' AND coupon_count > 0   ");

?>