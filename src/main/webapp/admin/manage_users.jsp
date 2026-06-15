<%@page import="java.sql.*"%>
<%@page import="com.rms.utility.DBConnection"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Savora | Manage Users</title>

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
	padding: 40px;
	border-radius: 20px;
	color: white;
	margin-bottom: 35px;
}

.page-title {
	font-size: 42px;
	font-weight: 700;
}

.page-subtitle {
	font-size: 16px;
	color: #d1d5db;
	margin-top: 10px;
}

/* CARD */
.user-card {
	border: none;
	border-radius: 20px;
	overflow: hidden;
}

/* TABLE */
.table {
	margin-bottom: 0;
}

.table thead {
	background: #111827;
	color: white;
}

.table th {
	padding: 18px;
	font-size: 15px;
	font-weight: 600;
	vertical-align: middle;
}

.table td {
	padding: 16px;
	vertical-align: middle;
	font-size: 15px;
	color: #374151;
}

/* HOVER */
.table tbody tr:hover {
	background: #f9fafb;
	transition: 0.3s;
}

/* ROLE BADGES */
.role-badge {
	padding: 8px 15px;
	border-radius: 30px;
	color: white;
	font-size: 13px;
	font-weight: 600;
}

.admin-role {
	background: #dc2626;
}

.customer-role {
	background: #10b981;
}

/* ICON CIRCLE */
.icon-circle {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	background: #111827;
	color: white;
	font-size: 18px;
}

/* BUTTON */
.back-btn {
	border-radius: 10px;
	padding: 12px 20px;
	font-weight: 600;
}

/* RESPONSIVE */
@media ( max-width :768px) {
	.page-title {
		font-size: 32px;
	}
	.table th, .table td {
		font-size: 13px;
		padding: 12px;
	}
}
</style>

</head>

<body>

	<!-- ADMIN NAVBAR -->

	<%@ include file="../common/adminnavbar.jsp"%>

	<div class="container mt-5 mb-5">

		<!-- PAGE HEADER -->

		<div class="page-header shadow">
			<div
				class="d-flex justify-content-between align-items-center flex-wrap">

				<div>
					<h1 class="page-title">Manage Users</h1>
					<p class="page-subtitle">View, monitor, and manage all
						registered users of the Savora platform</p>
				</div>

				<div>
					<a href="dashboard.jsp" class="btn btn-warning back-btn"> <i
						class="bi bi-arrow-left-circle-fill"></i> Return to Dashboard
					</a>
				</div>
			</div>
		</div>

		<!-- USER TABLE -->

		<div class="card shadow user-card">

			<div class="table-responsive">

				<table class="table table-hover align-middle">

					<thead>

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
Connection conn = null;

PreparedStatement ps = null;

ResultSet rs = null;

try{

    conn = DBConnection.getConnection();

    String sql =
            "SELECT * FROM users ORDER BY user_id DESC";

    ps = conn.prepareStatement(sql);

    rs = ps.executeQuery();

    while(rs.next()){

        int userId =
                rs.getInt("user_id");

        String fullName =
                rs.getString("full_name");

        String email =
                rs.getString("email");

        String phone =
                rs.getString("phone");

        String role =
                rs.getString("role");

        String roleClass = "";

        if(role.equalsIgnoreCase("ADMIN")){

            roleClass = "admin-role";

        }else{

            roleClass = "customer-role";
        }
%>

						<!-- USER ROW -->

						<tr>

							<!-- USER ID -->

							<td><strong> #<%= userId %>

							</strong></td>

							<!-- NAME -->

							<td>

								<div class="d-flex align-items-center gap-3">

									<div class="icon-circle">

										<i class="bi bi-person-fill"></i>

									</div>

									<div>

										<strong> <%= fullName %>

										</strong>

									</div>

								</div>

							</td>

							<!-- EMAIL -->

							<td><i class="bi bi-envelope-fill text-primary"></i> <%= email %>

							</td>

							<!-- PHONE -->

							<td><i class="bi bi-telephone-fill text-success"></i> <%= phone %>

							</td>

							<!-- ROLE -->

							<td><span class="role-badge <%= roleClass %>"> <%= role %>

							</span></td>

						</tr>

						<%
    }

}catch(Exception e){

    e.printStackTrace();
%>

						<!-- ERROR -->

						<tr>

							<td colspan="5" class="text-center text-danger fw-bold p-4">

								Error Loading Users</td>

						</tr>

						<%
}finally{

    try{

        if(rs != null)
            rs.close();

        if(ps != null)
            ps.close();

        if(conn != null)
            conn.close();

    }catch(Exception e){

        e.printStackTrace();
    }
}
%>

					</tbody>

				</table>

			</div>

		</div>

	</div>

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>

</body>

</html>