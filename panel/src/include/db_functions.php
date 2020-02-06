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

function db_get_table_data($table, $fields)
{
    global $global_is_active;
    global $global_deleted;

    $sqlstring = "SELECT ";
    if ($fields && is_array($fields)) {
        $sqlstring .= implode(',', $fields);
    } else {
        $sqlstring .= "*";
    }
    $sqlstring .= " FROM `$table` WHERE `is_active`=$global_is_active AND `deleted`=$global_deleted ORDER BY `order` ASC;";
    $sqlresult = sql_query($sqlstring);
    $resultarr = array();
    while ($row = mysqli_fetch_assoc($sqlresult)) {
        $idx = $row['id'];
        $resultarr[$idx] = $row;
    }
    return $resultarr;
}

function db_get_table_with_lang($table, $lang = 'tr', $is_active = 1, $deleted = 0)
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

function db_get_table_row($table, $id)
{
    $sqlstring = "SELECT * FROM `$table` WHERE `id`=$id;";
    $sqlresult = sql_query($sqlstring);
    $resultarr = mysqli_fetch_assoc($sqlresult);
    return $resultarr;
}

function db_write_log($sql)
{
    global $request_method, $request_page, $request_func, $request_ip;
    $user_id = $_SESSION['user_id'];
    $sqlstring = "INSERT INTO logs SET 
        `task` = '$request_method $request_page/$request_func',
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
