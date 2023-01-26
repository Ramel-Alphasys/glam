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
		'table' => 'g_customer',
		'filter' => 'WHERE gc_guId= '.$userId,
		'dbcon' => $serverConn
	);
	$information = $crud->sm_vr_server($params);
	$info = $information[0];
	$cus_add = explode(',',$info['gc_address']);
	$street = "";
	$brgy = "";
	$city = "";
	$province = "";
	if($info['gc_address'] != '') {
		if($cus_add[0] != "" ) {
			$street = $cus_add[0];
		}
		if($cus_add[1] != "" ) {
			$brgy = $cus_add[1];
		}
		if($cus_add[2] != "" ) {
			$city = $cus_add[2];
		}
		if($cus_add[3] != "" ) {
			$province = $cus_add[3];
		}
	}

?>
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
				<form action="assets\php\updateInfo.php" method="POST" class="mt-5">
					<div class="d-flex align-items-center justify-content-between border-bottom">
						<h2 class="pb-2">Profile</h2>
						<div class="">
						<input type="submit" name="submit" class="btn btn-sm border shadow-sm form-control" value="Save Changes">
						</div>
					</div>
					<input type="hidden" name="gc_id" value="<?php echo $info['gcId']; ?>">
					<h5 class="ms-4 me-4 mt-4 pb-2">Your Information</h5>
					<div class="row m-4">
						<div class="col">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" name="gname" id="floatFnam" placeholder="First Name" value="<?php echo $info['gc_gname']; ?>" required>
								<label for="floatFnam">First Name</label>
							</div>
						</div>
						<div class="col">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" name="sname" id="floatLnam" placeholder="Last Name" value="<?php echo $info['gc_sname']; ?>" required>
								<label for="floatLnam">Last Name</label>
							</div>
						</div>
					</div>
					<div class="row m-4">
						<div class="col">
							<div class="form-floating mb-3">
								<input type="tel" maxlength="12" class="form-control" name="mobile" id="floatPhone" value="<?php echo $info['gc_p_m_number']; ?>" required placeholder="Mobile" required>
								<label for="floatPhone">Phone</label>
							</div>
						</div>
						<div class="col">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" name="email" id="floatEmail" placeholder="Email" value="<?php echo $info['gc_email']; ?>" required>
								<label for="floatEmail">Email</label>
							</div>
						</div>
					</div>
					<h5 class="ms-4 me-4 pb-2">Your Address</h5>
					<div class="row m-4">
						<div class="col">
							<div class="form-floating mb-3">
								<input type="text" name="street" class="form-control" id="floatStreet" placeholder="Street" value="<?php echo $street; ?>" required>
								<label for="floatStreet">Street</label>
							</div>
						</div>
					</div>
					<div class="row m-4">
						<div class="col">
							<div class="form-floating mb-3">
								<input type="text" name="brgy" class="form-control" id="floatBrgy" placeholder="Barangay" value="<?php echo $brgy; ?>" required>
								<label for="floatBrgy">Barangay</label>
							</div>
						</div>
						<div class="col">
							<div class="form-floating mb-3">
								<input type="text" name="city" class="form-control" id="floatCity" placeholder="City/Municipality" value="<?php echo $city; ?>" required>
								<label for="floatCity">City/Municipality</label>
							</div>
						</div>
						<div class="col">
							<div class="form-floating mb-3">
								<input type="text" name="province" class="form-control" id="floatProvince" placeholder="Province" value="<?php echo $province; ?>" required>
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
			} else {
				$('nav').removeClass('black');
			}
		});
	</script>
</html>
