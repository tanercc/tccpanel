<?php

defined('BASEPATH') or exit('No direct script access allowed');

if (!isset($editdata)) return;

$static_fields = [
    'id',
    'name',
    'slug',
    'email',
    'password',
    'is_active',
    'image',
    'file',
    'deleted',
    'order',
    'created_at',
    'updated_at'
];

?>

<?php if (array_key_exists('name', $editdata)) : ?>
<div class="form-group">
    <label for="name"><?= lang('name') ?></label>
    <input type="text" class="form-control name" name="name" value="<?= $editdata['name'] ?>" required>
</div>
<!-- /.form-group -->
<?php endif ?>

<?php if (array_key_exists('slug', $editdata)) : ?>
<div class="form-group">
    <label for="slug"><?= lang('slug') ?></label>
    <input type="text" class="form-control slug" name="slug" value="<?= $editdata['slug'] ?>" required>
</div>
<!-- /.form-group -->
<?php endif ?>

<?php if (array_key_exists('email', $editdata)) : ?>
<div class="form-group">
    <label for="email"><?= lang('email') ?></label>
    <input type="email" class="form-control email" name="email" value="<?= $editdata['email'] ?>" required>
</div>
<!-- /.form-group -->
<?php endif ?>

<?php if (array_key_exists('password', $editdata)) : ?>
<div class="form-group">
    <label for="password"><?= lang('password') ?></label>
    <input type="password" class="form-control password" name="password" value="<?= $editdata['password'] ?>" required>
</div>
<!-- /.form-group -->
<?php endif ?>

<?php if (array_key_exists('type_name', $editdata)) : ?>
<!-- Select type -->
<div class="form-group">
    <label><?= lang('type') ?></label>
    <select class="form-control select2" id="type_id" name="type_id" style="width: 100%;">
        <?php if ($editdata['type_id'] > 0) { ?>
        <option value="<?= $editdata['type_id'] ?>" selected="selected"><?= $editdata['type_name'] ?></option>
        <?php } ?>
    </select>
</div>
<!-- /.form-group -->
<?php endif ?>

<?php if (array_key_exists('upper_name', $editdata)) : ?>
<!-- Select upper page -->
<div class="form-group">
    <label><?= lang('upperdata') ?></label>
    <select class="form-control select2" id="upper_id" name="upper_id" style="width: 100%;">
        <?php if ($editdata['upper_id'] > 0) { ?>
        <option value="<?= $editdata['upper_id'] ?>" selected="selected"><?= $editdata['upper_name'] ?></option>
        <?php } else { ?>
        <option value="" selected="selected"><?= lang('yok') ?></option>
        <?php } ?>
    </select>
</div>
<!-- /.form-group -->
<?php endif ?>

<?php if (array_key_exists('lang_name', $editdata)) : ?>
<!-- Select upper page -->
<div class="form-group">
    <label><?= lang('lang') ?></label>
    <select class="form-control select2" id="lang_id" name="lang_id" style="width: 100%;">
        <?php if ($editdata['lang_id'] > 0) { ?>
        <option value="<?= $editdata['lang_id'] ?>" selected="selected"><?= $editdata['lang_name'] ?></option>
        <?php } else { ?>
        <option value="" selected="selected"><?= lang('yok') ?></option>
        <?php } ?>
    </select>
</div>
<!-- /.form-group -->
<?php endif ?>

<?php if (array_key_exists('is_active', $editdata)) : ?>
<div class="form-group">
    <div class="radio">
        <label>
            <input type="radio" name="is_active" class="active" value="1"
                <?= ($editdata['is_active'] ? 'checked' : '') ?>>
            <?= lang('active') ?>
        </label>
    </div>
    <div class="radio">
        <label>
            <input type="radio" name="is_active" class="passive" value="0"
                <?= ($editdata['is_active'] ? '' : 'checked') ?>>
            <?= lang('passive') ?>
        </label>
    </div>
</div>
<!-- /.form-group -->
<?php endif ?>

<?php if (array_key_exists('image', $editdata)) : ?>
<div class="form-group">
    <label for="image"><?= lang('image') ?></label>
    <div class="input-group input-file">
        <span class="input-group-btn">
            <button class="btn btn-default btn-reset" type="button"><i class="fa fa-times"></i></button>
            <button class="btn btn-default btn-view" type="button"><i class="fa fa-image"></i></button>
        </span>
        <input type="hidden" name="image" value="<?= $editdata['image'] ?>">
        <input type="text" class="form-control" id="image" placeholder='<?= lang('resimsec') ?>'
            value="<?= basename($editdata['image']) ?>" />
        <span class="input-group-btn">
            <button class="btn btn-default btn-choose" type="button"><?= lang('sec') ?></button>
        </span>
    </div>
</div>
<!-- /.form-group -->
<?php endif ?>

<?php if (array_key_exists('file', $editdata)) : ?>
<div class="form-group">
    <label for="file"><?= lang('file') ?></label>
    <div class="input-group input-file">
        <span class="input-group-btn">
            <button class="btn btn-default btn-reset" type="button"><i class="fa fa-times"></i></button>
            <button class="btn btn-default btn-view" type="button"><i class="fa fa-file"></i></button>
        </span>
        <input type="hidden" name="file" value="<?= $editdata['file'] ?>">
        <input type="text" class="form-control" id="file" placeholder='<?= lang('dosyasec') ?>'
            value="<?= basename($editdata['file']) ?>" />
        <span class="input-group-btn">
            <button class="btn btn-default btn-choose" type="button"><?= lang('sec') ?></button>
        </span>
    </div><!-- /input-group -->
</div>
<!-- /.form-group -->
<?php endif ?>

<?php foreach ($editdata as $key => $value) : ?>
<?php if (
        !in_array($key, $static_fields) &&
        strpos($key, '_id') === false &&
        strpos($key, '_name') === false &&
        strpos($key, '_at') === false
    ) : ?>
<div class="form-group">
    <label for="<?= $key ?>"><?= lang($key) ?></label>
    <input type="text" class="form-control <?= $key ?>" name="<?= $key ?>" value="<?= $value ?>">
</div>
<!-- /.form-group -->
<?php endif ?>
<?php endforeach ?>

<?php

$select2_script = <<<EOT
$('%s').select2({
    minimumResultsForSearch: Infinity,
    ajax: {
        url: "%s",
        dataType: 'json',
        type: "POST",
        data: function (params) {
            return {
                search: params.term,
                page: params.page,
                id: {$editdata['id']},
                disabled: %s
            };
        },
        processResults: function (data, params) {
            params.page = params.page || 1;   
            return {
                results: data.results,
                pagination: {
                    more: (params.page * 10) < data.count
                }
            };
        }
    }
});
EOT;
$imagefiles_link = set_href('files', 'list', $request_id, $request_route);
$input_script = <<<EOT
function loadFileModal() {
    $("#modal-panel .modal-body").load("$imagefiles_link");
    $("#modal-panel").modal();
}
EOT;

if (array_key_exists('type_name', $editdata)) $input_script .= sprintf($select2_script, '#type_id', set_href($request_route . 'type', 'select2'), 0);
if (array_key_exists('cat_name', $editdata)) $input_script .= sprintf($select2_script, '#cat_id', set_href($request_route . 'cat', 'select2'), 0);
if (array_key_exists('upper_name', $editdata)) $input_script .= sprintf($select2_script, '#upper_id', set_href($request_route, 'select2'), $editdata['id']);

?>
