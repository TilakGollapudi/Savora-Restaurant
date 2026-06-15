package com.rms.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.rms.dao.AdminDAO;
import com.rms.utility.DBConnection;

public class AdminDAOImpl implements AdminDAO {

    @Override
    public boolean adminLogin(String username, String password) {
        boolean status = false;
        try {
            Connection conn = DBConnection.getConnection();
            String query = "SELECT * FROM admins WHERE username=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                status = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}