<?php 

     require '..\..\glamserver\assets\php\database.php';
     require '..\..\glamserver\assets\php\CRUD.php';
     $crud = new serverManipulation();
     $serverConn  = new ServerCon(['localhost', 3306, 'glamdb', 'Metx', '(sX6j8k_GQ07uw*1']);

     if(isset($_POST['submit'])) {
          $params = array(
               "fields" => 
               "`gc_gname`='"+$_POST["gname"]+
               "', `gc_sname`='"+$_POST["sname"]+
               "', `gc_p_m_number`='"+$_POST["mobile"]+
               "', `gc_email`='"+$_POST["email"]+
               "', `gc_address`='"+$_POST["street"]+", "+ $_POST["brgy"]+", "+$_POST["city"]+", "+$_POST["province"],
               "table" => 'g_customer',
               "dbcon" => $serverConn
          );

          $response = $crud->sm_ur_server($params);
     }

