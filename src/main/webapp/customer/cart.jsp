<%@page import="java.sql.*"%>
<%@page import="com.rms.utility.DBConnection"%>

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

<title>Savora | My Cart</title>

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

/* TITLE */
.cart-title {
	font-size: 45px;
	font-weight: 700;
	color: #111827;
	margin-bottom: 40px;
}

/* CART CARD */
.cart-card {
	border: none;
	border-radius: 20px;
	overflow: hidden;
}

/* TABLE */
.table thead {
	background: #111827;
	color: white;
}

.table th {
	padding: 18px;
	font-size: 16px;
}

.table td {
	padding: 18px;
	vertical-align: middle;
}

/* FOOD NAME */
.food-name {
	font-size: 18px;
	font-weight: 600;
	color: #111827;
}

/* PRICE */
.price {
	font-weight: 600;
	color: #dc2626;
}

/* TOTAL */
.total-price {
	font-size: 26px;
	font-weight: 700;
	color: #111827;
}

/* BUTTON */
.checkout-btn {
	background: #111827;
	color: white;
	padding: 14px 35px;
	border-radius: 10px;
	font-size: 17px;
	font-weight: 600;
	border: none;
	transition: 0.3s;
}

.checkout-btn:hover {
	background: #000;
	color: white;
	transform: translateY(-2px);
}

/* EMPTY CART */
.empty-cart {
	padding: 80px 20px;
	text-align: center;
}

.empty-cart i {
	font-size: 90px;
	color: #9ca3af;
	margin-bottom: 20px;
}

.empty-cart h3 {
	font-size: 35px;
	font-weight: 700;
	color: #111827;
	margin-bottom: 15px;
}

.empty-cart p {
	color: #6b7280;
	font-size: 17px;
	margin-bottom: 30px;
}

.shop-btn {
	background: #f59e0b;
	color: white;
	padding: 12px 30px;
	border-radius: 10px;
	text-decoration: none;
	font-weight: 600;
}

.shop-btn:hover {
	background: #d97706;
	color: white;
}
</style>

</head>

<body>

	<%@ include file="../common/customernavbar.jsp"%>

	<div class="container py-5">

		<h1 class="cart-title text-center">Your Cart</h1>

		<%
		double grandTotal = 0;

		boolean hasItems = false;

		try {

			Connection conn = DBConnection.getConnection();

			String sql = "SELECT c.cart_item_id, f.food_name,f.price,c.quantity " + "FROM cart_items c "
			+ "JOIN food_items f ON c.food_id=f.food_id " + "JOIN cart ca ON c.cart_id=ca.cart_id "
			+ "JOIN users u ON ca.user_id=u.user_id " + "WHERE u.email=?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				hasItems = true;
		%>

		<div class="card shadow cart-card">

			<div class="table-responsive">

				<table class="table table-hover mb-0">

					<thead>

						<tr>
							<th>Item</th>
							<th>Price</th>
							<th>Qty</th>
							<th>Total</th>
							<th>Action</th>
						</tr>

					</thead>

					<tbody>

						<%
						do {

							String foodName = rs.getString("food_name");

							double price = rs.getDouble("price");

							int quantity = rs.getInt("quantity");

							double total = price * quantity;

							int cartItemId = rs.getInt("cart_item_id");

							grandTotal += total;
						%>

						<tr>

							<td>
								<div class="food-name">
									<%=foodName%>
								</div>
							</td>

							<td class="price">Rs. <%=price%>
							</td>

							<td>

								<div class="d-flex align-items-center">

									<a
										href="<%=request.getContextPath()%>/updateCartQuantity?cartItemId=<%=cartItemId%>&action=decrease"
										class="btn btn-sm btn-danger"> - </a> <span
										class="mx-3 fw-bold"> <%=quantity%>

									</span> <a
										href="<%=request.getContextPath()%>/updateCartQuantity?cartItemId=<%=cartItemId%>&action=increase"
										class="btn btn-sm btn-success"> + </a>

								</div>

							</td>

							<td class="price">Rs. <%=total%>
							</td>
							</td>
							<td><a
								href="<%=request.getContextPath()%>/removeCartItem?cartItemId=<%=cartItemId%>"
								class="btn btn-danger btn-sm"
								onclick="return confirm('Remove this item from cart?')"> <i
									class="bi bi-trash-fill"></i> Remove Item

							</a></td>
						</tr>

						<%
						} while (rs.next());
						%>

						<tr>

							<td colspan="3" class="text-end total-price">Order Total :</td>

							<td class="total-price">Rs. <%=grandTotal%>

							</td>

						</tr>

					</tbody>

				</table>

			</div>

		</div>

		<div class="text-end mt-4">

			<a href="checkout.jsp" class="btn checkout-btn"> Continue to
				Checkout </a>

		</div>

		<%
		} else {
		%>

		<div class="card shadow empty-cart">

			<i class="bi bi-cart-x-fill"></i>

			<h3>Your cart is empty</h3>
			<p>Looks like you haven’t added anything yet. Explore our menu to
				start ordering.</p>
			<a href="menu.jsp" class="shop-btn">Explore Menu</a>

		</div>

		<%
		}

		} catch (Exception e) {

		e.printStackTrace();
		}
		%>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>

</html>