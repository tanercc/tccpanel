<?php

defined('BASEPATH') or exit('No direct script access allowed');

?>

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- search form (Optional) -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                    <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                    </button>
                </span>
            </div>
        </form>
        <!-- /.search form -->

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header"><?= lang('menus') ?></li>
            <!-- Optionally, you can add icons to the links -->

            <li class="<?= is_menu_active('home') ?>"><a href="<?= set_href('home') ?>"><i class="fa fa-dashboard"></i><span><?= lang('dashboard') ?></span></a></li>

            <?php if (has_user_permission(['data'])) : ?>
                <li class="treeview <?= is_treemenu_active('data') ?>">
                    <a href="#"><i class="fa fa-file-text-o"></i> <span><?= lang('datas') ?></span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li class="<?= is_menu_active('data') ?>"><a href="<?= set_href('data') ?>"><i class="fa fa-table"></i> <?= lang('list') ?></a></li>
                        <li class="<?= is_menu_active('datatype') ?>"><a href="<?= set_href('datatype') ?>"><i class="fa fa-files-o"></i> <?= lang('datatypes') ?></a></li>
                        <li class="<?= is_menu_active('datacat') ?>"><a href="<?= set_href('datacat') ?>"><i class="fa fa-sitemap"></i> <?= lang('datacats') ?></a></li>
                        <li class="<?= is_menu_active('datatagtype') ?>"><a href="<?= set_href('datatagtype') ?>"><i class="fa fa-tags"></i> <?= lang('datatagtypes') ?></a></li>
                        <li class="<?= is_menu_active('datatag') ?>"><a href="<?= set_href('datatag') ?>"><i class="fa fa-tag"></i> <?= lang('datatags') ?></a></li>
                    </ul>
                </li>
            <?php endif ?>

            <?php if (has_user_permission(['menu'])) : ?>
                <li class="treeview <?= is_treemenu_active('menu') ?>">
                    <a href="#"><i class="fa fa-bars"></i> <span><?= lang('menus') ?></span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li class="<?= is_menu_active('menu') ?>"><a href="<?= set_href('menu') ?>"><i class="fa fa-table"></i> <?= lang('list') ?></a></li>
                        <li class="<?= is_menu_active('menutype') ?>"><a href="<?= set_href('menutype') ?>"><i class="fa fa-window-restore"></i> <?= lang('menutypes') ?></a></li>
                    </ul>
                </li>
            <?php endif ?>

            <?php if (has_user_permission(['slider'])) : ?>
                <li class="treeview <?= is_treemenu_active('slider') ?>">
                    <a href="#"><i class="fa fa-picture-o"></i> <span><?= lang('sliders') ?></span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li class="<?= is_menu_active('slider') ?>"><a href="<?= set_href('slider') ?>"><i class="fa fa-table"></i> <?= lang('list') ?></a></li>
                        <li class="<?= is_menu_active('slidertype') ?>"><a href="<?= set_href('slidertype') ?>"><i class="fa fa-window-restore"></i> <?= lang('slidertypes') ?></a></li>
                    </ul>
                </li>
            <?php endif ?>

            <?php if (has_user_permission(['product'])) : ?>
                <li class="treeview <?= is_treemenu_active('product') ?>">
                    <a href="#"><i class="fa fa-cubes"></i> <span><?= lang('products') ?></span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li class="<?= is_menu_active('product') ?>"><a href="<?= set_href('product') ?>"><i class="fa fa-table"></i> <?= lang('list') ?></a></li>
                        <li class="<?= is_menu_active('productcat') ?>"><a href="<?= set_href('productcat') ?>"><i class="fa fa-sitemap"></i> <?= lang('productcats') ?></a></li>
                        <li class="<?= is_menu_active('producttagtype') ?>"><a href="<?= set_href('producttagtype') ?>"><i class="fa fa-tags"></i> <?= lang('producttagtypes') ?></a></li>
                        <li class="<?= is_menu_active('producttag') ?>"><a href="<?= set_href('producttag') ?>"><i class="fa fa-tag"></i> <?= lang('producttags') ?></a></li>
                    </ul>
                </li>
            <?php endif ?>

            <?php if (has_user_permission(['fileman'])) : ?>
                <li class="<?= is_menu_active('fileman') ?>"><a href="<?= set_href('fileman') ?>"><i class="fa fa-folder"></i> <span><?= lang('uploads') ?></span></a></li>
            <?php endif ?>

            <?php if (has_user_permission(['lang', 'user', 'variable'])) : ?>
                <li class="treeview <?= is_treemenu_active('set') ?>">
                    <a href="#"><i class="fa fa-gears"></i> <span><?= lang('settings') ?></span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li class="<?= is_menu_active('lang') ?>"><a href="<?= set_href('lang') ?>"><i class="fa fa-commenting"></i> <span><?= lang('languages') ?></span></a></li>
                        <li class="<?= is_menu_active('user') ?>"><a href="<?= set_href('user') ?>"><i class="fa fa-users"></i> <span><?= lang('users') ?></span></a></li>
                        <li class="<?= is_menu_active('variable') ?>"><a href="<?= set_href('variable') ?>"><i class="fa fa-list-ol"></i> <span><?= lang('variables') ?></span></a></li>
                    </ul>
                </li>
            <?php endif ?>

        </ul>
        <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>