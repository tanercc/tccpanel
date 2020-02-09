<?php

defined('BASEPATH') or exit('No direct script access allowed');

if ($_FILES['file']['name']) {
    if (!$_FILES['file']['error']) {
        $ext = pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);
        $filename = slugify(pathinfo($_FILES['file']['name'], PATHINFO_FILENAME)) . '.' . $ext;
        $folder = isset($_POST['folder']) ? $_POST['folder'] . '/' : '';
        $id = isset($_POST['id']) ? $_POST['id'] . '/' : ''; 
        $destination = 'uploads/' . $folder . $id . $filename;
        $location = $_FILES["file"]["tmp_name"];
        move_uploaded_file($location, $destination);
        $jsonarray = ['success' => true, 'result' => BASEPATH . "/$destination"];
    } else {
        $jsonarray = ['success' => false, 'result' => 'Error: ' . $_FILES['file']['error']];
    }
} else {
    $jsonarray = ['success' => false, 'result' => 'Error'];
}

echo json_encode($jsonarray);
exit;
