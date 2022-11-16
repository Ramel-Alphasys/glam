<?php
require 'database.php';
require 'CRUD.php';

$crud = new serverManipulation();
// set here connection to database
$conToServer = new ServerCon([$serverUsed, $databasePort, $databaseUsed, $user, $pass]);

if (!empty($_POST['TYPE'])) {
    switch ($_POST['TYPE']) {
        case 'thisYearG':
            try {
                $params = array(
                    'fields' => 'SUM(total_this_year) AS this_year',
                    'table' => 'gv_dashboard_on_gcash_c',
                    'dbcon' => $conToServer
                );
                $checker = $crud->sm_vr_server($params);
                echo (!empty($checker)) ? json_encode(['Response' => number_format($checker[0]['this_year'],2)]) : json_encode(['Response' => 0]);
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in thisYearG: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
        case 'lastYearG':
                try {
                    $params = array(
                        'fields' => 'SUM(total_last_year) AS last_year',
                        'table' => 'gv_dashboard_on_gcash_l',
                        'dbcon' => $conToServer
                    );
                    $checker = $crud->sm_vr_server($params);
                    echo (!empty($checker)) ? json_encode(['Response' => number_format($checker[0]['last_year'],2)]) : json_encode(['Response' => 0]);
                } catch (PDOException $e) {
                    echo json_encode([['MESSAGE' => "Connection failed in lastYearG: " . $conToServer->htmlize($e->getMessage())]]);
                }
                break;
        case 'thisYearW':
            try {
                $params = array(
                    'fields' => 'SUM(total_this_year) AS this_year',
                    'table' => 'gv_dashboard_on_walkin_c',
                    'dbcon' => $conToServer
                );
                $checker = $crud->sm_vr_server($params);
                echo (!empty($checker)) ? json_encode(['Response' => number_format($checker[0]['this_year'],2)]) : json_encode(['Response' => 0]);
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in thisYearW: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
        case 'lastYearW':
                try {
                    $params = array(
                        'fields' => 'SUM(total_last_year) AS last_year',
                        'table' => 'gv_dashboard_on_walkin_l',
                        'dbcon' => $conToServer
                    );
                    $checker = $crud->sm_vr_server($params);
                    echo (!empty($checker)) ? json_encode(['Response' => number_format($checker[0]['last_year'],2)]) : json_encode(['Response' => 0]);
                } catch (PDOException $e) {
                    echo json_encode([['MESSAGE' => "Connection failed in lastYearW: " . $conToServer->htmlize($e->getMessage())]]);
                }
                break;
        case 'thisYearCOD':
            try {
                $params = array(
                    'fields' => 'SUM(total_this_year) AS this_year',
                    'table' => 'gv_dashboard_on_cod_c',
                    'dbcon' => $conToServer
                );
                $checker = $crud->sm_vr_server($params);
                echo (!empty($checker)) ? json_encode(['Response' => number_format($checker[0]['this_year'],2)]) : json_encode(['Response' => 0]);
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in thisYearCOD: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
        case 'lastYearCOD':
                try {
                    $params = array(
                        'fields' => 'SUM(total_last_year) AS last_year',
                        'table' => 'gv_dashboard_on_cod_l',
                        'dbcon' => $conToServer
                    );
                    $checker = $crud->sm_vr_server($params);
                    echo (!empty($checker)) ? json_encode(['Response' => number_format($checker[0]['last_year'],2)]) : json_encode(['Response' => 0]);
                } catch (PDOException $e) {
                    echo json_encode([['MESSAGE' => "Connection failed in lastYearCOD: " . $conToServer->htmlize($e->getMessage())]]);
                }
                break;
        case 'thisYearTR':
            try {
                $params = array(
                    'fields' => 'SUM(total_this_year) AS this_year',
                    'table' => 'gv_dashboard_overall_c',
                    'dbcon' => $conToServer
                );
                $checker = $crud->sm_vr_server($params);
                echo (!empty($checker)) ? json_encode(['Response' => number_format($checker[0]['this_year'],2)]) : json_encode(['Response' => 0]);
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in thisYearTR: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
        case 'lastYearTR':
                try {
                    $params = array(
                        'fields' => 'SUM(total_last_year) AS last_year',
                        'table' => 'gv_dashboard_overall_l',
                        'dbcon' => $conToServer
                    );
                    $checker = $crud->sm_vr_server($params);
                    echo (!empty($checker)) ? json_encode(['Response' => number_format($checker[0]['last_year'],2)]) : json_encode(['Response' => 0]);
                } catch (PDOException $e) {
                    echo json_encode([['MESSAGE' => "Connection failed in lastYearTR: " . $conToServer->htmlize($e->getMessage())]]);
                }
                break;
    }
}