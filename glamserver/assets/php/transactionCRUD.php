<?php

/**
 * @ Name: transactionCRUD
 * @ Author: Ramel Niño O. Empleo
 * @ Create Time: 2022-11-10 21:21:43
 * @ Modified by: Ramel Niño O. Empleo
 * @ Modified time: 2023-01-26 21:26:21
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

                if ($_POST['status'] == 'Paid' || $_POST['status'] == 'Delivered') {

                    $params = array(
                        'fields' => 'g_days_till_due',
                        'table'  => 'g_settings',
                        'dbcon'  => $conToServer
                    );

                    $dueDate = $crud->sm_vr_server($params);

                    $valuesToInsert =
                        "null," .
                        $_POST['tId'] . ",
                    now(),
                    DATE_ADD(now(), interval {$dueDate[0]['g_days_till_due']} day),
                    'Still Due'";

                    $params = array(
                        'fields' => $valuesToInsert,
                        'table'  => 'g_due_rentals',
                        'dbcon'  => $conToServer
                    );

                    $dueRecord = $crud->sm_cr_server($params);
                }

                return ($crud->sm_ur_server($params) != null) ? 'Transaction updated!' : null;
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in updateTransaction: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
        case 'newTransaction':
            try {

                $params = array(
                    'fields' => '*',
                    'table' => 'g_customer',
                    'filter' => "WHERE gc_gname = '{$_POST['customer']['firstName']}' AND gc_mname = '{$_POST['customer']['middleName']}' AND gc_sname = '{$_POST['customer']['lastName']}'",
                    'dbcon' => $conToServer
                );

                $checker = $crud->sm_vr_server($params);

                if (!empty($checker)) {
                    $customerId = $checker[0]['gc_guId'];
                } else {
                    $params = array(
                        'fields' => 'COUNT(*) AS Total',
                        'table' => 'g_customer',
                        'dbcon' => $conToServer
                    );
                    $checker = $crud->sm_vr_server($params);
                    $customerId = $checker[0]['Total'];
                    echo $customerId;
                    $valuesToInsert = "{$customerId},0,'{$_POST['customer']['firstName']}','{$_POST['customer']['middleName']}','{$_POST['customer']['lastName']}','','',{$_POST['customer']['phone']}";

                    $params = array(
                        'fields' => $valuesToInsert,
                        'table' => 'g_customer',
                        'dbcon' => $conToServer
                    );

                    $client = $crud->sm_cr_server($params);
                }

                for ($i = 0; $i < count($_POST['transactionRecords']); $i++) {
                    $valuesToInsert =
                        "null," .
                        $_POST['transactionRecords'][$i]['gpId'] . ",
                        {$customerId},
                        'Walk In',
                        'Cash'," .
                        ($_POST['transactionRecords'][$i]['gp_price'] * $_POST['transactionRecords'][$i]['selectedSizeCount']) . ",
                        0.00,
                        now(),
                        'Paid',
                        '','" .
                        implode(", ", $_POST['transactionRecords'][$i]['selectedSize'])
                        . "'," . $_POST['transactionRecords'][$i]['selectedSizeCount'];

                    $params = array(
                        'fields' => $valuesToInsert,
                        'table'  => 'g_transactions',
                        'dbcon'  => $conToServer
                    );

                    $transac = $crud->sm_cr_server($params);

                    $params = array(
                        'fields' => 'gp_count = (SELECT gp_count WHERE gpId = ' . $_POST['transactionRecords'][$i]['gpId'] . ') - ' . count($_POST['transactionRecords'][$i]['selectedSize']),
                        'table'  => 'g_product',
                        'filter' => 'gpId = ' . $_POST['transactionRecords'][$i]['gpId'],
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
                    if (empty($checker) || ($transCreated[0]['gt_status'] == 'Paid' || $transCreated[0]['gt_status'] == 'Delivered')) {

                        $params = array(
                            'fields' => 'g_days_till_due',
                            'table'  => 'g_settings',
                            'dbcon'  => $conToServer
                        );

                        $dueDate = $crud->sm_vr_server($params);

                        $valuesToInsert =
                            "null," .
                            $transCreated[0]['gtId'] . ",
                        now(),
                        DATE_ADD(now(), interval {$dueDate[0]['g_days_till_due']} day),
                        'Still Due'";

                        $params = array(
                            'fields' => $valuesToInsert,
                            'table'  => 'g_due_rentals',
                            'dbcon'  => $conToServer
                        );

                        $dueRecord = $crud->sm_cr_server($params);
                    }
                }

                echo json_encode(array('MESSAGE' => 1));
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in updateTransaction: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
    }
}
