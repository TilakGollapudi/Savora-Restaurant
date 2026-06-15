<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Order Confirmed | Savora</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>
body {
	background: #f8fafc;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.success-card {
	background: white;
	padding: 60px;
	border-radius: 25px;
	text-align: center;
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
}

.success-icon {
	font-size: 120px;
	color: #22c55e;
}

.success-title {
	font-size: 40px;
	font-weight: 700;
	margin-top: 20px;
}

.success-text {
	color: #6b7280;
	margin-top: 15px;
	margin-bottom: 30px;
}
</style>

</head>

<body>

	<div class="success-card">

		<i class="bi bi-check-circle-fill success-icon"></i>

		<h1 class="success-title">Order Confirmed!</h1>

		<p class="success-text">
			Thank you for ordering with <strong> Savora Restaurant</strong>.<br>
			Your delicious meal is being prepared and will be delivered soon.
		</p>

		<a href="menu.jsp" class="btn btn-success btn-lg"> Continue
			Ordering </a> <a href="orders.jsp"
			class="btn btn-outline-secondary btn-lg"> View My Orders </a>
	</div>

</body>

</html>