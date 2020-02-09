<?php

defined('BASEPATH') or exit('No direct script access allowed');

if (isset($_POST['folder']) && isset($_POST['id']) && isset($_POST['file'])) {
    $folder = $_POST['folder'] . '/';
    $id =  $_POST['id'] . '/';
    $file =  $_POST['file'];
    $filename = 'uploads/' . $folder . $id . $file;
    if (unlink($filename)) {
        $jsonarray = ['success' => true, 'result' => BASEPATH . "/$filename"];
    } else {
        $jsonarray = ['success' => false, 'result' => 'Error: ' . $_FILES['file']['error']];
    }
} else {
    $jsonarray = ['success' => false, 'result' => 'Error'];
}

echo json_encode($jsonarray);
exit;
