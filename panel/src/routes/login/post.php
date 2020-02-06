<?php

defined('BASEPATH') or exit('No direct script access allowed');

if (!is_array($request_post)) {
    echo json_encode(['success' => false, 'message' => 'Error']);
    exit;
}

$table_name = "users";
$username = mres(post_value('email'));
$password = mres(post_value('password'));

$sqlstring = "SELECT `users`.*, `usertypes`.`slug` AS `type_slug` 
    FROM `users` 
    LEFT JOIN `usertypes` ON `usertypes`.`id`=`users`.`type_id`
    WHERE `users`.`is_active`=1 
    AND `users`.`deleted`=0
    AND `users`.`email`='$username'
    AND `users`.`password`='$password'";
$sqlresult = sql_query($sqlstring);

$rowdata = mysqli_fetch_assoc($sqlresult);
if ($rowdata) {
    $_SESSION['user_id'] = $rowdata['id']; 
    $_SESSION['user_name'] = $rowdata['name']; 
    $_SESSION['user_email'] = $rowdata['email']; 
    $_SESSION['user_type'] = $rowdata['type_slug']; 
    $_SESSION['user_login'] = true; 
    $jsonarray = ['success' => true, 'result' => $rowdata['name']];
} else {
    $jsonarray = ['success' => false, 'message' => 'Username or password error!'];
}

echo json_encode($jsonarray);
exit;
