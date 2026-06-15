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

.main-navbar{
    background:#111827;
    padding:14px 0;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

.navbar-brand{
    color:white !important;
    font-size:30px;
    font-weight:700;
}

.navbar-brand span{
    color:#f59e0b;
}

.nav-link{
    color:white !important;
    font-size:15px;
    font-weight:500;
    margin-left:10px;
    transition:0.3s;
    padding:10px 15px !important;
    border-radius:8px;
}

.nav-link:hover{
    background:#1f2937;
    color:#f59e0b !important;
}

.login-btn{
    background:#2563eb;
    border-radius:8px;
}

.login-btn:hover{
    background:#1d4ed8 !important;
}

.register-btn{
    background:#f59e0b;
    color:white !important;
    border-radius:8px;
}

.register-btn:hover{
    background:#d97706 !important;
}

</style>

<!-- NAVBAR -->

<nav class="navbar navbar-expand-lg navbar-dark main-navbar">

    <div class="container-fluid px-4">

        <!-- LOGO -->

        <a class="navbar-brand"
           href="<%= request.getContextPath() %>/index.jsp">

            <span> Savora </span>

        </a>

        <!-- MOBILE BUTTON -->

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#mainNavbar">

            <span class="navbar-toggler-icon"></span>

        </button>

        <!-- NAV ITEMS -->

        <div class="collapse navbar-collapse"
             id="mainNavbar">

            <ul class="navbar-nav ms-auto align-items-lg-center">

                <!-- HOME -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%= request.getContextPath() %>/index.jsp">

                        <i class="bi bi-house-fill"></i>

                        Home

                    </a>

                </li>

                <!-- MENU -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%= request.getContextPath() %>/customer/menu.jsp">

                        <i class="bi bi-grid-fill"></i>

                        Menu

                    </a>

                </li>

                <!-- LOGIN -->

                <li class="nav-item">

                    <a class="nav-link login-btn"
                       href="<%= request.getContextPath() %>/auth/login.jsp">

                        <i class="bi bi-box-arrow-in-right"></i>

                        Sign In

                    </a>

                </li>

                <!-- REGISTER -->

                <li class="nav-item ms-lg-2">

                    <a class="nav-link register-btn"
                       href="<%= request.getContextPath() %>/auth/register.jsp">

                        <i class="bi bi-person-plus-fill"></i>

                        Sign Up

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