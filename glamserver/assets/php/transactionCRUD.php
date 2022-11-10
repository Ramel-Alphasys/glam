<?php
require 'database.php';
require 'CRUD.php';

$crud = new serverManipulation();
// set here connection to database
$conToServer = new ServerCon(['localhost', 3306, 'glamdb', $user, $pass]);

if (!empty($_POST['TYPE'])) {
    switch ($_POST['TYPE']) {
        case 'updateTransaction':
            try {

            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in updateProduct: " . $conToServer->htmlize($e->getMessage())]]);
            }
    }
}