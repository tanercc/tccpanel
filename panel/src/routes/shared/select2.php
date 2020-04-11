<?php

defined('BASEPATH') OR exit('No direct script access allowed');

if (!is_array($request_post)) {
    echo json_encode(['success' => false, 'message' => 'Error']);
    exit;    
}

$table_name = $request_route . "s";
$search = post_value('search');
$page = post_value('page');
$id = post_value('id');
$disabled_id = post_value('disabled');

$sqlstring = "SELECT * FROM `$table_name` 
    WHERE `is_active`=$global_is_active 
    AND `deleted`=$global_deleted ";
if ($search){
    $sqlstring .= " HAVING `name` LIKE '%$search%' ";
}
$sqlstring .= " ORDER BY `order`, `name` LIMIT " . ($page * 10) . ", 10";
$sqlresult = sql_query($sqlstring);
$tabledatas = array();
$tabledatas[] = [ "id" => "", "text" => lang('yok') ];
while ($row = mysqli_fetch_assoc($sqlresult)) {
    $selectdata = [ "id" => $row['id'], "text" => $row['name'] ];
    if($disabled_id==$row['id']) $selectdata['disabled'] = true;  
    $tabledatas[] = $selectdata;
}

$sqlstring = "SELECT FOUND_ROWS() AS `count` ";
$sqlresult = sql_query($sqlstring);
$tabledata = mysqli_fetch_assoc($sqlresult);

$count = $tabledata['count'];

$jsonarray = ['total' => $count, 'results' => $tabledatas];
echo json_encode($jsonarray);
exit;
