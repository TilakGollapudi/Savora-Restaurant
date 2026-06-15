package com.rms.dao;

public interface OrderDAO {
	boolean placeOrder(int userId, double foodTotal);
}
