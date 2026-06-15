<!-- ========================= UPDATED menu.jsp ========================= -->

<%@page import="java.sql.*"%>
<%@page import="com.rms.utility.DBConnection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String email = (String) session.getAttribute("userEmail");

if (email == null) {

	response.sendRedirect("../auth/login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Savora | Menu</title>

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

/* TITLE */
.menu-title {
	text-align: center;
	font-size: 52px;
	font-weight: 700;
	margin-top: 60px;
	margin-bottom: 15px;
	color: #0f172a;
}

.menu-subtitle {
	text-align: center;
	font-size: 18px;
	color: #6b7280;
	margin-bottom: 60px;
}

/* TOP BAR */
.top-bar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 40px;
	flex-wrap: wrap;
	gap: 15px;
}

/* FOOD CARD */
.food-card {
	border: none;
	border-radius: 20px;
	overflow: hidden;
	background: white;
	transition: 0.3s;
	height: 100%;
}

.food-card:hover {
	transform: translateY(-8px);
}

.food-image {
	width: 100%;
	height: 240px;
	object-fit: cover;
}

.card-body {
	padding: 25px;
}

.food-name {
	font-size: 24px;
	font-weight: 600;
	margin-bottom: 10px;
	color: #111827;
}

.food-description {
	color: #6b7280;
	font-size: 15px;
	min-height: 55px;
	margin-bottom: 18px;
	line-height: 1.7;
}

.food-price {
	font-size: 24px;
	font-weight: 700;
	color: #dc2626;
	margin-bottom: 20px;
}

/* QUANTITY */
.quantity-box {
	border-radius: 10px;
	height: 48px;
}

/* BUTTON */
.cart-btn {
	height: 48px;
	border-radius: 10px;
	font-size: 16px;
	font-weight: 600;
	background: #111827;
	border: none;
	transition: 0.3s;
}

.cart-btn:hover {
	background: #000;
}

/* VIEW CART BUTTON */
.view-cart-btn {
	background: #f59e0b;
	border: none;
	padding: 12px 25px;
	border-radius: 10px;
	font-weight: 600;
	color: white;
	text-decoration: none;
	transition: 0.3s;
}

.view-cart-btn:hover {
	background: #d97706;
	color: white;
}

/* RESPONSIVE */
@media ( max-width :768px) {
	.menu-title {
		font-size: 38px;
	}
	.top-bar {
		flex-direction: column;
		align-items: flex-start;
	}
}
</style>

</head>

<body>

	<!-- NAVBAR -->

	<%@ include file="../common/customernavbar.jsp"%>

	<!-- TITLE -->

	<div class="container">
		<h1 class="menu-title">Explore Our Menu</h1>
		<p class="menu-subtitle">Discover delicious dishes and add your
			favorites to the cart</p>
	</div>

	<!-- MENU -->

	<div class="container mb-5">

		<!-- TOP BAR -->

		<div class="top-bar">
			<h4 class="fw-bold text-dark">Available Menu Items</h4>
			<a href="cart.jsp" class="view-cart-btn"> <i
				class="bi bi-cart-fill"></i> View Cart
			</a>
		</div>

		<div class="row g-4">

			<%
			Connection conn = null;

			PreparedStatement ps = null;

			ResultSet rs = null;

			try {

				conn = DBConnection.getConnection();

				String sql = "SELECT * FROM food_items";

				ps = conn.prepareStatement(sql);

				rs = ps.executeQuery();

				while (rs.next()) {

					int foodId = rs.getInt("food_id");

					String foodName = rs.getString("food_name");

					String description = rs.getString("description");

					double foodPrice = rs.getDouble("price");

					String imageUrl = rs.getString("image_url");
			%>

			<!-- FOOD ITEM -->

			<div class="col-lg-4 col-md-6">

				<div class="card shadow-sm food-card">

					<!-- IMAGE -->

					<img src="<%=imageUrl%>" class="food-image" alt="Food Image">

					<div class="card-body text-center">

						<!-- FOOD NAME -->

						<div class="food-name">

							<%=foodName%>

						</div>

						<!-- DESCRIPTION -->

						<div class="food-description">

							<%=description%>

						</div>

						<!-- PRICE -->

						<div class="food-price">

							₹
							<%=foodPrice%>

						</div>

						<!-- ADD TO CART FORM -->

						<form action="<%=request.getContextPath()%>/AddToCartServlet"
							method="post">

							<input type="hidden" name="foodId" value="<%=foodId%>">

							<div class="row g-2">

								<!-- QUANTITY -->

								<input type="hidden" name="quantity" value="1">

								<div class="col-12">

									<button type="submit" class="btn btn-dark w-100 cart-btn">

										<i class="bi bi-cart-plus-fill"></i> Add To Cart

									</button>

								</div>

							</div>

						</form>

					</div>

				</div>

			</div>

			<%
			}

			} catch (Exception e) {
			%>

			<!-- ERROR MESSAGE -->

			<div class="col-12">

				<div class="alert alert-danger text-center">

					Error :
					<%=e.getMessage()%>

				</div>

			</div>

			<%
			e.printStackTrace();

			} finally {

			try {

				if (rs != null)
					rs.close();

				if (ps != null)
					ps.close();

				if (conn != null)
					conn.close();

			} catch (Exception e) {

				e.printStackTrace();
			}
			}
			%>

		</div>

	</div>

	<!-- FOOTER -->

	<%@ include file="../common/footer.jsp"%>

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>

</html>