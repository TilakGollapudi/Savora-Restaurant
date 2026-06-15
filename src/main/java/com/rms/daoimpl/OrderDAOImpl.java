package com.rms.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.rms.dao.OrderDAO;
import com.rms.utility.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    private static final double GST_PERCENT = 5.0;
    private static final double SGST_PERCENT = 5.0;

    @Override
    public boolean placeOrder(int userId, double foodTotal) {

        boolean status = false;

        try {

            Connection conn = DBConnection.getConnection();

            double gstAmount = (foodTotal * GST_PERCENT) / 100;

            double sgstAmount = (foodTotal * SGST_PERCENT) / 100;

            double finalBill = foodTotal + gstAmount + sgstAmount;

            String query =
                    "INSERT INTO orders(user_id,food_total,gst,sgst,final_bill) VALUES(?,?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(query);

            ps.setInt(1, userId);
            ps.setDouble(2, foodTotal);
            ps.setDouble(3, gstAmount);
            ps.setDouble(4, sgstAmount);
            ps.setDouble(5, finalBill);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                status = true;
            }

            System.out.println("========= BILL =========");
            System.out.println("Food Total : " + foodTotal);
            System.out.println("GST        : " + gstAmount);
            System.out.println("SGST       : " + sgstAmount);
            System.out.println("Final Bill : " + finalBill);
            System.out.println("========================");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}