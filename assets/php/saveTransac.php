<?php

require '..\..\glamserver\assets\php\database.php';
require '..\..\glamserver\assets\php\CRUD.php';
$crud = new serverManipulation();
$serverConn  = new ServerCon(['localhost', 3306, 'glamdb', 'glam', '-TEnT3pf_-JqPbX*']);

$uploaddir = 'C:\\xampp\\htdocs\\glam\\glamserver\\assets\\transactions\\';
$uploadfile = $uploaddir . basename($_FILES['full']['name']);

$valuesToInsert =
    "null," .
    $_POST['prudId'] . "," .
    $_POST['userId'] . ",
    'Gcash','" .
    $_POST['paymentMode'] . "'," .
    $_POST['price'] . ",
    0.00,
    now(),
    'Pending','" . $_FILES['full']['name'] . "','" .
    $_POST['selectedSize']
    . "'," . $_POST['counter'];

$params = array(
    'fields' => $valuesToInsert,
    'table'  => 'g_transactions',
    'dbcon'  => $serverConn
);

$transac = $crud->sm_cr_server($params);

if (move_uploaded_file($_FILES['full']['tmp_name'], $uploadfile)) {
    echo "File is valid, and was successfully uploaded.";
} else {
    echo "Upload failed";
}
