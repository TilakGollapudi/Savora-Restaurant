package com.rms.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.rms.dao.CategoryDAO;
import com.rms.utility.DBConnection;

public class CategoryDAOImpl implements CategoryDAO {

	@Override
	public boolean addCategory(String categoryName) {
		boolean status = false;

		try {
			Connection conn = DBConnection.getConnection();
			String query = "INSERT INTO categories(category_name) VALUES(?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, categoryName);
			int rows = ps.executeUpdate();

			if (rows > 0) {
				status = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
}
