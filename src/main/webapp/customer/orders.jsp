<%@page import="java.sql.*"%>
<%@page import="com.rms.utility.DBConnection"%>

<%
String email =
        (String) session.getAttribute("userEmail");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Your Orders | Savora</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

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

.page-title {
	font-size: 42px;
	font-weight: 700;
	color: #111827;
}

.card {
	border: none;
	border-radius: 18px;
}

.status {
	padding: 8px 14px;
	border-radius: 30px;
	color: white;
	font-size: 14px;
	font-weight: 600;
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
</style>

</head>

<body>

	<%@ include file="../common/customernavbar.jsp"%>

	<div class="container mt-5 mb-5">

		<div class="d-flex justify-content-between align-items-center mb-4">

			<h2 class="page-title">My Orders</h2>

			<a href="menu.jsp" class="btn btn-dark"> Order More Food </a>

		</div>

		<div class="card shadow p-4">

			<div class="table-responsive">
				<table class="table table-bordered table-hover align-middle">
					<thead class="table-dark">
						<tr>
							<th>Order ID</th>
							<th>Total Amount</th>
							<th>Status</th>
							<th>Order Date</th>
						</tr>
					</thead>
					<tbody>

						<%
Connection conn = null;

PreparedStatement ps = null;

ResultSet rs = null;

boolean hasOrders = false;

try {

    conn = DBConnection.getConnection();

    String sql =
            "SELECT o.* FROM orders o " +
            "JOIN users u ON o.user_id = u.user_id " +
            "WHERE u.email=? " +
            "ORDER BY order_id DESC";

    ps = conn.prepareStatement(sql);

    ps.setString(1, email);

    rs = ps.executeQuery();

    while(rs.next()){

        hasOrders = true;

        int orderId =
                rs.getInt("order_id");

        double totalAmount =
                rs.getDouble("total_amount");

        String orderStatus =
                rs.getString("order_status");

        Timestamp orderDate =
                rs.getTimestamp("order_date");

        String statusClass = "";

        if(orderStatus.equalsIgnoreCase("PENDING")){

            statusClass = "pending";

        }else if(orderStatus.equalsIgnoreCase("CONFIRMED")){

            statusClass = "preparing";

        }else if(orderStatus.equalsIgnoreCase("PREPARING")){

            statusClass = "preparing";

        }else if(orderStatus.equalsIgnoreCase("OUT_FOR_DELIVERY")){

            statusClass = "delivery";

        }else if(orderStatus.equalsIgnoreCase("DELIVERED")){

            statusClass = "delivered";

        }else if(orderStatus.equalsIgnoreCase("CANCELLED")){

            statusClass = "cancelled";
        }
%>

						<tr>

							<td>#<%= orderId %>

							</td>

							<td>Rs. <%= totalAmount %>

							</td>

							<td><span class="status <%= statusClass %>"> <%= orderStatus %>

							</span></td>

							<td><%= orderDate %></td>

						</tr>

						<%
    }

    if(!hasOrders){
%>

						<tr>

							<td colspan="4" class="text-center text-danger fw-bold p-4">

								Your order history is empty</td>

						</tr>

						<%
    }

}catch(Exception e){

    e.printStackTrace();
}
%>

					</tbody>

				</table>

			</div>

		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>