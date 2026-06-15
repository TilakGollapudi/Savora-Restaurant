<%@page import="java.sql.*"%>
<%@page import="com.rms.utility.DBConnection"%>

<%
Connection conn = null;

PreparedStatement ps = null;

ResultSet rs = null;

String action = request.getParameter("action");

try {

	conn = DBConnection.getConnection();

	/* ================= ADD CATEGORY ================= */

	if ("add".equals(action)) {

		String categoryName = request.getParameter("category_name");

		String insertQuery = "INSERT INTO categories(category_name) VALUES(?)";

		ps = conn.prepareStatement(insertQuery);

		ps.setString(1, categoryName);

		ps.executeUpdate();

		response.sendRedirect("manage_category.jsp");

		return;
	}

	/* ================= DELETE CATEGORY ================= */

	if ("delete".equals(action)) {

		int id = Integer.parseInt(request.getParameter("id"));

		String deleteQuery = "DELETE FROM categories WHERE category_id=?";

		ps = conn.prepareStatement(deleteQuery);

		ps.setInt(1, id);

		ps.executeUpdate();

		response.sendRedirect("manage_category.jsp");

		return;
	}

	/* ================= UPDATE CATEGORY ================= */

	if ("update".equals(action)) {

		int id = Integer.parseInt(request.getParameter("category_id"));

		String categoryName = request.getParameter("category_name");

		String updateQuery = "UPDATE categories SET category_name=? WHERE category_id=?";

		ps = conn.prepareStatement(updateQuery);

		ps.setString(1, categoryName);

		ps.setInt(2, id);

		ps.executeUpdate();

		response.sendRedirect("manage_category.jsp");

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

<title>Savora | Manage Categories</title>

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

/* CARDS */
.custom-card {
	border: none;
	border-radius: 22px;
	overflow: hidden;
}

/* FORM */
.form-control {
	height: 50px;
	border-radius: 12px;
	border: 1px solid #d1d5db;
}

.form-control:focus {
	box-shadow: none;
	border-color: #111827;
}

/* BUTTONS */
.btn {
	border-radius: 10px;
	padding: 10px 18px;
	font-weight: 500;
}

.btn-dark {
	background: #111827;
}

.btn-dark:hover {
	background: #000;
}

.btn-success {
	background: #10b981;
	border: none;
}

.btn-success:hover {
	background: #059669;
}

.btn-danger {
	background: #ef4444;
	border: none;
}

.btn-danger:hover {
	background: #dc2626;
}

/* TABLE */
.table thead {
	background: #111827;
	color: white;
}

.table th {
	padding: 16px;
	vertical-align: middle;
}

.table td {
	padding: 16px;
	vertical-align: middle;
	background: white;
}

/* CATEGORY BADGE */
.category-badge {
	background: #f59e0b;
	color: white;
	padding: 8px 16px;
	border-radius: 30px;
	font-size: 14px;
	font-weight: 600;
	display: inline-block;
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
						<i class="bi bi-grid-fill"></i> Manage Categories
					</h1>
					<p class="page-subtitle">Manage and organize menu categories
						for better structure and user experience.</p>
				</div>

				<div>
					<a href="dashboard.jsp" class="btn btn-warning"> <i
						class="bi bi-arrow-left-circle"></i> Return to Dashboard
					</a>
				</div>
			</div>
		</div>

		<!-- ADD CATEGORY -->
		<div class="card shadow custom-card mb-5">
			<div class="card-body p-4">
				<h4 class="mb-4 fw-bold">
					<i class="bi bi-plus-circle-fill text-success"></i> Add New
					Category
				</h4>
				<form action="manage_category.jsp?action=add" method="post">
					<div class="row g-3">
						<!-- CATEGORY NAME -->
						<div class="col-md-10">
							<input type="text" name="category_name" class="form-control"
								placeholder="Enter category name" required>
						</div>

						<!-- BUTTON -->

						<div class="col-md-2">
							<button type="submit" class="btn btn-dark w-100 h-100">
								<i class="bi bi-plus-lg"></i> Add
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<!-- CATEGORY TABLE -->

		<div class="card shadow custom-card">

			<div class="card-body p-4">

				<div class="d-flex justify-content-between align-items-center mb-4">
					<h4 class="fw-bold">
						<i class="bi bi-table"></i> Category List
					</h4>
				</div>

				<div class="table-responsive">

					<table class="table table-hover align-middle">

						<thead>
							<tr>
								<th width="120">ID</th>
								<th>Category Name</th>
								<th width="300">Manage Actions</th>
							</tr>
						</thead>

						<tbody>

							<%
							boolean hasData = false;

							try {

								String sql = "SELECT * FROM categories ORDER BY category_id DESC";

								ps = conn.prepareStatement(sql);

								rs = ps.executeQuery();

								while (rs.next()) {

									hasData = true;

									int categoryId = rs.getInt("category_id");

									String categoryName = rs.getString("category_name");
							%>

							<!-- UPDATE FORM -->

							<form action="manage_category.jsp?action=update" method="post">

								<tr>

									<!-- CATEGORY ID -->

									<td><strong> #<%=categoryId%>

									</strong> <input type="hidden" name="category_id"
										value="<%=categoryId%>"></td>

									<!-- CATEGORY NAME -->

									<td><input type="text" name="category_name"
										value="<%=categoryName%>" class="form-control"></td>

									<!-- ACTIONS -->

									<td>

										<button type="submit" class="btn btn-success btn-sm">

											<i class="bi bi-pencil-square"></i> Update

										</button> <a
										href="manage_category.jsp?action=delete&id=<%=categoryId%>"
										class="btn btn-danger btn-sm"
										onclick="return confirm('Delete this category?')"> <i
											class="bi bi-trash-fill"></i> Delete

									</a> <a href="dashboard.jsp" class="btn btn-secondary btn-sm">

											<i class="bi bi-arrow-left"></i> Go Back

									</a>

									</td>

								</tr>

							</form>

							<%
							}

							if (!hasData) {
							%>

							<!-- NO DATA -->

							<tr>

								<td colspan="3">

									<div class="empty-box">

										<i class="bi bi-exclamation-circle-fill"></i> No Categories
										Found

									</div>

								</td>

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

		</div>

	</div>

	<!-- Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>

</html>