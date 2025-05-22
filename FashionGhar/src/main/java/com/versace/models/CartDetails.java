package com.versace.models;

public class CartDetails {
private int productId;
private int userId;
private String productName;
private int quantity;
private float price;
private float amount;

public CartDetails(int productId, int userId, String productName, int quantity, float price, float amount) {
	this.productId = productId;
	this.userId = userId;
	this.productName = productName;
	this.quantity = quantity;
	this.price = price;
	this.amount = amount;
}

public int getProductId() {
	return productId;
}

public void setProductId(int productId) {
	this.productId = productId;
}

public int getUserId() {
	return userId;
}

public void setUserId(int userId) {
	this.userId = userId;
}

public String getProductName() {
	return productName;
}

public void setProductName(String productName) {
	this.productName = productName;
}

public int getQuantity() {
	return quantity;
}

public void setQuantity(int quantity) {
	this.quantity = quantity;
}

public float getPrice() {
	return price;
}

public void setPrice(float price) {
	this.price = price;
}

public float getAmount() {
	return amount;
}

public void setAmount(float amount) {
	this.amount = amount;
}


}
