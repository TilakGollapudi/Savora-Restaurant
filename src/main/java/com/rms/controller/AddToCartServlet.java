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

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection conn = null;

		try {

			HttpSession session = request.getSession();

			String email = (String) session.getAttribute("userEmail");

			if (email == null) {

				response.sendRedirect(request.getContextPath() + "/auth/login.jsp");

				return;
			}

			int foodId = Integer.parseInt(request.getParameter("foodId"));

			int quantity = Integer.parseInt(request.getParameter("quantity"));

			conn = DBConnection.getConnection();

			/* GET USER ID */

			int userId = 0;

			PreparedStatement userPs = conn.prepareStatement("SELECT user_id FROM users WHERE email=?");

			userPs.setString(1, email);

			ResultSet userRs = userPs.executeQuery();

			if (userRs.next()) {

				userId = userRs.getInt("user_id");
			}

			/* GET CART ID */

			int cartId = 0;

			PreparedStatement cartPs = conn.prepareStatement("SELECT cart_id FROM cart WHERE user_id=?");

			cartPs.setInt(1, userId);

			ResultSet cartRs = cartPs.executeQuery();

			if (cartRs.next()) {

				cartId = cartRs.getInt("cart_id");

			} else {

				PreparedStatement insertCart = conn.prepareStatement("INSERT INTO cart(user_id) VALUES(?)",
						Statement.RETURN_GENERATED_KEYS);

				insertCart.setInt(1, userId);

				insertCart.executeUpdate();

				ResultSet generated = insertCart.getGeneratedKeys();

				if (generated.next()) {

					cartId = generated.getInt(1);
				}
			}

			/* CHECK ITEM EXISTS */

			PreparedStatement checkPs = conn
					.prepareStatement("SELECT quantity FROM cart_items " + "WHERE cart_id=? AND food_id=?");

			checkPs.setInt(1, cartId);
			checkPs.setInt(2, foodId);

			ResultSet checkRs = checkPs.executeQuery();

			if (checkRs.next()) {

				PreparedStatement updatePs = conn.prepareStatement(
						"UPDATE cart_items " + "SET quantity = quantity + ? " + "WHERE cart_id=? AND food_id=?");

				updatePs.setInt(1, quantity);
				updatePs.setInt(2, cartId);
				updatePs.setInt(3, foodId);

				updatePs.executeUpdate();

			} else {

				PreparedStatement insertItem = conn
						.prepareStatement("INSERT INTO cart_items" + "(cart_id,food_id,quantity) " + "VALUES(?,?,?)");

				insertItem.setInt(1, cartId);
				insertItem.setInt(2, foodId);
				insertItem.setInt(3, quantity);

				insertItem.executeUpdate();
			}

			session.setAttribute("cartMessage", "Item added to cart successfully!");

			response.sendRedirect(request.getContextPath() + "/customer/menu.jsp");

		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}