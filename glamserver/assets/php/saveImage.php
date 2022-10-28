<?php
require 'database.php';
require 'CRUD.php';

$crud = new serverManipulation();
// set here connection to database
$conToServer = new ServerCon(['localhost', 3306, 'glamdb', 'root', 'admin']);

$uploaddir = 'C:\\xampp\\htdocs\\glam\\glamserver\\assets\\contents\\';
$uploadfile = $uploaddir . basename($_FILES['inputFile']['name']);

if (move_uploaded_file($_FILES['inputFile']['tmp_name'], $uploadfile)) {
    echo "File is valid, and was successfully uploaded.";
} else {
    echo "Upload failed";
}

// echo "</p>";
// echo '<pre>';
// echo 'Here is some more debugging info:';
// print_r($_FILES);
// print "</pre>";
