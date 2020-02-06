<?php

defined('BASEPATH') or exit('No direct script access allowed');

if (is_array($request_post) && isset($request_post['id']) && (intval($request_post['id']) > 0)) {
    $delete_id = $request_post['id'];
} else {
    echo json_encode(['success' => false, 'message' => 'Error']);
    exit;
}

$table_name = $request_page . "s";

sql_query('BEGIN;');

$sqlstring = "UPDATE `$table_name` SET `deleted`=1 WHERE `id`=$delete_id;";

$result = sql_query($sqlstring);

// log
// if (WRITE_SQL_LOG) db_write_log($sqlstring);

sql_query('COMMIT;');

echo json_encode(['success' => true, 'message' => 'Deleted']);
exit;
