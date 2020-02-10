<?php
//========================================
// www.test.dev/[lang]/[page]/[id|slug]/[pagination]
//========================================
require_once(dirname(__FILE__) . '/src/start.php');

// echo "<pre>";
// echo '<br>$request_params ';
// print_r($request_params);
// echo '<br>$request_ajax ';
// print_r($request_ajax);
// echo '<br>$request_lang ';
// print_r($request_lang);
// echo '<br>$request_route ';
// print_r($request_route);
// echo '<br>$request_func ';
// print_r($request_func);
// echo '<br>$request_id ';
// print_r($request_id);
// echo '<br>$request_data ';
// print_r($request_data);
// echo '<br>$request_method ';
// print_r($request_method);
// echo '<br>$request_post ';
// print_r($request_post);
// die("</pre>");

if ($request_ajax) {
    header('Content-Type: application/json');
    include_once(dirname(__FILE__) . "/src/routes/$request_route/$request_func.php");
    exit;
}

// Page data
include_once(dirname(__FILE__) . '/src/page-data.php');

// <head>
include_once(dirname(__FILE__) . '/src/page-top.php');

// POST veya GET metodu icin ozel php varsa yukle
file_exists(dirname(__FILE__) . "/src/routes/$request_route/$request_func-$request_method.php") and include(dirname(__FILE__) . "/src/routes/$request_route/$request_func-$request_method.php");
// <page>
include_once(dirname(__FILE__) . "/src/routes/$request_route/$request_func.php");

// <page-end>
include_once(dirname(__FILE__) . "/src/page-end.php");

exit;
