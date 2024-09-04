<?php

include "../../connect.php";

$email = filterRequest("email");


$stmt = $con->prepare("SELECT * FROM delivery WHERE delivery_email = ? ");
$stmt->execute(array($email));
$count = $stmt->rowCount();

result($count);