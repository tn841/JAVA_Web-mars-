package com.itwill.cart;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

import com.itwill.item.Item;

public class ShoppingCartService {
	HashMap<String, ShoppingCartItem> items = null;
	int numberOfItems = 0;

	public ShoppingCartService() {
		items = new HashMap<String, ShoppingCartItem>();
	}
	
	public synchronized void add(String key, Item item, int qty) {
		if (items.containsKey(key)) {
			ShoppingCartItem scitem = (ShoppingCartItem) items.get(key);
			scitem.incrementQuantity(qty);
		} else {
			ShoppingCartItem newItem = new ShoppingCartItem(item,qty);
			items.put(key, newItem);
			numberOfItems++;
		}

	}
	public synchronized void update(String key,int qty) {
		if (items.containsKey(key)) {
			ShoppingCartItem scitem = (ShoppingCartItem) items.get(key);
			scitem.decrementQuantity(qty);
			if (scitem.getQuantity() <= 0){
				items.remove(key);
				numberOfItems--;
			}
		}
	}
	public synchronized void remove(String key) {
		if (items.containsKey(key)) {
			items.remove(key);
			numberOfItems--;
		}
	}
	public synchronized Collection<ShoppingCartItem> getItems() {
		return items.values();
	}
	
	public synchronized int getNumberOfItems() {
		return numberOfItems;
	}

	public synchronized double getTotal() {
		double amount = 0.0;

		for (Iterator i = getItems().iterator(); i.hasNext();) {
			ShoppingCartItem cartItem = (ShoppingCartItem) i.next();
			Item item = (Item) cartItem.getItem();
			amount += cartItem.getQuantity() * item.getI_point();
		}
		return roundOff(amount);
	}

	private double roundOff(double x) {
		long val = Math.round(x * 100);
		return val / 100.0;
	}

	public synchronized void clear() {
		items.clear();
		numberOfItems = 0;
	}
}
