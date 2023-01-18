<?php

require '..\..\glamserver\assets\php\database.php';
require '..\..\glamserver\assets\php\CRUD.php';
$crud = new serverManipulation();
$serverConn  = new ServerCon(['localhost', 3306, 'glamdb', 'glam', '-TEnT3pf_-JqPbX*']);

$uploaddir = 'C:\\xampp\\htdocs\\glam\\glamserver\\assets\\transactions\\';
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


echo $_POST['selectedSize'];
