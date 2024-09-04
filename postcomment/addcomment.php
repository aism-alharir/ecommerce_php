<?php
include "../connect.php";

$comment = filterRequest("comment");
$comment_user = filterRequest("comuser");
$comment_post = filterRequest("compost");

$sql = "INSERT INTO
 `comments`( `comment`, `com_user`, `comment_post`)
        VALUES   (:comment,:commentuser,:commentpost) ";

$stmt = $con->prepare($sql);
$stmt->execute(array(
    ":comment" => $comment ,
    ":commentuser"  => $comment_user,
    ":commentpost"  => $comment_post,
));

$count = $stmt->rowCount();

if($count > 0){
    echo json_encode(array("status" => "success add"));
}

?>