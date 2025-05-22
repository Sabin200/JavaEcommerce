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
import java.sql.SQLException;

import com.versace.databaseConnection.DatabaseConnection;

/**
 * Servlet implementation class GetProductInfo
 */
public class GetProductInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String product_id_str = request.getParameter("product_id");
		int product_id = Integer.parseInt(product_id_str);
		String function = request.getParameter("function");
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			DatabaseConnection dc = new DatabaseConnection();
			Connection con = dc.getConnect();
			
			String query = "SELECT *,pc.prod_category_id,pc.prod_category_name,cc.cloth_cat_name,cc.cloth_cat_id"
					+ " FROM products p "
					+ "INNER JOIN product_category pc ON p.prod_category_id = pc.prod_category_id "
					+ "INNER JOIN cloth_category cc ON p.cloth_cat_id = cc.cloth_cat_id "
					+ "where product_id =?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1,product_id);
			ResultSet rs = ps.executeQuery();
			
			request.setAttribute("productInfo", rs);
			
			if(function.equals("view")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("ProductOverview.jsp");
				dispatcher.forward(request, response);
			}else if(function.equals("edit")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateProductDetails.jsp");
			dispatcher.forward(request, response);
			}else if(function.equals("display")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("ProductView.jsp");
				dispatcher.forward(request, response);
			}else {
				System.out.println("Error");
			}
			

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
