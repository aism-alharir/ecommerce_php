<?php
include "../../connect.php";

$ordersid = filterRequest("ordersid");
$userid = filterRequest("userid");
$deliveryid = filterRequest("deliveryid");

$data = array(
    "orders_statuse" => 3,
    "orders_delivery" => $deliveryid
);

updateData("orders",$data,"orders_id = $ordersid AND orders_statuse = 2");

insertNotification("success", "Your order is on the way", $userid, "users$userid", "none", "refreshorderpending");

sendGCM("warning","they order has been Approved by delivery" , "services","none","none");


sendGCM("warning","they order has been Approved by delivery" . $deliveryid , "delivery","none","none");

?>