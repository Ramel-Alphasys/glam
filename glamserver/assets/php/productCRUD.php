<?php
require 'database.php';
require 'CRUD.php';

$crud = new serverManipulation();
// set here connection to database
$conToServer = new ServerCon(['localhost', 3306, 'glamdb', 'root', 'admin']);

if (!empty($_POST['TYPE'])) {
    switch ($_POST['TYPE']) {
        case 'updateProduct':
            try {
                if (!empty($_POST['params']) && !empty($_POST['filter'])) {
                    $params = array(
                        'fields' => $_POST['params'],
                        'filter' => $_POST['filter'],
                        'table' => 'g_product',
                        'dbcon' => $conToServer
                    );
                    return ($crud->sm_ur_server($params) != null) ? 'Product updated!' : null;
                }
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in updateProduct: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
        case 'createProduct':
            try {
                if (!empty($_POST['params'])) {
                    $params = array(
                        'fields' => $_POST['params'],
                        'table' => 'g_product',
                        'dbcon' => $conToServer
                    );
                    print_r($params);
                    return ($crud->sm_cr_server($params) != null) ? 'Product created!' : null;
                }
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in createProduct: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
    }
}