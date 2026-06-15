package com.rms.model;

import java.util.List;

public class Order {

	private int id;
	private int userId;
	private List<OrderItem> orderItems;

	private double foodTotal;
	private double gst;
	private double sgst;
	private double finalBill;

	public Order() {
	}

	public double calculateBill() {

		foodTotal = 0;

		for (OrderItem item : orderItems) {
			foodTotal += item.getTotalPrice();
		}

		gst = foodTotal * 0.05;
		sgst = foodTotal * 0.05;

		finalBill = foodTotal + gst + sgst;

		return finalBill;
	}

	public double getFinalBill() {
		return finalBill;
	}

	public double getFoodTotal() {
		return foodTotal;
	}

	public double getGst() {
		return gst;
	}

	public int getId() {
		return id;
	}

	public List<OrderItem> getOrderItems() {
		return orderItems;
	}

	public double getSgst() {
		return sgst;
	}

	public int getUserId() {
		return userId;
	}

	public void setFinalBill(double finalBill) {
		this.finalBill = finalBill;
	}

	public void setFoodTotal(double foodTotal) {
		this.foodTotal = foodTotal;
	}

	public void setGst(double gst) {
		this.gst = gst;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	public void setSgst(double sgst) {
		this.sgst = sgst;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
}