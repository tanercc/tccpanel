<?php
//========================================
// www.test.dev/[lang]/[page]/[id|slug]/[pagination]
//========================================
require_once('src/start.php');
require_once('src/include/helpers.php');

// echo "<pre>";
// echo '<br>$request_params '; print_r($request_params);
// echo '<br>$request_ajax '; print_r($request_ajax);
// echo '<br>$request_route ';print_r($request_route);
// echo '<br>$request_func ';print_r($request_func);
// echo '<br>$request_id ';print_r($request_id);
// echo '<br>$request_data ';print_r($request_data);
// echo '<br>$request_method ';print_r($request_method);
// echo '<br>$request_post ';print_r($request_post);
// die("</pre>");

if ($request_ajax) {
    header('Content-Type: application/json');
    include_once("src/routes/$request_route/$request_func.php");
    exit;
}

// <head>
include_once('src/shared/document-head.php');

if (in_array($request_route, ['login'])) {
    // if method exist
    include_once("src/routes/$request_route/$request_func.php");
} else { 
    // <body>
    include_once("src/shared/body-header.php");
    // <menu>
    include_once("src/shared/body-sidebar.php");
    // <page-head>
    include_once("src/shared/page-head.php");
   
    // POST veya GET metodu icin ozel php varsa yukle
    file_exists("src/routes/$request_route/$request_func-$request_method.php") AND include("src/routes/$request_route/$request_func-$request_method.php");
    file_exists("src/routes/shared/$request_func-$request_method.php") AND include("src/routes/shared/$request_func-$request_method.php");
   
    // <page>
    include_once("src/routes/$request_route/$request_func.php");
    // <page-end>
    include_once("src/shared/page-end.php");
    // <footer>
    include_once("src/shared/body-footer.php");
}
// <script> <body-end>
include_once('src/shared/document-end.php');

exit;