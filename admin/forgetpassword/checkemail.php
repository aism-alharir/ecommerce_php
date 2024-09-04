<?php

include "../../connect.php";

$email = filterRequest("email");


$stmt = $con->prepare("SELECT * FROM `admin` WHERE admin_email = ? ");
$stmt->execute(array($email));
$count = $stmt->rowCount();

result($count);