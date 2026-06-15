<%@page import="com.rms.model.User"%>
<%@page import="com.rms.daoimpl.UserDAOImpl"%>
<%@page import="com.rms.dao.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String email = (String) session.getAttribute("userEmail");

User user = null;

if (email != null) {

	UserDAO dao = new UserDAOImpl();

	user = dao.getUserByEmail(email);
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Savora | My Profile</title>

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
	background: #f3f4f6;
}

/* PROFILE SECTION */
.profile-section {
	padding: 70px 15px;
}

/* PROFILE CARD */
.profile-card {
	max-width: 950px;
	margin: auto;
	border: none;
	border-radius: 25px;
	overflow: hidden;
	background: white;
}

/* TOP HEADER */
.profile-header {
	background: linear-gradient(135deg, #111827, #1f2937);
	padding: 50px 30px;
	text-align: center;
	color: white;
	position: relative;
}

/* PROFILE IMAGE */
.profile-avatar {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	background: white;
	color: #111827;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 55px;
	margin: auto;
	margin-bottom: 20px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
}

/* TITLE */
.profile-title {
	font-size: 40px;
	font-weight: 700;
	margin-bottom: 10px;
}

.profile-subtitle {
	font-size: 16px;
	color: #d1d5db;
}

/* PROFILE BODY */
.profile-body {
	padding: 40px;
}

/* INFO CARD */
.info-card {
	background: #f9fafb;
	border-radius: 18px;
	padding: 25px;
	height: 100%;
	border: 1px solid #e5e7eb;
	transition: 0.3s;
}

.info-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.08);
}

/* ICON */
.info-icon {
	width: 60px;
	height: 60px;
	border-radius: 15px;
	background: #111827;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 28px;
	margin-bottom: 20px;
}

/* LABEL */
.info-label {
	font-size: 15px;
	font-weight: 600;
	color: #6b7280;
	margin-bottom: 8px;
}

/* VALUE */
.info-value {
	font-size: 20px;
	font-weight: 600;
	color: #111827;
	word-break: break-word;
}

/* ROLE BADGE */
.role-badge {
	background: #10b981;
	color: white;
	padding: 8px 18px;
	border-radius: 50px;
	font-size: 14px;
	font-weight: 600;
	display: inline-block;
	margin-top: 5px;
}

/* BUTTONS */
.profile-btn {
	padding: 12px 25px;
	border-radius: 10px;
	font-weight: 600;
	font-size: 16px;
	text-decoration: none;
	transition: 0.3s;
}

.edit-btn {
	background: #111827;
	color: white;
}

.edit-btn:hover {
	background: #000;
	color: white;
}

.order-btn {
	background: #f59e0b;
	color: white;
}

.order-btn:hover {
	background: #d97706;
	color: white;
}

/* NOT LOGIN */
.not-login-card {
	max-width: 650px;
	margin: auto;
	background: white;
	border-radius: 25px;
	padding: 60px 40px;
	text-align: center;
}

.not-login-icon {
	font-size: 90px;
	color: #ef4444;
	margin-bottom: 25px;
}

.not-login-title {
	font-size: 38px;
	font-weight: 700;
	color: #111827;
	margin-bottom: 15px;
}

.not-login-text {
	font-size: 17px;
	color: #6b7280;
	margin-bottom: 30px;
}

.login-btn {
	background: #111827;
	color: white;
	padding: 14px 35px;
	border-radius: 12px;
	font-size: 17px;
	font-weight: 600;
	text-decoration: none;
	display: inline-block;
}

.login-btn:hover {
	background: black;
	color: white;
}
</style>

</head>

<body>

	<!-- NAVBAR -->

	<%@ include file="../common/customernavbar.jsp"%>

	<!-- PROFILE SECTION -->

	<section class="profile-section">
		<%
		if (request.getParameter("updated") != null) {
		%>

		<div class="container">
			<div class="alert alert-success text-center">Your profile has
				been updated successfully</div>
		</div>

		<%
		}
		%>

		<%
		if (user != null) {
		%>

		<div class="card shadow-lg profile-card">

			<!-- HEADER -->

			<div class="profile-header">

				<div class="profile-avatar">

					<i class="bi bi-person-fill"></i>

				</div>

				<h1 class="profile-title">

					<%=user.getFullName()%>

				</h1>

				<p class="profile-subtitle">Welcome back to your Savora
					dashboard</p>

			</div>

			<!-- BODY -->

			<div class="profile-body">

				<div class="row g-4">

					<!-- USER ID -->

					<div class="col-md-6">

						<div class="info-card">

							<div class="info-icon">

								<i class="bi bi-hash"></i>

							</div>

							<div class="info-label">Account ID</div>

							<div class="info-value">

								#<%=user.getUserId()%>

							</div>

						</div>

					</div>

					<!-- EMAIL -->

					<div class="col-md-6">

						<div class="info-card">

							<div class="info-icon">

								<i class="bi bi-envelope-fill"></i>

							</div>

							<div class="info-label">Email</div>

							<div class="info-value">

								<%=user.getEmail()%>

							</div>

						</div>

					</div>

					<!-- PHONE -->

					<div class="col-md-6">

						<div class="info-card">

							<div class="info-icon">

								<i class="bi bi-telephone-fill"></i>

							</div>

							<div class="info-label">Phone</div>

							<div class="info-value">

								<%=user.getPhone()%>

							</div>

						</div>

					</div>

					<!-- ADDRESS -->

					<div class="col-md-6">

						<div class="info-card">

							<div class="info-icon">

								<i class="bi bi-geo-alt-fill"></i>

							</div>

							<div class="info-label">Address</div>

							<div class="info-value">

								<%=user.getAddress()%>

							</div>

						</div>

					</div>

					<!-- ROLE -->

					<div class="col-md-12">

						<div class="info-card">

							<div class="info-icon">

								<i class="bi bi-person-badge-fill"></i>

							</div>

							<div class="info-label">User Role</div>

							<div class="info-value">

								<span class="role-badge"> <%=user.getRole()%>

								</span>

							</div>

						</div>

					</div>

				</div>

				<!-- BUTTONS -->

				<div class="text-center mt-5">

					<a href="orders.jsp" class="btn profile-btn order-btn me-3"> <i
						class="bi bi-bag-check-fill"></i> My Orders

					</a> <a href="editProfile.jsp" class="btn profile-btn edit-btn me-3">

						<i class="bi bi-pencil-square"></i> Edit Profile

					</a> <a href="menu.jsp" class="btn profile-btn edit-btn"> <i
						class="bi bi-grid-fill"></i> Browse Menu

					</a>

				</div>

			</div>

		</div>

		<%
		} else {
		%>

		<div class="not-login-card shadow-lg">

			<div class="not-login-icon">

				<i class="bi bi-person-x-fill"></i>

			</div>

			<h1 class="not-login-title">You are not logged in</h1>

			<p class="not-login-text">Please log in to access your profile,
				view orders, and manage your account.</p>

			<a href="../auth/login.jsp" class="login-btn"> <i
				class="bi bi-box-arrow-in-right"></i> Log in now
			</a>

		</div>

		<%
		}
		%>

	</section>

	<!-- FOOTER -->

	<%@ include file="../common/footer.jsp"%>

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>

</html>