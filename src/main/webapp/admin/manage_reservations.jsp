<%@page import="java.sql.*"%>
<%@page import="com.rms.utility.DBConnection"%>

<%
try{

	Connection conn =
	DBConnection.getConnection();

	String reservationId =
	request.getParameter("reservationId");

	String status =
	request.getParameter("status");

	if(reservationId != null &&
	   status != null){

		String updateSql =
		"UPDATE reservations " +
		"SET reservation_status=? " +
		"WHERE reservation_id=?";

		PreparedStatement updatePs =
		conn.prepareStatement(updateSql);

		updatePs.setString(1,status);

		updatePs.setInt(
		2,
		Integer.parseInt(reservationId));

		updatePs.executeUpdate();

		response.sendRedirect(
		"manage_reservations.jsp");

		return;
	}
}
catch(Exception e){

	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Savora | Manage Reservations</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>
body {
	background: #f5f5f5;
}

.card-box {
	background: white;
	border-radius: 15px;
	padding: 25px;
}

.page-title {
	font-size: 32px;
	font-weight: 700;
	color: #111827;
}

.status-pending {
	background: #ffc107;
	color: black;
	padding: 6px 12px;
	border-radius: 20px;
	font-weight: 600;
}

.status-confirmed {
	background: #198754;
	color: white;
	padding: 6px 12px;
	border-radius: 20px;
	font-weight: 600;
}

.status-cancelled {
	background: #dc3545;
	color: white;
	padding: 6px 12px;
	border-radius: 20px;
	font-weight: 600;
}
</style>

</head>

<body>

	<%@ include file="../common/adminnavbar.jsp"%>

	<div class="container mt-5">

		<div class="card shadow card-box">
			<h2 class="page-title mb-4">Manage Table Reservations</h2>
			<table class="table table-bordered table-hover">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Customer</th>
						<th>Reservation Date</th>
						<th>Reservation Time</th>
						<th>Guests</th>
						<th>Current Status</th>
						<th>Manage</th>
					</tr>
				</thead>

				<tbody>

					<%
try{

	Connection conn =
	DBConnection.getConnection();

	String sql =
	"SELECT * FROM reservations " +
	"ORDER BY reservation_id DESC";

	PreparedStatement ps =
	conn.prepareStatement(sql);

	ResultSet rs =
	ps.executeQuery();

	while(rs.next()){

		String currentStatus =
		rs.getString("reservation_status");
%>

					<tr>

						<td><%= rs.getInt("reservation_id") %></td>

						<td><%= rs.getInt("user_id") %></td>

						<td><%= rs.getDate("reservation_date") %></td>

						<td><%= rs.getTime("reservation_time") %></td>

						<td><%= rs.getInt("number_of_people") %></td>

						<td>
							<%
if("PENDING".equals(currentStatus)){
%> <span class="status-pending"> PENDING </span> <%
}else if("CONFIRMED".equals(currentStatus)){
%> <span class="status-confirmed"> CONFIRMED </span> <%
}else{
%> <span class="status-cancelled"> CANCELLED </span> <%
}
%>

						</td>

						<td>
							<%
if("PENDING".equals(currentStatus)){
%>

							<form method="get" action="manage_reservations.jsp"
								style="display: inline;">
								<input type="hidden" name="reservationId"
									value="<%= rs.getInt("reservation_id") %>"> <input
									type="hidden" name="status" value="CONFIRMED">
								<button type="submit" class="btn btn-success btn-sm">
									<i class="bi bi-check-circle-fill"></i> Confirm Reservation
								</button>
							</form>

							<form method="get" action="manageReservations.jsp"
								style="display: inline;">
								<input type="hidden" name="reservationId"
									value="<%= rs.getInt("reservation_id") %>"> <input
									type="hidden" name="status" value="CANCELLED">
								<button type="submit" class="btn btn-danger btn-sm">
									<i class="bi bi-x-circle-fill"></i> Cancel Reservation
								</button>
							</form> <%
}else{
%> <span class="text-muted"> Up to Date </span> <%
}
%>

						</td>

					</tr>

					<%
	}

}
catch(Exception e){

	out.println(
	"<tr><td colspan='7'>"
	+ e.getMessage()
	+ "</td></tr>");
}
%>

				</tbody>

			</table>

		</div>

	</div>

</body>

</html>
