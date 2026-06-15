package com.rms.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.rms.utility.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/validateCoupon")
public class ValidateCouponServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String couponCode = request.getParameter("couponCode");

		double total = Double.parseDouble(request.getParameter("total"));

		response.setContentType("text/plain");

		try {

			Connection conn = DBConnection.getConnection();

			String sql = "SELECT * FROM coupons " + "WHERE coupon_code=? " + "AND is_active=TRUE "
					+ "AND expiry_date>=CURDATE()";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, couponCode);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				int couponId = rs.getInt("coupon_id");

				double percentage = rs.getDouble("discount_percentage");

				double discount = total * percentage / 100.0;

				double finalAmount = total - discount;

				response.getWriter()
						.print("SUCCESS," + couponId + "," + percentage + "," + discount + "," + finalAmount);

			} else {

				response.getWriter().print("INVALID");
			}

		} catch (Exception e) {

			e.printStackTrace();

			response.getWriter().print("ERROR");
		}
	}
}