package com.rms.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.rms.utility.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeCartItem")
public class RemoveCartItemServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			HttpSession session = request.getSession(false);

			if (session == null || session.getAttribute("userEmail") == null) {

				response.sendRedirect(request.getContextPath() + "/auth/login.jsp");

				return;
			}

			String email = (String) session.getAttribute("userEmail");

			int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));

			conn = DBConnection.getConnection();

			/* GET USER ID */

			String userSql = "SELECT user_id FROM users WHERE email=?";

			ps = conn.prepareStatement(userSql);

			ps.setString(1, email);

			rs = ps.executeQuery();

			int userId = 0;

			if (rs.next()) {

				userId = rs.getInt("user_id");
			}

			rs.close();
			ps.close();

			/* DELETE ONLY IF ITEM BELONGS TO USER */

			String deleteSql = "DELETE ci FROM cart_items ci " + "JOIN cart c ON ci.cart_id = c.cart_id "
					+ "WHERE ci.cart_item_id=? " + "AND c.user_id=?";

			ps = conn.prepareStatement(deleteSql);

			ps.setInt(1, cartItemId);
			ps.setInt(2, userId);

			ps.executeUpdate();

			response.sendRedirect(request.getContextPath() + "/customer/cart.jsp");

		} catch (Exception e) {

			e.printStackTrace();

			response.sendRedirect(request.getContextPath() + "/customer/cart.jsp");

		} finally {

			try {

				if (rs != null)
					rs.close();

				if (ps != null)
					ps.close();

				if (conn != null)
					conn.close();

			} catch (Exception e) {

				e.printStackTrace();
			}
		}
	}
}