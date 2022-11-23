<?php 

     require '..\..\glamserver\assets\php\database.php';
     require '..\..\glamserver\assets\php\CRUD.php';
     $crud = new serverManipulation();
     $serverConn  = new ServerCon(['localhost', 3306, 'glamdb', 'Metx', '(sX6j8k_GQ07uw*1']);
     $updata = " `gc_gname` = '".$_POST["gname"]."', `gc_sname` = '".$_POST["sname"]."', `gc_p_m_number` = '".$_POST["mobile"]."', `gc_email` = '".$_POST["email"]."', `gc_address` = '".$_POST["street"].", ". $_POST["brgy"].", ".$_POST["city"].", ".$_POST["province"]."' WHERE `g_customer`.`gcId` =".$_POST["gc_id"]." ";
     
     if(isset($_POST['submit'])) {
          
          print_r($updata);
          $params = array(
               "fields" => $updata,
               "table" => 'g_customer',
               "dbcon" => $serverConn
          );

          $response = $crud->sm_ur_server($params);
          print_r($response);
     }
     header('Location: ..\..\Profile.php');

