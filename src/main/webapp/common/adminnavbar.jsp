<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!-- Bootstrap CSS -->

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
rel="stylesheet">

<!-- Bootstrap Icons -->

<link
rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<!-- Google Font -->

<link
href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

/* NAVBAR */

.admin-navbar{
    background:#111827;
    padding:14px 0;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

.navbar-brand{
    color:white !important;
    font-size:28px;
    font-weight:700;
}

.navbar-brand span{
    color:#f59e0b;
}

/* NAV LINKS */

.nav-link{
    color:white !important;
    font-size:15px;
    font-weight:500;
    margin-left:10px;
    transition:0.3s;
    padding:10px 14px !important;
    border-radius:8px;
}

.nav-link:hover{
    background:#1f2937;
    color:#f59e0b !important;
}

/* ACTIVE LINK */

.active-link{
    background:#f59e0b;
    color:white !important;
}

/* LOGOUT BUTTON */

.logout-btn{
    background:#ef4444;
    color:white !important;
    border-radius:8px;
    padding:10px 18px !important;
}

.logout-btn:hover{
    background:#dc2626 !important;
    color:white !important;
}

</style>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark admin-navbar">

    <div class="container-fluid px-4">

        <!-- LOGO -->

        <a class="navbar-brand"
           href="<%= request.getContextPath() %>/admin/dashboard.jsp">

            Savora <span>Admin</span>

        </a>

        <!-- MOBILE TOGGLE -->

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#adminNavbar">

            <span class="navbar-toggler-icon"></span>

        </button>

        <!-- NAV ITEMS -->

        <div class="collapse navbar-collapse"
             id="adminNavbar">

            <ul class="navbar-nav ms-auto align-items-lg-center">

                <!-- DASHBOARD -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%= request.getContextPath() %>/admin/dashboard.jsp">

                        <i class="bi bi-speedometer2"></i>

                        Dashboard

                    </a>

                </li>

                <!-- USERS -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%= request.getContextPath() %>/admin/manage_users.jsp">

                        <i class="bi bi-people-fill"></i>

                        Users

                    </a>

                </li>

                <!-- FOOD -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%= request.getContextPath() %>/admin/manage_food.jsp">

                        <i class="bi bi-cup-hot-fill"></i>

                        Food

                    </a>

                </li>

                <!-- CATEGORY -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%= request.getContextPath() %>/admin/manage_category.jsp">

                        <i class="bi bi-grid-fill"></i>

                        Categories

                    </a>

                </li>

                <!-- ORDERS -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%= request.getContextPath() %>/admin/manage_orders.jsp">

                        <i class="bi bi-bag-check-fill"></i>

                        Orders

                    </a>

                </li>

                <!-- RESERVATIONS -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%= request.getContextPath() %>/admin/manage_reservations.jsp">

                        <i class="bi bi-calendar-check-fill"></i>

                        Reservations

                    </a>

                </li>

                <!-- REPORTS -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%= request.getContextPath() %>/admin/reports.jsp">

                        <i class="bi bi-bar-chart-fill"></i>

                        Reports

                    </a>

                </li>

                <!-- LOGOUT -->

                <li class="nav-item ms-lg-3">

                    <a class="nav-link logout-btn"
                       href="<%= request.getContextPath() %>/logout">

                        <i class="bi bi-box-arrow-right"></i>

                        Logout

                    </a>

                </li>

            </ul>

        </div>

    </div>

</nav>

<!-- Bootstrap JS -->

<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>