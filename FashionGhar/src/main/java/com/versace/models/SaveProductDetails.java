package com.versace.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.versace.utility.DBConnection;

public class SaveProductDetails {
    
    public int saveProduct(ProductDetails product) {
        String sql = "INSERT INTO products (product_name, cloth_category, product_category_id, brand, price, stock, ratings, product_description, product_image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, product.getProductName());
            pstmt.setString(2, product.getClothCategory());
            pstmt.setInt(3, product.getProductCategoryId());
            pstmt.setString(4, product.getBrand());
            pstmt.setFloat(5, product.getPrice());
            pstmt.setInt(6, product.getStock());
            pstmt.setFloat(7, product.getRatings());
            pstmt.setString(8, product.getProductDescription());
            pstmt.setString(9, product.getProductImage());
            
            return pstmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
}