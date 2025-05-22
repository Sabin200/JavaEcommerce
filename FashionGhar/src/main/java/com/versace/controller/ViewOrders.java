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
 * Servlet implementation class ViewOrders
 */

public class ViewOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("customerId"));
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			 DatabaseConnection dc = new DatabaseConnection();
		        Connection con = dc.getConnect();
		        String query = "select * from cart where user_id = ?";
		        PreparedStatement ps = con.prepareStatement(query);
		        ps.setInt(1, userId);
		        ResultSet rs = ps.executeQuery();
		        request.setAttribute("List_Result", rs);

	            RequestDispatcher rd = request.getRequestDispatcher("ViewOrders.jsp");
	            rd.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
	}

}
