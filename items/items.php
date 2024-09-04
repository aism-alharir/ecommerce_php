<?php
include "../connect.php";
$categoriesid = filterRequest("id");
//getAllData("itemsview","categories_id = $categoriesid")

$userid = filterRequest("userid");
$stmt = $con->prepare("SELECT itemsview.* , 1 as favorite, (items_price - (items_price * items_discount / 100))  as itemspriceediscount FROM itemsview
INNER JOIN favorite ON favorite.favorite_itemsid = itemsview.items_id AND favorite.favorite_usersid = $userid
WHERE categories_id = $categoriesid
UNION ALL
SELECT itemsview.* , 0 as favorite , (items_price - (items_price * items_discount / 100))  as itemspriceediscount FROM itemsview
WHERE categories_id = $categoriesid AND itemsview.items_id NOT IN (SELECT itemsview.items_id FROM itemsview
INNER JOIN favorite ON favorite.favorite_itemsid = itemsview.items_id AND favorite.favorite_usersid = $userid)");

$stmt->execute();
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
$count = $stmt->rowCount();

if($count > 0 ) {
    echo json_encode(array("status" => "success", "data" => $data));
}else {
    echo json_encode(array("status" => "failure"));
}
?>