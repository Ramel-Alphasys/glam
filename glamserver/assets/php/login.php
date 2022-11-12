<?php

/**
 * @ Name: login.php
 * @ Purpose: file contains the connection from database to system
 * @ Author: Ramel Niño O. Empleo
 * @ Create Time: 2022-09-29 22:31:42
 * @ Modified by: Ramel Niño O. Empleo
 * @ Modified time: 2022-10-28 21:43:01
 * @ Change Log:
 */
require 'database.php';
require 'CRUD.php';

$crud = new serverManipulation();

// set here connection to database
$conToServer = new ServerCon([$serverUsed, $databasePort, $databaseUsed, $user, $pass]);

$tokenGenerated = $conToServer->generateRandomString();

if (!empty($_POST['TYPE'])) {
    switch ($_POST['TYPE']) {
        case 'userlogin':
            try {
                if (!empty($_POST['g_user']) && !empty($_POST['g_pass'])) {
                    $params = array(
                        'fields' => '*',
                        'table' => 'g_user',
                        'filter' => "g_username='${_POST['g_user']}' AND (g_userpass='${_POST['g_pass']}' OR g_token='${_POST['g_pass']}') AND gu_type=0 LIMIT 1",
                        'dbcon' => $conToServer
                    );
                    $checker = $crud->sm_vr_server($params);
                }
                echo (!empty($checker)) ? json_encode(array('STATUS' => 1, 'USER' => $checker[0]['guId'])) : json_encode(['STATUS' => 0]);
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
        case 'resetaccount':
            try {
                $params = array(
                    'fields' => '*',
                    'table' => 'g_employee',
                    'filter' => "ge_email = '${_POST['email']}' LIMIT 1",
                    'dbcon' => $conToServer
                );
                $checker = $crud->sm_vr_server($params);
                if (!empty($checker)) {
                    $params = array(
                        'fields' => "g_token='${tokenGenerated}' WHERE guId = {$checker[0]['ge_guId']}",
                        'table' => 'g_user',
                        'dbcon' => $conToServer
                    );
                    if ($crud->sm_ur_server($params) != null) {
                        $params = array(
                            'to' => $_POST['email'],
                            'message' => "Hi {$checker[0]['ge_gname']} {$checker[0]['ge_sname']},\n\n This is your token: ${tokenGenerated}. Use this to login your account at http:localhost/glamserver/.",
                            'subject' => "Token Access",
                            'headers' => "From: ramelTtech@gmail.com",
                            'dbcon' => $conToServer
                        );
                    }
                    echo json_encode($crud->sm_mailing($params));
                    // You can also use header('Location: thank_you.php'); to redirect to another page.
                } else {
                    echo json_encode(['STATUS' => 0]);
                }
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
        case 'clientlogin':
            try {
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
    }
}
