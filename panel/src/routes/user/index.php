<?php

defined('BASEPATH') OR exit('No direct script access allowed');

$tablerows = [
    'id' => lang('id'),
    'name' => lang('name'),
    'email' => lang('email'),
    'type_name' => lang('type'),
];

include("src/routes/shared/list.php");