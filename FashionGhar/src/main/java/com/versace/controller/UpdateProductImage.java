package com.versace.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.versace.databaseConnection.DatabaseConnection;

/**
 * Servlet implementation class UpdateProductImage
 */

@MultipartConfig
public class UpdateProductImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("productId"));
		System.out.println(productId);
        String query = "update products set product_image = ? where product_id = ?";
        try {

        Class.forName("com.mysql.cj.jdbc.Driver");
        DatabaseConnection dc = new DatabaseConnection();
        Connection con = dc.getConnect();

        Part file = request.getPart("productImage");
        String productImage = file.getSubmittedFileName();
        String uploadPath="C:/Users/Msi/eclipse-workspace1/Versace/src/main/webapp/Product Images/"+productImage;
        File image = new File(uploadPath);

            if(image.exists()) {
                System.out.println("Already Exits");

            }else {
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1,productImage);
                ps.setInt(2,productId);
                int rs = ps.executeUpdate();

                FileOutputStream fos=new FileOutputStream(uploadPath);
                InputStream is=file.getInputStream();

                byte[] data=new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();
                
                if (rs>0) {
                	RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");
    				dispatcher.forward(request, response);
                }
            }

        } catch (ClassNotFoundException | SQLException e1) {
        // TODO Auto-generated catch block
        e1.printStackTrace();
        }

	}

}
