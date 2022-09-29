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
             <a class="nav-link" href="index.php">Glamurous</a>
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
          <div class="carousel-item active">
            <img src="assets/img/img1.jpg" class="d-block w-100 img-fluid" alt="...">
          </div>
          <div class="carousel-item">
            <img src="assets/img/img2.jpg" class="d-block w-100 img-fluid" alt="...">
          </div>
          <div class="carousel-item">
            <img src="assets/img/img3.jpg" class="d-block w-100 img-fluid" alt="...">
          </div>
        </div>
        <div class="container">
          <div class="carousel-caption text-start text-dark">
            <h1>Example headline.</h1>
            <p>Some representative placeholder content for the first slide of the carousel.</p>
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

          <div class="col-lg-4">
            <img src="assets/img/img1.png" alt="..." class="bd-placeholder-img rounded-circle" width="140" height="140">
            <h2 class="fw-normal">Product 1</h2>
            <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
            <p><a class="btn btn-dark shadow-sm" href="Product.php">View More Product</a></p>
          </div>

          <div class="col-lg-4">
            <img src="assets/img/img2.png" alt="..." class="bd-placeholder-img rounded-circle" width="140" height="140">
            <h2 class="fw-normal">Product 2</h2>
            <p>Another exciting bit of representative placeholder content. This time, we've moved on to the second column.</p>
            <p><a class="btn btn-dark shadow-sm" href="Product.php">View More Product</a></p>
          </div>

          <div class="col-lg-4">
            <img src="assets/img/img3.png" alt="..." class="bd-placeholder-img rounded-circle" width="140" height="140">
            <h2 class="fw-normal">Product 3</h2>
            <p>And lastly this, the third column of representative placeholder content.</p>
            <p><a class="btn btn-dark shadow-sm" href="Product.php">View More Product</a></p>
          </div>

        </div>
        <hr class="featurette-divider">
        <!-- End-->
        <!-- Featured Content -->

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading fw-normal lh-1">First featurette heading. <span class="text-muted">It’ll blow your mind.</span></h2>
            <p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
          </div>
          <div class="col-md-5">
            <img src="assets/img/img4.png" alt="..." class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto rounded shadow" width="500" height="500">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7 order-md-2">
            <h2 class="featurette-heading fw-normal lh-1">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
            <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
          </div>
          <div class="col-md-5 order-md-1">
            <img src="assets/img/img5.png" alt="" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto rounded shadow" width="500" height="500">
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading fw-normal lh-1">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
            <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
          </div>
          <div class="col-md-5">
            <img src="assets/img/img6.png" alt="" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto rounded shadow" width="500" height="500">
          </div>
        </div>

        <hr class="featurette-divider">

        <!-- End -->

      </div>
      <footer class="container">
        <p><strong>&copy; 2022</strong> Ramel Gwaa Company, Inc. &middot; </p>  <!--<a href="#">Privacy</a> &middot; <a href="#">Terms</a>-->
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
