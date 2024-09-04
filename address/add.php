<?php
include "../connect.php";

$usersid = filterRequest("usersid");
$name = filterRequest("name");
$city = filterRequest("city");
$street = filterRequest("street");
$lat = filterRequest("lat");
$long = filterRequest("long");

$data = array(
    "address_usersid" => $usersid,
    "address_name" =>  $name,
    "address_city" => $city,
    "address_street" => $street,
    "address_lat" => $lat,
    "address_long" => $long,
);

// Insert the data into the "address" table
$result = insertData("address", $data);

?>