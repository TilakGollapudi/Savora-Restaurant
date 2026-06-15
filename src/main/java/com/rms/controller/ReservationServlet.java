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

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Reservation Servlet Called");

		HttpSession session = request.getSession();

		String email = (String) session.getAttribute("userEmail");

		if (email == null) {

			response.sendRedirect(request.getContextPath() + "/auth/login.jsp");

			return;
		}

		try {

			Connection conn = DBConnection.getConnection();

			String userQuery = "SELECT user_id FROM users WHERE email=?";

			PreparedStatement userPs = conn.prepareStatement(userQuery);

			userPs.setString(1, email);

			ResultSet rs = userPs.executeQuery();

			int userId = 0;

			if (rs.next()) {

			    userId = rs.getInt("user_id");
			}

			if(userId == 0){

			    response.getWriter().println(
			        "User not found in database"
			    );

			    return;
			}
			System.out.println("User ID = " + userId);

			String sql = "INSERT INTO reservations " + "(user_id,reservation_date,reservation_time,"
					+ "number_of_people,reservation_status) " + "VALUES(?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, userId);

			ps.setString(2, request.getParameter("date"));

			ps.setString(3, request.getParameter("time"));

			ps.setInt(4, Integer.parseInt(request.getParameter("persons")));

			ps.setString(5, "PENDING");

			int result = ps.executeUpdate();

			if (result > 0) {

				response.sendRedirect(request.getContextPath() + "/customer/viewReservations.jsp");

			} else {

				response.sendRedirect(request.getContextPath() + "/customer/reserve.jsp");
			}

		} catch (Exception e) {

			e.printStackTrace();

			response.getWriter().println(e.getMessage());
		}
	}
}