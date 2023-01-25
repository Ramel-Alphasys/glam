<?php 

     require '..\..\glamserver\assets\php\database.php';
     require '..\..\glamserver\assets\php\CRUD.php';
     $crud = new serverManipulation();
     $serverConn  = new ServerCon(['localhost', 3306, 'glamdb', 'glam', '-TEnT3pf_-JqPbX*']);
     $updata = " `gc_gname` = '".$_POST["gname"]."', `gc_sname` = '".$_POST["sname"]."', `gc_p_m_number` = '".$_POST["mobile"]."', `gc_email` = '".$_POST["email"]."', `gc_address` = '".$_POST["street"].", ". $_POST["brgy"].", ".$_POST["city"].", ".$_POST["province"]."'";

     
     if(isset($_POST['submit'])) {
          
          print_r($updata);
          $params = array(
               "fields" => $updata,
               "table" => 'g_customer',
               "filter" =>  '`gcId` ='.$_POST["gc_id"],
               "dbcon" => $serverConn
          );

          $response = $crud->sm_ur_server($params);
          print_r($response);
     }
     header('Location: ..\..\Profile.php');

