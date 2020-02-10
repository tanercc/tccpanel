<?php

defined('BASEPATH') or exit('No direct script access allowed');

?>

<!DOCTYPE html>
<html lang="<?= $request_lang ?>">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Multi-purpose theme</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="<?= BASEPATH ?>/css/bootstrap.min.css" />
    <link rel="stylesheet" href="<?= BASEPATH ?>css/font-awesome.min.css" />
    <link rel="stylesheet" href="<?= BASEPATH ?>css/jquery.bxslider.css" />
    <link rel="stylesheet" href="<?= BASEPATH ?>css/isotope.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="<?= BASEPATH ?>css/animate.css" />
    <link rel="stylesheet" href="<?= BASEPATH ?>js/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="<?= BASEPATH ?>css/prettyPhoto.css" />
    <link rel="stylesheet" href="<?= BASEPATH ?>css/style.css" />
    <?php

    if (file_exists(dirname(__FILE__) . "/routes/$request_route/css.php")) {
        include_once(dirname(__FILE__) . "/routes/$request_route/css.php");
    }

    ?>
    <!-- =======================================================
    Theme Name: Multi
    Theme URL: https://bootstrapmade.com/multi-responsive-bootstrap-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<body>

<header>
    <nav class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="navbar-brand">
                        <a href="index.html">
                            <h1><span>M</span>ulti</h1>
                        </a>
                    </div>
                </div>

                <div class="navbar-collapse collapse">
                    <div class="menu">
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation"><a href="index.html" class="active">Home</a></li>
                            <li role="presentation"><a href="services.html">Services</a></li>
                            <li role="presentation"><a href="blog.html">Blog</a></li>
                            <li role="presentation"><a href="portfolio.html">Portfolio</a></li>
                            <li role="presentation"><a href="contact.html">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <?= lang($request_route) ?>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i><?= lang('dashboard') ?></a></li>
                <li><a href="#"><?= lang($request_route . 's') ?></a></li>
                <li class="active"><?= lang($request_func) ?></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content container-fluid">