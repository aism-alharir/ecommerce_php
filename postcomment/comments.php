<?php
include "../connect.php";

$postid = filterRequest("postid");

$sql = "SELECT comments.* , users.* FROM `comments` 
INNER JOIN `users` ON 
comments.com_user  = users.users_id
WHERE comments.comment_post = ?
";
$stmt = $con->prepare($sql);
$stmt->execute(array($postid));
$mobiles = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($mobiles);
?>