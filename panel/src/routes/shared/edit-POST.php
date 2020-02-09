<?php

defined('BASEPATH') or exit('No direct script access allowed');

if (!$request_post) {
    return;
}

$sqlfields = array();
foreach ($request_post as $field => $value) {
    if ($field == 'id') continue;
    $value = mres(trim($value));
    if ($value!='') $sqlfields[] = "`$field`='$value'";
}
$sqlvalues = implode(',', $sqlfields);
$table_name = $request_route . "s";

sql_query('BEGIN;');
if (intval($request_post['id']) > 0) {
    $sqlstring = "UPDATE `$table_name` SET $sqlvalues WHERE `id`=$request_post[id];";
} else {
    $sqlstring = "INSERT INTO `$table_name` SET $sqlvalues;";
}

$result = sql_query($sqlstring);

if (intval($request_post['id']) <= 0) {
    $request_id = sql_insert_id();
}

// log
// if (WRITE_SQL_LOG) db_write_log($sqlstring);

sql_query('COMMIT;');
