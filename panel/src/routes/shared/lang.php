<?php

defined('BASEPATH') or exit('No direct script access allowed');

$lang_name = "";
if ($request_route) {
    $lang_name = $request_route . "_lang";
    $langfields = sql_fields($lang_name);
} else {
    return;
}

$langtabs = array();
$langdatas = array();

if ($request_id) {
    $sqlstring = "SELECT * FROM `langs` WHERE `langs`.`is_active`=$global_is_active  AND `langs`.`deleted`=$global_deleted";
    $sqlresult = sql_query($sqlstring);
    while ($row = mysqli_fetch_assoc($sqlresult)) {
        $langtabs[] = $row;
        foreach ($langfields as $langfield) {
            $langdatas[$row['id']][$langfield] = "";
        }
    }

    $sqlstring = "SELECT * FROM `$lang_name` WHERE `$lang_name`.`data_id`=$request_id";
    $sqlresult = sql_query($sqlstring);
    while ($row = mysqli_fetch_assoc($sqlresult)) {
        $langdatas[$row["lang_id"]] = $row;
    }
}
?>

<div class="nav-tabs-custom">
    <ul class="nav nav-tabs">
        <?php foreach ($langtabs as $i => $langtab) : ?>
            <li class="<?= ($i == 0) ? 'active' : '' ?>">
                <a href="#tab_<?= $i ?>" data-toggle="tab">
                    <?= strtoupper($langtab['slug']) ?>
                </a>
            </li>
        <?php endforeach ?>
    </ul>
    <div class="tab-content">
        <?php foreach ($langtabs as $i => $langtab) : ?>
            <div class="tab-pane <?= ($i == 0) ? 'active' : '' ?>" id="tab_<?= $i ?>">
                <form class="langform" role="form" method="POST" action="<?= set_href_lang($request_route) ?>">
                    <input type="hidden" name="data_id" value="<?= $request_id ?>">
                    <input type="hidden" name="lang_id" value="<?= $langtab["id"] ?>">

                    <?php if (in_array('name', $langfields)) : ?>
                        <div class="form-group">
                            <label for="name"><?= lang('name') ?></label>
                            <input type="text" class="form-control name" name="name" value="<?= $langdatas[$langtab["id"]]['name'] ?>" required>
                        </div>
                    <?php endif ?>

                    <?php if (in_array('slug', $langfields)) : ?>
                        <!-- textarea -->
                        <div class="form-group">
                            <label for="slug"><?= lang('slug') ?></label>
                            <input type="text" class="form-control slug" name="slug" value="<?= $langdatas[$langtab["id"]]['slug'] ?>" required>
                        </div>
                    <?php endif ?>

                    <?php if (in_array('title', $langfields)) : ?>
                        <!-- textarea -->
                        <div class="form-group">
                            <label><?= lang('title') ?></label>
                            <textarea class="form-control title" rows="3" name="title"><?= $langdatas[$langtab["id"]]['title'] ?></textarea>
                        </div>
                    <?php endif ?>

                    <?php if (in_array('content', $langfields)) : ?>
                        <!-- textarea -->
                        <div class="form-group">
                            <label><?= lang('content') ?></label>
                            <textarea class="form-control summernote content" name="content"><?= $langdatas[$langtab["id"]]['content'] ?></textarea>
                        </div>
                    <?php endif ?>

                    <?php if (in_array('image', $langfields)) : ?>
                        <div class="form-group">
                            <label for="image"><?= lang('image') ?></label>
                            <div class="input-group input-file">
                                <span class="input-group-btn">
                                    <button class="btn btn-default btn-reset" type="button"><i class="fa fa-times"></i></button>
                                    <button class="btn btn-default btn-view" type="button"><i class="fa fa-image"></i></button>
                                </span>
                                <input type="text" class="form-control" id="image" name="image" placeholder='<?= lang('resimsec') ?>' value="<?= $langdatas[$langtab["id"]]['image'] ?>" />
                                <span class="input-group-btn">
                                    <button class="btn btn-default btn-choose" type="button"><?= lang('sec') ?></button>
                                </span>
                            </div>
                        </div>
                        <!-- /.form-group -->
                    <?php endif ?>

                    <button type="submit" class="btn btn-primary"><i class="fa fa-spinner fa-pulse fa-fw" style="display:none"></i><?= lang('submit') ?></button>
                </form>
            </div>
            <!-- /.tab-pane -->
        <?php endforeach ?>
    </div>
    <!-- /.tab-content -->
</div>
<!-- nav-tabs-custom -->

<?php
$lang_script = <<<EOT
$(".langform").submit(function(e){
    e.preventDefault();
    if(!this.checkValidity()) {
        this.reportValidity();
        return;
    }
    $.ajax({
        url: this.action,
        type: this.method,
        data: $(this).serialize(),
        beforeSend: function() {
            $('.fa.fa-spinner').show();
        }
    }).done(function() {
        console.log('OK');
        $('.fa.fa-spinner').hide();
    }).fail(function() {
        console.log('ER');
        $('.fa.fa-spinner').hide();
    });
});
EOT;
$imagefiles_link = set_href('files', 'list', $request_id, $request_route);
$lang_script .= <<<EOT
function loadFileModal() {
    $("#modal-panel .modal-body").load("$imagefiles_link");
    $("#modal-panel").modal();
}
EOT;
?>