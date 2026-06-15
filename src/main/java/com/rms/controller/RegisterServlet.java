package com.rms.controller;

import java.io.IOException;

import com.rms.dao.UserDAO;
import com.rms.daoimpl.UserDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fullName = request.getParameter("fullName");

		String email = request.getParameter("email");

		String phone = request.getParameter("phone");

		String password = request.getParameter("password");

		String address = request.getParameter("address");

		UserDAO dao = new UserDAOImpl();

		boolean status = dao.registerUser(fullName, email, phone, password, address);

		System.out.println(status);

		if (status) {

			response.sendRedirect("auth/login.jsp?success=registered");

		} else {

			response.sendRedirect("auth/register.jsp?error=failed");
		}
	}
}