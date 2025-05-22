package com.versace.controller;

import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.versace.databaseConnection.DatabaseConnection;
import com.versace.models.CartDetails;
import com.versace.models.SaveInCart;

/**
 * Servlet implementation class AddToCart
 */
public class AddToCart extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId =Integer.parseInt((request.getParameter("productId")));
		String products = "Select * from products where product_id=?";
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("user")!= null) {	
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				DatabaseConnection dc = new DatabaseConnection();
				Connection con = dc.getConnect();;
				PreparedStatement ps1 = con.prepareStatement(products);
				ps1.setInt(1,productId);
				ResultSet rs1 = ps1.executeQuery();
				
				String username = (String) session.getAttribute("user");
				String user = "Select user_id from users where username=?";
				PreparedStatement ps2 = con.prepareStatement(user);
				ps2.setString(1,username);
				ResultSet rs2 = ps2.executeQuery();
				
				
				int stock =0 ;
				
				
				int quantity =1;
				String productName="";
				float price =0;
				
				if(rs1.next()) {
					
					productName = rs1.getString("product_name");
					price  = rs1.getFloat("price");
					stock = rs1.getInt("stock");
				}
				float amount = price *quantity;
				int userId=0;
				if(rs2.next()) {
				userId = rs2.getInt("user_id");
				}
				
				int stock2 = stock-quantity;
				
				String product = "Update products set stock = ? where product_id = ?";
				PreparedStatement ps3 = con.prepareStatement(product);
				ps3.setInt(1,stock2);
				ps3.setInt(2,productId);
				int rs3 = ps3.executeUpdate();
				
				
				CartDetails cart = new CartDetails(productId,userId,productName, quantity,  price, amount);
				SaveInCart save = new SaveInCart();
				int result = save.saveCart(cart);
				if (result>0) {
					
					response.sendRedirect("Cart.jsp");
				}else {
					response.sendRedirect("Website.jsp");
				}
				
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			response.sendRedirect("Login.jsp");
		}
		
	}
}
