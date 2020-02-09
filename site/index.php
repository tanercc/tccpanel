<?php
//========================================
// www.test.dev/[lang]/[page]/[id|slug]/[pagination]
//========================================
require_once('src/start.php');
require_once('src/include/helpers.php');

if ($request_ajax) {
    header('Content-Type: application/json');
    include_once("src/routes/$request_route/$request_func.php");
    exit;
}

// Load Data
include_once('src/load-data.php') 

// <head>
include_once('src/shared/document-head.php');

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

// <script> <body-end>
include_once('src/shared/document-end.php');

exit;