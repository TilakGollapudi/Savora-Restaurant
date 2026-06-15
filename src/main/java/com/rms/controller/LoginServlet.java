package com.rms.controller;

import java.io.IOException;

import com.rms.dao.UserDAO;
import com.rms.daoimpl.UserDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");

		String password = request.getParameter("password");

		UserDAO dao = new UserDAOImpl();

		String role = dao.loginUser(email, password);

		if (role != null) {

			HttpSession session = request.getSession();

			session.setAttribute("userEmail", email);

			session.setAttribute("userRole", role);

			if (role.equalsIgnoreCase("ADMIN")) {

				response.sendRedirect("admin/dashboard.jsp");

			} else {

				response.sendRedirect("customer/home.jsp");
			}

		} else {

			response.sendRedirect("auth/login.jsp?error=invalid");
		}
	}
}