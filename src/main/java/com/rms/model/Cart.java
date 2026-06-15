package com.rms.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

	private List<CartItem> items = new ArrayList<>();

	public void addItem(CartItem item) {
		items.add(item);
	}

	public List<CartItem> getItems() {
		return items;
	}

	public double calculateTotal() {

		double total = 0;

		for (CartItem item : items) {
			total += item.getTotalPrice();
		}

		return total;
	}
}