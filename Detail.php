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
    <link href="css/cstmDet.css" rel="stylesheet">
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
              <li><a href="Profile.php"><i class="p-2 fa fa-user-o border text-info rounded-circle"></i></a></li>
            </ul>
         </div>
      </nav>
    </header>
    <main>
      <div class="container">
        <div class="card m-3 shadow">
          <div class="row g-0 p-3">
            <div class="col-md-4">
              <div id="ItemPreview" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active" data-bs-interval="1500">
                    <img src="assets/img/img1.png" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item" data-bs-interval="1500">
                    <img src="assets/img/img3.png" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item" data-bs-interval="1500">
                    <img src="assets/img/img1.png" class="d-block w-100" alt="...">
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
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>
                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
              </div>
            </div>
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
