<?php
include "../connect.php";

$orderid = filterRequest("orderid");

deleteData("orders","orders_id = $orderid AND orders_statuse = 0 ");

?>