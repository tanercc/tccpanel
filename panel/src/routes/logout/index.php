<?php

defined('BASEPATH') OR exit('No direct script access allowed');

$_SESSION['user_id'] = 0; 
$_SESSION['user_name'] = ''; 
$_SESSION['user_email'] = ''; 
$_SESSION['user_type'] = ''; 
$_SESSION['user_login'] = false; 

?>

<script>
    window.location.replace("<?= set_href('login') ?>");
</script>
