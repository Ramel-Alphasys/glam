<?php
  require 'glamserver\assets\php\database.php';
  require 'glamserver\assets\php\CRUD.php';
  $crud = new serverManipulation();
  $serverConn  = new ServerCon(['localhost', 3306, 'glamdb', 'Metx', '(sX6j8k_GQ07uw*1']);

  $params = array(
    'fields' => '*',
    'table' => 'g_product',
    'filter' => "gpId='${_GET['Product']}'",
    'dbcon' => $serverConn
  );
  $response = $crud->sm_vr_server($params);
  $res = $response[0];
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Item Detail</title>
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
      <div class="container">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="card border-0 mb-3">
          <div id="ItemPreview" class="carousel slide carousel-fade m-5" data-bs-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active" data-bs-interval="1000">
                <img src="assets/img/img1.png" class="d-block rounded w-100" alt="..." style="height: 540px;">
              </div>
              <div class="carousel-item" data-bs-interval="1000">
                <img src="assets/img/img3.png" class="d-block rounded w-100" alt="..." style="height: 540px;">
              </div>
              <div class="carousel-item" data-bs-interval="1000">
                <img src="assets/img/img1.png" class="d-block rounded w-100" alt="..." style="height: 540px;">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#ItemPreview" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#ItemPreview" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
          <div class="card-body">
            <h5 class="card-title me-5 ms-5"><?php echo $res['gp_name'] ?></h5><br>
            <p class="card-text me-5 ms-5"><?php echo $res['gp_description'] ?></p>
            <!-- <p class="card-text"><small class="text-muted"><?php echo $res['gp_type']; ?> occasion</small></p> -->
          </div>
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
