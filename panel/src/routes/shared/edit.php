<?php

defined('BASEPATH') or exit('No direct script access allowed');

$table_name = $request_route . "s";

if (!isset($foreignrows)) {
    $foreignrows = [];
}
if (!isset($lang_present)) {
    $lang_present = false;
}

if ($request_id) {
    $sqlstring = "SELECT `$table_name`.* ";
    if (in_array('type_id', $foreignrows)) $sqlstring .= ", `t_types`.`name` AS `type_name` ";
    if (in_array('cat_id', $foreignrows)) $sqlstring .= ", `t_cats`.`name` AS `cat_name` ";
    if (in_array('upper_id', $foreignrows)) $sqlstring .= ", `t_upper`.`name` AS `upper_name` ";
    if (in_array('lang_id', $foreignrows)) $sqlstring .= ", `langs`.`name` AS `lang_name` ";
    $sqlstring .= "FROM `$table_name` ";
    if (in_array('type_id', $foreignrows)) $sqlstring .= "LEFT JOIN `{$request_route}types` AS `t_types` ON `t_types`.`id` = `$table_name`.`type_id` ";
    if (in_array('cat_id', $foreignrows)) $sqlstring .= "LEFT JOIN `{$request_route}cats` AS `t_cats` ON `t_cats`.`id` =`$table_name`.`cat_id` ";
    if (in_array('upper_id', $foreignrows)) $sqlstring .= "LEFT JOIN `$table_name` AS `t_upper` ON `t_upper`.`id` = `$table_name`.`upper_id` ";
    if (in_array('lang_id', $foreignrows)) $sqlstring .= "LEFT JOIN `langs` ON `langs`.`id` =`$table_name`.`lang_id` ";
    $sqlstring .= "WHERE `$table_name`.`is_active`=$global_is_active  AND `$table_name`.`deleted`=$global_deleted AND `$table_name`.`id`=$request_id";

    $result = sql_query($sqlstring);
    $editdata = mysqli_fetch_assoc($result);
} else {
    $editdata = db_get_columns_array($table_name);
}

if (isset($request_get['selected']) && $editdata['upper_id'] < 1) {
    $upperdata = db_get_table_row($table_name, $request_get['selected']);
    $editdata['upper_id'] = $upperdata['id'];
    $editdata['upper_name'] = $upperdata['name'];
}

?>

<!-- /.row -->
<div class="row">
    <div class="col-md-6 <?= ($lang_present && ($request_id>0)) ? "" : "col-md-offset-3" ?>">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><?= lang($request_func) ?></h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" method="POST">
                <input type="hidden" name="id" value="<?= $request_id ?>">

                <div class="box-body">

                    <?php
                    if (!empty($editdata)) {
                        include("src/routes/shared/inputs.php");
                    } else {
                        $input_script = "";
                    }
                    ?>

                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                    <?php
                    if (!empty($editdata)) : ?>
                        <button type="submit" class="btn btn-primary"><?= lang('submit') ?></button>
                    <?php else : ?>
                        <a class="btn btn-primary" href="<?= set_href($request_route) ?>"><?= lang('back') ?></a>
                    <?php endif ?>
                </div>
            </form>
        </div>
    </div>
    <?php if ($lang_present && ($request_id>0)) { ?>
        <div class="col-md-6">
            <?php
            if ($request_id) {
                include("src/routes/shared/lang.php");
            }
            ?>
        </div>
    <?php } else {
        $lang_script = "";
    } ?>
</div>

<?php

$page_script = <<<EOT
<script>
$input_script
$lang_script
</script>
EOT;

?>
