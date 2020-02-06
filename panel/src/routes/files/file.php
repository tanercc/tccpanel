<?php

defined('BASEPATH') OR exit('No direct script access allowed');

// ADD SPECIFIC FILES YOU WANT TO IGNORE HERE
$ignore_file_list = array(".htaccess", "Thumbs.db", ".DS_Store", "index.php");

// ADD SPECIFIC FILE EXTENSIONS YOU WANT TO IGNORE HERE, EXAMPLE: array('psd','jpg','jpeg')
$ignore_ext_list = array();

// SORT BY
$sort_by = "name_asc"; // options: name_asc, name_desc, date_asc, date_desc

// TOGGLE SUB FOLDERS, SET TO false IF YOU WANT OFF
$toggle_sub_folders = true;

// FORCE DOWNLOAD ATTRIBUTE
$force_download = true;

// IGNORE EMPTY FOLDERS
$ignore_empty_folders = true;

$dirname = getcwd() . DIRECTORY_SEPARATOR . 'uploads';

if(!isset($file_icons)) {
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

// SET TITLE BASED ON FOLDER NAME, IF NOT SET ABOVE
?>
<div class="file-list list-group">
    <?php

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

    function count_dir_files($dir)
    {
        global $dirname;
        $fi = new FilesystemIterator($dir, FilesystemIterator::SKIP_DOTS);
        return iterator_count($fi);
    }

    function get_directory_size($path)
    {
        $bytestotal = 0;
        $path = realpath($path);
        if ($path !== false && $path != '' && file_exists($path)) {
            foreach (new RecursiveIteratorIterator(new RecursiveDirectoryIterator($path, FilesystemIterator::SKIP_DOTS)) as $object) {
                $bytestotal += $object->getSize();
            }
        }

        return display_size($bytestotal);
    }


    // SHOW THE MEDIA BLOCK
    function display_block($file)
    {
        global $ignore_file_list, $ignore_ext_list, $force_download, $file_icons;

        $file_ext = ext($file);
        if (!$file_ext and is_dir($file)) $file_ext = "dir";
        if (in_array($file, $ignore_file_list)) return;
        if (in_array($file_ext, $ignore_ext_list)) return;

        if (isset($file_icons[$file_ext])){ $icon = $file_icons[$file_ext]; } else { return; }

        $basename = basename($file);
        if ($file_ext === "dir") {
            $rtn = "<a href=\"#$basename\" class=\"list-group-item list-group-item-action $file_ext\" data-toggle=\"collapse\">";
            $rtn .= "<h5>$icon $basename</h5>";
            $rtn .= "<span class=\"badge badge-primary\">" . count_dir_files($file) . " files</span>";
            //$rtn .= "<span class=\"badge badge-secondary\">" . get_directory_size($file) . "</span>";
            $rtn .= "</a>";
        } else {
            $download_att = ($force_download) ? " download='" . basename($file) . "'" : "";
            $select_att = " onclick=\"modalSelect('" . basename($file) . "');\"";
            $rtn = "<a class=\"list-group-item list-group-item-action $file_ext\" $select_att>";
            $rtn .= "<h5>$icon $basename</h5>";
            $rtn .= "<span class=\"badge badge-primary\">" . display_size(filesize($file)) . "</span>";
            //$rtn .= "<span class=\"badge badge-secondary\">" .  date("d-m-y h:s", filemtime($file)) . "</span>";
            $rtn .= "</a>";
        }
        $rtn .= "</a>";
        return $rtn;
    }


    // RECURSIVE FUNCTION TO BUILD THE BLOCKS
    function build_blocks($items, $folder)
    {
        global $ignore_file_list, $ignore_ext_list, $sort_by, $toggle_sub_folders, $ignore_empty_folders, $dirname;

        $objects = array();
        $objects['directories'] = array();
        $objects['files'] = array();

        foreach ($items as $c => $item) {
            if ($item == ".." or $item == ".") continue;

            // IGNORE FILE
            if (in_array($item, $ignore_file_list)) {
                continue;
            }

            if ($folder && $item) {
                $item = $folder . DIRECTORY_SEPARATOR . $item;
            } else {
                $item=$dirname . DIRECTORY_SEPARATOR . $item;
            }

            $file_ext = ext($item);

            // IGNORE EXT
            if (in_array($file_ext, $ignore_ext_list)) {
                continue;
            }

            // DIRECTORIES
            if (is_dir($item)) {
                $objects['directories'][] = $item;
                continue;
            }

            // FILE DATE
            $file_time = "";//date("U", filemtime($item));

            // FILES
            if ($item) {
                $objects['files'][$file_time . "-" . $item] = $item;
            }
        }

        foreach ($objects['directories'] as $c => $file) {
            $sub_items = (array) scandir($file);

            if ($ignore_empty_folders) {
                $has_sub_items = false;
                foreach ($sub_items as $sub_item) {
                    $sub_fileExt = ext($sub_item);
                    if ($sub_item == ".." or $sub_item == ".") continue;
                    if (in_array($sub_item, $ignore_file_list)) continue;
                    if (in_array($sub_fileExt, $ignore_ext_list)) continue;

                    $has_sub_items = true;
                    break;
                }

                if ($has_sub_items) echo display_block($file);
            } else {
                echo display_block($file);
            }

            if ($toggle_sub_folders) {
                if ($sub_items) {
                    echo "<div id=\"".basename($file)."\" class=\"collapse\">";
                    build_blocks($sub_items, $file);
                    echo "</div>";
                }
            }
        }

        // SORT BEFORE LOOP
        if ($sort_by == "date_asc") {
            ksort($objects['files']);
        } elseif ($sort_by == "date_desc") {
            krsort($objects['files']);
        } elseif ($sort_by == "name_asc") {
            natsort($objects['files']);
        } elseif ($sort_by == "name_desc") {
            arsort($objects['files']);
        }

        foreach ($objects['files'] as $t => $file) {
            $fileExt = ext($file);
            if (in_array($file, $ignore_file_list)) {
                continue;
            }
            if (in_array($fileExt, $ignore_ext_list)) {
                continue;
            }
            echo display_block($file);
        }
    }

    // GET THE BLOCKS STARTED, FALSE TO INDICATE MAIN FOLDER
    $items = scandir($dirname);
    build_blocks($items, false);
    ?>

    <?php if ($toggle_sub_folders) { ?>
        <script type="text/javascript">
            $(document).ready(function() {
                $("a.dir").click(function(e) {
                    $(this).toggleClass('open');
                    $('.sub[data-folder="' + $(this).attr('href') + '"]').slideToggle();
                    e.preventDefault();
                });
            });
            function selectFile(filename) {
                var input = $('#modal-panel').data('inputid');
                $(input).val(filename);
            }
        </script>
    <?php } ?>
</div>