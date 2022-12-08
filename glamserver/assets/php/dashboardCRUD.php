<?php
/**
 * @ Name:
 * @ Author: Ramel Niño O. Empleo
 * @ Create Time: 2022-11-15 20:50:08
 * @ Modified by: Ramel Niño O. Empleo
 * @ Modified time: 2022-12-08 17:48:23
 * @ Description:
 */

require 'database.php';
require 'CRUD.php';

$crud = new serverManipulation();

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
        case 'thisYearCR':
            try {
                $params = array(
                    'fields' => 'SUM(total_this_year) AS this_year',
                    'table' => 'gv_dashboard_on_cancel_c',
                    'dbcon' => $conToServer
                );
                $checker = $crud->sm_vr_server($params);
                echo (!empty($checker)) ? json_encode(['Response' => number_format($checker[0]['this_year'],2)]) : json_encode(['Response' => 0]);
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in thisYearCR: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
        case 'lastYearCR':
            try {
                $params = array(
                    'fields' => 'SUM(total_last_year) AS last_year',
                    'table' => 'gv_dashboard_on_cancel_l',
                    'dbcon' => $conToServer
                );
                $checker = $crud->sm_vr_server($params);
                echo (!empty($checker)) ? json_encode(['Response' => number_format($checker[0]['last_year'],2)]) : json_encode(['Response' => 0]);
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in lastYearCR: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
        case 'overDue':
            try {
                $params = array(
                    'fields' => 'SUM(over_due) AS over_due',
                    'table' => 'gv_dashboard_on_due_date',
                    'dbcon' => $conToServer
                );
                $checker = $crud->sm_vr_server($params);
                echo (!empty($checker)) ? json_encode(['Response' => number_format($checker[0]['over_due'],2)]) : json_encode(['Response' => 0]);
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in overDue: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
        case 'newTrasac':
            try {
                $params = array(
                    'fields' => 'SUM(pending_count) AS pending_count',
                    'table' => 'gv_dashboard_new',
                    'dbcon' => $conToServer
                );
                $checker = $crud->sm_vr_server($params);
                echo (!empty($checker)) ? json_encode(['Response' => number_format($checker[0]['pending_count'],2)]) : json_encode(['Response' => 0]);
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in newTrasac: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
        case 'stillDue':
            try {
                $params = array(
                    'fields' => 'SUM(still_due) AS still_due',
                    'table' => 'gv_dashboard_still_on_due_date',
                    'dbcon' => $conToServer
                );
                $checker = $crud->sm_vr_server($params);
                echo (!empty($checker)) ? json_encode(['Response' => number_format($checker[0]['still_due'],2)]) : json_encode(['Response' => 0]);
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed in stillDue: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
    }
}
