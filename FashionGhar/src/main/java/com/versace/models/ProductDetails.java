package com.versace.models;

public class ProductDetails {
    private String productName;
    private String clothCategory;
    private int productCategoryId;
    private String brand;
    private float price;
    private int stock;
    private float ratings;
    private String productDescription;
    private String productImage;
    
    public ProductDetails(String productName, String clothCategory, int productCategoryId, String brand, float price,
            int stock, float ratings, String productDescription, String productImage) {
        this.productName = productName;
        this.clothCategory = clothCategory;
        this.productCategoryId = productCategoryId;
        this.brand = brand;
        this.price = price;
        this.stock = stock;
        this.ratings = ratings;
        this.productDescription = productDescription;
        this.productImage = productImage;
    }

    // Getters and Setters
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getClothCategory() {
        return clothCategory;
    }

    public void setClothCategory(String clothCategory) {
        this.clothCategory = clothCategory;
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

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }
}