<?php

// date_default_timezone_set("Asia/Damascus");

define('MB', 1048576);

function filterRequest($requestname)
{
    return htmlspecialchars(strip_tags($_POST["$requestname"]));
}



function getAllData($table, $where = null, $values = null, $json = true)
{
    global $con;
    $data = array();
    if ($where == null) {
        $stmt = $con->prepare("SELECT * FROM  $table");
    } else {
        $stmt = $con->prepare("SELECT * FROM  $table WHERE $where");
    }
    $stmt->execute($values);
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            echo json_encode(array("status" => "failure"));
        }
        return $count;
    } else {
        if ($count > 0) {
            return array("status" => "success", "data" => $data);
        } else {
            return array("status" => "failure");
        }
    }
}

function getData($table, $where = null, $values = null, $json = true)
{
    global $con;
    $data = array();
    $stmt = $con->prepare("SELECT * FROM  $table WHERE $where");
    $stmt->execute($values);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    } else {
        return $count;
    }
}


function getDataArray($table, $where = null, $values = null, $json = true)
{
    global $con;
    $data = array();
    $stmt = $con->prepare("SELECT * FROM  $table WHERE $where");
    $stmt->execute($values);
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    } else {
        if ($count > 0) {
            return array("status" => "success", "data" => $data);
        } else {
            return array("status" => "failure");
        }
    }
}



function insertData($table, $data, $json = true)
{
    global $con;
    foreach ($data as $field => $v)
        $ins[] = ':' . $field;
    $ins = implode(',', $ins);
    $fields = implode(',', array_keys($data));
    $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

    $stmt = $con->prepare($sql);
    foreach ($data as $f => $v) {
        $stmt->bindValue(':' . $f, $v);
    }
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}

function updateData($table, $data, $where, $json = true)
{
    global $con;
    $cols = array();
    $vals = array();

    foreach ($data as $key => $val) {
        $vals[] = "$val";
        $cols[] = "`$key` = ? ";
    }
    $sql = "UPDATE $table SET" . implode(',', $cols) . " WHERE $where";

    $stmt = $con->prepare($sql);
    $stmt->execute($vals);
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}

function deleteData($table, $where, $json = true)
{
    global $con;
    $stmt = $con->prepare("DELETE FROM $table WHERE $where");
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}

//insert and update images to DB
function imageUpload($dir , $imageRequest)
{
    global $msgErrorr;
    if (isset($_FILES[$imageRequest])){
    $imagename = rand(1000, 10000) . $_FILES[$imageRequest]['name'];
    $imagetmp = $_FILES[$imageRequest]['tmp_name'];
    $imagesize = $_FILES[$imageRequest]['size'];
    $allowExt = array("jpg", "png", "gif", "mp3", "pdf","svg");
    $stringToArray = explode(".", $imagename);
    $ext = end($stringToArray);
    $ext = strtolower($ext);
    if (!empty($imagename) && !in_array($ext, $allowExt)) {
        $msgErrorr = "Ext";
    }
    if ($imagesize > 2 * MB) {
        $msgErrorr = "size";
    }
    if (empty($msgErrorr)) {
        move_uploaded_file($imagetmp, $dir . "/" . $imagename);
        return $imagename;
    } else {
        return "fail";
    }
    } else {
        return "empty";
    }
    
} 

// function imageUpload($dir , $imageRequest)
// {
//     global $msgErrorr;
//     if (isset($_FILES[$imageRequest])){
//     $imagename = rand(1000, 10000) . $_FILES[$imageRequest]['name'];
//     $imagetmp = $_FILES[$imageRequest]['tmp_name'];
//     $imagesize = $_FILES[$imageRequest]['size'];
//     $allowExt = array("jpg", "png", "gif", "mp3", "pdf","svg");
//     $stringToArray = explode(".", $imagename);
//     $ext = end($stringToArray);
//     $ext = strtolower($ext);
//     if (!empty($imagename) && !in_array($ext, $allowExt)) {
//         $msgErrorr[] = "Ext";
//     }
//     if ($imagesize > 2 * MB) {
//         $msgErrorr[] = "size";
//     }
//     if (empty($msgErrorr)) {
//         move_uploaded_file($imagetmp, $dir . "/" . $imagename);
//         return $imagename;
//     } else {
//         return "fail";
//     }
//     } else {
//         return "empty";
//     }
    
// }


function deleteFile($dir, $imagename)
{
    if (file_exists($dir . "/" . $imagename)) {
        unlink($dir . "/" . $imagename);
    }
}

function checkAuthenticate()
{
    if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {

        if ($_SERVER['PHP_AUTH_USER'] != "aism" ||  $_SERVER['PHP_AUTH_PW'] != "aism2001") {
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Page Not Found';
            exit;
        }
    } else {
        exit;
    }
}

function printFailure($message = "none")
{
    echo json_encode(array(
        "status" => "failure",
        "message" => $message,
    ));
}

function printSuccess()
{
    echo json_encode(array(
        "status" => "success",
    ));
}

function result($count)
{
    if ($count > 0) {
        printSuccess();
    } else {
        printFailure();
    }
}

function sendEmail($to, $title, $body){
    $header = "From: support@waelabohamza.com " . "\n" . "CC: waelagle1243@gmail.com";
    mail($to, $title, $body, $header);
}


//component function to send notification or message

function sendGCM($title, $message, $topic, $pageid, $pagename)
{

     
    $url = 'https://fcm.googleapis.com/v1/projects/ecommerce-362eb/messages:send';

    $fields = array(
        "to" => '/topics/' . $topic,
        'priority' => 'high',
        'content_available' => true,

        'notification' => array(
            "body" =>  $message,
            "title" =>  $title,
            "click_action" => "FLUTTER_NOTIFICATION_CLICK",
            "sound" => "default"

        ),
        'data' => array(
            "pageid" => $pageid,
            "pagename" => $pagename
        )

    );


    $fields = json_encode($fields);
    $headers = array(
        'Authorization: key=' . "Bearer ya29.c.c0ASRK0Gbfsf_ok9lRJvZFbUFDlG15xuleYaxPLIJxKSOyAFB8xOV8YHiwWo1a4wk3fj6K-ElPcb_iyShlhH4KKYGJ-1rCzqCFsG6PL3hlnyeIatcwy75rJM_PvZZZXU8oxUE3Mq1Y9Ew537Xvou0XnIyIOSpTJjIKtol4JFOlLUmwYjXjsS_JguJ4dR-5wNFABB6qD714xlBXekxnjo4yopn9oSxNBmiCdEbrUmWFx1yig3MwA4GC-FtW9JK2hzoVZAdXMQp32wee6s_VuQMvimZfPnDQXrb_peSK1-CuDK3dIW8E0cFVMhQAT72FoFfokp4HL3Pxn8nYyIvlZ25gh2ckUWU0zf882DAvuB2xuTJUda7iemR7LmXvs_MVaAL391Dlb9lkwJ2aSXleOuicZgp_k-ewqXzos0zxlkotvVbFlpnphlIaO8Znozlrbnvig3m5JwsInVV0Uvw17rM8OVj3o_rv3WjQMclbB2xd1_2d0hscagBuplQpROgxW4B_iMfsVuahSQIUq0t3X4mW1ny2zF49WvgiS1kw1kZ5hZj-dnMo3dQesYuJJh3I3MfmOaBm19f_z2nR-Jmnd_ZtQ1cbR4Xyrh6bj9RO5-xeeWpbIhi6h6UU9nsQo2vhiw65VoRxiirbR20a3pwo6ISmI-xkcMqSrVSsSm8ycS_QxfzBw3V7ve3r41kxe3MOom_oz79j400JUpVVtr48vneh17eRtsvZYvJ_1mv9n9SrVohR896_j35t0yeueXfBVk5xkhFz44QlwrIazQSr4MVSvR84ygeZaeQoBBR12ybmkZoJ03Z-cxQB0QWte9_pr1BZtfyB6-Q5UgqwcOWImMWz0k3o9kzZSniq1aVFeZ8QB_OJd86n2hdprmRj8rfkl7QlzuqpjgWiXSF9Zzg9Zv9t4Sw9qXyQSjSpakf4Fzqc0i8jXWUxWs6fubaZJujm4wg9hj3djZJqMQ8ObmncRh4R6gfjB8Odr4602UQ3wjlw",
        'Content-Type: application/json'
    );

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

    $result = curl_exec($ch);
    return $result;
    curl_close($ch);
}

// function insert notification or message to DataBase
function insertNotification($title,$body,$userid,$topic,$pageid,$pagename)
{
    global $con;
    $stmt = $con->prepare("INSERT INTO `notification`(`notification_title`, `notification_body`, `notification_userid`) VALUES (? , ? , ?)");
    $stmt->execute(array($title,$body,$userid));
    sendGCM($title,$body,$topic,$pageid,$pagename);
    $count = $stmt->rowCount();
    return $count;
}

?>