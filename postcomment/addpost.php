<?php
include "../connect.php";

$post = filterRequest("post");
$postuser = filterRequest("postuser");

$sql = "INSERT INTO `post`(`post`,`post_user`)
        VALUES   (:post,:postuser) ";

$stmt = $con->prepare($sql);
$stmt->execute(array(
    ":post" => $post ,
    ":postuser"  => $postuser
));

$count = $stmt->rowCount();

if($count > 0){
    echo json_encode(array("status" => "success add"));
}

?>