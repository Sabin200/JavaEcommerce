package com.versace.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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

/**
 * Servlet implementation class GetUserInfo
 */
public class GetUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String username = request.getParameter("username");
			String function = request.getParameter("function");
	
		
		String query = "Select * from users where username = ?";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			DatabaseConnection dc = new DatabaseConnection();
			Connection con = dc.getConnect();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			request.setAttribute("userInfo", rs);
			
			if(function.equals("overview")) {
				RequestDispatcher rd = request.getRequestDispatcher("UserOverview.jsp");
		          rd.forward(request, response);
			}else if(function.equals("edit")) {
				RequestDispatcher rd = request.getRequestDispatcher("EditUserDetails.jsp");
		          rd.forward(request, response);
			}else if(function.equals("password")) {
				RequestDispatcher rd = request.getRequestDispatcher("ChangePassword.jsp");
		         rd.forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
}
}
