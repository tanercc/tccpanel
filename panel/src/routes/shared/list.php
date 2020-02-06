<?php

defined('BASEPATH') or exit('No direct script access allowed');

if (!isset($tablerows)) {
    $tablerows = [
        'id' => lang('id'),
        'name' => lang('name'),
        'slug' => lang('slug'),
    ];
}

$table_name = $request_page . "s";

$sqlstring = "SELECT `$table_name`.* ";
if (isset($tablerows["type_name"])) $sqlstring .= ", `t_types`.`name` AS `type_name`";
if (isset($tablerows["cat_name"])) $sqlstring .= ", `t_cats`.`name` AS `cat_name`";
if (isset($tablerows["upper_name"])) $sqlstring .= ", `t_upper`.`name` AS `upper_name`";
$sqlstring .= "FROM `$table_name` ";
if (isset($tablerows["type_name"])) $sqlstring .= "LEFT JOIN `{$request_page}types` AS `t_types` ON `t_types`.`id` = `$table_name`.`type_id` ";
if (isset($tablerows["cat_name"])) $sqlstring .= "LEFT JOIN `{$request_page}cats` AS `t_cats` ON `t_cats`.`id` =`$table_name`.`cat_id` ";
if (isset($tablerows["upper_name"])) $sqlstring .= "LEFT JOIN `$table_name` AS `t_upper` ON `t_upper`.`id` = `$table_name`.`upper_id` ";
$sqlstring .= "WHERE `$table_name`.`is_active`=$global_is_active  AND `$table_name`.`deleted`=$global_deleted  ORDER BY `order` ASC";
$sqlresult = sql_query($sqlstring);
$tabledatas = array();
while ($row = mysqli_fetch_assoc($sqlresult)) {
    $idx = $row['id'];
    $tabledatas[$idx] = $row;
}

?>
<!-- /.row -->
<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title"><?= lang($request_func) ?></h3>

                <div class="box-tools">
                    <div class="input-group input-group-sm" style="width: 150px;">
                        <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive">
                <table id="datatable" class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <?php foreach ($tablerows as $key => $value) : ?>
                                <th><?= $value ?></th>
                            <?php endforeach ?>
                            <th><a href="<?= set_href($request_page, 'edit', 0) ?>" class="btn btn-xs btn-success"><i class="fa fa-fw fa-plus"></i> <?= lang('insert') ?></a></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($tabledatas as $id => $rowdata) : ?>
                            <tr>
                                <?php foreach ($tablerows as $key => $value) : ?>
                                    <td><?= $rowdata[$key] ?></td>
                                <?php endforeach ?>
                                <td>
                                    <a href="<?= set_href($request_page, 'edit', $id) ?>" class="btn btn-xs btn-primary"><i class="fa fa-fw fa-edit"></i> <?= lang('edit') ?></a>
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

$delete_link = set_href($request_page, 'delete');
$delete_title = lang('delete-message');
$delete_yes = lang('yes');
$delete_no = lang('no');
$page_script = <<<EOT
<script>
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