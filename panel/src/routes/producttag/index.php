<?php

defined('BASEPATH') OR exit('No direct script access allowed');

$tablerows = [
    'id' => 'ID',
    'name' => 'Name',
    'type_name' => lang('type'),
];

include("src/routes/shared/list.php");
