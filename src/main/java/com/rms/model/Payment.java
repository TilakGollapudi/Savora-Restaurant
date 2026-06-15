package com.rms.model;

public class Payment {

	private int id;
	private int orderId;
	private double amount;
	private String paymentMethod;
	private String paymentStatus;

	public Payment() {
	}

	public Payment(int id, int orderId, double amount, String paymentMethod, String paymentStatus) {

		this.id = id;
		this.orderId = orderId;
		this.amount = amount;
		this.paymentMethod = paymentMethod;
		this.paymentStatus = paymentStatus;
	}

	public double getAmount() {
		return amount;
	}

	public int getId() {
		return id;
	}

	public int getOrderId() {
		return orderId;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
}