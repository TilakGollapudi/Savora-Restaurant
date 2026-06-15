package com.rms.filter;

import java.io.IOException;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/admin/*")
public class AdminFilter extends HttpFilter {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpSession session = request.getSession(false);

		if (session == null) {

			response.sendRedirect(request.getContextPath() + "/auth/login.jsp");

			return;
		}

		Object roleObj = session.getAttribute("userRole");

		if (roleObj == null) {

			response.sendRedirect(request.getContextPath() + "/auth/login.jsp");

			return;
		}

		String role = roleObj.toString();

		if ("ADMIN".equalsIgnoreCase(role)) {

			chain.doFilter(request, response);

		} else {

			response.sendRedirect(request.getContextPath() + "/accessDenied.jsp");
		}
	}
}