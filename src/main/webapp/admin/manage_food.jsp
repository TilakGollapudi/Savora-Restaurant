<%@page import="java.sql.*"%>
<%@page import="com.rms.utility.DBConnection"%>

<%
Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

String action = request.getParameter("action");

try {

	conn = DBConnection.getConnection();

	/* ADD FOOD */
if ("add".equals(action)) {

    try {

        int categoryId =
                Integer.parseInt(request.getParameter("category_id"));

        String foodName =
                request.getParameter("food_name");

        String description =
                request.getParameter("description");

        double price =
                Double.parseDouble(request.getParameter("price"));

        String imageUrl =
                request.getParameter("image_url");

        String insertQuery =
                "INSERT INTO food_items(category_id,food_name,description,price,image_url) VALUES(?,?,?,?,?)";

        ps = conn.prepareStatement(insertQuery);

        ps.setInt(1, categoryId);
        ps.setString(2, foodName);
        ps.setString(3, description);
        ps.setDouble(4, price);
        ps.setString(5, imageUrl);

        int result = ps.executeUpdate();
    	response.sendRedirect("manage_food.jsp");
     } catch (Exception ex) {

        out.println("<h2 style='color:red'>");
        out.println(ex.getMessage());
        out.println("</h2>");

        ex.printStackTrace();
    }

    return;
}

	/* DELETE FOOD */
	if ("delete".equals(action)) {

		int id = Integer.parseInt(request.getParameter("id"));

		String deleteQuery = "DELETE FROM food_items WHERE food_id=?";

		ps = conn.prepareStatement(deleteQuery);

		ps.setInt(1, id);

		ps.executeUpdate();

		response.sendRedirect("manage_food.jsp");

		return;
	}

	/* UPDATE FOOD */
	if ("update".equals(action)) {

		int id = Integer.parseInt(request.getParameter("food_id"));

		int categoryId = Integer.parseInt(request.getParameter("category_id"));

		String foodName = request.getParameter("food_name");

		String description = request.getParameter("description");

		double price = Double.parseDouble(request.getParameter("price"));

		String imageUrl = request.getParameter("image_url");

		String updateQuery = "UPDATE food_items SET category_id=?, food_name=?, description=?, price=?, image_url=? WHERE food_id=?";

		ps = conn.prepareStatement(updateQuery);

		ps.setInt(1, categoryId);
		ps.setString(2, foodName);
		ps.setString(3, description);
		ps.setDouble(4, price);
		ps.setString(5, imageUrl);
		ps.setInt(6, id);

		ps.executeUpdate();

		response.sendRedirect("manage_food.jsp");

		return;
	}

} catch (Exception e) {

	e.printStackTrace();

	out.println("<h3 style='color:red'>Error : " + e.getMessage() + "</h3>");
}
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Savora | Manage Menu</title>

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
	color: #d1d5db;
	margin-top: 10px;
}

/* CARD */
.food-card {
	border: none;
	border-radius: 20px;
}

/* FORM */
.form-control {
	border-radius: 10px;
	padding: 12px;
}

.form-control:focus {
	box-shadow: none;
	border-color: #111827;
}

/* BUTTONS */
.btn {
	border-radius: 10px;
	font-weight: 600;
	padding: 10px 16px;
}

/* TABLE */
.table th {
	vertical-align: middle;
	font-size: 15px;
}

.table td {
	vertical-align: middle;
}

.food-img {
	width: 100px;
	height: 70px;
	object-fit: cover;
	border-radius: 10px;
}

/* ACTION BUTTONS */
.action-btn {
	margin-bottom: 5px;
}

/* HOVER */
.table tbody tr:hover {
	background: #f9fafb;
}

/* RESPONSIVE */
@media ( max-width :768px) {
	.page-title {
		font-size: 30px;
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
					<h1 class="page-title">Manage Menu</h1>
					<p class="page-subtitle">Manage Savora's menu items including
						create, update, and removal of dishes</p>
				</div>

				<div>
					<a href="dashboard.jsp" class="btn btn-warning"> <i
						class="bi bi-arrow-left-circle-fill"></i> Return to Dashboard
					</a>
				</div>
			</div>

		</div>

		<!-- ADD FOOD FORM -->

		<div class="card shadow food-card p-4 mb-5">

			<h4 class="mb-4 fw-bold">
				<i class="bi bi-plus-circle-fill text-success"></i> Add New Menu Item
			</h4>

			<form action="manage_food.jsp?action=add" method="post">

				<div class="row">

					<!-- FOOD NAME -->

					<div class="col-md-3 mb-3">

						<label class="form-label fw-semibold"> Menu Item Name</label> <input
							type="text" name="food_name" class="form-control"
							placeholder="Enter Food Name" required>

					</div>

					<div class="col-md-2 mb-3">

						<label class="form-label fw-semibold"> Menu Category </label> <select
							name="category_id" class="form-control" required>
							<option value="">Choose a category</option>

							<%
							PreparedStatement catPs = conn.prepareStatement("SELECT * FROM categories");

							ResultSet catRs = catPs.executeQuery();

							while (catRs.next()) {
							%>

							<option value="<%=catRs.getInt("category_id")%>">

								<%=catRs.getString("category_name")%>

							</option>

							<%
							}
							%>

						</select>

					</div>

					<!-- DESCRIPTION -->

					<div class="col-md-3 mb-3">

						<label class="form-label fw-semibold"> Description </label> <input
							type="text" name="description" class="form-control"
							placeholder="Enter menu item description" required>

					</div>

					<!-- PRICE -->

					<div class="col-md-2 mb-3">

						<label class="form-label fw-semibold"> Price (Rs.) </label> <input
							type="number" step="0.01" name="price" class="form-control"
							placeholder="e.g. 199.00" required>

					</div>

					<!-- IMAGE URL -->

					<div class="col-md-3 mb-3">

						<label class="form-label fw-semibold"> Menu Item Image </label> <input
							type="text" name="image_url" class="form-control"
							placeholder="https://example.com/image.jpg" required>

					</div>

					<!-- BUTTON -->

					<div class="col-md-1 mb-3 d-flex align-items-end">

						<button type="submit" class="btn btn-dark w-200">Add Item</button>

					</div>

				</div>

			</form>

		</div>

		<!-- FOOD TABLE -->

		<div class="card shadow food-card p-4">

			<div class="d-flex justify-content-between align-items-center mb-4">
				<h4 class="fw-bold mb-0">
					<i class="bi bi-grid-fill text-primary"></i> Menu Items List
				</h4>
			</div>

			<div class="table-responsive">

				<table class="table table-bordered table-hover align-middle">

					<thead class="table-dark">

						<tr>
							<th>ID</th>
							<th>Category</th>
							<th>Item Name</th>
							<th>Description</th>
							<th>Price (Rs.) </th>
							<th>Image</th>
							<th width="260">Manage Actions</th>
						</tr>

					</thead>

					<tbody>

						<%
						try {

							String sql =
									"SELECT f.*, c.category_name " +
									"FROM food_items f " +
									"INNER JOIN categories c " +
									"ON f.category_id = c.category_id " +
									"ORDER BY f.food_id DESC";

							ps = conn.prepareStatement(sql);

							rs = ps.executeQuery();

							while (rs.next()) {

								int foodId = rs.getInt("food_id");
								int categoryId = rs.getInt("category_id");

								String categoryName = rs.getString("category_name");

								String foodName = rs.getString("food_name");

								String description = rs.getString("description");

								double price = rs.getDouble("price");

								String imageUrl = rs.getString("image_url");
						%>

						<!-- UPDATE FORM -->

						<form action="manage_food.jsp?action=update" method="post">

							<tr>

								<!-- ID -->

								<td><input type="hidden" name="food_id" value="<%=foodId%>">
									<strong> #<%=foodId%>

								</strong></td>

								<!-- CATEGORY -->
								<td><select name="category_id" class="form-control">

										<%
										PreparedStatement cp = conn.prepareStatement("SELECT * FROM categories");

										ResultSet cr = cp.executeQuery();

										while (cr.next()) {

											int cid = cr.getInt("category_id");
										%>

										<option value="<%=cid%>"
											<%=cid == categoryId ? "selected" : ""%>>

											<%=cr.getString("category_name")%>

										</option>

										<%
										}
										%>

								</select></td>

								<!-- FOOD NAME -->

								<td><input type="text" name="food_name"
									value="<%=foodName%>" class="form-control"></td>

								<!-- DESCRIPTION -->

								<td><input type="text" name="description"
									value="<%=description%>" class="form-control"></td>

								<!-- PRICE -->

								<td><input type="number" step="0.01" name="price"
									value="<%=price%>" class="form-control"></td>

								<!-- IMAGE -->

								<td><img src="<%=imageUrl%>" class="food-img mb-2"> <input
									type="text" name="image_url" value="<%=imageUrl%>"
									class="form-control"></td>

								<!-- ACTIONS -->

								<td>
									<!-- UPDATE -->

									<button type="submit" class="btn btn-success btn-sm action-btn">

										<i class="bi bi-pencil-square"></i> Update

									</button> <!-- DELETE --> <a
									href="manage_food.jsp?action=delete&id=<%=foodId%>"
									class="btn btn-danger btn-sm action-btn"
									onclick="return confirm('Delete this food item?')"> <i
										class="bi bi-trash-fill"></i> Delete

								</a> <!-- BACK --> <a href="dashboard.jsp"
									class="btn btn-secondary btn-sm action-btn"> <i
										class="bi bi-arrow-left-circle-fill"></i> Back

								</a>

								</td>

							</tr>

						</form>

						<%
						}

						} catch (Exception e) {

						    e.printStackTrace();
						%>

						<tr>
							<td colspan="7" class="text-center text-danger fw-bold p-4">

								<%= e.getMessage() %>

							</td>
						</tr>

						<%
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