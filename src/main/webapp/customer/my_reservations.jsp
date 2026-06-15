<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Savora | Reservation Confirmed</title>

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
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

.success-section {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 40px;
}

.success-card {
	background: white;
	padding: 50px;
	border-radius: 25px;
	text-align: center;
	max-width: 700px;
	width: 100%;
}

.success-icon {
	font-size: 90px;
	color: #22c55e;
}

.success-title {
	font-size: 42px;
	font-weight: 700;
	color: #111827;
	margin-top: 20px;
}

.success-message {
	font-size: 18px;
	color: #6b7280;
	margin-top: 15px;
	line-height: 1.8;
}

.success-btn {
	margin-top: 30px;
	padding: 12px 30px;
	font-size: 18px;
	border-radius: 10px;
}
</style>

</head>

<body>

	<%@ include file="../common/customernavbar.jsp"%>

	<section class="success-section">

		<div class="card shadow success-card">

			<div class="success-icon">

				<i class="bi bi-check-circle-fill"></i>

			</div>

			<h1 class="success-title">Table Reserved Successfully</h1>

			<p class="success-message">Your table reservation request has
				been submitted successfully. Our team will review and confirm your
				booking shortly.</p>

			<div class="mt-4">

				<span class="badge bg-warning text-dark fs-6"> Status :
					PENDING </span>

			</div>

			<a href="home.jsp" class="btn btn-success success-btn"> <i
				class="bi bi-house-fill"></i> Back To Home

			</a> <a href="viewReservations.jsp" class="btn btn-dark success-btn">

				<i class="bi bi-calendar-check-fill"></i> View Reservations

			</a>

		</div>

	</section>

	<%@ include file="../common/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>
</html>