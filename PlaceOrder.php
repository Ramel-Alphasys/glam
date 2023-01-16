<?php

/**
 * @ Name: Product.php
 * @ Purpose: file contains the connection from database to system
 * @ Author: Metz Tamz
 * 
 */
session_start();
require 'glamserver\assets\php\database.php';
require 'glamserver\assets\php\CRUD.php';
$crud = new serverManipulation();
$serverConn  = new ServerCon(['localhost', 3306, 'glamdb', 'glam', '-TEnT3pf_-JqPbX*']);

$params = array(
  'fields' => '*',
  'table' => 'g_product',
  'filter' => 'WHERE gpId = ' . $_GET['ProdId'],
  'dbcon' => $serverConn
);
$userId = $_SESSION['userId'];
if ($userId == '') {
  header("Location: glamserver/?mode=client");
  exit;
}

$product = $crud->sm_vr_server($params);
$productName = $product[0]['gp_name'];
$description = $product[0]['gp_description'];
$description = str_replace('{', '', $description);
$description = str_replace('}', '', $description);
$description = explode('":"', $description);
$description[2] = str_replace('"', '', $description[2]);
$description[2] = str_replace('[', '', $description[2]);
$description[2] = str_replace(']', '', $description[2]);
$productSizing = explode(',', $description[2]);
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Checkout</title>
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
      <form action="" method="POST" class="">
        <div class="d-flex align-items-center justify-content-between border-bottom">
          <h2 class="pb-2">Checkout Details</h2>
          <div class="fixed-bottom container shadow-lg border" style="max-width: 50rem; height: 5rem;">
            <div class="row">
              <div class="col text-center pt-4">
                <div class=""=>
                  <input type="submit" name="submit" class="btn btn-md border btn-dark shadow-sm form-control" value="Checkout">
                </div>
              </div>
              <div class="col text-center fs-5 pt-4"></div>
            </div>
          </div>
        </div>
        <div class="row m-5">
          <div class="p-3 shadow rounded">
            <div class="table-responsive">
              <table class="table table-borderless">
                <thead>
                  <tr>
                    <th scope="col">Product Name</th>
                    <th scope="col">Sizes</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><?php echo $productName; ?></td>
                    <td>
                      <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                        <?php
                        foreach ($productSizing as $x => $val) {
                          echo '<input type="checkbox" class="btn-check" id="btncheck' . $x . '" autocomplete="off"><label class="btn btn-outline-primary" for="btncheck' . $x . '">' . $productSizing[$x] . '</label>';
                        }
                        ?>
                      </div>
                    </td>
                    <td>
                      <input type="number" aria-label="Quantity" step="1" value="0" class="form-control">
                    </td>
                    <td>₱ <?php echo $product[0]['gp_price']; ?></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="row m-5">
          <div class="p-3 shadow-sm rounded">
            <div class="form-check form-check-inline">
              <h5>GCash Payment:</h5>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input pay-mod" type="radio" name="paymentMode" id="gcashFull" value="Full">
              <label class="form-check-label" for="gcashFull">Full Payment</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input pay-mod" type="radio" name="paymentMode" id="gcashPartial" value="Partial">
              <label class="form-check-label" for="gcashPartial">Partial Payment</label>
            </div>
          </div>
          <div class="container p-3 d-none" id="payFulGCash">
            <div class="card" style="width: 18rem; height: 18rem;">
              <div class="card-body"><img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="<?php echo '/glam/glamserver/assets/qrcodes/' . $product[0]['gp_gcash_qr']; ?>" /></div>
            </div>
            <div class="mb-3" style="width: 18rem;">
              <label for="gcashReceipt" class="form-label">Upload a copy of payment receipt</label>
              <input class="form-control form-control-sm" id="gcashReceipt" type="file">
            </div>
          </div>
          <div class="container p-3 d-none" id="payParGCash">
            <div class="card" style="width: 18rem; height: 18rem;">
              <div class="card-body">Partial Payment QR!</div>
            </div>
            <div class="mb-3" style="width: 18rem;">
              <label for="gcashReceipt" class="form-label">Upload a copy of payment receipt</label>
              <input class="form-control form-control-sm" id="gcashReceipt" type="file">
            </div>
          </div>
        </div>
        <div class="row m-5">
          <hr>
          <div class="fs-5 fw-semibold mb-2">Terms and conditions</div>
          <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" required title="terms and condition." aria-required="true">
            <p class="form-check-label" for="flexCheckDefault">
              <span>The terms and conditions are in relation to business and work carried out by the Glamorouza Boutique. It shall provide the details of the agreement that is formed between the customer and the glamorouza owner/staff. Upon the rent classified to be approved, it is considered that the customer accepted the terms and condition of the business/company provided. The glamorouza boutique terms and condition are as follows: </span><br>
            <ul class="list-group ps-5 pb-3">
              <li>the customer shall provide accurate information in order to validate the reservation request. In accurate information shall lead to unsuccessful reservation.</li>
              <li>the customer shall provide down payment in order to reserve the selected apparel(s). (Can be online and non- online reservation)</li>
              <li>the Glamorouza boutique only provides 1 to 2 days to return the rented apparel(s).</li>
              <li>returning of apparel(s) with damages shall be charges, and can be discussed by owner and the customer.</li>
              <li>delayed of returning the apparel(s) with it's due date shall be charges 100 each day and each apparel.</li>
              <li>the Glamorouza boutique do not provide delivery. </li>
            </ul>
            <span class="pt-3">The terms and conditions of Glamorouza boutique provides a peaceful agreement and a good service to the customers.</span>
            <br><br>
            </p>
          </div>
        </div>
      </form>
    </div>
  </main>
</body>
<script type="text/javascript">
  $(document).ready(function() {
    $(".menu-icon").on("click", function() {
      $("nav ul").toggleClass("showing");
    });
    $("#gcashFull").on("click", function() {
      $("#payFulGCash").removeClass('d-none')
      $("#payParGCash").addClass('d-none')
    });
    $("#gcashPartial").on("click", function() {
      $("#payFulGCash").addClass('d-none')
      $("#payParGCash").removeClass('d-none')
    });
  });
</script>

</html>