<?php
include "../../connect.php";
$id = filterRequest("id");
$name = filterRequest("name");
$namear = filterRequest("namear");
$imageold = filterRequest("imageold");
$res = imageUpload("../../upload/categories","file");

$table = "categories";


if ($res == "empty") {
    $data = array(
        "categories_name" => $name,
        "categories_name_ar" => $namear, 
       
    );

} else {
    deleteFile("../../upload/categories",$imageold);
    $data = array(
        "categories_name" => $name,
        "categories_name_ar" => $namear, 
        "categories_image" => $res
    );
}


updateData($table,$data,"categories_id = $id");


?>