<?php
include "../connect.php";

$userid = filterRequest("id");

getAllData("ordersview","orders_usersid = $userid AND orders_statuse = 4");

// orders_statuse  = o   pendeing Approval
// orders_statuse  = 1   order the paper
// orders_statuse  = 2   Delivery Man
// orders_statuse  = 3   On The Way 
// orders_statuse  = 4   Archive
?>