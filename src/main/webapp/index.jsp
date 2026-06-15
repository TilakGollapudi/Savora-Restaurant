<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String userEmail = (String) session.getAttribute("userEmail");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Savora Restaurant</title>

<!-- Bootstrap CSS -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap Icons -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<!-- Google Font -->

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
	background: #f8f9fa;
}

/* HERO SECTION */
.hero-section {
	height: 90vh;
	background: linear-gradient(rgba(0, 0, 0, 0.65), rgba(0, 0, 0, 0.65)),
		url('https://images.unsplash.com/photo-1414235077428-338989a2e8c0');
	background-size: cover;
	background-position: center;
	display: flex;
	justify-content: center;
	align-items: center;
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
	margin-bottom: 25px;
}

.hero-content p {
	font-size: 22px;
	line-height: 1.8;
	margin-bottom: 35px;
}

.btn-custom {
	padding: 14px 35px;
	border-radius: 10px;
	font-size: 17px;
	margin: 10px;
	font-weight: 600;
}

/* SECTION TITLE */
.section-title {
	text-align: center;
	font-size: 42px;
	font-weight: 700;
	margin-bottom: 50px;
	color: #111827;
}

/* FEATURE CARDS */
.feature-card {
	border: none;
	border-radius: 18px;
	transition: 0.3s;
	height: 100%;
	padding: 35px 25px;
}

.feature-card:hover {
	transform: translateY(-10px);
}

.feature-icon {
	font-size: 55px;
	color: #f59e0b;
	margin-bottom: 20px;
}

.feature-card h3 {
	font-size: 24px;
	font-weight: 600;
	margin-bottom: 15px;
}

.feature-card p {
	color: #555;
	line-height: 1.8;
}

/* FOOD SECTION */
.food-card {
	border: none;
	border-radius: 18px;
	overflow: hidden;
	transition: 0.3s;
}

.food-card:hover {
	transform: translateY(-10px);
}

.food-card img {
	height: 250px;
	object-fit: cover;
}

.food-card .card-body {
	padding: 25px;
}

.food-card h4 {
	font-weight: 600;
	margin-bottom: 15px;
}

.food-card p {
	font-size: 22px;
	font-weight: 700;
	color: #dc3545;
}

/* RESERVATION */
.reservation-card {
	border: none;
	border-radius: 20px;
}

.form-control, textarea {
	border-radius: 10px;
	height: 50px;
}

textarea {
	height: auto;
}

.form-label {
	font-weight: 500;
	margin-bottom: 10px;
}

/* LOGIN BOX */
.login-box {
	text-align: center;
	padding: 50px 20px;
}

.login-box i {
	font-size: 70px;
	color: #f59e0b;
	margin-bottom: 20px;
}

/* FOOTER SPACE */
.footer-space {
	margin-top: 70px;
}
</style>

</head>

<body>

	<!-- NAVBAR -->

	<%@ include file="common/navbar.jsp"%>

	<!-- HERO SECTION -->

	<section class="hero-section">

		<div class="hero-content">

			<h1>Savora – Where Every Bite Tells a Story</h1>

			<p>Discover the art of fine dining with Savora. Order delicious
				meals online, book tables instantly, and enjoy a seamless, modern
				restaurant experience.</p>

			<a href="./customer/menu.jsp" class="btn btn-warning btn-custom">

				Explore Menu </a> <a href="#reservation"
				class="btn btn-light btn-custom"> Reserve Table </a>

		</div>

	</section>

	<!-- FEATURES -->

	<div class="container py-5">

		<h2 class="section-title">Our Features</h2>

		<div class="row g-4">

			<!-- FEATURE 1 -->

			<div class="col-md-4">

				<div class="card shadow feature-card text-center">

					<div class="feature-icon">

						<i class="bi bi-bag-check-fill"></i>

					</div>

					<h3>Online Food Ordering</h3>

					<p>Discover Savora’s curated menu and enjoy effortless online
						ordering with a fast, seamless, and modern dining experience.</p>
				</div>

			</div>

			<!-- FEATURE 2 -->

			<div class="col-md-4">

				<div class="card shadow feature-card text-center">

					<div class="feature-icon">

						<i class="bi bi-receipt-cutoff"></i>

					</div>

					<h3>Smart Billing</h3>

					<p>Savora ensures fast and secure billing with automatic GST
						and SGST calculations, delivering accurate and hassle-free order
						management.</p>
				</div>

			</div>

			<!-- FEATURE 3 -->

			<div class="col-md-4">

				<div class="card shadow feature-card text-center">

					<div class="feature-icon">

						<i class="bi bi-calendar-check-fill"></i>

					</div>

					<h3>Table Reservations</h3>

					<p>Experience seamless table booking at Savora for family
						dinners, celebrations, meetings, and special occasions with ease
						and instant confirmation.</p>

				</div>

			</div>

		</div>

	</div>

	<!-- POPULAR FOODS -->

	<div class="container py-5">

		<h2 class="section-title">Popular Dishes at Savora</h2>

		<div class="row g-4">

			<!-- FOOD 1 -->
			<div class="col-md-4">

				<div class="card shadow food-card">

					<img
						src="https://brookrest.com/wp-content/uploads/2020/05/AdobeStock_282247995-scaled.jpeg"
						alt="Burger">

					<div class="card-body text-center">

						<h4>Cheese Burger</h4>

						<p>₹199</p>

						<a href="./customer/menu.jsp" class="btn btn-dark w-100">
							Order Now </a>

					</div>

				</div>

			</div>

			<!-- FOOD 2 -->
			<div class="col-md-4">

				<div class="card shadow food-card">

					<img
						src="https://travelhubster.com/wp-content/uploads/2024/06/authentic-italian-pizza.jpg"
						alt="Pizza">

					<div class="card-body text-center">

						<h4>Italian Pizza</h4>

						<p>₹399</p>

						<a href="./customer/menu.jsp" class="btn btn-dark w-100">
							Order Now </a>

					</div>

				</div>

			</div>

			<!-- FOOD 3 -->
			<div class="col-md-4">

				<div class="card shadow food-card">

					<img
						src="https://thumbs.dreamstime.com/b/delicious-biryani-dish-captured-fine-dining-setting-mouthwatering-beautifully-plated-warm-inviting-restaurant-rich-365068527.jpg"
						alt="Biryani">

					<div class="card-body text-center">

						<h4>Chicken Biryani</h4>

						<p>₹299</p>

						<a href="./customer/menu.jsp" class="btn btn-dark w-100">
							Order Now </a>

					</div>

				</div>

			</div>

		</div>

	</div>

	<!-- RESERVATION SECTION -->

	<section class="container py-5" id="reservation">

		<h2 class="section-title">Table Reservation at Savora</h2>

		<div class="row justify-content-center">

			<div class="col-lg-8">

				<div class="card shadow reservation-card p-4">

					<%
                if (userEmail == null) {
                %>

					<!-- LOGIN REQUIRED -->

					<div class="login-box">

						<i class="bi bi-person-lock"></i>

						<h2 class="fw-bold mb-3">Login Required</h2>

						<p class="text-muted mb-4">Please login or create an account
							to reserve your table at Savora.</p>

						<a href="auth/login.jsp" class="btn btn-dark btn-lg me-2">
							Login </a> <a href="auth/register.jsp" class="btn btn-warning btn-lg">
							Register </a>

					</div>

					<%
                } else {
                %>

					<!-- RESERVATION FORM -->

					<form action="reservation" method="post">

						<div class="row">

							<div class="col-md-6 mb-4">
								<label class="form-label">Full Name</label> <input type="text"
									name="customerName" class="form-control"
									placeholder="Enter your full name" required>
							</div>

							<div class="col-md-6 mb-4">
								<label class="form-label">Number of Guests</label> <input
									type="number" name="persons" class="form-control"
									placeholder="e.g. 2, 4, 6" min="1" required>
							</div>

						</div>

						<div class="row">

							<div class="col-md-6 mb-4">
								<label class="form-label">Date</label> <input type="date"
									name="date" class="form-control" required>
							</div>

							<div class="col-md-6 mb-4">
								<label class="form-label">Time</label> <input type="time"
									name="time" class="form-control" required>
							</div>

						</div>

						<div class="mb-4">

							<label class="form-label">Special Requests (Optional)</label>

							<textarea name="message" class="form-control" rows="4"
								placeholder="Birthday celebration, anniversary, window seat, etc."></textarea>

						</div>

						<button type="submit" class="btn btn-dark w-100 py-3">
							Reserve Your Table</button>

					</form>

					<%
                }
                %>

				</div>

			</div>

		</div>

	</section>

	<!-- FOOTER -->

	<div class="footer-space">

		<%@ include file="common/footer.jsp"%>

	</div>

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>

</html>