package com.rms.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.rms.utility.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = null;

		try {

			System.out.println("========== PAYMENT START ==========");

			HttpSession session = request.getSession(false);

			if (session == null || session.getAttribute("userEmail") == null) {
				response.sendRedirect(request.getContextPath() + "/auth/login.jsp?error=sessionExpired");
				return;
			}

			String email = (String) session.getAttribute("userEmail");

			/* ================= CUSTOMER DETAILS ================= */

			String paymentMethod = request.getParameter("paymentMethod");
			String customerName = request.getParameter("customerName");
			String mobile = request.getParameter("mobile");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String pincode = request.getParameter("pincode");
			String finalAmountStr = request.getParameter("finalAmount");

			/* ================= PAYMENT DETAILS ================= */

			String utrNumber = request.getParameter("utrNumber");
			String upiId = request.getParameter("upiId");
			String cardNumber = request.getParameter("cardNumber");
			String bankName = request.getParameter("bankName");

			/* ================= BASIC VALIDATION ================= */

			if (paymentMethod == null || paymentMethod.trim().isEmpty()) {
				response.sendRedirect(request.getContextPath() + "/customer/checkout.jsp?error=Select Payment Method");
				return;
			}

			if (customerName == null || customerName.trim().isEmpty() || mobile == null || mobile.trim().isEmpty()
					|| address == null || address.trim().isEmpty() || city == null || city.trim().isEmpty()
					|| pincode == null || pincode.trim().isEmpty()) {

				response.sendRedirect(
						request.getContextPath() + "/customer/checkout.jsp?error=Fill all customer details");
				return;
			}

			double finalAmount;

			try {
				finalAmount = Double.parseDouble(finalAmountStr);

				if (finalAmount <= 0) {
					throw new NumberFormatException();
				}

			} catch (Exception e) {

				response.sendRedirect(request.getContextPath() + "/customer/checkout.jsp?error=Invalid Amount");
				return;
			}

			conn = DBConnection.getConnection();

			if (conn == null) {
				throw new Exception("Database connection failed");
			}

			conn.setAutoCommit(false);

			/* ================= GET USER ================= */

			int userId = 0;

			String userSql = "SELECT user_id FROM users WHERE email=?";

			try (PreparedStatement ps = conn.prepareStatement(userSql)) {

				ps.setString(1, email);

				try (ResultSet rs = ps.executeQuery()) {

					if (rs.next()) {
						userId = rs.getInt("user_id");
					}
				}
			}

			if (userId == 0) {
				throw new Exception("User not found");
			}

			/* ================= PAYMENT VALIDATION ================= */

			String paymentStatus = "SUCCESS";

			if ("CASH_ON_DELIVERY".equalsIgnoreCase(paymentMethod)) {

				paymentStatus = "PENDING";

			} else if ("UPI".equalsIgnoreCase(paymentMethod)) {

				/*
				 * If UPI ID is not provided, do not throw exception. Use a default value.
				 */

				if (upiId == null || upiId.trim().isEmpty()) {
					upiId = "N/A";
				}

				paymentStatus = "SUCCESS";

			} else if ("CARD".equalsIgnoreCase(paymentMethod)) {

				/*
				 * Allow payment even if card number is not received.
				 */

				if (cardNumber == null || cardNumber.trim().isEmpty()) {
					cardNumber = "N/A";
				}

				paymentStatus = "SUCCESS";

			} else if ("NET_BANKING".equalsIgnoreCase(paymentMethod)) {

				/*
				 * Allow payment even if bank name is not received.
				 */

				if (bankName == null || bankName.trim().isEmpty()) {
					bankName = "N/A";
				}

				paymentStatus = "SUCCESS";

			} else {

				response.sendRedirect(request.getContextPath() + "/customer/checkout.jsp?error=Invalid Payment Method");
				return;
			}

			/* ================= INSERT FOOD ORDER ================= */

			int orderId = 0;

			String orderSql = "INSERT INTO food_orders (" + "user_id, customer_name, mobile, address, city, pincode, "
					+ "total_amount, payment_method, payment_status, order_status"
					+ ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			try (PreparedStatement ps = conn.prepareStatement(orderSql, Statement.RETURN_GENERATED_KEYS)) {

				ps.setInt(1, userId);
				ps.setString(2, customerName);
				ps.setString(3, mobile);
				ps.setString(4, address);
				ps.setString(5, city);
				ps.setString(6, pincode);
				ps.setDouble(7, finalAmount);
				ps.setString(8, paymentMethod);
				ps.setString(9, paymentStatus);
				ps.setString(10, "PLACED");

				int rows = ps.executeUpdate();

				if (rows == 0) {
					throw new Exception("Order creation failed");
				}

				try (ResultSet rs = ps.getGeneratedKeys()) {

					if (rs.next()) {
						orderId = rs.getInt(1);
					}
				}
			}

			/* ================= INSERT PAYMENT ================= */

			String paymentSql = "INSERT INTO payments ("
					+ "order_id, payment_method, utr_transaction_id, payment_status, amount"
					+ ") VALUES (?, ?, ?, ?, ?)";

			try (PreparedStatement ps = conn.prepareStatement(paymentSql)) {

			    if ("CASH_ON_DELIVERY".equalsIgnoreCase(paymentMethod)) {
			        utrNumber = null;
			    }

			    ps.setInt(1, orderId);
			    ps.setString(2, paymentMethod);
			    ps.setString(3, utrNumber);
			    ps.setString(4, paymentStatus);
			    ps.setDouble(5, finalAmount);

			    ps.executeUpdate();
			}

			/* ================= INSERT ORDERS ================= */

			String ordersSql = "INSERT INTO orders (" + "user_id, total_amount, order_status" + ") VALUES (?, ?, ?)";

			try (PreparedStatement ps = conn.prepareStatement(ordersSql)) {

				ps.setInt(1, userId);
				ps.setDouble(2, finalAmount);
				ps.setString(3, "PENDING");

				ps.executeUpdate();
			}

			/* ================= CLEAR CART ================= */

			String clearSql = "DELETE c FROM cart_items c " + "JOIN cart ca ON c.cart_id = ca.cart_id "
					+ "WHERE ca.user_id=?";

			try (PreparedStatement ps = conn.prepareStatement(clearSql)) {

				ps.setInt(1, userId);
				ps.executeUpdate();
			}

			conn.commit();

			System.out.println("========== PAYMENT SUCCESS ==========");

			response.sendRedirect(request.getContextPath() + "/customer/orders.jsp?success=1");

		} catch (Exception e) {

			try {

				if (conn != null) {
					conn.rollback();
				}

			} catch (Exception ex) {
				ex.printStackTrace();
			}

			e.printStackTrace();

			response.sendRedirect(request.getContextPath() + "/customer/checkout.jsp?error="
					+ java.net.URLEncoder.encode(e.getMessage(), "UTF-8"));

		} finally {

			try {

				if (conn != null) {
					conn.setAutoCommit(true);
					conn.close();
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}