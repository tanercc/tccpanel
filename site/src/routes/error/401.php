<?php

defined('BASEPATH') OR exit('No direct script access allowed');

?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        401 Error Page
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Error</a></li>
        <li class="active">401 error</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="error-page">
        <h2 class="headline text-yellow"> 401</h2>

        <div class="error-content">
          <h3><i class="fa fa-warning text-yellow"></i> Oops! Unauthorized.</h3>

          <p>
            You are Unauthorized for this section.
            Meanwhile, you may <a href="<?=BASEPATH?>">return to dashboard</a>.
          </p>

        </div>
        <!-- /.error-content -->
      </div>
      <!-- /.error-page -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
