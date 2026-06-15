<!-- ========================= home.jsp ========================= -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Savora | Home</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: #f5f5f5;
}

/* HERO SECTION */
.hero-section {
	height: 92vh;
	background: linear-gradient(rgba(0, 0, 0, 0.65), rgba(0, 0, 0, 0.65)),
		url('https://images.unsplash.com/photo-1504674900247-0877df9cc836');
	background-size: cover;
	background-position: center;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	color: white;
	padding: 20px;
}

.hero-content {
	max-width: 850px;
}

.hero-content h1 {
	font-size: 65px;
	font-weight: 700;
	line-height: 1.3;
	margin-bottom: 20px;
}

.hero-content p {
	font-size: 20px;
	line-height: 1.8;
	margin-bottom: 35px;
	color: #f3f4f6;
}

.hero-btn {
	padding: 14px 35px;
	font-size: 17px;
	border-radius: 10px;
	font-weight: 600;
	margin: 10px;
}

/* SECTION TITLE */
.section-title {
	font-size: 42px;
	font-weight: 700;
	color: #111827;
	text-align: center;
	margin-bottom: 50px;
}

/* FEATURE CARD */
.feature-card {
	border: none;
	border-radius: 20px;
	padding: 35px 25px;
	text-align: center;
	transition: 0.3s;
	height: 100%;
	background: white;
}

.feature-card:hover {
	transform: translateY(-8px);
}

.feature-icon {
	font-size: 55px;
	color: #f59e0b;
	margin-bottom: 20px;
}

.feature-card h3 {
	font-size: 25px;
	font-weight: 600;
	margin-bottom: 15px;
	color: #111827;
}

.feature-card p {
	font-size: 15px;
	line-height: 1.8;
	color: #6b7280;
}

/* FOOD SECTION */
.food-card {
	border: none;
	border-radius: 18px;
	overflow: hidden;
	transition: 0.3s;
	height: 100%;
	background: white;
}

.food-card:hover {
	transform: translateY(-8px);
}

.food-card img {
	height: 250px;
	object-fit: cover;
	width: 100%;
}

.food-card .card-body {
	padding: 25px;
}

.food-card h4 {
	font-weight: 600;
	margin-bottom: 10px;
	color: #111827;
}

.food-price {
	font-size: 22px;
	font-weight: 700;
	color: #ef4444;
	margin-bottom: 20px;
}

/* OFFER SECTION */
.offer-section {
	background: #111827;
	color: white;
	padding: 80px 20px;
	text-align: center;
	border-radius: 25px;
}

.offer-section h2 {
	font-size: 48px;
	font-weight: 700;
	margin-bottom: 20px;
}

.offer-section p {
	font-size: 18px;
	color: #d1d5db;
	max-width: 800px;
	margin: auto;
	line-height: 1.8;
}

/* RESERVE CARD */
.reserve-card {
	border: none;
	border-radius: 20px;
	padding: 40px;
	background: white;
}

.reserve-icon {
	font-size: 70px;
	color: #10b981;
	margin-bottom: 20px;
}

/* BUTTONS */
.btn-dark-custom {
	background: #111827;
	color: white;
	border: none;
}

.btn-dark-custom:hover {
	background: #000;
	color: white;
}

.reserve-btn {
	background: #10b981;
	color: white;
	border: none;
	padding: 14px 35px;
	border-radius: 10px;
	font-weight: 600;
	text-decoration: none;
	display: inline-block;
}

.reserve-btn:hover {
	background: #059669;
	color: white;
}
</style>

</head>

<body>

	<!-- NAVBAR -->

	<%@ include file="../common/customernavbar.jsp"%>

	<!-- HERO SECTION -->

	<section class="hero-section">
		<div class="hero-content">
			<h1>Order delicious food from your favorite restaurants</h1>
			<p>Discover delicious meals, book tables instantly, and track
				your orders with a smooth Savora restaurant experience.</p>
			<a href="menu.jsp" class="btn btn-warning hero-btn"> Explore Menu
			</a> <a href="reserve.jsp" class="btn btn-warning hero-btn"> Book
				Table </a>
		</div>
	</section>

	<!-- FEATURES -->

	<section class="container py-5">
		<h2 class="section-title">Why Choose Savora?</h2>
		<div class="row g-4">
			<!-- FEATURE 1 -->

			<div class="col-md-4">
				<div class="card shadow-sm feature-card">
					<div class="feature-icon">
						<i class="bi bi-truck"></i>
					</div>
					<h3>Fast Delivery</h3>
					<p>Enjoy quick and reliable delivery of your favorite meals
						right to your doorstep.</p>
				</div>
			</div>

			<!-- FEATURE 2 -->

			<div class="col-md-4">
				<div class="card shadow-sm feature-card">
					<div class="feature-icon">
						<i class="bi bi-stars"></i>
					</div>
					<h3>Top Quality Food</h3>
					<p>Enjoy hygienic and delicious meals prepared by experienced
						chefs using fresh ingredients.</p>
				</div>
			</div>

			<!-- FEATURE 3 -->

			<div class="col-md-4">
				<div class="card shadow-sm feature-card">
					<div class="feature-icon">
						<i class="bi bi-credit-card-2-front-fill"></i>
					</div>
					<h3>Secure Payments</h3>
					<p>Enjoy safe and seamless payments with multiple trusted
						payment options.</p>
				</div>
			</div>
		</div>
	</section>

	<!-- POPULAR FOOD -->

	<section class="container py-5">
		<h2 class="section-title">Popular Menu Items</h2>

		<div class="row g-4">

			<!-- ITEM 1 -->
			<div class="col-md-4">
				<div class="card shadow food-card">

					<img
						src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd"
						alt="Burger">

					<div class="card-body text-center">
						<h4>Classic Burger</h4>
						<div class="food-price">₹199</div>

						<a href="menu.jsp" class="btn btn-dark-custom w-100 btn">
							Order Now </a>
					</div>

				</div>
			</div>

			<!-- ITEM 2 -->
			<div class="col-md-4">
				<div class="card shadow food-card">

					<img
						src="https://images.unsplash.com/photo-1513104890138-7c749659a591"
						alt="Pizza">

					<div class="card-body text-center">
						<h4>Cheese Pizza</h4>
						<div class="food-price">₹399</div>

						<a href="menu.jsp" class="btn btn-dark-custom w-100 btn">
							Order Now </a>
					</div>

				</div>
			</div>

			<!-- ITEM 3 -->
			<div class="col-md-4">
				<div class="card shadow food-card">

					<img
						src="https://images.unsplash.com/photo-1600891964092-4316c288032e"
						alt="Biryani">

					<div class="card-body text-center">
						<h4>Hyderabadi Biryani</h4>
						<div class="food-price">₹299</div>

						<a href="menu.jsp" class="btn btn-dark-custom w-100 btn">
							Order Now </a>
					</div>

				</div>
			</div>

		</div>
	</section>

	<!-- SPECIAL OFFER -->

	<section class="container py-5">
		<div class="offer-section shadow">
			<h2>Get 25% OFF On Your First Order</h2>
			<p>Enjoy delicious meals, seamless ordering, and smart restaurant
				services with Savora.</p>
			<a href="menu.jsp" class="btn btn-warning hero-btn mt-4"> Start
				Ordering </a>
		</div>
	</section>

	<!-- RESERVATION -->

	<section class="container py-5">
		<h2 class="section-title">Reserve Your Table</h2>
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="card shadow reserve-card text-center">
					<div class="reserve-icon">
						<i class="bi bi-calendar-check-fill"></i>
					</div>
					<h2 class="mb-3">Book Your Table</h2>
					<p class="text-muted mb-4">Reserve tables for family dinners,
						birthday celebrations, and special occasions.</p>
					<div>
						<a href="reserve.jsp" class="reserve-btn btn-lg"> <i
							class="bi bi-calendar2-check-fill"></i> Book Table Now
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- FOOTER -->

	<%@ include file="../common/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>
</html>