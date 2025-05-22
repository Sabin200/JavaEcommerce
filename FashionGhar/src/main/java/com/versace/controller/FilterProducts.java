package com.versace.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.versace.databaseConnection.DatabaseConnection;

public class FilterProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String source= request.getParameter("JSP");
		String maxPriceParam = request.getParameter("maxPrice");
		int maxprice = 0;
		if (maxPriceParam != null) {
		    try {
		        maxprice = Integer.parseInt(maxPriceParam);
		    } catch (NumberFormatException e) {
		        // handle invalid input, e.g. show an error message to the user
		    }
		}

		String minPriceParam = request.getParameter("minPrice");
		int minprice = 0;
		if (minPriceParam != null) {
		    try {
		        minprice = Integer.parseInt(minPriceParam);
		    } catch (NumberFormatException e) {
		        // handle invalid input, e.g. show an error message to the user
		    }
		}
		
		int gender = Integer.parseInt(request.getParameter("gender"));
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			DatabaseConnection dc = new DatabaseConnection();
			Connection con = dc.getConnect();;
			
			if(maxprice!=0 && minprice==0) {
				String query = "SELECT *,pc.prod_category_name,cc.cloth_cat_name"
						+ " FROM products p "
						+ "INNER JOIN product_category pc ON p.prod_category_id = pc.prod_category_id "
						+ "INNER JOIN cloth_category cc ON p.cloth_cat_id = cc.cloth_cat_id "
						+ "where p.cloth_cat_id =? AND price = ?";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setInt(1,gender);
				ps.setInt(2,maxprice);
				ResultSet rs = ps.executeQuery();
				request.setAttribute("FilteredProducts", rs);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("FilterProducts.jsp");
				dispatcher.forward(request, response);
				
				
			}else if(maxprice==0 && minprice!=0) {
				String query = "SELECT *,pc.prod_category_name,cc.cloth_cat_name"
						+ " FROM products p "
						+ "INNER JOIN product_category pc ON p.prod_category_id = pc.prod_category_id "
						+ "INNER JOIN cloth_category cc ON p.cloth_cat_id = cc.cloth_cat_id "
						+ "where p.cloth_cat_id  =? AND price = ?";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setInt(1,gender);
				ps.setInt(2,minprice);
				ResultSet rs = ps.executeQuery();
				request.setAttribute("FilteredProducts", rs);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("FilterProducts.jsp");
				dispatcher.forward(request, response);
				
				
			}else if(maxprice!=0 && minprice!=0) {
				String query = "SELECT *,pc.prod_category_name,cc.cloth_cat_name"
						+ " FROM products p "
						+ "INNER JOIN product_category pc ON p.prod_category_id = pc.prod_category_id "
						+ "INNER JOIN cloth_category cc ON p.cloth_cat_id = cc.cloth_cat_id "
						+ "where p.cloth_cat_id  =? AND price Between ? AND ?";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setInt(1,gender);
				ps.setInt(2,minprice);
				ps.setInt(3,maxprice);
				ResultSet rs = ps.executeQuery();
				request.setAttribute("FilteredProducts", rs);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("FilterProducts.jsp");
				dispatcher.forward(request, response);
				
			}else if(maxprice==0 && minprice==0) {
				RequestDispatcher dispatcher = request.getRequestDispatcher(source);
				dispatcher.forward(request, response);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
