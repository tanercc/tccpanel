<?php

defined('BASEPATH') or exit('No direct script access allowed');

$ignore_file_list = array(".", "..", ".htaccess", "Thumbs.db", ".DS_Store", "index.php");

$ignore_ext_list = array("php", "html", "htm", "js", "css");

$dirname = getcwd() . DIRECTORY_SEPARATOR . 'uploads' . DIRECTORY_SEPARATOR . $request_data . DIRECTORY_SEPARATOR . $request_id;
$pathname = BASEPATH ."/uploads/$request_data/$request_id";

if (!file_exists($dirname)) {
    mkdir($dirname, 0777, true);
}

if (!isset($file_icons)) {
    $file_icons = array(
        'dir' => '<i class="fa fa-folder"></i>',
        'jpeg' => '<i class="fa fa-file-image-o"></i>',
        'png' => '<i class="fa fa-file-image"></i>',
        'jpg' => '<i class="fa fa-file-image-o"></i>',
        'gif' => '<i class="fa fa-file-image"></i>',
        'zip' => '<i class="fa fa-file-archive-o"></i>',
        'rar' => '<i class="fa fa-file-archive"></i>',
        'pdf' => '<i class="fa fa-file-pdf-o"></i>',
        'doc' => '<i class="fa fa-file-text-o"></i>',
        'xls' => '<i class="fa fa-file-excel-o"></i>',
        'docx' => '<i class="fafa-file-text-o"></i>',
        'xlsx' => '<i class="fa fa-file-excel-o"></i>',
    );
}

function ext($filename)
{
    return substr(strrchr($filename, '.'), 1);
}

function display_size($bytes, $precision = 2)
{
    $units = array('B', 'KB', 'MB', 'GB', 'TB');
    $bytes = max($bytes, 0);
    $pow = floor(($bytes ? log($bytes) : 0) / log(1024));
    $pow = min($pow, count($units) - 1);
    $bytes /= (1 << (10 * $pow));
    return round($bytes, $precision) . '<b>' . $units[$pow] . "</b>";
}

$file_list = array();

if ($handle = opendir($dirname)) {
    while (false !== ($entry = readdir($handle))) {
        if (in_array($entry, $ignore_file_list)) continue;
        if (in_array(ext($entry), $ignore_ext_list)) continue;
        if (is_dir($dirname . DIRECTORY_SEPARATOR . $entry)) continue;
        $file_list[] = trim($entry);
    }
    closedir($handle);
}

sort($file_list);

$imagefiles_link = set_href('files', 'list', $request_id, $request_data);
?>

<div class="file-list">
    <div class="list-group">
        <?php
        foreach ($file_list as $file_name) {
            $select_att = " onclick=\"modalSelect('$pathname/$file_name')\"";
            $delete_att = " onclick=\"deleteFile('$file_name')\"";
            $file_ext = ext($file_name);
            $icon = isset($file_icons[$file_ext]) ? $file_icons[$file_ext] : '<i class="fa fa-file-o"></i>';
            $file_size = filesize($dirname . DIRECTORY_SEPARATOR . $file_name);
            echo "<div class=\"list-group-item list-group-item-action $file_ext\">";
            echo "<a class=\"select-button\" $select_att>";
            echo "<h5>$icon $file_name</h5>";
            echo "</a>";
            echo "<span class=\"delete-button badge badge-secondary\" data-name=\"$dirname/$file_name\"><i class=\"fa fa-trash\"></i></span>";
            echo "<span class=\"badge badge-primary\">" . display_size($file_size) . "</span>";
            echo "</div>";
        }
        ?>
    </div>
    <div id="dropzone">
        <form action="<?= set_href('files','upload') ?>" class="dropzone needsclick" id="file-upload">
            <input type="hidden" name="folder" value="<?= $request_data ?>">
            <input type="hidden" name="id" value="<?= $request_id ?>">
            <div class="dz-message needsclick">
                Drop files here or click to upload.<br />
                <span class="note needsclick">(This is just a demo dropzone. Selected files are <strong>not</strong> actually uploaded.)</span>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        function modalRefresh() {
            $("#modal-panel .modal-body").load("<?=$imagefiles_link?>");
        }

        var myDropzone = new Dropzone("#file-upload");
        myDropzone.on("success", function(file) {
            modalRefresh();
        });
        $(".delete-button").click(function(){
            if(confirm("Silmek istiyor musunuz!")) {
                deleteFile($(this).data("name")).then(modalRefresh);
            }
            
        });
    });
</script>