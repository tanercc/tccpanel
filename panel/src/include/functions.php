<?php

#DB Settings and Functions

require_once 'db_functions.php';

function get_server_link()
{
    $parse_arr = parse_url($_SERVER['HTTP_REFERER']);
    return $parse_arr['scheme'] . '://' . $parse_arr['host'];
}

function get_client_ip()
{
    if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
        return $_SERVER['HTTP_CLIENT_IP'];
    } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        return $_SERVER['HTTP_X_FORWARDED_FOR'];
    } else {
        return $_SERVER['REMOTE_ADDR'];
    }
}

function write_exception($exception)
{
    global $conn;
    global $request_datetime, $request_ip;
    global $langs;

    if (!isset($langs['custom_exception'])) $langs['custom_exception'] = "Site Exception!";

    $referer = "No";
    if (isset($_SERVER['HTTP_REFERER'])) {
        $referer = $_SERVER['HTTP_REFERER'];
    }
    if (WRITE_ERROR || $exception->getMessage() == $langs['custom_exception']) {
        echo $exception->getMessage();
    } else {
        echo "My software never has bugs. It just develops random features.";
    }
    if ($exception->getMessage() != $langs['custom_exception']) {
        mysqli_query($conn, "ROLLBACK");
        mysqli_query($conn, "BEGIN");
        $sqlstring = "INSERT INTO errors SET 
            `ip_no` = `$request_ip`,
            `error` =  `" . mres($exception->getMessage() . " - " . $exception->getFile()) . "`,
            `session` = `" . mres(serialize($_SESSION)) . "`, 
            `referer` = `" . mres($referer)  . "`, 
            `get` = `" . mres(serialize($_GET)) . "`,
            `post` = `" . mres(serialize($_POST)) . "`,
            `page` = `" . mres(basename($_SERVER['SCRIPT_FILENAME']) . " - " . $exception->getLine()) . "`,
            `request_at` = `$request_datetime`";
        $result = mysqli_query($conn, $sqlstring);
        mysqli_query($conn, "COMMIT");
        if (!$result) {
            echo mysqli_error($conn);
        }
    }
}

function write_error($errno, $errstr, $errfile, $errline)
{
    global $conn;
    global $request_datetime, $request_ip;
    global $langs;

    $referer = "No";
    if (isset($_SERVER['HTTP_REFERER'])) {
        $referer = $_SERVER['HTTP_REFERER'];
    }

    echo "My software never has bugs. It just develops random features.";
    if (WRITE_ERROR) {
        echo $errfile . "-" . $errline . "<br />" . $errstr;
    }
    mysqli_query($conn, "ROLLBACK");
    mysqli_query($conn, "BEGIN");
    $sqlstring = "INSERT INTO errors SET 
        `ip_no` = `$request_ip`,
        `error` =  `" . mres($errstr . " - " . $errfile) . "`,
        `session` = `" . mres(serialize($_SESSION)) . "`, 
        `referer` = `" . mres($referer)  . "`, 
        `get` = `" . mres(serialize($_GET)) . "`,
        `post` = `" . mres(serialize($_POST)) . "`,
        `page` = `" . mres(basename($_SERVER['SCRIPT_FILENAME']) . " - " . $errline) . "`,
        `request_at` = `$request_datetime`";
    $result = mysqli_query($conn, $sqlstring);
    mysqli_query($conn, "COMMIT");
    if (!$result) {
        echo mysqli_error($conn);
    }

    die();
}
