<%@page import="com.rms.model.User"%>
<%@page import="com.rms.daoimpl.UserDAOImpl"%>
<%@page import="com.rms.dao.UserDAO"%>

<%
String email=(String)session.getAttribute("userEmail");

if(email==null){

	response.sendRedirect("../auth/login.jsp");
	return;
}

UserDAO dao=new UserDAOImpl();

User user=dao.getUserByEmail(email);
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Savora | Edit Profile</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

</head>

<body class="bg-light">

	<%@ include file="../common/customernavbar.jsp"%>

	<div class="container mt-5">

		<div class="card shadow p-4">

			<div class="mb-6">
				<h2 class="text-3xl font-bold tracking-tight text-gray-900">
					Edit Profile</h2>
				<p class="text-sm text-gray-500 mt-1">Update your restaurant
					information and public details</p>
			</div>
			<form action="<%=request.getContextPath()%>/updateProfile"
				method="post">
				<input type="hidden" name="userId" value="<%=user.getUserId()%>">
				<div class="mb-3">
					<label class="form-label"> Full Name </label> <input type="text"
						name="fullName" class="form-control"
						value="<%=user.getFullName()%>" required>
				</div>
				<div class="mb-3">
					<label class="form-label"> Phone </label> <input type="text"
						name="phone" class="form-control" value="<%=user.getPhone()%>"
						required>
				</div>
				<div class="mb-3">
					<label class="form-label"> Address </label>
					<textarea name="address" class="form-control" rows="4"><%=user.getAddress()%></textarea>
				</div>
				<div class="d-flex justify-content-end gap-2">
					<button type="reset" class="btn btn-success px-4">Cancel</button>
					<button type="submit" class="btn btn-success px-4">Update
						Profile</button>
				</div>
			</form>

		</div>

	</div>

</body>

</html>