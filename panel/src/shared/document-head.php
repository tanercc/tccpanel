<?php

defined('BASEPATH') or exit('No direct script access allowed');

?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Log in</title>
    <link rel="icon" href="<?= BASEPATH ?>/img/favicon.ico">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/node_modules/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/node_modules/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/node_modules/ionicons/dist/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="/node_modules/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <!-- JsTree -->
    <link rel="stylesheet" href="/node_modules/jstree/dist/themes/default/style.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="/node_modules/select2/dist/css/select2.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="/node_modules/icheck/skins/square/blue.css">
    <!-- Summernote -->
    <link rel="stylesheet" href="/node_modules/summernote/dist/summernote.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?= BASEPATH ?>/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
    page. However, you can choose any other skin. Make sure you
    sapply the skin class to the body tag so the changes take effect. -->
    <link rel="stylesheet" href="<?= BASEPATH ?>/dist/css/skins/skin-blue.min.css">
    <!-- Custom style -->
    <link rel="stylesheet" href="<?= BASEPATH ?>/css/style.css">
    <?php

    if (file_exists("src/routes/$request_page/css.php")) {
        include_once("src/routes/$request_page/css.php");
    }

    ?>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="<?= BASEPATH ?>/fonts/fonts.css">

    <!-- jQuery 3 -->
    <script src="/node_modules/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="/node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->

<body class="hold-transition skin-blue sidebar-mini page-<?= $request_page ?> <?= $_SESSION['sidebar-collapse'] ?>">
    <div class="wrapper" style="height: auto; min-height: 100%;">