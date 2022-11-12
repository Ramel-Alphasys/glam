<?php
require 'database.php';
require 'CRUD.php';

$crud = new serverManipulation();
// set here connection to database
$conToServer = new ServerCon([$serverUsed, $databasePort, $databaseUsed, $user, $pass]);

if (!empty($_POST['TYPE'])) {
    switch ($_POST['TYPE']) {
        // Attempts to connect to the server to update a transaction
        case 'updateTransaction':
            try {
                $params = array(
                    'fields' => $_POST['params'],
                    'table' => $_POST['table'],
                    'filter' => $_POST['filter'],
                    'dbcon' => $conToServer
                );
                return ($crud->sm_ur_server($params) != null) ? 'Transaction updated!' : null;

            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in updateTransaction: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
    }
}