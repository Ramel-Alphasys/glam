<?php

/**
 * @ Name: Product.php
 * @ Purpose: file contains the connection from database to system
 * @ Author: Metz Tamz
 * 
 */

require 'glamserver\assets\php\database.php';
require 'glamserver\assets\php\CRUD.php';
$crud = new serverManipulation();
$serverConn  = new ServerCon(['localhost', 3306, 'glamdb', 'glam', '-TEnT3pf_-JqPbX*']);

if(isset($_GET['sort'])){
  $sorting = $_GET['sort'];
  $params = array(
    'fields' => '*',
    'table' => 'g_product',
    'filter' => ' WHERE `gp_type` LIKE "'.$sorting.'"',
    'dbcon' => $serverConn
  );
} else {
  $params = array(
    'fields' => '*',
    'table' => 'g_product',
    'dbcon' => $serverConn
  );
}
$response = $crud->sm_vr_server($params);
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Product</title>
  <link href="assets/css/bootstrap.min.css" rel="stylesheet">
  <script src="assets/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <link href="css/cstmProd.css" rel="stylesheet">
</head>

<body>
  <header>
    <nav>
      <div class="menu-icon">
        <i class="fa fa-bars fa-2x"></i>
      </div>
      <div class="logo">
        <a class="nav-link" href="index.php">Glamorouza</a>
      </div>
      <div class="menu">
        <ul>
          <li><a href="Order.php">My Order</a></li>
          <li><a href="Product.php">Products</a></li>
          <li><a href="Profile.php"><i class="p-2 fa fa-user-o border text-info rounded-circle"></i></a></li>
        </ul>
      </div>
    </nav>
  </header>
  <main>
    <div class="breakline-spacer">
      <br>
      <br>
      <br>
      <br>
    </div>
    <div class="container px-4 py-5" id="custom-cards">
      <h2 class="pb-2 border-bottom">Products</h2>
      <div class="row row-cols-1 row-cols-lg-3 align-items-stretch g-4 py-5">
        <?php if( gettype($response) != 'NULL') {?>
          <?php foreach ($response as $resp) { ?>
            <a href="<?php echo 'Detail.php?Product=' . $resp['gpId'] ?>" class="col text-decoration-none">
              <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" style="<?php echo "background-image: url('glamserver/assets/contents/".$resp['gp_product_img']."');" ?>">
                <div class="d-flex flex-column h-100 p-3 text-shadow-1">
                  <ul class="d-flex list-unstyled">
                    <li class="d-flex align-items-center">
                      <?php if ($resp['gp_count'] > 0) { ?>
                        <span class="shadow-sm badge text-bg-light opacity-75 p-2 text-success">Available <i class="fa fa-check" aria-hidden="true"></i></span>
                      <?php } else { ?>
                        <span class="shadow-sm badge text-bg-light opacity-75 p-2 text-danger">Available <i class="fa fa-times" aria-hidden="true"></i></span>
                      <?php } ?>
                    </li>
                  </ul>
                  <h2 class="mt-5 mb-4 display-7 lh-base">
                    <span class="text-bg-dark bg-opacity-10"><?php echo $resp['gp_name'] ?></span>
                  </h2>
                </div>
              </div>
            </a>
          <?php }; 
        };
        if( gettype($response) == 'NULL') {?>
          <p>No Product to show.</p>
        <?php }; ?>
        <!-- <a href="Detail.php?" class="col text-decoration-none">
            <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 shadow-lg" style="background-image: url('assets/img/img5.png');">
              <div class="d-flex flex-column h-100 p-3 text-shadow-1">
                <ul class="d-flex list-unstyled ">
                  <li class="d-flex align-items-center">
                    <span class="shadow-sm badge text-bg-light opacity-75 p-2 text-danger">Available <i class="fa fa-times" aria-hidden="true"></i></span>
                  </li>
                </ul>
                <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">Another longer title belongs here</h2>
              </div>
            </div>
          </a> -->
      </div>
    </div>
  </main>
</body>
<script type="text/javascript">
  $(document).ready(function() {
    $(".menu-icon").on("click", function() {
      $("nav ul").toggleClass("showing");
    });
  });
</script>

</html>