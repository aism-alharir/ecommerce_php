<?php
include "../../connect.php";

$ordersid = filterRequest("ordersid");
$userid = filterRequest("userid");
$ordertype = filterRequest("ordertype");

if($ordertype == "0"){
    $data = array(
        "orders_statuse" => 2
    );
} else {
    $data = array(
        "orders_statuse" => 4
    );
}



updateData("orders",$data,"orders_id = $ordersid AND orders_statuse = 1");

insertNotification("success", "the order Has been Approve", $userid, "users$userid", "none", "refreshorderpending");

if($ordertype == "0"){
    sendGCM("warning","there is a orders awaiting approvel" , "delivery","none","none");
}
?>