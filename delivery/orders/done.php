<?php
include "../../connect.php";

$ordersid = filterRequest("ordersid");
$userid = filterRequest("userid");

$data = array(
    "orders_statuse" => 4
);

updateData("orders",$data,"orders_id = $ordersid AND orders_statuse = 3");

insertNotification("success", "Your order Has been  delivery", $userid, "users$userid", "none", "refreshorderpending");

sendGCM("warning","they order has been deliverd  to  customer" , "services","none","none");

?>