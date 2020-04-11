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
    <link rel="stylesheet" href="<?= BASEPATH ?>/css/font-awesome.min.css" />
    <link rel="stylesheet" href="<?= BASEPATH ?>/css/jquery.bxslider.css" />
    <link rel="stylesheet" href="<?= BASEPATH ?>/css/isotope.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="<?= BASEPATH ?>/css/animate.css" />
    <link rel="stylesheet" href="<?= BASEPATH ?>/js/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="<?= BASEPATH ?>/css/prettyPhoto.css" />
    <link rel="stylesheet" href="<?= BASEPATH ?>/css/style.css" />
    <?php

    if (file_exists(dirname(__FILE__) . "/routes/$request_route/css.php")) {
        include_once(dirname(__FILE__) . "/routes/$request_route/css.php");
    }

    ?>

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
                            <h1><?=$vars["siteName"]?></h1>
                        </a>
                    </div>
                </div>

                <div class="navbar-collapse collapse">
                    <div class="menu">
                        <ul class="nav nav-tabs" role="tablist">
                        <?php
                            include("main-menu.php")
                        ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>
