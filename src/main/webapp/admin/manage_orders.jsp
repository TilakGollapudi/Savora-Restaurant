<%@page import="java.sql.*"%>
<%@page import="com.rms.utility.DBConnection"%>

<%
Connection conn = null;

PreparedStatement ps = null;

ResultSet rs = null;

String action = request.getParameter("action");

try {

    conn = DBConnection.getConnection();

    /* ================= UPDATE ORDER STATUS ================= */

    if ("update".equals(action)) {

        int orderId =
                Integer.parseInt(request.getParameter("order_id"));

        String status =
                request.getParameter("order_status");

        String updateQuery =
                "UPDATE orders SET order_status=? WHERE order_id=?";

        PreparedStatement updatePs =
                conn.prepareStatement(updateQuery);

        updatePs.setString(1, status);

        updatePs.setInt(2, orderId);

        updatePs.executeUpdate();

        updatePs.close();

        response.sendRedirect("manage_orders.jsp");

        return;
    }

} catch (Exception e) {

    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Savora | Manage Orders</title>

<!-- Bootstrap CSS -->

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

/* PAGE HEADER */
.page-header {
	background: linear-gradient(135deg, #111827, #1f2937);
	padding: 35px;
	border-radius: 22px;
	color: white;
	margin-bottom: 35px;
}

.page-title {
	font-size: 40px;
	font-weight: 700;
}

.page-subtitle {
	color: #d1d5db;
	margin-top: 10px;
	font-size: 16px;
}

/* CARD */
.custom-card {
	border: none;
	border-radius: 22px;
	overflow: hidden;
}

/* TABLE */
.table th {
	vertical-align: middle;
	padding: 16px;
}

.table td {
	vertical-align: middle;
	padding: 16px;
	background: white;
}

/* BUTTON */
.btn {
	border-radius: 10px;
	font-weight: 500;
}

/* STATUS BADGES */
.status-badge {
	padding: 8px 16px;
	border-radius: 30px;
	color: white;
	font-size: 14px;
	font-weight: 600;
	display: inline-block;
}

.pending {
	background: #f59e0b;
}

.preparing {
	background: #3b82f6;
}

.delivery {
	background: #8b5cf6;
}

.delivered {
	background: #10b981;
}

.cancelled {
	background: #ef4444;
}

/* SELECT */
.form-select {
	border-radius: 10px;
}

/* EMPTY */
.empty-box {
	padding: 50px;
	text-align: center;
	font-size: 20px;
	font-weight: 600;
	color: #ef4444;
}
</style>

</head>

<body>

	<!-- NAVBAR -->

	<%@ include file="../common/adminnavbar.jsp"%>

	<div class="container mt-5 mb-5">

		<!-- PAGE HEADER -->

		<div class="page-header shadow">
			<div
				class="d-flex justify-content-between align-items-center flex-wrap">
				<div>
					<h1 class="page-title">
						<i class="bi bi-bag-check-fill"></i> Manage Orders
					</h1>
					<p class="page-subtitle">Monitor and manage all customer
						orders, payments, and delivery updates in real-time.</p>
				</div>
				<div>
					<a href="dashboard.jsp" class="btn btn-warning"> <i
						class="bi bi-arrow-left-circle"></i> Return to Dashboard
					</a>
				</div>
			</div>
		</div>

		<!-- ORDERS TABLE -->

		<div class="card shadow custom-card">

			<div class="card-body p-4">

				<div class="table-responsive">

					<table class="table table-hover align-middle">

						<thead class="table-dark">
							<tr>
								<th>Order ID</th>
								<th>Customer</th>
								<th>Total (Rs.)</th>
								<th>Current Status</th>
								<th>Update Status</th>
								<th>Order Date</th>
								<th width="180">Manage</th>
							</tr>
						</thead>

						<tbody>

							<%
boolean hasOrders = false;

try {

    String sql =
            "SELECT * FROM orders ORDER BY order_id DESC";

    ps = conn.prepareStatement(sql);

    rs = ps.executeQuery();

    while(rs.next()) {

        hasOrders = true;

        int orderId =
                rs.getInt("order_id");

        int userId =
                rs.getInt("user_id");

        double totalAmount =
                rs.getDouble("total_amount");

        String orderStatus =
                rs.getString("order_status");

        Timestamp orderDate =
                rs.getTimestamp("order_date");

        String statusClass = "";

        if(orderStatus.equalsIgnoreCase("Pending")){

            statusClass = "pending";

        }else if(orderStatus.equalsIgnoreCase("Preparing")){

            statusClass = "preparing";

        }else if(orderStatus.equalsIgnoreCase("Out For Delivery")){

            statusClass = "delivery";

        }else if(orderStatus.equalsIgnoreCase("Delivered")){

            statusClass = "delivered";

        }else if(orderStatus.equalsIgnoreCase("Cancelled")){

            statusClass = "cancelled";
        }
%>

							<!-- UPDATE FORM -->

							<form action="manage_orders.jsp?action=update" method="post">

								<tr>

									<!-- ORDER ID -->

									<td><strong> #<%= orderId %>

									</strong> <input type="hidden" name="order_id" value="<%= orderId %>">

									</td>

									<!-- USER ID -->

									<td><%= userId %></td>

									<!-- TOTAL AMOUNT -->

									<td>Rs. <%= totalAmount %>

									</td>

									<!-- CURRENT STATUS -->

									<td><span class="status-badge <%= statusClass %>">

											<%= orderStatus %>

									</span></td>

									<!-- UPDATE STATUS -->

									<td><select name="order_status" class="form-select">

											<option value="Pending"
												<%= orderStatus.equals("Pending") ? "selected" : "" %>>

												Pending</option>

											<option value="Preparing"
												<%= orderStatus.equals("Preparing") ? "selected" : "" %>>

												Preparing</option>

											<option value="Out For Delivery"
												<%= orderStatus.equals("Out For Delivery") ? "selected" : "" %>>

												Out For Delivery</option>

											<option value="Delivered"
												<%= orderStatus.equals("Delivered") ? "selected" : "" %>>

												Delivered</option>

											<option value="Cancelled"
												<%= orderStatus.equals("Cancelled") ? "selected" : "" %>>

												Cancelled</option>

									</select></td>

									<!-- ORDER DATE -->

									<td><%= orderDate %></td>

									<!-- ACTION -->

									<td>
										<button type="submit" class="btn btn-success btn-sm">
											<i class="bi bi-check-circle-fill"></i> Update Status
										</button>
									</td>

								</tr>

							</form>

							<%
    }

    if(!hasOrders){
%>

							<!-- NO ORDERS -->

							<tr>
								<td colspan="7">
									<div class="empty-box">
										<i class="bi bi-exclamation-circle-fill"></i> No orders available at the moment
									</div>
								</td>
							</tr>

							<%
    }

} catch(Exception e) {

    e.printStackTrace();
}
%>

						</tbody>

					</table>

				</div>

			</div>

		</div>

	</div>

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>