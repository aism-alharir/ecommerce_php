<?php
include "../../connect.php";

$deliveryid = filterRequest("id");

getAllData("ordersview"," 1 = 1  AND  orders_statuse = 3 AND orders_delivery = $deliveryid ");



?>