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

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session =
				request.getSession();

		String email =
				(String) session.getAttribute("userEmail");

		if (email == null) {

			response.sendRedirect("auth/login.jsp");
			return;
		}

		int foodId =
				Integer.parseInt(request.getParameter("foodId"));

		int quantity =
				Integer.parseInt(request.getParameter("quantity"));

		Connection conn = null;

		PreparedStatement ps = null;

		ResultSet rs = null;

		try {

			conn = DBConnection.getConnection();

			/* ==========================================
			   GET USER ID
			========================================== */

			String userQuery =
					"SELECT user_id FROM users WHERE email=?";

			ps = conn.prepareStatement(userQuery);

			ps.setString(1, email);

			rs = ps.executeQuery();

			int userId = 0;

			if (rs.next()) {

				userId = rs.getInt("user_id");
			}

			rs.close();
			ps.close();

			/* ==========================================
			   CHECK CART EXISTS
			========================================== */

			String cartQuery =
					"SELECT cart_id FROM cart WHERE user_id=?";

			ps = conn.prepareStatement(cartQuery);

			ps.setInt(1, userId);

			rs = ps.executeQuery();

			int cartId = 0;

			if (rs.next()) {

				cartId = rs.getInt("cart_id");

			} else {

				rs.close();
				ps.close();

				String createCart =
						"INSERT INTO cart(user_id) VALUES(?)";

				ps = conn.prepareStatement(createCart);

				ps.setInt(1, userId);

				ps.executeUpdate();

				ps.close();

				ps = conn.prepareStatement(cartQuery);

				ps.setInt(1, userId);

				rs = ps.executeQuery();

				if (rs.next()) {

					cartId = rs.getInt("cart_id");
				}
			}

			rs.close();
			ps.close();

			/* ==========================================
			   CHECK ITEM ALREADY EXISTS
			========================================== */

			String checkItem =
					"SELECT quantity FROM cart_items " +
					"WHERE cart_id=? AND food_id=?";

			ps = conn.prepareStatement(checkItem);

			ps.setInt(1, cartId);

			ps.setInt(2, foodId);

			rs = ps.executeQuery();

			/* ==========================================
			   UPDATE QUANTITY
			========================================== */

			if (rs.next()) {

				int oldQty =
						rs.getInt("quantity");

				int newQty =
						oldQty + quantity;

				rs.close();
				ps.close();

				String updateQty =
						"UPDATE cart_items " +
						"SET quantity=? " +
						"WHERE cart_id=? AND food_id=?";

				ps = conn.prepareStatement(updateQty);

				ps.setInt(1, newQty);

				ps.setInt(2, cartId);

				ps.setInt(3, foodId);

				ps.executeUpdate();

			} else {

				rs.close();
				ps.close();

				/* ==========================================
				   INSERT NEW ITEM
				========================================== */

				String insertItem =
						"INSERT INTO cart_items(cart_id,food_id,quantity) " +
						"VALUES(?,?,?)";

				ps = conn.prepareStatement(insertItem);

				ps.setInt(1, cartId);

				ps.setInt(2, foodId);

				ps.setInt(3, quantity);

				ps.executeUpdate();
			}

			response.sendRedirect("customer/cart.jsp");

		} catch (Exception e) {

			e.printStackTrace();

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