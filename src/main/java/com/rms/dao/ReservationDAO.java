package com.rms.dao;

public interface ReservationDAO {
	boolean reserveTable(String customerName, int persons, String date);
}
