<%@page import="java.sql.*"%>
<%@page import="com.rms.utility.DBConnection"%>

<%
Connection conn = null;

PreparedStatement ps = null;

ResultSet rs = null;

int totalUsers = 0;
int totalFoods = 0;
int totalOrders = 0;
double totalRevenue = 0;

try {

	conn = DBConnection.getConnection();

	// TOTAL USERS

	ps = conn.prepareStatement("SELECT COUNT(*) FROM users");

	rs = ps.executeQuery();

	if (rs.next()) {

		totalUsers = rs.getInt(1);
	}

	// TOTAL FOOD ITEMS

	ps = conn.prepareStatement("SELECT COUNT(*) FROM food_items");

	rs = ps.executeQuery();

	if (rs.next()) {

		totalFoods = rs.getInt(1);
	}

	// TOTAL ORDERS

	ps = conn.prepareStatement("SELECT COUNT(*) FROM orders");

	rs = ps.executeQuery();

	if (rs.next()) {

		totalOrders = rs.getInt(1);
	}

	// TOTAL REVENUE

	ps = conn.prepareStatement("SELECT SUM(total_amount) FROM orders");

	rs = ps.executeQuery();

	if (rs.next()) {

		totalRevenue = rs.getDouble(1);
	}

} catch (Exception e) {

	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Savora | Admin Dashboard</title>

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

/* HEADER */
.dashboard-header {
	background: linear-gradient(135deg, #111827, #1f2937);
	padding: 50px 30px;
	border-radius: 20px;
	color: white;
	margin-bottom: 40px;
}

.dashboard-title {
	font-size: 48px;
	font-weight: 700;
}

.dashboard-subtitle {
	font-size: 18px;
	margin-top: 10px;
	color: #d1d5db;
}

/* STATS CARD */
.stats-card {
	border: none;
	border-radius: 20px;
	padding: 30px;
	color: white;
	transition: 0.3s;
	height: 100%;
}

.stats-card:hover {
	transform: translateY(-8px);
}

.stats-icon {
	font-size: 50px;
	margin-bottom: 15px;
}

.stats-number {
	font-size: 38px;
	font-weight: 700;
}

.stats-text {
	font-size: 18px;
	font-weight: 500;
}

/* COLORS */
.users-card {
	background: linear-gradient(135deg, #2563eb, #1d4ed8);
}

.food-card {
	background: linear-gradient(135deg, #16a34a, #15803d);
}

.orders-card {
	background: linear-gradient(135deg, #f59e0b, #d97706);
}

.revenue-card {
	background: linear-gradient(135deg, #db2777, #be185d);
}

/* ACTION CARDS */
.action-card {
	border: none;
	border-radius: 20px;
	padding: 35px;
	text-align: center;
	transition: 0.3s;
	background: white;
	height: 100%;
}

.action-card:hover {
	transform: translateY(-8px);
}

.action-icon {
	font-size: 55px;
	color: #111827;
	margin-bottom: 20px;
}

.action-title {
	font-size: 24px;
	font-weight: 600;
	color: #111827;
	margin-bottom: 15px;
}

.action-text {
	color: #6b7280;
	font-size: 15px;
}

.card-link {
	text-decoration: none;
}

/* BUTTON */
.manage-btn {
	margin-top: 20px;
	border-radius: 10px;
	padding: 10px 20px;
	font-weight: 600;
}
</style>

</head>

<body>

	<!-- ADMIN NAVBAR -->

	<%@ include file="../common/adminnavbar.jsp"%>

	<div class="container mt-5 mb-5">

		<!-- HEADER -->

		<div class="dashboard-header shadow">
			<h1 class="dashboard-title">Savora Admin Dashboard</h1>
			<p class="dashboard-subtitle">Oversee orders, reservations, and
				restaurant operations from one powerful system</p>
		</div>

		<!-- STATS SECTION -->

		<div class="row g-4 mb-5">

			<!-- USERS -->

			<div class="col-lg-3 col-md-6">
				<div class="stats-card users-card shadow">
					<div class="stats-icon">
						<i class="bi bi-people-fill"></i>
					</div>
					<div class="stats-number">
						<%=totalUsers%>
					</div>
					<div class="stats-text">Registered Users</div>
				</div>
			</div>

			<!-- FOOD ITEMS -->

			<div class="col-lg-3 col-md-6">
				<div class="stats-card food-card shadow">
					<div class="stats-icon">
						<i class="bi bi-cup-hot-fill"></i>
					</div>
					<div class="stats-number">
						<%=totalFoods%>
					</div>
					<div class="stats-text">Available Menu Items</div>
				</div>
			</div>

			<!-- ORDERS -->

			<div class="col-lg-3 col-md-6">
				<div class="stats-card orders-card shadow">
					<div class="stats-icon">
						<i class="bi bi-bag-check-fill"></i>
					</div>
					<div class="stats-number">
						<%=totalOrders%>
					</div>
					<div class="stats-text">Total Orders Received</div>
				</div>
			</div>

			<!-- REVENUE -->

			<div class="col-lg-3 col-md-6">
				<div class="stats-card revenue-card shadow">
					<div class="stats-icon">
						<i class="bi bi-currency-rupee"></i>
					</div>
					<div class="stats-number">
						Rs.
						<%=totalRevenue%>
					</div>
					<div class="stats-text">Total Revenue</div>
				</div>
			</div>

		</div>

		<!-- MANAGEMENT SECTION -->

		<div class="row g-4">

			<!-- USERS -->

			<div class="col-lg-4 col-md-6">
				<a href="manage_users.jsp" class="card-link">
					<div class="action-card shadow">
						<div class="action-icon">
							<i class="bi bi-people-fill"></i>
						</div>
						<div class="action-title">Manage Users</div>
						<div class="action-text">Manage registered users and their
							activity within Savora.</div>
						<button class="btn btn-dark manage-btn">Open</button>
					</div>
				</a>
			</div>

			<!-- FOOD -->

			<div class="col-lg-4 col-md-6">
				<a href="manage_food.jsp" class="card-link">
					<div class="action-card shadow">
						<div class="action-icon">
							<i class="bi bi-cup-hot-fill"></i>
						</div>
						<div class="action-title">Manage Menu</div>
						<div class="action-text">Manage Savora's menu items
							including adding, updating, and removing dishes.</div>
						<button class="btn btn-dark manage-btn">Open</button>
					</div>
				</a>
			</div>

			<!-- CATEGORY -->

			<div class="col-lg-4 col-md-6">
				<a href="manage_category.jsp" class="card-link">
					<div class="action-card shadow">
						<div class="action-icon">
							<i class="bi bi-grid-fill"></i>
						</div>
						<div class="action-title">Manage Categories</div>
						<div class="action-text">Create and manage menu categories
							for better food organization in Savora.</div>
						<button class="btn btn-dark manage-btn">Open</button>
					</div>
				</a>
			</div>

			<!-- ORDERS -->

			<div class="col-lg-4 col-md-6">
				<a href="manage_orders.jsp" class="card-link">
					<div class="action-card shadow">
						<div class="action-icon">
							<i class="bi bi-bag-check-fill"></i>
						</div>
						<div class="action-title">Manage Orders</div>
						<div class="action-text">Monitor and manage all customer
							orders in real-time.</div>
						<button class="btn btn-dark manage-btn">Open</button>
					</div>
				</a>
			</div>

			<!-- RESERVATIONS -->

			<div class="col-lg-4 col-md-6">
				<a href="manage_reservations.jsp" class="card-link">
					<div class="action-card shadow">
						<div class="action-icon">
							<i class="bi bi-calendar-check-fill"></i>
						</div>
						<div class="action-title">Manage Reservations</div>
						<div class="action-text">Monitor and manage all table
							bookings in real-time.</div>
						<button class="btn btn-dark manage-btn">Open</button>
					</div>
				</a>
			</div>

			<!-- REPORTS -->

			<div class="col-lg-4 col-md-6">
				<a href="reports.jsp" class="card-link">
					<div class="action-card shadow">
						<div class="action-icon">
							<i class="bi bi-bar-chart-fill"></i>
						</div>
						<div class="action-title">View Reports</div>
						<div class="action-text">Monitor sales performance, orders,
							and customer insights in real-time.</div>
						<button class="btn btn-dark manage-btn">Open</button>
					</div>
				</a>
			</div>

		</div>

	</div>

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>

</html>
