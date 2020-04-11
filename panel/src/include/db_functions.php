<?php

$sql_dbname = DBNAME;
$sql_host = DBHOST;
$sql_user = DBUSER;
$sql_password = DBPASS;

$conn = null;

function sql_connect()
{
    global $sql_dbname;
    global $sql_host;
    global $sql_user;
    global $sql_password;

    $dbconn = mysqli_connect($sql_host, $sql_user, $sql_password);

    if ($dbconn) {
        $mysql = mysqli_select_db($dbconn, $sql_dbname);
        if ($mysql) {
            mysqli_query($dbconn, "SET NAMES 'utf8'");
            mysqli_query($dbconn, "SET CHARACTER SET utf8");
            mysqli_query($dbconn, "SET COLLATION_CONNECTION = 'utf8_unicode_ci'");
        } else {
            throw new Exception("Veritabanina baglanilamadi");
        }
    } else {
        throw new Exception("Veritabani sunucusuna baglanilamadi");
    }

    return $dbconn;
}

function sql_query($sqlstring)
{
    global $conn;
    $result = mysqli_query($conn, $sqlstring);
    if (!$result) {
        throw new Exception(mysqli_error($conn));
    }
    return $result;
}

function sql_fields($db_name)
{
    global $conn;
    $sqlstring = "SELECT * FROM `$db_name` LIMIT 1";
    $result_array = array();
    $exclude_fields = array('id', 'data_id', 'lang_id', 'created_at', 'updated_at');

    if ($result = mysqli_query($conn, $sqlstring)) {
        $finfo = mysqli_fetch_fields($result);
        foreach ($finfo as $val) {
            if (!in_array($val->name, $exclude_fields)) {
                $result_array[] = $val->name;
            }
        }
        mysqli_free_result($result);
    } else {
        throw new Exception(mysqli_error($conn));
    }
    return $result_array;
}

function sql_fetch_fields($result)
{
    $exclude_fields = array('id', 'data_id', 'lang_id', 'created_at', 'updated_at');
    $result_array = array();

    $finfo = mysqli_fetch_fields($result);
    foreach ($finfo as $val) {
        if (!in_array($val->name, $exclude_fields)) {
            $result_array[] = $val->name;
        }
    }
    return $result_array;
}

function sql_insert_id()
{
    global $conn;
    return mysqli_insert_id($conn);
}

function mres($str)
{
    global $conn;
    return mysqli_real_escape_string($conn, $str);
}

function db_lang_exist($table) {
    $lang_table = rtrim($table, 's') . '_lang';
    $result = sql_query("SHOW TABLES LIKE '$lang_table'");
    return (mysqli_num_rows($result)) ? TRUE : FALSE;
}

function db_get_columns_array($table)
{
    $sqlstring = "SHOW COLUMNS FROM `$table`";
    $sqlresult = sql_query($sqlstring);
    $resultarr = array();
    while ($row = mysqli_fetch_assoc($sqlresult)) {
        $idx = $row['Field'];
        $resultarr[$idx] = $row['Default'];
    }

    $resultarr['id'] = 0;
    if (isset($resultarr['created_at'])) unset($resultarr['created_at']);
    if (isset($resultarr['updated_at'])) unset($resultarr['updated_at']);

    return $resultarr;
}

function db_get_table($table, $is_active = 1, $deleted = 0)
{
    $sqlstring = "SELECT * FROM `$table` WHERE `is_active`=$is_active AND `deleted`=$deleted ORDER BY `order` ASC;";
    $sqlresult = sql_query($sqlstring);
    $resultarr = array();
    while ($row = mysqli_fetch_assoc($sqlresult)) {
        $idx = $row['id'];
        $resultarr[$idx] = $row;
    }
    return $resultarr;
}

function db_get_table_data($table, $fields, $is_active = 1, $deleted = 0)
{
    $table = rtrim($table, 's') . 's';

    $sqlstring = "SELECT ";
    if ($fields && is_array($fields)) {
        $sqlstring .= implode(',', $fields);
    } else {
        $sqlstring .= "*";
    }
    $sqlstring .= " FROM `$table` WHERE `is_active`=$is_active AND `deleted`=$deleted ORDER BY `order` ASC;";
    $sqlresult = sql_query($sqlstring);
    $resultarr = array();
    while ($row = mysqli_fetch_assoc($sqlresult)) {
        $idx = $row['id'];
        $resultarr[$idx] = $row;
    }
    return $resultarr;
}

function db_get_table_with_lang($table, $lang_id = 1, $is_active = 1, $deleted = 0)
{
    $lang_table = rtrim($table, 's') . '_lang';
    $table = rtrim($table, 's') . 's';

    $result = sql_query("SHOW COLUMNS FROM `$lang_table` LIKE 'name'");
    $name = (mysqli_num_rows($result)) ? TRUE : FALSE;
    $result = sql_query("SHOW COLUMNS FROM `$lang_table` LIKE 'image'");
    $image = (mysqli_num_rows($result)) ? TRUE : FALSE;
    $result = sql_query("SHOW COLUMNS FROM `$lang_table` LIKE 'title'");
    $title = (mysqli_num_rows($result)) ? TRUE : FALSE;

    $sqlstring = "SELECT `$table`.*";
    $name && $sqlstring .= ", COALESCE(`tl`.`name`, `$table`.`name`) AS `name`";
    $image && $sqlstring .= ", COALESCE(`tl`.`image`, `$table`.`image`) AS `image`";
    $title && $sqlstring .= ", `tl`.`title`";
    $sqlstring .= "FROM `$table`
        LEFT JOIN `$lang_table` AS `tl` ON `tl`.`data_id`=`$table`.`id` AND `tl`.`lang_id`=$lang_id
        WHERE `$table`.`is_active`=$is_active 
        AND `$table`.`deleted`=$deleted 
        ORDER BY `$table`.`order` ASC;";
    $sqlresult = sql_query($sqlstring);
    $resultarr = array();
    while ($row = mysqli_fetch_assoc($sqlresult)) {
        $idx = $row['id'];
        $resultarr[$idx] = $row;
    }
    return $resultarr;
}

function db_get_variables($lang_id = 1, $is_active = 1, $deleted = 0)
{
    $table = 'variables';
    $lang_table = 'variable_lang';

    $sqlstring = "SELECT `$table`.`name`, `tl`.`name` AS `lang`
        FROM `$table`
        LEFT JOIN `$lang_table` AS `tl` ON `tl`.`data_id`=`$table`.`id`
        WHERE `$table`.`is_active`=$is_active AND `$table`.`deleted`=$deleted AND `tl`.`lang_id`=$lang_id";
    $sqlresult = sql_query($sqlstring);
    $resultarr = array();
    while ($row = mysqli_fetch_assoc($sqlresult)) {
        $idx = $row['name'];
        $resultarr[$idx] = $row['lang'];
    }
    return $resultarr;
}

function db_get_table_row($table, $id)
{
    $sqlstring = "SELECT * FROM `$table` WHERE `id`=$id;";
    $sqlresult = sql_query($sqlstring);
    $resultarr = mysqli_fetch_assoc($sqlresult);
    return $resultarr;
}


function db_get_current_lang_id($slug)
{
    $sqlstring = "SELECT `id` FROM `langs` WHERE `langs`.`is_active`=1 AND `langs`.`deleted`=0 AND `slug`='$slug'";
    $sqlresult = sql_query($sqlstring);
    $resultarr = mysqli_fetch_assoc($sqlresult);
    if ($resultarr) {
        return $resultarr["id"];
    } else {
        return 1;
    }
}

function db_write_log($sql)
{
    global $request_method, $request_route, $request_func, $request_ip;
    $user_id = $_SESSION['user_id'];
    $sqlstring = "INSERT INTO logs SET 
        `task` = '$request_method $request_route/$request_func',
        `comment` = '" . mres($sql) . "',
        `task_at` = NOW(),
        `ip_no` = '$request_ip',
        `user_id` = $user_id;";
    $sqlresult = sql_query($sqlstring);
    return $sqlresult;
}

function db_get_table_count($table, $is_active = 1, $deleted = 0)
{
    $sqlstring = "SELECT COUNT(*) FROM $table WHERE `is_active`=$is_active AND `deleted`=$deleted";
    $sqlresult = sql_query($sqlstring);
    if ($sqlresult) {
        return mysqli_fetch_row($sqlresult)[0];
    } else {
        return null;
    }
}
