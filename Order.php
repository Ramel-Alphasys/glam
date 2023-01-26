<?php

session_start();
require 'glamserver\assets\php\database.php';
require 'glamserver\assets\php\CRUD.php';
$crud = new serverManipulation();
$serverConn  = new ServerCon(['localhost', 3306, 'glamdb', 'glam', '-TEnT3pf_-JqPbX*']);

$userId = $_SESSION['userId'];
if($userId == '') {
  header("Location: glamserver/?mode=client");
  exit;
}

$params = array(
  'fields' => '*',
  'table' => 'g_transactions',
  'filter' => 'WHERE gt_gcId='.$userId,
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
      <?php if($orderlist != null) {
        foreach ($orderlist as $order) {
      ?>
          <div class="card shadow-sm w-100 mb-3" data-bs-toggle="modal" data-bs-target="<?php echo '#Ordr'. $order['gtId']; ?>">
            <div class="card-body">
              <div class="float-start text-truncate">
                Order #<?php echo $order['gtId']; ?>
              </div>
              <div class="float-end">
                <span class="text-muted">View Order</span>&nbsp;&nbsp;<i class="fa fa-arrow-right"></i>
              </div>
            </div>
          </div>
        <?php };
      } else { ?>
        <p>No order to show.</p>  
      <?php }; ?>
      </div>
      <!-- Modal -->

      <?php if($orderlist != null) {
        foreach ($orderlist as $order) { 
          $prodpar = array(
            'fields' => '*',
            'table' => 'g_product',
            'filter' => 'WHERE gpId='.$order['gt_gpId'],
            'dbcon' => $serverConn
          );
          $prodlst = $crud->sm_vr_server($prodpar);
          $prod = $prodlst[0];

          $custpar = array(
            'fields' => '*',
            'table' => 'g_customer',
            'filter' => 'WHERE gcId='.$order['gt_gcId'],
            'dbcon' => $serverConn
          );
          $custlst = $crud->sm_vr_server($custpar);
          $cust = $custlst[0];
      ?>
            <div class="modal fade" id="<?php echo 'Ordr'. $order['gtId']; ?>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="<?php echo 'Ordr'. $order['gtId']; ?>" aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title text-black-50" id="Order1">Order #<?php echo $order['gtId']; ?></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="container">
                      <div class="d-flex p-2 shadow rounded order-det">
                        <div class="">
                          <img src="glamserver/assets/contents/<?php echo $prod['gp_product_img']; ?>" class="img-fluid shadow rounded" alt="" style="max-width: 200px; max-height: 150px;">
                        </div>
                        <div class="ps-3">
                          <ul>
                            <h5><?php echo $prod['gp_name']; ?> <label class="text-muted align-text-bottom fs-5">₱<?php echo $prod['gp_price']; ?></label></h5>
                            <p class="fst-italic fw-light"><strong>Quantity:</strong> <?php echo $order['gt_items']; ?>&nbsp; <strong>Size:</strong> <?php echo $order['gt_selected_size']; ?></p>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="container w-100 mt-5 mb-3">
                      <h5 class="text-black-100">Payment Type: <?php echo $order['gt_payment_method']; ?></h5>
                    </div>
                    <div class="container mt-5">
                      <h6 class="pb-2 text-black-75">Shipping Address</h6>
                      <p class="fst-italic text-black-50"><?php echo $cust['gc_address']; ?></p>
                    </div>
                  </div>
                  <div class="modal-footer clearfix">
                    <div class="float-start">
                      <span class="fw-light">Order Status: </span><span class="text-success fw-semibold"><?php echo $order['gt_status']; ?></span>
                    </div>
                    <!-- <div class="float-end">
                      <span class="fw-light">Expected Date: </span><span class="fw-semibold">30 Sept. 2020</span>
                    </div> -->
                  </div>
                </div>
              </div>
            </div>
            <?php };
        }; ?>
    </div>
  </main>
</body>
<script type="text/javascript">
  $(document).ready(function() {
    $(".menu-icon").on("click", function() {
      $("nav ul").toggleClass("showing");
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