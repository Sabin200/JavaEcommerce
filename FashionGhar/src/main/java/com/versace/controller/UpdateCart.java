package com.versace.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.versace.databaseConnection.DatabaseConnection;

/**
 * Servlet implementation class UpdateCart
 */
public class UpdateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String function = request.getParameter("function");
		int cartId= Integer.parseInt(request.getParameter("cart_id"));
		
		if(function.equals("add")) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				  DatabaseConnection dc = new DatabaseConnection();
				    Connection con = dc.getConnect();
					String quantity_str = request.getParameter("quantity");
					int quantity = Integer.parseInt(quantity_str);
					
					String sql = "Select * from cart where cart_id = ?";
					PreparedStatement cart = con.prepareStatement(sql);
					cart.setInt(1, cartId);
					ResultSet rs = cart.executeQuery();
					
					float price = 0;
					if (rs.next()) {
						 price = Float.parseFloat(rs.getString("price"));
					}
		
					float amount = price*quantity;
					
					String updateCart = "Update cart set quantity = ?, Amount =? WHERE cart_id =?";
					PreparedStatement ps = con.prepareStatement(updateCart);
					ps.setInt(1, quantity);
					ps.setFloat(2, amount);
					ps.setInt(3, cartId);
					int result = ps.executeUpdate();
					if (result>0) {
						 RequestDispatcher dispatcher = request.getRequestDispatcher("Cart.jsp");
						 dispatcher.forward(request, response);
					}

			 
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(function.equals("remove")) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		    DatabaseConnection dc = new DatabaseConnection();
		    Connection con = dc.getConnect();
		    String delete_query = "DELETE FROM cart WHERE cart_id =?";
		    PreparedStatement ps = con.prepareStatement(delete_query);
		    ps.setInt(1, cartId);
		    int rows_deleted = ps.executeUpdate();
		    if(rows_deleted>0) {
			    RequestDispatcher dispatcher = request.getRequestDispatcher("Cart.jsp");
	            dispatcher.forward(request, response);
			    }
		    
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
