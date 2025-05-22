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
 * Servlet implementation class ViewProducts
 */
public class ViewProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            DatabaseConnection dc = new DatabaseConnection();
            Connection con = dc.getConnect();
            String query = "select * from products";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs1 = ps.executeQuery();

            request.setAttribute("List_Result", rs1);

            RequestDispatcher rd = request.getRequestDispatcher("Products.jsp");
            rd.forward(request, response);

        }catch(Exception e) {
            e.printStackTrace();
        }
	}

}
