package com.rms.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.rms.dao.ReservationDAO;
import com.rms.utility.DBConnection;

public class ReservationDAOImpl implements ReservationDAO {

    @Override
    public boolean reserveTable(String customerName, int persons, String date) {

        boolean status = false;

        try {

            Connection conn = DBConnection.getConnection();

            String query =
                    "INSERT INTO reservations(customer_name,persons,reservation_date) VALUES(?,?,?)";

            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, customerName);
            ps.setInt(2, persons);
            ps.setString(3, date);

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