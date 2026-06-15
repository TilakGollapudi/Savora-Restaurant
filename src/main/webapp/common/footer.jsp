<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<style>

/* FOOTER */

footer{
    background:linear-gradient(135deg,#111827,#1f2937);
    color:white;
    padding:50px 0 20px;
    margin-top:60px;
}

.footer-title{
    font-size:24px;
    font-weight:700;
    margin-bottom:15px;
}

.footer-text{
    color:#d1d5db;
    line-height:1.8;
    font-size:15px;
}

.footer-links{
    list-style:none;
    padding-left:0;
}

.footer-links li{
    margin-bottom:10px;
}

.footer-links a{
    color:#d1d5db;
    text-decoration:none;
    transition:0.3s;
}

.footer-links a:hover{
    color:#f59e0b;
    padding-left:5px;
}

.footer-divider{
    border-color:rgba(255,255,255,0.15);
    margin:25px 0 15px;
}

.footer-bottom{
    text-align:center;
    color:#9ca3af;
    font-size:14px;
}

.contact-info{
    color:#d1d5db;
    line-height:2;
}

</style>

<!-- FOOTER -->

<footer>

    <div class="container">

        <div class="row">

            <!-- ABOUT -->

            <div class="col-lg-4 col-md-6 mb-4">

                <h4 class="footer-title">

                    Savora 

                </h4>

                <p class="footer-text">

                    Enjoy delicious food, easy table reservations,
                    quick online ordering and a seamless dining
                    experience with Savora.

                </p>

            </div>

            <!-- QUICK LINKS -->

            <div class="col-lg-4 col-md-6 mb-4">

                <h4 class="footer-title">

                    Quick Links

                </h4>

                <ul class="footer-links">

                    <li>
                        <a href="<%=request.getContextPath()%>/customer/home.jsp">
                            Home
                        </a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/customer/menu.jsp">
                            Menu
                        </a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/customer/cart.jsp">
                            Cart
                        </a>
                    </li>

                    <li>
                        <a href="<%=request.getContextPath()%>/customer/profile.jsp">
                            My Profile
                        </a>
                    </li>

                </ul>

            </div>

            <!-- CONTACT -->

            <div class="col-lg-4 col-md-12 mb-4">

                <h4 class="footer-title">

                    Contact Us

                </h4>

                <div class="contact-info">

                    📍 Hyderabad, Telangana, India
                    <br>

                    📞 +91 9876543210
                    <br>

                    ✉ support@Savora.com

                </div>

            </div>

        </div>

        <hr class="footer-divider">

        <div class="footer-bottom">

            © 2026 Savora Restaurant |
            All Rights Reserved |
            Designed For Savora Project

        </div>

    </div>

</footer>