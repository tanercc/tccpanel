<?php

defined('BASEPATH') OR exit('No direct script access allowed');

$datacount = db_get_table_count('datas');
$menucount = db_get_table_count('menus');
$productcount = db_get_table_count('products');
$categorycount = db_get_table_count('productcats');

?>

<div class="row">
    <div class="col-md-3 col-md-offset-3">
        <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-bookmark-o"></i></span>

            <div class="info-box-content">
                <span class="info-box-text"><?=lang('menus')?></span>
                <span class="info-box-number"><?=$menucount?></span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div>
    <div class="col-md-3">
        <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-files-o"></i></span>

            <div class="info-box-content">
                <span class="info-box-text"><?=lang('data')?></span>
                <span class="info-box-number"><?=$datacount?></span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div>
</div>

<div class="row">
    <div class="col-md-3 col-md-offset-3">
        <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-sitemap"></i></span>

            <div class="info-box-content">
                <span class="info-box-text"><?=lang('categories')?></span>
                <span class="info-box-number"><?=$categorycount?></span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div>
    <div class="col-md-3">
        <div class="info-box">
            <span class="info-box-icon bg-blue"><i class="fa fa-cubes"></i></span>

            <div class="info-box-content">
                <span class="info-box-text"><?=lang('products')?></span>
                <span class="info-box-number"><?=$productcount?></span>
            </div>
            <!-- /.info-box-content -->
        </div>
        <!-- /.info-box -->
    </div>
</div>
