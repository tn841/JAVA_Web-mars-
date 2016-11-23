package com.itwill.cart;

import com.itwill.item.Item;

public class ShoppingCartItem {
    Item item;
    int quantity;
    int tot;
    
    
    public int getTot() {
		return tot;
	}

	public void setTot(int tot) {
		this.tot = tot;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public ShoppingCartItem(Item anItem,int qty) {
        item = anItem;
        quantity = qty;
        tot = item.getI_point()*quantity;
    }

   
    public void incrementQuantity(int qty) {
        quantity=quantity+qty;
        tot = item.getI_point()*quantity;
    }
    
    public void decrementQuantity(int qty) {
        quantity=quantity-qty;
        tot = item.getI_point()*quantity;
    }

    public Item getItem() {
        return item;
    }

    public int getQuantity() {
        return quantity;
    }
}









