<?php
//=======================================================
// Tum scriptler calismadan once BASEPATH kontrolu yapar 
//=======================================================
define('BASEPATH', '/site');
//=======================================================
// Genel ayarlar
//=======================================================
error_reporting(E_ALL);
ini_set('display_errors', '1');
mb_internal_encoding('UTF-8');
set_time_limit(500);
ini_set('session.gc_maxlifetime', 60 * 60 * 60);
date_default_timezone_set('Europe/Istanbul');

define('USER_LOGIN', false);
define('WRITE_ERROR', false);
define('WRITE_ERROR_LOG', false);
define('WRITE_SQL_LOG', false);

//=======================================================
// Mysql
//=======================================================
define('DBNAME', 'sablon-fs');
define('DBHOST', 'localhost');
define('DBUSER', 'root');
define('DBPASS', 'toor');

$server_name = $_SERVER['SERVER_NAME'];

$client_ip = '127.0.0.1';

$recaptcha_key = "6Ldh8DQUAAAAABy-U1F-Nlf_ZX3o6UdBMhlIl789";
$recaptcha_secret = "6Ldh8DQUAAAAAOqfXg9TjH8dyhV7-D_rPcM8x_RN";