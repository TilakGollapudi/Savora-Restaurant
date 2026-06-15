<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Register - Restaurant System</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>

body{
	background:#f5f5f5;
}

/* REGISTER SECTION */

.register-section{
	padding:20px 15px 40px;
}

/* CARD */

.register-card{
	max-width:600px;
	margin:auto;
	background:white;
	padding:40px;
	border-radius:18px;
	border:none;
}

/* TITLE */

.register-title{
	text-align:center;
	font-size:38px;
	font-weight:700;
	color:#111827;
	margin-bottom:10px;
}

.register-subtitle{
	text-align:center;
	color:#6b7280;
	margin-bottom:35px;
}

/* FORM */

.form-label{
	font-weight:500;
	margin-bottom:8px;
}

.form-control{
	border-radius:10px;
	height:52px;
}

textarea.form-control{
	height:auto;
}

/* SIGN UP BUTTON */

/* SIGN UP BUTTON */
button.register-btn{
	width:100%;
	height:50px;
	border:1px solid #111827 !important;
	border-radius:10px;
	font-size:17px;
	font-weight:600;
	background-color:#111827 !important;
	color:#ffffff !important;
	box-shadow:none !important;
	outline:none !important;
	transition:all 0.3s ease;
}

/* HOVER */
button.register-btn:hover{
	background-color:#000000 !important;
	border-color:#000000 !important;
	color:#ffffff !important;
}

/* FOCUS */
button.register-btn:focus,
button.register-btn:active{
	background-color:#000000 !important;
	border-color:#000000 !important;
	color:#ffffff !important;
	box-shadow:none !important;
}
/* LOGIN LINK */

.login-link{
	text-align:center;
	margin-top:20px;
}

.login-link a{
	text-decoration:none;
	color:#111827;
	font-weight:600;
}

.login-link a:hover{
	color:#ffc107;
}

</style>

</head>

<body>

<!-- NAVBAR -->

<%@ include file="../common/navbar.jsp"%>

<!-- REGISTER -->

<section class="register-section">

	<div class="card shadow-sm register-card">

		<h2 class="register-title">
			Create Account
		</h2>

		<p class="register-subtitle">
			Join and enjoy delicious meals online
		</p>

		<form action="<%=request.getContextPath()%>/register"
			  method="post">

			<!-- FULL NAME -->

			<div class="mb-3">

				<label class="form-label">
					Full Name
				</label>

				<input type="text"
					   name="fullName"
					   class="form-control"
					   placeholder="Enter your full name"
					   required>

			</div>

			<!-- EMAIL -->

			<div class="mb-3">

				<label class="form-label">
					Email
				</label>

				<input type="email"
					   name="email"
					   class="form-control"
					   placeholder="Enter your email"
					   required>

			</div>

			<!-- PHONE -->

			<div class="mb-3">

				<label class="form-label">
					Phone Number
				</label>

				<input type="text"
					   name="phone"
					   class="form-control"
					   placeholder="Enter your phone number"
					   required>

			</div>

			<!-- ADDRESS -->

			<div class="mb-3">

				<label class="form-label">
					Address
				</label>

				<textarea name="address"
						  class="form-control"
						  rows="3"
						  placeholder="Enter your address"
						  required></textarea>

			</div>

			<!-- PASSWORD -->

			<div class="mb-4">

				<label class="form-label">
					Password
				</label>

				<input type="password"
					   name="password"
					   class="form-control"
					   placeholder="Create password"
					   required>

			</div>

			<!-- BUTTON -->

			<button type="submit"
					class="btn register-btn">

				Sign Up

			</button>

		</form>

		<div class="login-link">

			Already have an account?

			<a href="login.jsp">
				Sign In
			</a>

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