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
        'data',
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
        'data',
        'menu',
        'slider',
        'product',
        'fileman',
    ],
];

$granted = false;

function has_user_permission($route_array)
{
    global $permissions;
    $result = false;
    foreach ($route_array as $route) {
        if (in_array($route, $permissions[$_SESSION["user_type"]])) {
            $result = true;
        }
    }
    return $result;
}

if (isset($permissions['grant'])) {
    foreach ($permissions["grant"] as $route) {
        if (strpos($request_route, $route) === 0) {
            $granted = true;
        }
    }
}

if (!$granted) {
    if (isset($permissions[$_SESSION["user_type"]])) {
        foreach ($permissions[$_SESSION["user_type"]] as $route) {
            if (strpos($request_route, $route) === 0) {
                $granted = true;
            }
        }
    } else {
        $request_route = 'error';
        $request_func = '401'; //Unauthorized!
        return;
    }
}

if (!$granted) {
    $request_route = 'error';
    $request_func = '403'; //Forbidden!
}
