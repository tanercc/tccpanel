<?php

defined('BASEPATH') or exit('No direct script access allowed');

if (file_exists("$request_func-$request_method.php")) {
    include "$request_func-$request_method.php";
}

if (!isset($tablerows)) {
    $tablerows = [
        'id' => 'ID',
        'name' => 'Name',
    ];
}

$table_name = $request_page . "s";

$sqlstring = "SELECT `$table_name`.* ";
if (isset($tablerows["type_name"])) $sqlstring .= ", `t_types`.`name` AS `type_name`";
if (isset($tablerows["cat_name"])) $sqlstring .= ", `t_cats`.`name` AS `cat_name`";
if (isset($tablerows["upper_name"])) $sqlstring .= ", `t_upper`.`name` AS `upper_name`";
$sqlstring .= "FROM `$table_name` ";
if (isset($tablerows["type_name"])) $sqlstring .= "LEFT JOIN `{$request_page}_types` AS `t_types` ON `t_types`.`id` = `$table_name`.`type_id` ";
if (isset($tablerows["cat_name"])) $sqlstring .= "LEFT JOIN `{$request_page}cats` AS `t_cats` ON `t_cats`.`id` =`$table_name`.`cat_id` ";
if (isset($tablerows["upper_name"])) $sqlstring .= "LEFT JOIN `$table_name` AS `t_upper` ON `t_upper`.`id` = `$table_name`.`upper_id` ";
$sqlstring .= "WHERE `is_active`=$global_is_active  AND `deleted`=$global_deleted  ORDER BY `order` ASC";
$result = sql_query($sqlstring);
$sqldatas = array();
while ($row = mysqli_fetch_assoc($result)) {
    $idx = $row['id'];
    $sqldatas[$idx] = $row;
}

$selected_id = null;
if (isset($request_get['selected'])) {
    $selected_id = $request_get['selected'];
}

$jstreehtml = jstree_html($sqldatas, 0, $selected_id);

$tabledatas = array();
foreach ($sqldatas as $data) {
    if ($data['upper_id'] == intval($selected_id)) {
        $tabledatas[] = $data;
    }
}
?>

<!-- /.row -->
<div class="row">
    <div class="col-md-6">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><?= lang('tree') ?></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div id="jstree">
                    <ul>
                        <li class="jstree-open" data-id="0" data-jstree='{"icon":"fa fa-dot-circle-o"}'>
                            <a href="#" class="<?= ($selected_id ? '' : 'jstree-clicked') ?>">
                                <?= lang($request_func) ?>
                            </a>
                            <ul>
                                <?= $jstreehtml ?>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- /.box-body -->
        </div>
    </div>
    <div class="col-md-6">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title"><?= lang($request_func) ?></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive">
                <?php if ($selected_id) : ?>
                    <form>
                        <div class="input-group">
                            <input type="text" class="form-control" value="<?= $sqldatas[$selected_id]['name'] ?>" readonly>
                            <span class="input-group-btn">
                                <a href="<?= set_href($request_page, 'edit', $selected_id) ?>" class="btn btn-primary" type="button"><i class="fa fa-edit"></i> <?= lang('edit') ?></a>
                            </span>
                        </div>
                    </form>
                    <br>
                <?php endif ?>
                <table id="datatable" class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <?php foreach ($tablerows as $key => $value) : ?>
                                <th><?= $value ?></th>
                            <?php endforeach ?>
                            <th><a href="<?= set_href($request_page, 'edit', 0) ?><?= ($selected_id ? "?selected=$selected_id" : '') ?>" class="btn btn-xs btn-success"><i class="fa fa-fw fa-plus"></i> <?= lang('insert') ?></a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($tabledatas as $rowdata) : ?>
                            <tr>
                                <?php foreach ($tablerows as $key => $value) : ?>
                                    <td><?= $rowdata[$key] ?></td>
                                <?php endforeach ?>
                                <td>
                                    <a href="<?= set_href($request_page, 'edit', $rowdata['id']) ?>" class="btn btn-xs btn-primary"><i class="fa fa-fw fa-edit"></i> <?= lang('edit') ?></a>
                                    <button id="conf-<?= $id ?>" type="button" class="btn btn-xs btn-danger" data-toggle="confirmation" data-id="<?= $id ?>">
                                        <i class="fa fa-fw fa-trash"></i> <?= lang('delete') ?>
                                    </button>
                                </td>
                            </tr>
                        <?php endforeach ?>
                    </tbody>
                </table>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </div>
</div>

<?php
$tree_link = set_href($request_page);
$delete_link = set_href($request_page, 'delete');
$delete_title = lang('delete-message');
$delete_yes = lang('yes');
$delete_no = lang('no');
$page_script = <<<EOT
<script>
$("#jstree").jstree().on("select_node.jstree", function (e, data) { 
    window.location = "{$tree_link}?selected=" + $("#"+data.node.id).data('id'); 
});
$(document).ready( function () {
    // $('#datatable').DataTable();
});
$('[data-toggle=confirmation]').confirmation({
    rootSelector: '[data-toggle=confirmation]',
    title: "$delete_title",
    singleton: true,
    btnOkLabel: "$delete_yes",
    btnOkClass: "btn-success",
    btnCancelLabel: "$delete_no",
    btnCancelClass: "btn-danger",
    onConfirm: function () {
        $.ajax({
            url: "$delete_link",
            method: "POST",
            data: { id: $(this).data("id") }
        }).done(function() {
            location.reload();
        });
    }
});
</script>
EOT;
?>