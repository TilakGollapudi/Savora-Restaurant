<!-- ========================= checkout.jsp ========================= -->

<%@page import="java.sql.*"%>
<%@page import="com.rms.utility.DBConnection"%>

<%
String email = (String) session.getAttribute("userEmail");

if (email == null) {

	response.sendRedirect("../auth/login.jsp");
	return;
}
%>
<%
double subTotal = 0;
double gst = 0;
double sbCess = 0;
double finalTotal = 0;

try {

	Connection conn = DBConnection.getConnection();

	String sql = "SELECT f.price, c.quantity " + "FROM cart_items c " + "JOIN food_items f ON c.food_id = f.food_id "
	+ "JOIN cart ca ON c.cart_id = ca.cart_id " + "JOIN users u ON ca.user_id = u.user_id " + "WHERE u.email=?";

	PreparedStatement ps = conn.prepareStatement(sql);

	ps.setString(1, email);

	ResultSet rs = ps.executeQuery();

	while (rs.next()) {

		subTotal += rs.getDouble("price") * rs.getInt("quantity");
	}

	gst = subTotal * 0.05;
	sbCess = subTotal * 0.01;

	finalTotal = subTotal + gst + sbCess;

} catch (Exception e) {

	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Savora | Checkout</title>

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

/* PAGE */
.page-title {
	font-size: 42px;
	font-weight: 700;
	color: #111827;
	margin-bottom: 10px;
}

.page-subtitle {
	color: #6b7280;
	font-size: 16px;
	margin-bottom: 35px;
}

/* CARD */
.checkout-card {
	border: none;
	border-radius: 24px;
	padding: 40px;
	background: white;
}

.summary-card {
	background: #111827;
	color: white;
	border-radius: 24px;
	padding: 35px;
	height: 100%;
}

/* PAYMENT OPTION */
.payment-option {
	border: 2px solid #e5e7eb;
	border-radius: 16px;
	padding: 18px;
	margin-bottom: 15px;
	cursor: pointer;
	transition: 0.3s;
	font-weight: 500;
}

.payment-option:hover {
	border-color: #f59e0b;
	background: #fffaf0;
}

/* PAYMENT SECTION */
.payment-section {
	display: none;
	margin-top: 25px;
	padding: 25px;
	border-radius: 16px;
	background: #f9fafb;
	border: 1px solid #e5e7eb;
}

/* QR */
.qr-box {
	text-align: center;
}

.qr-box img {
	width: 220px;
	height: 220px;
	border-radius: 16px;
	background: white;
	padding: 10px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

/* FORM */
.form-control, .form-select {
	height: 52px;
	border-radius: 12px;
}

/* BUTTON */
.pay-btn {
	background: #111827;
	color: white;
	border: none;
	padding: 15px;
	font-size: 18px;
	font-weight: 600;
	border-radius: 12px;
	transition: 0.3s;
}

.pay-btn:hover {
	background: black;
	color: white;
}

/* OTP */
.otp-box {
	background: #ecfeff;
	border: 1px solid #a5f3fc;
	padding: 18px;
	border-radius: 15px;
	margin-top: 20px;
}

/* ORDER SUMMARY */
.summary-title {
	font-size: 28px;
	font-weight: 700;
	margin-top: 20px;
	margin-bottom: 30px;
}

.item-box {
	background: rgba(255, 255, 255, 0.08);
	padding: 16px;
	border-radius: 14px;
	margin-bottom: 15px;
}

.food-name {
	font-size: 18px;
	font-weight: 600;
	margin-bottom: 10px;
}

.item-details {
	display: flex;
	justify-content: space-between;
	font-size: 15px;
	color: #d1d5db;
	margin-bottom: 8px;
}

.item-total {
	text-align: right;
	font-size: 18px;
	font-weight: 700;
	color: #fbbf24;
}

.summary-row {
	display: flex;
	justify-content: space-between;
	margin-top: 15px;
	font-size: 17px;
}

.total-row {
	border-top: 1px solid rgba(255, 255, 255, 0.2);
	padding-top: 20px;
	margin-top: 25px;
	font-size: 24px;
	font-weight: 700;
}

.badge-custom {
	background: #f59e0b;
	padding: 10px 16px;
	border-radius: 50px;
	font-size: 14px;
	font-weight: 600;
}

.empty-cart {
	text-align: center;
	background: white;
	color: #111827;
	padding: 25px;
	border-radius: 15px;
}
</style>

</head>

<body>

	<!-- NAVBAR -->

	<%@ include file="../common/customernavbar.jsp"%>

	<div class="container py-5">

		<div class="row g-4">

			<!-- LEFT SIDE -->

			<div class="col-lg-8">

				<div class="checkout-card shadow">

					<%
					String error = request.getParameter("error");

					if (error != null) {
					%>

					<div class="alert alert-danger mb-4">We couldn’t process your
						payment. Please try again.</div>

					<%
					}
					%>

					<h1 class="page-title">Checkout & Payment</h1>
					<p class="page-subtitle">Select your payment method and
						complete your order securely.</p>

					<form action="<%=request.getContextPath()%>/payment" method="post"
						onsubmit="return validateCheckout()">


						<!-- DELIVERY DETAILS -->

						<h4 class="mb-4">Delivery Information</h4>

						<div class="row">

							<div class="col-md-6 mb-3">

								<label class="form-label">Full Name</label> <input type="text"
									name="customerName" class="form-control" required>

							</div>

							<div class="col-md-6 mb-3">

								<label class="form-label">Phone Number</label> <input
									type="text" name="mobile" class="form-control" required>

							</div>

							<div class="col-12 mb-3">

								<label class="form-label">Delivery Address</label>

								<textarea name="address" class="form-control" rows="3" required></textarea>

							</div>

							<div class="col-md-6 mb-3">

								<label class="form-label">City</label> <input type="text"
									name="city" class="form-control" required>

							</div>

							<div class="col-md-6 mb-3">

								<label class="form-label">PIN code</label> <input type="text"
									name="pincode" class="form-control" required>

							</div>

						</div>

						<hr>

						<div class="card shadow-sm p-4 mb-4">

							<h5 class="mb-3">
								<i class="bi bi-ticket-perforated-fill"></i> Apply Coupon
							</h5>

							<div class="input-group">

								<input type="text" id="couponCode" name="couponCode"
									class="form-control" placeholder="Enter Coupon Code">

								<button type="button" class="btn btn-success"
									onclick="applyCoupon()">
									<i class="bi bi-ticket-perforated-fill"></i> Apply Coupon
								</button>

							</div>

							<div id="couponMessage" class="mt-3"></div>

							<input type="hidden" id="discountAmount" name="discountAmount"
								value="0"> <input type="hidden" id="couponId"
								name="couponId" value=""> <input type="hidden"
								id="finalAmountInput" name="finalAmount"
								value="<%=String.format("%.2f", finalTotal)%>">
						</div>

						<!-- PAYMENT METHODS -->

						<h5 class="mb-4">Choose Payment Method</h5>

						<!-- UPI -->

						<label class="payment-option d-block"><input type="radio"
							name="paymentMethod" value="UPI" checked
							onchange="updatePaymentMethod(this.value)"
							onclick="showSection('upiSection')"> <i
							class="bi bi-qr-code-scan"></i> Pay via UPI </label>

						<!-- CARD -->

						<label class="payment-option d-block"> <input type="radio"
							name="paymentMethod" value="CARD"
							onchange="updatePaymentMethod(this.value)"
							onclick="showSection('cardSection')"> <i
							class="bi bi-credit-card-fill"></i> Pay via CARD

						</label>

						<!-- NET BANKING -->

						<label class="payment-option d-block"> <input type="radio"
							name="paymentMethod" value="NET_BANKING"
							onchange="updatePaymentMethod(this.value)"
							onclick="showSection('bankSection')"> <i
							class="bi bi-bank"></i> Pay via Net Banking

						</label>

						<!-- COD -->

						<label class="payment-option d-block"> <input type="radio"
							name="paymentMethod" value="CASH_ON_DELIVERY"
							onchange="updatePaymentMethod(this.value)"
							onclick="showSection('codSection')"> <i
							class="bi bi-cash-stack"></i> Pay on Delivery

						</label>

						<!-- ================= UPI ================= -->
						<%
						String upiId = "9381705449@ybl";
						String payeeName = "Savora Restaurant";

						String upiLink = "upi://pay?pa=" + upiId + "&pn=" + java.net.URLEncoder.encode(payeeName, "UTF-8") + "&am="
								+ String.format("%.2f", finalTotal) + "&cu=INR";

						String qrUrl = "https://api.qrserver.com/v1/create-qr-code/?size=250x250&data="
								+ java.net.URLEncoder.encode(upiLink, "UTF-8");
						%>

						<!-- ================= UPI ================= -->

						<div id="upiSection" class="payment-section"
							style="display: block;">

							<h4 class="mb-4">
								<i class="bi bi-qr-code-scan"></i> Pay via UPI
							</h4>

							<!-- Amount -->
							<div class="alert alert-success text-center">
								<h5 class="mb-0">
									Amount to Pay : <strong> Rs. <span id="upiAmount">
											<%=String.format("%.2f", finalTotal)%>
									</span>
									</strong>
								</h5>
							</div>

							<!-- QR Code -->
							<div class="qr-box mb-4">

								<img id="upiQrCode" src="<%=qrUrl%>" alt="UPI QR Code"
									class="img-fluid"> <input type="hidden" id="upiId"
									value="<%=upiId%>"> <input type="hidden" id="payeeName"
									value="<%=payeeName%>">
								<h5 class="mt-3">Scan & Pay</h5>
								<p class="text-muted mb-1">
									UPI ID : <b><%=upiId%></b>
								</p>
								<p class="text-muted mb-1">
									Payee : <b><%=payeeName%></b>
								</p>
								<p class="text-success fw-bold">
									Amount : Rs. <span id="upiAmount"> <%=String.format("%.2f", finalTotal)%>
									</span>
								</p>
								<p class="text-muted">Scan using PhonePe, Google Pay, Paytm,
									or BHIM.</p>
							</div>

							<!-- UTR Number -->
							<div class="mb-3">
								<label class="form-label"> UTR / Transaction ID </label> <input
									type="text" name="utrNumber" class="form-control"
									placeholder="Enter UTR Number">
							</div>
						</div>

						<!-- ================= CARD ================= -->

						<div id="cardSection" class="payment-section">

							<h4 class="mb-4">Pay by Card</h4>
							<div class="alert alert-primary text-center">

								<strong> Amount to Pay : Rs. <span id="cardAmount">
										<%=String.format("%.2f", finalTotal)%>
								</span>
								</strong>

							</div>

							<div class="row">

								<div class="col-md-12 mb-3">

									<label class="form-label"> Card Number </label> <input
										type="text" class="form-control" name="cardNumber"
										maxlength="16" placeholder="1234 5678 9012 3456">

								</div>

								<div class="col-md-6 mb-3">

									<label class="form-label"> Expiry Date </label> <input
										type="text" class="form-control" name="expiry"
										placeholder="MM/YY">

								</div>

								<div class="col-md-6 mb-3">

									<label class="form-label"> CVV </label> <input type="password"
										class="form-control" name="cvv" maxlength="3"
										placeholder="***">

								</div>

							</div>

							<div class="otp-box">

								<h6>

									<i class="bi bi-shield-lock-fill"></i> OTP Verification

								</h6>

								<p>Enter the OTP sent to your registered mobile number.</p>

								<input type="text" class="form-control" name="otp"
									placeholder="Enter OTP">

							</div>

						</div>

						<!-- ================= BANK ================= -->

						<div id="bankSection" class="payment-section">

							<h4 class="mb-4">Pay via Net Banking</h4>
							<div class="alert alert-info text-center">
								<strong> Amount to Pay : Rs. <span id="bankAmount">
										<%=String.format("%.2f", finalTotal)%>
								</span>
								</strong>
							</div>

							<div class="mb-3">
								<label class="form-label"> Select Bank </label> <select
									class="form-select" name="bankName">
									<option>State Bank Of India</option>
									<option>HDFC Bank</option>
									<option>ICICI Bank</option>
									<option>Axis Bank</option>
									<option>Punjab National Bank</option>
								</select>
							</div>

							<div class="mb-3">
								<label class="form-label"> Account Holder Name </label> <input
									type="text" class="form-control" name="accountHolder"
									placeholder="Enter Name">
							</div>

							<div class="otp-box">
								<h6>
									<i class="bi bi-shield-lock-fill"></i> OTP Verification
								</h6>
								<p>Enter the OTP sent by your bank to complete the
									transaction.</p>
								<input type="text" class="form-control" name="bankOtp"
									placeholder="Enter OTP">
							</div>

						</div>

						<!-- ================= COD ================= -->

						<div id="codSection" class="payment-section">
							<h4 class="mb-3">Pay On Delivery</h4>
							<div class="alert alert-warning text-center">
								<strong> Amount to Pay : Rs. <span id="codAmount">
										<%=String.format("%.2f", finalTotal)%>
								</span>
								</strong>
							</div>
							<p class="text-muted">Pay with cash when your order is
								delivered to your doorstep.</p>
						</div>

						<!-- BUTTON -->

						<button type="submit" class="btn pay-btn w-100 mt-4">
							<i class="bi bi-lock-fill"></i> Complete Payment Rs. <span
								id="payButtonAmount"> <%=String.format("%.2f", finalTotal)%>
							</span>
						</button>

					</form>

				</div>

			</div>

			<!-- ================= ORDER SUMMARY ================= -->

			<div class="col-lg-4">

				<div class="summary-card shadow">

					<span class="badge-custom"> Order Summary </span>

					<h3 class="summary-title">Review Your Order</h3>

					<%
					subTotal = 0;

					try {

						Connection conn = DBConnection.getConnection();

						String sql = "SELECT f.food_name, f.price, c.quantity " + "FROM cart_items c "
						+ "JOIN food_items f ON c.food_id = f.food_id " + "JOIN cart ca ON c.cart_id = ca.cart_id "
						+ "JOIN users u ON ca.user_id = u.user_id " + "WHERE u.email = ?";

						PreparedStatement ps = conn.prepareStatement(sql);

						ps.setString(1, email);

						ResultSet rs = ps.executeQuery();

						boolean hasItems = false;

						while (rs.next()) {

							hasItems = true;

							String foodName = rs.getString("food_name");

							double price = rs.getDouble("price");

							int quantity = rs.getInt("quantity");

							double total = price * quantity;

							subTotal += total;
					%>

					<!-- ITEM -->

					<div class="item-box">

						<div class="food-name">

							<%=foodName%>

						</div>

						<div class="item-details">

							<span> Price : Rs. <%=price%>

							</span> <span> Qty : <%=quantity%>

							</span>

						</div>

						<div class="item-total">

							Rs.
							<%=total%>

						</div>

					</div>

					<%
					}

					if (hasItems) {

					gst = subTotal * 0.05;
					sbCess = subTotal * 0.01;
					finalTotal = subTotal + gst + sbCess;
					%>

					<div class="summary-row">

						<span>Subtotal</span> <span> Rs. <span id="subtotal">
								<%=String.format("%.2f", subTotal)%>
						</span>
						</span>

					</div>
					<div class="summary-row">
						<span> GST (5%) </span> <span> Rs. <%=String.format("%.2f", gst)%>
						</span>
					</div>
						<div class="summary-row">
						<span>Swachh Bharat Cess (1%)</span> <span>Rs. <%=String.format("%.2f", sbCess)%></span>
					</div>
					<div class="summary-row text-success">
						<span>Discount Applied</span> <span> - Rs. <span id="discountValue">0.00</span>
						</span>
					</div>

				

					<div class="summary-row total-row">
						<span>Total Payable</span> <span> Rs. <span id="finalAmount">
								<%=String.format("%.2f", finalTotal)%>
						</span>
						</span>
					</div>

					<%
					} else {
					%>

					<div class="empty-cart">
						<h5>Your cart is empty</h5>
						<p class="mt-3">Start exploring the menu to build your order</p>
					</div>

					<%
					}

					} catch (Exception e) {

					out.println(e);
					}
					%>

				</div>

			</div>

		</div>

	</div>

	<!-- JAVASCRIPT -->

	<script>
		function showSection(sectionId) {

			let sections = document.querySelectorAll('.payment-section');

			sections.forEach(function(section) {

				section.style.display = 'none';
			});

			document.getElementById(sectionId).style.display = 'block';
		}
	</script>

	<!-- Bootstrap JS -->
	<script>

function applyCoupon(){

    let couponCode =
        document.getElementById("couponCode").value;

    let total =
        document.getElementById("finalAmount").innerText;

    if(couponCode.trim()===""){

        alert("Enter Coupon Code");
        return;
    }

    fetch(
        "<%=request.getContextPath()%>/validateCoupon"
        + "?couponCode=" + couponCode
        + "&total=" + total)

    .then(response => response.text())

    .then(data => {

        if(data.startsWith("SUCCESS")){

            let arr = data.split(",");

            let couponId   = arr[1];
            let percentage = arr[2];
            let discount   = arr[3];
            let finalAmt   = arr[4];

            document.getElementById("couponId").value =
                    couponId;

            document.getElementById("discountAmount").value =
                    discount;

            document.getElementById("discountValue").innerText =
                    parseFloat(discount).toFixed(2);

            document.getElementById("finalAmount").innerText =
                    parseFloat(finalAmt).toFixed(2);

            /* UPDATE PAYMENT AMOUNTS */

document.getElementById("upiAmount").innerText =
        parseFloat(finalAmt).toFixed(2);

document.getElementById("cardAmount").innerText =
        parseFloat(finalAmt).toFixed(2);

document.getElementById("bankAmount").innerText =
        parseFloat(finalAmt).toFixed(2);

document.getElementById("codAmount").innerText =
        parseFloat(finalAmt).toFixed(2);

document.getElementById("payButtonAmount").innerText =
        parseFloat(finalAmt).toFixed(2);

            /* STORE FINAL AMOUNT */
/* UPDATE QR CODE */

let upiId =
    document.getElementById("upiId").value;

let payeeName =
    document.getElementById("payeeName").value;

let amount =
    parseFloat(finalAmt).toFixed(2);

let upiLink =
    "upi://pay?pa="
    + encodeURIComponent(upiId)
    + "&pn="
    + encodeURIComponent(payeeName)
    + "&am="
    + amount
    + "&cu=INR";

let qrUrl =
    "https://api.qrserver.com/v1/create-qr-code/?size=250x250&data="
    + encodeURIComponent(upiLink);

document.getElementById("upiQrCode").src =
    qrUrl;
            let hiddenAmount =
                document.getElementById("finalAmountInput");

            if(hiddenAmount){

                hiddenAmount.value =
                        parseFloat(finalAmt).toFixed(2);
            }

            document.getElementById("couponMessage").innerHTML =

                "<div class='alert alert-success'>" +
                "Coupon Applied Successfully (" +
                percentage +
                "% OFF)" +
                "</div>";

        }else{

            document.getElementById("couponMessage").innerHTML =

                "<div class='alert alert-danger'>" +
                "Invalid Coupon Code" +
                "</div>";
        }
    });

}

</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>

</html>