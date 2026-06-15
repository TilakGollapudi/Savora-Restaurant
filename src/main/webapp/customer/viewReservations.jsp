<%@page import="java.sql.*"%>
<%@page import="com.rms.utility.DBConnection"%>

<%
String email = (String)session.getAttribute("userEmail");

if(email == null){
    response.sendRedirect("../auth/login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Savora | My Reservations</title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
rel="stylesheet">

<link
rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<style>

body{
    background:#f5f5f5;
}

.page-title{
    font-size:40px;
    font-weight:700;
    color:#111827;
}

.reservation-card{
    border:none;
    border-radius:20px;
    overflow:hidden;
}

.card-header-custom{
    background:#111827;
    color:white;
    padding:18px 25px;
    font-size:22px;
    font-weight:600;
}

.info-label{
    font-weight:600;
    color:#6b7280;
}

.info-value{
    color:#111827;
    font-weight:500;
}

.status-pending{
    background:#ffc107;
    color:black;
    padding:8px 16px;
    border-radius:30px;
}

.status-confirmed{
    background:#198754;
    color:white;
    padding:8px 16px;
    border-radius:30px;
}

.status-cancelled{
    background:#dc3545;
    color:white;
    padding:8px 16px;
    border-radius:30px;
}

</style>

</head>

<body>

<%@ include file="../common/customernavbar.jsp" %>

<div class="container py-5">

    <h1 class="page-title mb-4">

        <i class="bi bi-calendar-check-fill"></i>

        My Reservations

    </h1>

<%
try{

    Connection conn = DBConnection.getConnection();

    String sql =
    "SELECT r.*,u.full_name,u.phone " +
    "FROM reservations r " +
    "INNER JOIN users u ON r.user_id=u.user_id " +
    "WHERE u.email=? " +
    "ORDER BY r.reservation_id DESC";

    PreparedStatement ps =
    conn.prepareStatement(sql);

    ps.setString(1,email);

    ResultSet rs =
    ps.executeQuery();

    boolean found = false;

    while(rs.next()){

        found = true;

        String status =
        rs.getString("reservation_status");
%>

    <div class="card shadow reservation-card mb-4">

        <div class="card-header-custom">

            Reservation ID :
            #<%= rs.getInt("reservation_id") %>

        </div>

        <div class="card-body p-4">

            <div class="row">

                <div class="col-md-6">

                    <p>

                        <span class="info-label">
                            Customer Name :
                        </span>

                        <span class="info-value">
                            <%= rs.getString("full_name") %>
                        </span>

                    </p>

                    <p>

                        <span class="info-label">
                            Phone Number :
                        </span>

                        <span class="info-value">
                            <%= rs.getString("phone") %>
                        </span>

                    </p>

                    <p>

                        <span class="info-label">
                            Reservation Date :
                        </span>

                        <span class="info-value">
                            <%= rs.getDate("reservation_date") %>
                        </span>

                    </p>

                </div>

                <div class="col-md-6">

                    <p>

                        <span class="info-label">
                            Reservation Time :
                        </span>

                        <span class="info-value">
                            <%= rs.getTime("reservation_time") %>
                        </span>

                    </p>

                    <p>

                        <span class="info-label">
                            Number Of People :
                        </span>

                        <span class="info-value">
                            <%= rs.getInt("number_of_people") %>
                        </span>

                    </p>

                    <p>

                        <span class="info-label">
                            Booked On :
                        </span>

                        <span class="info-value">
                            <%= rs.getTimestamp("created_at") %>
                        </span>

                    </p>

                    <%
                    if("PENDING".equals(status)){
                    %>

                        <span class="badge status-pending">

                            PENDING

                        </span>

                    <%
                    }
                    else if("CONFIRMED".equals(status)){
                    %>

                        <span class="badge status-confirmed">

                            CONFIRMED

                        </span>

                    <%
                    }
                    else{
                    %>

                        <span class="badge status-cancelled">

                            CANCELLED

                        </span>

                    <%
                    }
                    %>

                </div>

            </div>

            <%
            if("PENDING".equals(status)){
            %>

                <div class="alert alert-warning mt-3">

                     Waiting for Admin Approval

                </div>

            <%
            }
            else if("CONFIRMED".equals(status)){
            %>

                <div class="alert alert-success mt-3">

                     Reservation Confirmed by Admin

                </div>

            <%
            }
            else{
            %>

                <div class="alert alert-danger mt-3">

                     Reservation Cancelled by Admin

                </div>

            <%
            }
            %>

        </div>

    </div>

<%
    }

    if(!found){
%>

    <div class="alert alert-warning">

        No reservations found.

    </div>

<%
    }

}catch(Exception e){

    e.printStackTrace();
}
%>

</div>

<%@ include file="../common/footer.jsp" %>

<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>