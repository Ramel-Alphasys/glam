<?php
/**
 * @ Name: transactionCRUD
 * @ Author: Ramel Niño O. Empleo
 * @ Create Time: 2022-11-10 21:21:43
 * @ Modified by: Ramel Niño O. Empleo
 * @ Modified time: 2022-12-08 09:39:36
 * @ Description:
 */
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
                    'table'  => $_POST['table'],
                    'filter' => $_POST['filter'],
                    'dbcon'  => $conToServer
                );
                return ($crud->sm_ur_server($params) != null) ? 'Transaction updated!' : null;

            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in updateTransaction: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
        case 'newTransaction':
            try {
                
                for($i = 0; $i < count($_POST['transactionRecords']); $i++) {
                    $valuesToInsert = 
                        "null,".
                        $_POST['transactionRecords'][$i]['gpId'].",
                        0,
                        'Walk In',
                        'Cash',".
                        $_POST['transactionRecords'][$i]['gp_price'].",
                        0.00,
                        now(),
                        'Paid',
                        '','".
                        implode($_POST['transactionRecords'][$i]['selectedSize'])
                        ."',".$_POST['transactionRecords'][$i]['selectedSizeCount']
                    ;

                    $params = array(
                        'fields' => $valuesToInsert,
                        'table'  => 'g_transactions',
                        'dbcon'  => $conToServer
                    );

                    $transac = $crud->sm_cr_server($params);

                    $params = array(
                        'fields' => 'gp_count = (SELECT gp_count WHERE gpId = '.$_POST['transactionRecords'][$i]['gpId'].') - '.count($_POST['transactionRecords'][$i]['selectedSize']),
                        'table'  => 'g_product',
                        'filter' => 'gpId = '.$_POST['transactionRecords'][$i]['gpId'],
                        'dbcon'  => $conToServer
                    );

                    $prod = $crud->sm_ur_server($params);

                    $params = array(
                        'fields' => 'gtId, gt_status',
                        'table'  => 'g_transactions',
                        'filter' => "ORDER BY gtId DESC LIMIT 1",
                        'dbcon'  => $conToServer
                    );

                    $transCreated = $crud->sm_vr_server($params);

                    $params = array(
                        'fields' => 'gdr_gtId',
                        'table'  => 'g_due_rentals',
                        'filter' => "WHERE gdr_gtId = {$transCreated[0]['gtId']}",
                        'dbcon'  => $conToServer
                    );
                    
                    $checker = $crud->sm_vr_server($params);
                    /*********************************************
                     * CREATES A DUE RECORD IF PAID OR DELIVERED *
                     *********************************************/
                    if(empty($checker) || ($transCreated[0]['gt_status'] == 'Paid' || $transCreated[0]['gt_status'] == 'Delivered')) {
                        
                        $params = array(
                            'fields' => 'g_days_till_due',
                            'table'  => 'g_settings',
                            'dbcon'  => $conToServer
                        );

                        $dueDate = $crud->sm_vr_server($params);

                        $valuesToInsert = 
                        "null,".
                        $transCreated[0]['gtId'].",
                        now(),
                        DATE_ADD(now(), interval {$dueDate[0]['g_days_till_due']} day),
                        'Still Due'"  ;

                        $params = array(
                            'fields' => $valuesToInsert,
                            'table'  => 'g_due_rentals',
                            'dbcon'  => $conToServer
                        );

                        $dueRecord = $crud->sm_cr_server($params);
                    }

                }
                
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in updateTransaction: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
    }
}