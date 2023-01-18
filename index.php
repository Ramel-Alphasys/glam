<?php
require 'glamserver\assets\php\database.php';
require 'glamserver\assets\php\CRUD.php';
$crud = new serverManipulation();
$serverConn  = new ServerCon(['localhost', 3306, 'glamdb', 'glam', '-TEnT3pf_-JqPbX*']);

$params = array(
  'fields' => '*',
  'table' => 'g_product',
  'filter' => 'LIMIT 3',
  'dbcon' => $serverConn
);

$featured = $crud->sm_vr_server($params);

?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/cstmHome.css" rel="stylesheet">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
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
               <!-- <li><a href="index.php">Home</a></li> -->
               <li><a href="Order.php">My Order</a></li>
               <li><a href="Product.php">Products</a></li>
               <li><a href="Profile.php"><i class="p-2 fa fa-user-o border text-info rounded-circle"></i></a></li>
             </ul>
          </div>
       </nav>
    </header>

    <main>
      <div id="myCarousel" class="carousel slide d-none d-sm-block" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active" data-bs-interval="3000">
            <img src="assets/img/img2.jpg" class="d-block w-100 img-fluid" alt="...">
          </div>
          <div class="carousel-item" data-bs-interval="3000">
            <img src="assets/img/imgPlace.jpg" class="d-block w-100 img-fluid" alt="...">
          </div>
          <div class="carousel-item" data-bs-interval="3000">
            <img src="assets/img/img3.jpg" class="d-block w-100 img-fluid" alt="...">
          </div>
        </div>
        <div class="container">
          <div class="carousel-caption text-start text-light bg-dark bg-opacity-50 p-3 rounded">
            <h1>Glamorouza Charlene</h1>
            <p>Wedding full package, Make up for any occasions, wedding, beauty pageant, debut, JS Prom, Acquiantan.</p>
          </div>
        </div>
      </div>
      <div class="breakline-space">
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
      </div>
      <div class="container marketing">
        <!-- Carousel Content-->
        <div class="row">
          <?php if($featured != null) { 
                    foreach($featured as $ft) {
          ?>
            <div class="col-lg-4">
              <img src="<?php echo "glamserver/assets/contents/".$ft['gp_product_img']."" ?>" alt="..." class="bd-placeholder-img rounded-circle" width="140" height="140">
              <p class="mt-3"><a class="btn btn-dark shadow-sm" href="Product.php">View More Product</a></p>
              <h4 class="fw-normal"><?php echo $ft['gp_name']; ?></h4>
            </div>
          <?php };
            }; ?>

        </div>
        <hr class="featurette-divider">
        <!-- End-->
        <!-- Featured Content -->

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading fw-normal lh-1">First feature. <span class="text-muted">Glamorouza will always give you a full service that you will never forget.</span></h2>
            <p class="lead"></p>
          </div>
          <div class="col-md-5">
            <img src="assets/img/imgOwner.jpg" alt="..." class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto rounded shadow" width="500" height="500">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7 order-md-2">
            <h2 class="featurette-heading fw-normal lh-1">Offers, <span class="text-muted">good services and affordable price for all customers.</span></h2>
            <p class="lead">Come visit Glamorouza fashion shop by Charlene Meneses Pahayahay Located @ Purok 3, Upper San Apolinario, Tangub City.</p>
          </div>
          <div class="col-md-5 order-md-1">
            <img src="assets/img/imgPlaceView.jpg" alt="" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto rounded shadow" width="500" height="500">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading fw-normal lh-1">And lastly. <span class="text-muted">Moments.</span></h2>
            <p class="lead">"Capturing the moments of today that will wow your hearts tomorrow." <br> Achieve your dream wedding with us.</p>
          </div>
          <div class="col-md-5">
            <img src="assets/img/imgPrepare.jpg" alt="" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto rounded shadow" width="500" height="200">
          </div>
        </div>

        <hr class="featurette-divider">

        <!-- End -->

      </div>
      <footer class="container">
        <p><strong><?php echo date("Y"); ?> &copy;</strong> Glamurousa &middot; </p>
      </footer>
    </main>
  </body>
  <script type="text/javascript">
    $(document).ready(function() {
           $(".menu-icon").on("click", function() {
                 $("nav ul").toggleClass("showing");
           });
     });

     // Scrolling Effect

     $(window).on("scroll", function() {
           if($(window).scrollTop()) {
                 $('nav').addClass('black');
           }

           else {
                 $('nav').removeClass('black');
           }
     })
  </script>
</html>
