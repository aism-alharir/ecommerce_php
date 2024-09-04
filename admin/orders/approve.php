<?php
include "../../connect.php";

$ordersid = filterRequest("ordersid");
$userid = filterRequest("userid");

$data = array(
    "orders_statuse" => 1
);

updateData("orders", $data, "orders_id = $ordersid AND orders_statuse = 0");



insertNotification("success", "the order Has been Approve", $userid, "users$userid", "none", "refreshorderpending");

?>