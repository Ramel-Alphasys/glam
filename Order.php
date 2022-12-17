<?php
require 'glamserver\assets\php\database.php';
require 'glamserver\assets\php\CRUD.php';
$crud = new serverManipulation();
$serverConn  = new ServerCon(['localhost', 3306, 'glamdb', 'Metx', '(sX6j8k_GQ07uw*1']);

$params = array(
  'fields' => '*',
  'table' => 'g_transactions',
  'dbcon' => $serverConn
);

$orderlist = $crud->sm_vr_server($params);

?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Order</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="css/cstmOrder.css" rel="stylesheet">
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
      <div class="breakline-spacer">
          <br>
          <br>
          <br>
          <br>
      </div>
      <div class="container px-4 py-5">
        <h2 class="pb-2 border-bottom mb-5">Order</h2>
        <div class="container">
          <?php foreach ($orderlist as $order) { ?>
            <div class="card shadow-sm w-100 mb-3" data-bs-toggle="modal" data-bs-target="#Ordr1">
              <div class="card-body">
                <div class="float-start text-truncate">
                  Order #1
                </div>
                <div class="float-end">
                  <span class="text-muted">View Order</span>&nbsp;&nbsp;<i class="fa fa-arrow-right"></i>
                </div>
              </div>
            </div>
          <?php } ?>
          <!-- <div class="card shadow-sm w-100 mb-3" data-bs-toggle="modal" data-bs-target="#Ordr2">
            <div class="card-body">
              <div class="float-start text-truncate">
                Order #2
              </div>
              <div class="float-end">
                <span class="text-muted">View Order</span>&nbsp;&nbsp;<i class="fa fa-arrow-right"></i>
              </div>
            </div>
          </div> -->
        </div>
        <!-- Modal -->
        <div class="modal fade" id="Ordr1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="Order1" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title text-black-50" id="Order1">Order #17183091765</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <div class="container">
                  <div class="d-flex p-2 shadow rounded order-det">
                    <div class="">
                      <img src="assets/img/img1.png" class="img-fluid shadow rounded" alt="" width="200" height="200">
                    </div>
                    <div class="ps-3">
                      <ul>
                        <h3>Wedding Package #10 <label class="text-muted align-text-bottom fs-5">₱ 1,000</label></h3>
                        <li class="fst-italic fw-light">Simple design with elegant look.</li>
                        <li class="fst-italic fw-light">Color combination of black and white motif</li>
                        <li class="fst-italic fw-light">Easy and neat design</li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="container w-100 mt-5 mb-3">
                  <div class="d-flex justify-content-center m-3">
                    <div class="cstm-card f2-bold me-3" id="gcashMode">
                      Gcash
                    </div>
                    <div class="cstm-card f2-bold" id="codMode">
                      Cash On Delivery
                    </div>
                  </div>
                </div>
                <div class="form invisible d-none" id="gcashForm">
                  <div class="container">
                    Gcash
                  </div>
                </div>
                <div class="form invisible d-none" id="codForm">
                  <div class="container">
                    <div class="form-check shadow-sm p-3 rounded">
                      <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" id="defaultAddressSelect">
                        <label class="form-check-label" for="defaultAddressSelect">Use Default Address</label>
                      </div>
                    </div>
                    <form class="form">
                      <h5 class="ms-4 me-4 mt-4 pb-2">Shipping Address</h5>
                      <div class="row m-4">
                        <div class="col">
                          <div class="form-floating">
                            <input type="text" class="form-control" id="floatStreet" placeholder="Street" required>
                            <label for="floatStreet">Street</label>
                          </div>
                        </div>
                        <div class="col">
                          <div class="form-floating">
                            <input type="text" class="form-control" id="floatBrgy" placeholder="Barangay" required>
                            <label for="floatBrgy">Barangay</label>
                          </div>
                        </div>
                      </div>
                      <div class="row m-4">
                        <div class="col">
                          <div class="form-floating">
                            <input type="text" class="form-control" id="floatMunicipal" placeholder="Municipality" required>
                            <label for="floatMunicipal">Municipality</label>
                          </div>
                        </div>
                        <div class="col">
                          <div class="form-floating">
                            <input type="text" class="form-control" id="floatProv" placeholder="Province" required>
                            <label for="floatProv">Province</label>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <div class="modal-footer clearfix">
                <div class="float-start">
                  <span class="fw-light">Order Status: </span><span class="text-success fw-semibold">To ship</span>
                </div>
                <div class="float-end">
                  <span class="fw-light">Expected Date: </span><span class="fw-semibold">30 Sept. 2020</span>
                </div>
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

           $("#gcashMode").on("click", function() {
              $("#gcashMode").addClass("active");
              $("#codMode").removeClass("active");
              $("#codForm").addClass("invisible d-none");
              var gch = document.getElementById('gcashMode');
              if(gch.className != 'cstm-card fs-5 f2-bold text-uppercase me-3') {
                $("#gcashForm").removeClass("invisible d-none");
                $("#gcashForm").addClass("visible");
              } else {
                $("#gcashForm").removeClass("visible");
                $("#gcashForm").addClass("invisible d-none");
              }
           });
           $("#codMode").on("click", function() {

              $("#codMode").addClass("active");
              $("#gcashMode").removeClass("active");
              $("#gcashForm").addClass("invisible d-none");

              var cod = document.getElementById('codMode');
              if(cod.className != 'cstm-card fs-5 f2-bold text-uppercase') {
                $("#codForm").removeClass("invisible d-none");
                $("#codForm").addClass("visible");
              } else {
                $("#codForm").removeClass("visible");
                $("#codForm").addClass("invisible d-none");

              }
           });
     });

     // Scrolling Effect

     // $(window).on("scroll", function() {
     //       if($(window).scrollTop()) {
     //             $('nav').addClass('black');
     //       }
     //
     //       else {
     //             $('nav').removeClass('black');
     //       }
     // })
  </script>
</html>
