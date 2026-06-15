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

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(
			HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		int userId =
				Integer.parseInt(
				request.getParameter("userId"));

		String fullName =
				request.getParameter("fullName");

		String phone =
				request.getParameter("phone");

		String address =
				request.getParameter("address");

		try {

			Connection conn =
					DBConnection.getConnection();

			String sql =
			"UPDATE users "
			+ "SET full_name=?,phone=?,address=? "
			+ "WHERE user_id=?";

			PreparedStatement ps =
					conn.prepareStatement(sql);

			ps.setString(1, fullName);
			ps.setString(2, phone);
			ps.setString(3, address);
			ps.setInt(4, userId);

			ps.executeUpdate();

			response.sendRedirect(
			request.getContextPath()
			+ "/customer/profile.jsp?updated=true");

		}
		catch(Exception e){

			e.printStackTrace();
		}
	}
}