<?php

defined('BASEPATH') or exit('No direct script access allowed');

$lang_id = db_get_current_lang_id($request_lang);
$vars = db_get_variables($lang_id);
$menus = db_get_table_with_lang('menu', $lang_id);

$datas = db_get_table_with_lang('data', $lang_id);
$datatypes = db_get_table_with_lang('data', $lang_id);

$datacats = db_get_table_with_lang('datatag', $lang_id);

$datatags = db_get_table_with_lang('datatag', $lang_id);
$datatagtypes = db_get_table_data('datatagtype','*');
