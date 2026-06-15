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

.customer-navbar{
    background:#111827;
    padding:14px 0;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
}

/* LOGO */

.navbar-brand{
    color:white !important;
    font-size:30px;
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
    padding:10px 15px !important;
    border-radius:8px;
}

.nav-link:hover{
    background:#1f2937;
    color:#f59e0b !important;
}

/* ACTIVE PAGE */

.active-link{
    background:#f59e0b;
    color:white !important;
}

/* RESERVATION LINK */

.reservation-link:hover{
    background:#1f2937;
    color:#ffffff !important;
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

<nav class="navbar navbar-expand-lg navbar-dark customer-navbar">

    <div class="container-fluid px-4">

        <!-- LOGO -->

        <a class="navbar-brand"
           href="<%= request.getContextPath() %>/customer/home.jsp">

            Savora <span>Customer</span>

        </a>

        <!-- MOBILE BUTTON -->

        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#customerNavbar">

            <span class="navbar-toggler-icon"></span>

        </button>

        <!-- NAVIGATION -->

        <div class="collapse navbar-collapse"
             id="customerNavbar">

            <ul class="navbar-nav ms-auto align-items-lg-center">

                <!-- HOME -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%= request.getContextPath() %>/customer/home.jsp">

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

                <!-- CART -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%= request.getContextPath() %>/customer/cart.jsp">

                        <i class="bi bi-cart-fill"></i>

                        Cart

                    </a>

                </li>

                <!-- CHECKOUT -->

            <!--     <li class="nav-item">

                    <a class="nav-link"
                       href="<%= request.getContextPath() %>/customer/checkout.jsp">

                        <i class="bi bi-credit-card-fill"></i>

                        Checkout

                    </a>

                </li>  
                -->

                <!-- ORDERS -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%= request.getContextPath() %>/customer/orders.jsp">

                        <i class="bi bi-bag-check-fill"></i>

                        Orders

                    </a>

                </li>

                <!-- RESERVATION -->

                <li class="nav-item">

                    <a class="nav-link reservation-link"
                       href="<%= request.getContextPath() %>/customer/reserve.jsp">

                        <i class="bi bi-calendar-check-fill"></i>

                        Reservation

                    </a>

                </li>

                <!-- MY RESERVATIONS -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%= request.getContextPath() %>/customer/viewReservations.jsp">

                        <i class="bi bi-calendar2-check-fill"></i>

                        My Reservations

                    </a>

                </li>

                <!-- PROFILE -->

                <li class="nav-item">

                    <a class="nav-link"
                       href="<%= request.getContextPath() %>/customer/profile.jsp">

                        <i class="bi bi-person-circle"></i>

                        Profile

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