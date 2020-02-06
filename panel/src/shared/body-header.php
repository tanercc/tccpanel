<?php

defined('BASEPATH') or exit('No direct script access allowed');

?>

<!-- Main Header -->
<header class="main-header">

    <!-- Logo -->
    <a href="<?= BASEPATH ?>" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>A</b>P</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Admin</b>Panel</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- Messages: style can be found in dropdown.less-->
                <li class="dropdown">
                    <!-- Menu toggle button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        TR
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Türkçe</a></li>
                        <li><a href="#">English</a></li>
                    </ul>
                </li>
                <!-- /.messages-menu -->

                <!-- User Account Menu -->
                <li class="dropdown user user-menu">
                    <!-- Menu Toggle Button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <!-- The user image in the navbar-->
                        <img src="<?= BASEPATH ?>/img/user.png" class="user-image" alt="User Image">
                        <!-- hidden-xs hides the username on small devices so only the image appears. -->
                        <span class="hidden-xs"><?= $_SESSION['user_name'] ?></span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- The user image in the menu -->
                        <li class="user-header">
                            <img src="<?= BASEPATH ?>/img/user.png" class="img-circle" alt="User Image">

                            <p>
                                <?= $_SESSION['user_name'] ?>
                                <small><?= $_SESSION['user_type'] ?></small>
                            </p>
                        </li>
                        <!-- Menu Body -->
                        <li class="user-body">
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="#" class="btn btn-default btn-flat">Profile</a>
                            </div>
                            <div class="pull-right">
                                <a href="<?= set_href('logout') ?>" class="btn btn-default btn-flat">Sign out</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>