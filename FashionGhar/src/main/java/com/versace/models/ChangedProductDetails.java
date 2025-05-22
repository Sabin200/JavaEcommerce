package com.versace.models;

public class ChangedProductDetails {
	public int productId;
	public String productName;
	public int clothCategoryId;
	public int productCategoryId;
	public String brand;
	public float price;
	public int stock;
	public float ratings;
	public String productDescription;
	public ChangedProductDetails(int productId, String productName, int clothCategoryId, int productCategoryId,
			String brand, float price, int stock, float ratings, String productDescription) {
		this.productId = productId;
		this.productName = productName;
		this.clothCategoryId = clothCategoryId;
		this.productCategoryId = productCategoryId;
		this.brand = brand;
		this.price = price;
		this.stock = stock;
		this.ratings = ratings;
		this.productDescription = productDescription;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getClothCategoryId() {
		return clothCategoryId;
	}
	public void setClothCategoryId(int clothCategoryId) {
		this.clothCategoryId = clothCategoryId;
	}
	public int getProductCategoryId() {
		return productCategoryId;
	}
	public void setProductCategoryId(int productCategoryId) {
		this.productCategoryId = productCategoryId;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public float getRatings() {
		return ratings;
	}
	public void setRatings(float ratings) {
		this.ratings = ratings;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	
	
	
}
