<?php

defined('BASEPATH') or exit('No direct script access allowed');

$lang_name = "";
if ($request_page) {
    $lang_name = $request_page . "_lang";
} else {
    echo json_encode(['result' => false]);
    return;
}

if (!$request_post && !isset($lang_name)) {
    echo json_encode(['result' => false]);
    return;
}

$sqlfields = array();
foreach ($request_post as $field => $value) {
    if($field == 'id') continue;
    $value = mres(trim($value));
    if ($value!='') $sqlfields[] = "`$field`='$value'";
}
$sqlvalues = implode(',', $sqlfields);

sql_query('BEGIN;');

$sqlstring = "INSERT INTO `$lang_name` SET $sqlvalues ON DUPLICATE KEY UPDATE $sqlvalues;";

$result = sql_query($sqlstring);
// log
//db_write_log($sqlstring);
sql_query('COMMIT;');

if ($result) {
    echo json_encode(['result' => true]);
} else {
    echo json_encode(['result' => false]);
}