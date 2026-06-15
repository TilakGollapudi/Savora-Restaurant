package com.rms.model;

public class OrderItem {

	private int id;
	private FoodItem foodItem;
	private int quantity;
	private double totalPrice;

	public OrderItem() {
	}

	public OrderItem(int id, FoodItem foodItem, int quantity, double totalPrice) {
		this.id = id;
		this.foodItem = foodItem;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
	}

	public int getId() {
		return id;
	}

	public FoodItem getFoodItem() {
		return foodItem;
	}

	public int getQuantity() {
		return quantity;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setFoodItem(FoodItem foodItem) {
		this.foodItem = foodItem;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
}