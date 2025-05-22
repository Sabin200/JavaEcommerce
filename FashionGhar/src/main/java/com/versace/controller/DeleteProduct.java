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
import java.sql.SQLException;

import com.versace.databaseConnection.DatabaseConnection;

/**
 * Servlet implementation class DeleteProduct
 */
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String product_id_str = request.getParameter("productId");
        int product_id = Integer.parseInt(product_id_str);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            DatabaseConnection dc = new DatabaseConnection();
            Connection con = dc.getConnect();

            String delete_query = "DELETE FROM products WHERE product_id =?";
            PreparedStatement ps = con.prepareStatement(delete_query);
            ps.setInt(1,product_id);
            int rows_deleted = ps.executeUpdate();

            if(rows_deleted != 0) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("Products.jsp");
                dispatcher.include(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	}

}
