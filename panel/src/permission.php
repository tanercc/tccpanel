<?php

defined('BASEPATH') or exit('No direct script access allowed');

if (!isset($_SESSION)) {
    session_start();
}

// var_dump($_SESSION['user_id']);
// var_dump($_SESSION['user_name']);
// var_dump($_SESSION['user_email']);
// var_dump($_SESSION['user_type']);
// var_dump($_SESSION['user_login']);

$usertypes = db_get_table('usertypes');

$permissions = [
    'grant' => [
        'login',
        'logout',
        'upload',
        'files',
    ],
    'admin' => [
        'home',
        'page',
        'menu',
        'slider',
        'product',
        'fileman',
        'lang',
        'user',
        'variable',
    ],
    'user' => [
        'home',
        'page',
        'menu',
        'slider',
        'product',
        'fileman',
    ],
];

$granted = false;

function has_user_permission($page_array)
{
    global $permissions;
    $result = false;
    foreach ($page_array as $page) {
        if (in_array($page, $permissions[$_SESSION["user_type"]])) {
            $result = true;
        }
    }
    return $result;
}

if (isset($permissions['grant'])) {
    foreach ($permissions["grant"] as $page) {
        if (strpos($request_page, $page) === 0) {
            $granted = true;
        }
    }
}

if (!$granted) {
    if (isset($permissions[$_SESSION["user_type"]])) {
        foreach ($permissions[$_SESSION["user_type"]] as $page) {
            if (strpos($request_page, $page) === 0) {
                $granted = true;
            }
        }
    } else {
        $request_page = 'error';
        $request_func = '401'; //Unauthorized!
        return;
    }
}

if (!$granted) {
    $request_page = 'error';
    $request_func = '403'; //Forbidden!
}
