<?php
require 'database.php';
require 'CRUD.php';

$crud = new serverManipulation();
// set here connection to database
$conToServer = new ServerCon([$serverUsed, $databasePort, $databaseUsed, $user, $pass]);

if (!file_exists('C:\\xampp\\htdocs\\glam\\glamserver\\assets\\contents\\')) {
    mkdir('C:\\xampp\\htdocs\\glam\\glamserver\\assets\\contents\\', 0777, true);
}

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
