<%@page import="java.sql.*"%>
<%@page import="com.rms.utility.DBConnection"%>

<%
Connection conn = null;

PreparedStatement ps = null;

ResultSet rs = null;

String view = request.getParameter("view");

int totalUsers = 0;

int totalOrders = 0;

double totalSales = 0;

String topFood = "No Data";

int topFoodCount = 0;

try {

	conn = DBConnection.getConnection();

	/* ================= TOTAL USERS ================= */

	String usersQuery = "SELECT COUNT(*) totalUsers FROM users";

	ps = conn.prepareStatement(usersQuery);

	rs = ps.executeQuery();

	if (rs.next()) {

		totalUsers = rs.getInt("totalUsers");
	}

	rs.close();
	ps.close();

	/* ================= TOTAL ORDERS ================= */

	String ordersQuery = "SELECT COUNT(*) totalOrders FROM orders";

	ps = conn.prepareStatement(ordersQuery);

	rs = ps.executeQuery();

	if (rs.next()) {

		totalOrders = rs.getInt("totalOrders");
	}

	rs.close();
	ps.close();

	/* ================= TOTAL SALES ================= */

	String salesQuery = "SELECT SUM(total_amount) totalSales FROM orders";

	ps = conn.prepareStatement(salesQuery);

	rs = ps.executeQuery();

	if (rs.next()) {

		totalSales = rs.getDouble("totalSales");
	}

	rs.close();
	ps.close();

	/* ================= TOP SELLING FOOD ================= */

	String topFoodQuery = "SELECT f.food_name, SUM(oi.quantity) totalSold " + "FROM order_items oi "
	+ "JOIN food_items f ON oi.food_id = f.food_id " + "GROUP BY f.food_name " + "ORDER BY totalSold DESC "
	+ "LIMIT 1";

	ps = conn.prepareStatement(topFoodQuery);

	rs = ps.executeQuery();

	if (rs.next()) {

		topFood = rs.getString("food_name");

		topFoodCount = rs.getInt("totalSold");
	}

	rs.close();
	ps.close();

} catch (Exception e) {

	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Savora | Reports</title>

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

/* PAGE TITLE */
.page-title {
	font-size: 42px;
	font-weight: 700;
	color: #111827;
}

/* CARD */
.report-card {
	border: none;
	border-radius: 20px;
	transition: 0.3s;
	overflow: hidden;
	cursor: pointer;
}

.report-card:hover {
	transform: translateY(-8px);
}

.card-icon {
	font-size: 45px;
	margin-bottom: 15px;
}

.users-card {
	background: linear-gradient(135deg, #2563eb, #1d4ed8);
	color: white;
}

.orders-card {
	background: linear-gradient(135deg, #7c3aed, #5b21b6);
	color: white;
}

.sales-card {
	background: linear-gradient(135deg, #059669, #047857);
	color: white;
}

.card-title {
	font-size: 22px;
	font-weight: 600;
}

.card-value {
	font-size: 42px;
	font-weight: 700;
}

/* TABLE */
.table-card {
	border: none;
	border-radius: 18px;
}

.table th {
	vertical-align: middle;
}

.table td {
	vertical-align: middle;
}

/* SALES BOX */
.sales-box {
	background: white;
	border-radius: 20px;
	padding: 35px;
}

.sales-title {
	font-size: 34px;
	font-weight: 700;
	color: #111827;
}

.highlight {
	color: #dc2626;
	font-weight: 700;
}
</style>

</head>

<body>

	<!-- NAVBAR -->

	<%@ include file="../common/adminnavbar.jsp"%>

	<div class="container mt-5 mb-5">

		<!-- HEADER -->

		<div class="d-flex justify-content-between align-items-center mb-5">
			<h2 class="page-title">Analytics & Reports</h2>
			<div>
				<a href="dashboard.jsp" class="btn btn-warning"> <i
					class="bi bi-arrow-left-circle"></i> Return to Dashboard
				</a>
			</div>
		</div>

		<!-- REPORT CARDS -->

		<div class="row g-4 mb-5">

			<!-- USERS -->

			<div class="col-lg-4">
				<a href="reports.jsp?view=users" style="text-decoration: none;">
					<div class="card shadow report-card users-card p-4 text-center">

						<div class="card-icon">
							<i class="bi bi-people-fill"></i>
						</div>
						<div class="card-title">Users</div>
						<div class="card-value">
							<%=totalUsers%>
						</div>
					</div>
				</a>
			</div>

			<!-- ORDERS -->

			<div class="col-lg-4">
				<a href="reports.jsp?view=orders" style="text-decoration: none;">
					<div class="card shadow report-card orders-card p-4 text-center">
						<div class="card-icon">
							<i class="bi bi-bag-check-fill"></i>
						</div>
						<div class="card-title">Orders</div>
						<div class="card-value">
							<%=totalOrders%>
						</div>
					</div>
				</a>
			</div>

			<!-- SALES -->

			<div class="col-lg-4">
				<a href="reports.jsp?view=sales" style="text-decoration: none;">
					<div class="card shadow report-card sales-card p-4 text-center">
						<div class="card-icon">
							<i class="bi bi-currency-rupee"></i>
						</div>
						<div class="card-title">Revenue</div>
						<div class="card-value">
							Rs.
							<%=totalSales%>
						</div>
					</div>
				</a>
			</div>
		</div>

		<!-- USERS VIEW -->

		<%
		if ("users".equals(view)) {
		%>

		<div class="card shadow table-card p-4">
			<h3 class="mb-4">User List</h3>
			<div class="table-responsive">
				<table class="table table-bordered table-hover">
					<thead class="table-dark">
						<tr>
							<th>User ID</th>
							<th>User Name</th>
							<th>Email Address</th>
							<th>Contact Number</th>
							<th>User Role</th>
						</tr>
					</thead>
					<tbody>

						<%
						try {

							String query = "SELECT * FROM users";

							ps = conn.prepareStatement(query);

							rs = ps.executeQuery();

							while (rs.next()) {
						%>

						<tr>

							<td><%=rs.getInt("user_id")%></td>

							<td><%=rs.getString("full_name")%></td>

							<td><%=rs.getString("email")%></td>

							<td><%=rs.getString("phone")%></td>

							<td><%=rs.getString("role")%></td>

						</tr>

						<%
						}

						} catch (Exception e) {

						e.printStackTrace();
						}
						%>

					</tbody>

				</table>

			</div>

		</div>

		<%
		}
		%>

		<!-- ORDERS VIEW -->

		<%
		if ("orders".equals(view)) {
		%>

		<div class="card shadow table-card p-4">
			<h3 class="mb-4">Order List</h3>
			<div class="table-responsive">
				<table class="table table-bordered table-hover">
					<thead class="table-dark">
						<tr>
							<th>Order ID</th>
							<th>User</th>
							<th>Total (Rs.)</th>
							<th>Status</th>
							<th>Order Date</th>
						</tr>
					</thead>

					<tbody>

						<%
						try {

							String query = "SELECT * FROM orders ORDER BY order_id DESC";

							ps = conn.prepareStatement(query);

							rs = ps.executeQuery();

							while (rs.next()) {
						%>

						<tr>

							<td>#<%=rs.getInt("order_id")%></td>

							<td><%=rs.getInt("user_id")%></td>

							<td>Rs. <%=rs.getDouble("total_amount")%></td>

							<td><%=rs.getString("order_status")%></td>

							<td><%=rs.getTimestamp("order_date")%></td>

						</tr>

						<%
						}

						} catch (Exception e) {

						e.printStackTrace();
						}
						%>

					</tbody>

				</table>

			</div>

		</div>

		<%
		}
		%>

		<!-- SALES VIEW -->

		<%
		if ("sales".equals(view)) {
		%>

		<div class="sales-box shadow">
			<h2 class="sales-title mb-4">Revenue Report</h2>
			<h4 class="mb-4">
				Total Revenue : <span class="highlight"> Rs. <%=totalSales%>
				</span>
			</h4>
			<hr>
			<h4 class="mt-4">
				Top Selling Item : <span class="highlight"> <%=topFood%>
				</span>
			</h4>
			<h5 class="mt-3">
				Units Sold : <strong> <%=topFoodCount%>
				</strong>
			</h5>
		</div>

		<%
		}
		%>

	</div>

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>

</html>