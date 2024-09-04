<?php
include "connect.php";
$allData = array();
$allData['status'] = "success";
$setting = getDataarray("settings","1 = 1",null,false);
$allData['settings'] = $setting;
$categories = getAllData("categories",null,null,false);
$allData['categories'] = $categories;
$items = getAllData("itemstopselling","1 = 1 ORDER By countitems DESC",null,false);
$allData['items'] = $items;
echo json_encode($allData);

?>