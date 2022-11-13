<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Profile</title>
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
      <div class="container px-4 py-5">
        <form class="mt-5">
          <div class="d-flex align-items-center justify-content-between border-bottom">
            <h2 class="pb-2">Profile</h2>
            <div class="">
              <button type="submit" class="btn btn-sm border shadow-sm form-control">Save Changes</button>
            </div>
          </div>
          <h5 class="ms-4 me-4 mt-4 pb-2">Your Information</h5>
          <div class="row m-4">
            <div class="col">
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatFnam" placeholder="First Name" value="Metz" required>
                <label for="floatFnam">First Name</label>
              </div>
            </div>
            <div class="col">
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatLnam" placeholder="Last Name" value="Tamz" required>
                <label for="floatLnam">Last Name</label>
              </div>
            </div>
          </div>
          <div class="row m-4">
            <div class="col">
              <div class="form-floating mb-3">
                <input type="tel" class="form-control" id="floatPhone" required placeholder="Phone" required>
                <label for="floatPhone">Phone</label>
              </div>
            </div>
            <div class="col">
              <div class="form-floating mb-3">
                <input type="email" class="form-control" id="floatEmail" placeholder="Email" value="test@test.com" required>
                <label for="floatEmail">Email</label>
              </div>
            </div>
          </div>
          <h5 class="ms-4 me-4 pb-2">Your Address</h5>
          <div class="row m-4">
            <div class="col">
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatStreet" placeholder="Street">
                <label for="floatStreet">Street</label>
              </div>
            </div>
          </div>
          <div class="row m-4">
            <div class="col">
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatBrgy" placeholder="Barangay">
                <label for="floatBrgy">Barangay</label>
              </div>
            </div>
            <div class="col">
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatCity" placeholder="City/Municipality">
                <label for="floatCity">City/Municipality</label>
              </div>
            </div>
            <div class="col">
              <div class="form-floating mb-3">
                <input type="text" class="form-control" id="floatProvince" placeholder="Province">
                <label for="floatProvince">Province</label>
              </div>
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
