<?php
include "../../connect.php";
$msgError = array();

$name = filterRequest("name");
$namear = filterRequest("namear");
$imagename = imageUpload("../../upload/categories","file");

$table = "categories";

$data = array(
    "categories_name" => $name,
    "categories_name_ar" => $namear, 
    "categories_image" => $imagename
);

insertData($table,$data);


?>