package com.rms.model;

public class FoodItem {

	private int id;
	private String name;
	private double price;
	private int categoryId;

	public FoodItem() {
	}

	public FoodItem(int id, String name, double price, int categoryId) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.categoryId = categoryId;
	}

	public int getId() {
		return id;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public double getPrice() {
		return price;
	}

	public String getName() {
		return name;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void setName(String name) {
		this.name = name;
	}
}