package com.rms.model;

public class Reservation {

	private int id;
	private String customerName;
	private int persons;
	private String reservationDate;

	public Reservation() {
	}

	public Reservation(int id, String customerName, int persons, String reservationDate) {
		this.id = id;
		this.customerName = customerName;
		this.persons = persons;
		this.reservationDate = reservationDate;
	}

	public String getCustomerName() {
		return customerName;
	}

	public int getId() {
		return id;
	}

	public int getPersons() {
		return persons;
	}

	public String getReservationDate() {
		return reservationDate;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setPersons(int persons) {
		this.persons = persons;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}
}