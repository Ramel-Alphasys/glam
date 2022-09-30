<?php
require 'database.php';

$conToServer = new ServerCon(['localhost', 3306, 'glamdb', 'root', '']);


if (!empty($_POST['TYPE'])) {
    switch ($_POST['TYPE']) {
        case 'userlogin':
            try {
                if (!empty($_POST['g_user']) && !empty($_POST['g_pass'])) {
                    $checker = '';
                    $data = $conToServer->startDb()->prepare('SELECT * FROM g_user WHERE g_username="' . $_POST['g_user'] . '" AND (g_userpass="' . $_POST['g_pass'] . '" OR g_token="' . $_POST['g_pass'] . '") AND gu_type=0 LIMIT 1');
                    $data->execute();
                    $checker = $data->fetchAll();
                }
                echo (!empty($checker)) ? json_encode([['STATUS' => 1, 'USER' => $checker[0]['guId']]]) : json_encode(['STATUS' => 0]);
            } catch (PDOException $e) {
                echo json_encode([['MESSAGE' => "Connection failed: " . $conToServer->htmlize($e->getMessage())]]);
            }
            break;
        case 'resetaccount':
            try {
                $to = $_POST['email']; // this is your Email address
                $from = "ramelTtech@gmail.com"; // this is the sender's Email address
                $checker = '';
                $data = $conToServer->startDb()->prepare('SELECT * FROM g_employee WHERE ge_email="' . $_POST['email'] . '" LIMIT 1');
                $data->execute();
                $checker = $data->fetchAll();
                if (!empty($checker)) {
                    $tokenGenerated = $conToServer->generateRandomString();
                    $conToServer->startDb()->prepare('UPDATE g_user SET g_token="' . $tokenGenerated . '" WHERE guId=' . $checker[0]['ge_guId'])->execute();
                    $first_name = $checker[0]['ge_gname'];
                    $last_name = $checker[0]['ge_sname'];
                    $subject = "Token Access";
                    $message = "Hi " . $first_name . " " . $last_name . ",\n\n This is your token: " . $tokenGenerated . ". Use this to login your account at http:localhost/glamserver/.";
                    $headers = "From:" . $from;
                    mail($to, $subject, $message, $headers);
                    echo json_encode(['STATUS' => "Mail Sent. Please check your email."]);
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
