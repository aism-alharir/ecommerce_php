<?php
include "../../connect.php";

$deliveryid = filterRequest("id");

getAllData("ordersview","1 = 1 AND orders_statuse = 4 AND orders_delivery = $deliveryid ");

// orders_statuse  = o   pendeing Approval
// orders_statuse  = 1   order the paper
// orders_statuse  = 2   Delivery Man
// orders_statuse  = 3   On The Way 
// orders_statuse  = 4   Archive
?>