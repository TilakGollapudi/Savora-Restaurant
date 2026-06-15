<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Login - Restaurant System</title>

<!-- Bootstrap -->

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{
	background:#f5f5f5;
}

/* LOGIN SECTION */

.login-section{
	min-height:85vh;
	display:flex;
	justify-content:center;
	align-items:center;
	padding:40px 15px;
}

.login-card{
	width:100%;
	max-width:450px;
	background:white;
	padding:40px;
	border-radius:18px;
	border:none;
}

.login-title{
	text-align:center;
	font-size:38px;
	font-weight:700;
	color:#111827;
	margin-bottom:10px;
}

.login-subtitle{
	text-align:center;
	color:#6b7280;
	margin-bottom:35px;
}

.form-label{
	font-weight:500;
	margin-bottom:8px;
}

.form-control{
	height:52px;
	border-radius:10px;
}

/* LOGIN PAGE BUTTON */

.signin-page-btn{
	width:100%;
	height:50px;
	border:none;
	border-radius:10px;
	font-size:17px;
	font-weight:500;
	background:#111827;
	color:white;
	cursor:pointer;
	transition:0.3s;
}

.signin-page-btn:hover{
	background:#000000;
	color:white;
}

/* REGISTER LINK */

.register-link{
	text-align:center;
	margin-top:20px;
}

.register-link a{
	text-decoration:none;
	color:#111827;
	font-weight:600;
}

.register-link a:hover{
	color:#ffc107;
}

</style>

</head>

<body>

<!-- NAVBAR -->

<%@ include file="../common/navbar.jsp"%>

<!-- LOGIN -->

<section class="login-section">

	<div class="card shadow-sm login-card">

		<h2 class="login-title">

			Welcome Back

		</h2>

		<p class="login-subtitle">

			Login to continue your food journey

		</p>

<%
String error =
(String)request.getAttribute("error");

if(error != null){
%>

		<div class="alert alert-danger">

			<%= error %>

		</div>

<%
}
%>

		<form action="<%=request.getContextPath()%>/login"
			  method="post">

			<!-- EMAIL -->

			<div class="mb-3">

				<label class="form-label">

					Email Address

				</label>

				<input type="email"
					   name="email"
					   class="form-control"
					   placeholder="Enter your email"
					   required>

			</div>

			<!-- PASSWORD -->

			<div class="mb-4">

				<label class="form-label">

					Password

				</label>

				<input type="password"
					   name="password"
					   class="form-control"
					   placeholder="Enter your password"
					   required>

			</div>

			<!-- SIGN IN BUTTON -->

			<button type="submit"
					class="signin-page-btn">

				Sign In

			</button>

		</form>

		<div class="register-link">

			Don't have an account?

			<a href="register.jsp">

				Sign Up

			</a>

		</div>

	</div>

</section>

<!-- FOOTER -->

<%@ include file="../common/footer.jsp"%>

<!-- Bootstrap JS -->

<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>