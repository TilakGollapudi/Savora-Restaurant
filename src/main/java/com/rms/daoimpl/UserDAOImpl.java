package com.rms.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.rms.dao.UserDAO;
import com.rms.model.User;
import com.rms.utility.DBConnection;

public class UserDAOImpl implements UserDAO {

	@Override
	public boolean registerUser(String fullName, String email, String phone, String password, String address) {

		boolean status = false;

		try {

			Connection conn = DBConnection.getConnection();

			String query = "INSERT INTO users(full_name,email,phone,password,address,role) VALUES(?,?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, fullName);

			ps.setString(2, email);

			ps.setString(3, phone);

			ps.setString(4, password);

			ps.setString(5, address);

			ps.setString(6, "CUSTOMER");

			int rows = ps.executeUpdate();

			if (rows > 0) {

				status = true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return status;
	}

	@Override
	public String loginUser(String email, String password) {

		String role = null;

		try {

			Connection conn = DBConnection.getConnection();

			String query = "SELECT role FROM users WHERE email=? AND password=?";

			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, email);

			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				role = rs.getString("role");
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return role;
	}

	@Override
	public User getUserByEmail(String email) {

		User user = null;

		try {

			Connection conn = DBConnection.getConnection();

			String query = "SELECT * FROM users WHERE email=?";

			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				user = new User();

				user.setUserId(rs.getInt("user_id"));

				user.setFullName(rs.getString("full_name"));

				user.setEmail(rs.getString("email"));

				user.setPhone(rs.getString("phone"));

				user.setPassword(rs.getString("password"));

				user.setAddress(rs.getString("address"));

				user.setRole(rs.getString("role"));
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return user;
	}
}