package com.rms.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.rms.utility.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateCartQuantity")
public class UpdateCartQuantityServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));

			String action = request.getParameter("action");

			Connection conn = DBConnection.getConnection();

			if ("increase".equals(action)) {

				String sql = "UPDATE cart_items " + "SET quantity = quantity + 1 " + "WHERE cart_item_id=?";

				PreparedStatement ps = conn.prepareStatement(sql);

				ps.setInt(1, cartItemId);

				ps.executeUpdate();

			} else if ("decrease".equals(action)) {

				String sql = "UPDATE cart_items " + "SET quantity = quantity - 1 " + "WHERE cart_item_id=? "
						+ "AND quantity > 1";

				PreparedStatement ps = conn.prepareStatement(sql);

				ps.setInt(1, cartItemId);

				ps.executeUpdate();
			}

			response.sendRedirect(request.getContextPath() + "/customer/cart.jsp");

		} catch (Exception e) {

			e.printStackTrace();

			response.sendRedirect(request.getContextPath() + "/customer/cart.jsp");
		}
	}
}