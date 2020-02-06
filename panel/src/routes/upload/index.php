<?php

defined('BASEPATH') or exit('No direct script access allowed');

if ($_FILES['image']['name']) {
    if (!$_FILES['image']['error']) {
        $ext = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
        $filename = slugify(pathinfo($_FILES['image']['name'], PATHINFO_FILENAME)) . '.' . $ext;
        $destination = 'uploads/' . $filename; 
        $location = $_FILES["image"]["tmp_name"];
        move_uploaded_file($location, $destination);
        $jsonarray = ['success' => true, 'result' => BASEPATH . '/uploads/' . $filename];
    } else {
        $jsonarray = ['success' => false, 'result' => 'Error: ' . $_FILES['image']['error']];
    }
} else {
    $jsonarray = ['success' => false, 'result' => 'Error'];
}

echo json_encode($jsonarray);
exit;
