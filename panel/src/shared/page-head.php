<?php

defined('BASEPATH') OR exit('No direct script access allowed');

?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <?=lang($request_route)?>
    </h1>
    <ol class="breadcrumb">
      <li><a href="<?=BASEPATH."/$request_lang"?>"><i class="fa fa-dashboard"></i><?=lang('dashboard')?></a></li>
      <li><a href="<?=set_href($request_route)?>"><?=lang($request_route)?></a></li>
      <li class="active"><?=lang($request_func)?></li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content container-fluid">