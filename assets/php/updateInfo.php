<?php 

     require '..\..\glamserver\assets\php\database.php';
     require '..\..\glamserver\assets\php\CRUD.php';
     $crud = new serverManipulation();
     $serverConn  = new ServerCon(['localhost', 3306, 'glamdb', 'Metx', '(sX6j8k_GQ07uw*1']);

     if(isset($_POST['submit'])) {
          $gname = $_POST['g_gname'];
          $sname = $_POST['g_sname'];
          $mobile = $_POST['g_mobile'];
          $email = $_POST['g_email'];
     }

     echo $gname;
     echo $sname;
     echo $mobile;
     echo $email;