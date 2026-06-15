package com.rms.model;

public class CartItem {

	private FoodItem foodItem;
	private int quantity;

	public CartItem() {
	}

	public CartItem(FoodItem foodItem, int quantity) {
		this.foodItem = foodItem;
		this.quantity = quantity;
	}

	public FoodItem getFoodItem() {
		return foodItem;
	}

	public int getQuantity() {
		return quantity;
	}

	public double getTotalPrice() {
		return foodItem.getPrice() * quantity;
	}

	public void setFoodItem(FoodItem foodItem) {
		this.foodItem = foodItem;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}