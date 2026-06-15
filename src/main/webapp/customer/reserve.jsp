<%@page import="java.sql.*"%>
<%@page import="com.rms.utility.DBConnection"%>

<%
String userEmail =
        (String) session.getAttribute("userEmail");

/* ================= LOGIN CHECK ================= */

if(userEmail == null){

    response.sendRedirect("../auth/login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Book a Table | Savora</title>

<!-- Bootstrap -->

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
	background: #f5f5f5;
}

/* HERO */
.reservation-hero {
	height: 45vh;
	background: linear-gradient(rgba(0, 0, 0, 0.65), rgba(0, 0, 0, 0.65)),
		url('https://images.unsplash.com/photo-1517248135467-4c7edcad34c4');
	background-size: cover;
	background-position: center;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	color: white;
}

.reservation-hero h1 {
	font-size: 58px;
	font-weight: 700;
}

.reservation-hero p {
	font-size: 20px;
	margin-top: 15px;
}

/* CARD */
.reservation-card {
	border: none;
	border-radius: 20px;
	overflow: hidden;
}

/* FORM */
.form-control {
	height: 52px;
	border-radius: 10px;
}

textarea.form-control {
	height: auto;
}

.form-label {
	font-weight: 600;
	margin-bottom: 10px;
}

/* BUTTON */
.reserve-btn {
	height: 55px;
	border-radius: 10px;
	font-size: 18px;
	font-weight: 600;
}

/* INFO CARD */
.info-card {
	background: #111827;
	color: white;
	border-radius: 20px;
	padding: 40px;
	height: 100%;
}

.info-card i {
	font-size: 40px;
	color: #f59e0b;
}

.info-card h3 {
	margin-top: 20px;
	font-weight: 700;
}

.info-card p {
	margin-top: 15px;
	line-height: 1.8;
	color: #d1d5db;
}

/* TITLE */
.page-title {
	font-size: 42px;
	font-weight: 700;
	color: #111827;
}

.alert {
	border-radius: 15px;
	padding: 20px;
	font-weight: 600;
}
</style>

</head>

<body>

	<!-- NAVBAR -->

	<%@ include file="../common/customernavbar.jsp"%>

	<!-- HERO SECTION -->

	<section class="reservation-hero">
		<div>
			<h1>Book Your Table</h1>
			<p>Reserve your favorite table instantly for family dinners,
				celebrations, and special occasions at Savora.</p>
		</div>
	</section>

	<!-- RESERVATION SECTION -->

	<div class="container py-5">

		<div class="text-center mb-5">

			<h2 class="page-title">Book a Table</h2>

		</div>

		<div class="row g-5">

			<!-- RESERVATION FORM -->

			<div class="col-lg-7">

				<div class="card shadow reservation-card p-4">

					<h3 class="mb-4 fw-bold">Table Reservation Details</h3>

					<form action="../reservation" method="post">

						<div class="row">

							<!-- CUSTOMER NAME -->

							<div class="col-md-6 mb-4">

								<label class="form-label"> Full Name </label> <input
									type="text" name="customerName" class="form-control"
									placeholder="Enter Your Name" required>

							</div>

							<!-- PHONE -->

							<div class="col-md-6 mb-4">

								<label class="form-label"> Phone Number </label> <input
									type="text" name="phone" class="form-control"
									placeholder="Enter Phone Number" required>

							</div>

						</div>

						<div class="row">

							<!-- PERSONS -->

							<div class="col-md-6 mb-4">

								<label class="form-label"> Guests </label> <input
									type="number" name="persons" class="form-control"
									placeholder="Enter Persons Count" min="1" required>

							</div>

							<!-- DATE -->

							<div class="col-md-6 mb-4">

								<label class="form-label"> Date </label> <input
									type="date" name="date" class="form-control" required>

							</div>

						</div>

						<div class="row">

							<!-- TIME -->

							<div class="col-md-6 mb-4">

								<label class="form-label"> Time </label> <input
									type="time" name="time" class="form-control" required>

							</div>

							<!-- TABLE TYPE -->

							<div class="col-md-6 mb-4">

								<label class="form-label"> Table Type </label> <select
									name="tableType" class="form-select form-control" required>
									<option value="">Select Table Type</option>
									<option value="Family Table">Family</option>
									<option value="Couple Table">Couple</option>
									<option value="VIP Table">VIP</option>
									<option value="Birthday Table">Birthday</option>
								</select>

							</div>

						</div>

						<!-- SPECIAL MESSAGE -->

						<div class="mb-4">

							<label class="form-label"> Special Requests (Optional) </label>

							<textarea name="message" rows="5" class="form-control"
								placeholder="Birthday celebration, window seat, decorations etc."></textarea>

						</div>

						<!-- BUTTON -->

						<button type="submit" class="btn btn-dark w-100 reserve-btn">

							<i class="bi bi-calendar-check-fill"></i> Confirm Booking

						</button>

					</form>

				</div>

			</div>

			<!-- SIDE INFO -->

			<div class="col-lg-5">

				<div class="info-card shadow">

					<i class="bi bi-cup-hot-fill"></i>

					<h3>Experience Premium Dining Experience</h3>

					<p>Reserve tables for family dinners, birthdays, business meetings,
    romantic evenings, and special occasions at Savora.</p>

					<hr class="my-4">

					<h5 class="fw-bold">Opening Hours</h5>

					<p>

						Monday - Sunday <br> 10:00 AM - 11:00 PM

					</p>

					<hr class="my-4">

					<h5 class="fw-bold">Need Help?</h5>

					<p>

						+91 9381705449 <br> support@savora.com

					</p>

				</div>

			</div>

		</div>

	</div>

	<%
String reservationStatus = null;

try{

	Connection conn =
	DBConnection.getConnection();

	String sql =
	"SELECT reservation_status " +
	"FROM reservations r " +
	"JOIN users u ON r.user_id=u.user_id " +
	"WHERE u.email=? " +
	"ORDER BY reservation_id DESC LIMIT 1";

	PreparedStatement ps =
	conn.prepareStatement(sql);

	ps.setString(1,userEmail);

	ResultSet rs =
	ps.executeQuery();

	if(rs.next()){

		reservationStatus =
		rs.getString("reservation_status");
	}

}catch(Exception e){

	e.printStackTrace();
}
%>

	<% if(reservationStatus != null){ %>

	<div class="container mt-4">

		<% if("CONFIRMED".equalsIgnoreCase(reservationStatus)){ %>

		<div class="alert alert-success text-center shadow">

			<h4>

				<i class="bi bi-check-circle-fill"></i> Your reservation is confirmed

			</h4>

		</div>

		<% } else if("PENDING".equalsIgnoreCase(reservationStatus)){ %>

		<div class="alert alert-warning text-center shadow">

			<h4>

				<i class="bi bi-hourglass-split"></i> Your reservation is awaiting approval

			</h4>

		</div>

		<% } else if("CANCELLED".equalsIgnoreCase(reservationStatus)){ %>

		<div class="alert alert-danger text-center shadow">

			<h4>

				<i class="bi bi-x-circle-fill"></i> Your reservation has been cancelled
			</h4>

		</div>

		<% } %>

	</div>

	<% } %>

	<!-- FOOTER -->

	<%@ include file="../common/footer.jsp"%>

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>