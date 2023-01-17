<?php

require '..\..\glamserver\assets\php\database.php';
require '..\..\glamserver\assets\php\CRUD.php';
$crud = new serverManipulation();
$serverConn  = new ServerCon(['localhost', 3306, 'glamdb', 'glam', '-TEnT3pf_-JqPbX*']);


echo $_POST['selectedSize'];
