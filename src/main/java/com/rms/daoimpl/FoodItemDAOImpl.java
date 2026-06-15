package com.rms.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.rms.dao.FoodItemDAO;
import com.rms.utility.DBConnection;

public class FoodItemDAOImpl implements FoodItemDAO {

    @Override
    public boolean addFoodItem(String name, double price, int categoryId) {
        boolean status = false;
        try {
            Connection conn = DBConnection.getConnection();
            String query = "INSERT INTO food_items(name,price,category_id) VALUES(?,?,?)";

            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, name);
            ps.setDouble(2, price);
            ps.setInt(3, categoryId);

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