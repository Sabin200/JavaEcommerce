package com.versace.models;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.versace.databaseConnection.DatabaseConnection;

public class SaveInCart {
	private DatabaseConnection dc;
	private Connection con;

		public SaveInCart() {
			this.dc = new DatabaseConnection();
			this.con = this.dc.getConnect();
		}
		public int saveCart(CartDetails cart) {
			int result = 0;
			
			 String query="INSERT INTO cart(product_id, user_id, product_name, quantity, price, Amount)values(?,?,?,?,?,?)";
			try {
				PreparedStatement ps = this.con.prepareStatement(query);
				ps.setInt(1,cart.getProductId());
				ps.setInt(2,cart.getUserId());
				ps.setString(3,cart.getProductName());
				ps.setInt(4,cart.getQuantity());
				ps.setFloat(5,cart.getPrice());
				ps.setFloat(6,cart.getAmount());
				result = ps.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}

}
