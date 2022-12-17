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
  $serverConn  = new ServerCon(['localhost', 3306, 'glamdb', 'Metx', '(sX6j8k_GQ07uw*1']);

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
        <div class="container px-4 py-5 mt-1">
            <form action="" method="POST" class="">
                <div class="d-flex align-items-center justify-content-between border-bottom">
                    <h2 class="pb-2">Checkout Details</h2>
                    <div class="">
                    <input type="submit" name="submit" class="btn btn-md border shadow-sm form-control" value="Checkout">
                    </div>
                </div>
                <div class="row m-5">
                    <div class="p-3 shadow rounded">
                        <div class="table-responsive">
                            <table class="table table-borderless">
                                <thead>
                                    <tr>
                                      <th scope="col">Product Name</th>
                                      <th scope="col">Sizing</th>
                                      <th scope="col">Quantity</th>
                                      <th scope="col">Price</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                        <td>Product #1</td>
                                        <td>
                                            <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                            <input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off">
                                            <label class="btn btn-outline-primary" for="btncheck1">Small</label>
                                          
                                            <input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
                                            <label class="btn btn-outline-primary" for="btncheck2">Medium</label>
                                          
                                            <input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
                                            <label class="btn btn-outline-primary" for="btncheck3">Large</label>
                                          
                                            <input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off">
                                            <label class="btn btn-outline-primary" for="btncheck4">XL</label>
                                          </div>
                                        </td>
                                        <td>
                                            <input type="number" aria-label="Quantity" class="form-control">
                                        </td>
                                        <td>P 100</td>
                                    </tr>
                                  </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row m-5">
                    <div class="p-3 shadow-sm rounded">
                        <h5>Payment Method</h5>
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
  });
</script>
</html>