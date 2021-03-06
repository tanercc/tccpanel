<?php
//===================================
// load config.php
//===================================
require_once(dirname(__FILE__) . '/config.php');

//===================================
// session start
//===================================
session_start();

//===================================
// sessions variables
//===================================
if (!isset($_SESSION['language'])) {
    $_SESSION['language'] = substr(Locale::acceptFromHttp($_SERVER['HTTP_ACCEPT_LANGUAGE']),0,2);
}
if (!isset($_SESSION['is_active'])) {
    $_SESSION['is_active'] = 1;
}
if (!isset($_SESSION['deleted'])) {
    $_SESSION['deleted'] = 0;
}
$global_is_active = $_SESSION['is_active'];
$global_deleted = $_SESSION['deleted'];

//===================================
// functions
//===================================
require_once(dirname(__FILE__) . '/include/functions.php');

//===================================
// .htaccess -> get uri and parse
//===================================
$request_datetime = date('Y-m-d H:i:s');
$request_ip = get_client_ip();

if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
    $request_ajax = true;
} else {
    $request_ajax = false;
}
$request_method = $_SERVER['REQUEST_METHOD'];
$request_get = array();
$request_post = array();
$request_query = array();
$request_params = array();

$request_arr = parse_url($_SERVER['REQUEST_URI']);
if (isset($request_arr['query'])) {
    parse_str($request_arr['query'], $request_query);
}
if (isset($request_arr['path'])) {
    $uri = $request_arr['path'];
    $basepath = trim(BASEPATH, '/');
    $uri = trim($uri, '/');
    $uri = ltrim($uri, $basepath);
    $uri = ltrim($uri, '/');
    $request_params = explode('/', $uri);
}
if ($request_method == 'GET') {
    $request_get = $_GET;
}
if ($request_method == 'POST') {
    $request_post = $_POST;
}
//===================================
// global parametreler
//===================================
$request_lang = $_SESSION['language'];
$request_route = 'home';
$request_func = 'index';
$request_id = 0;
$request_slug = '';
$request_data = '';

if (isset($request_params[0]) && $request_params[0] != '') {
    $request_lang = $request_params[0];
}
if (isset($request_params[1]) && $request_params[1] != '') {
    $request_route = $request_params[1];
}
if (isset($request_params[2]) && $request_params[2] != '') {
    $request_func = $request_params[2];
}
if (isset($request_params[3]) && $request_params[3] != '') {
    if (is_numeric($request_params[3])) {
        $request_id = $request_params[3];
    } else {
        $request_slug = $request_params[3];
    }
}
if (isset($request_params[4]) && $request_params[4] != '') {
    $request_data = $request_params[4];
}


//===================================
// user session defaults
//===================================
if (!isset($_SESSION['user_id'])) {
    $_SESSION['user_id'] = null;
}
if (!isset($_SESSION['user_name'])) {
    $_SESSION['user_name'] = null;
}
if (!isset($_SESSION['user_email'])) {
    $_SESSION['user_email'] = null;
}
if (!isset($_SESSION['user_type'])) {
    $_SESSION['user_type'] = null;
}
if (!isset($_SESSION['user_login'])) {
    $_SESSION['user_login'] = false;
}

//testing
// $_SESSION['user_id'] = 1; 
// $_SESSION['user_name'] = 'Admin'; 
// $_SESSION['user_email'] = 'admin@admin.com'; 
// $_SESSION['user_type'] = 'admin'; 
// $_SESSION['user_login'] = true; 

if (!$_SESSION['user_login']) {
    $request_route = 'login';
    $request_id = 0;
    $request_slug = '';
    $request_data = '';
}

if (!file_exists(dirname(__FILE__) . "/routes/$request_route/$request_func.php")) {
    $request_route = 'error';
    $request_func = '404';
}

//===================================
// sessions variables
//===================================

if (!isset($_SESSION['is_active'])) {
    $_SESSION['is_active'] = 1;
}
if (!isset($_SESSION['deleted'])) {
    $_SESSION['deleted'] = 0;
}
$global_is_active = $_SESSION['is_active'];
$global_deleted = $_SESSION['deleted'];

# db_config.php de tanımlı
$conn = sql_connect();

//===================================
// language selection
//===================================

if (file_exists(dirname(__FILE__) . "/lang/$request_lang.php")) {
    $_SESSION['language'] = $request_lang;
    require_once(dirname(__FILE__) . "/lang/$request_lang.php");
} else {
    $request_lang = $_SESSION['language'];
    if (file_exists(dirname(__FILE__) . "/lang/$request_lang.php")) {
        require_once(dirname(__FILE__) . "/lang/$request_lang.php");
    } else {
        $langs = ['home' => 'Home'];
    }
}

//set_exception_handler('write_exception');
//set_error_handler('write_error');

//===================================
// user permissions
//===================================
require_once(dirname(__FILE__) . '/permission.php');

// Collapsed sidebar
if (!isset($_SESSION['sidebar-collapse'])) {
    $_SESSION['sidebar-collapse'] = '';
}
