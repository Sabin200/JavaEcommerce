package com.versace.controller;

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
 * Servlet implementation class UpdateUserImage
 */
@MultipartConfig
public class UpdateUserImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
        String query = "update users set user_image = ? where user_id = ?";
        try {

        Class.forName("com.mysql.cj.jdbc.Driver");
        DatabaseConnection dc = new DatabaseConnection();
        Connection con = dc.getConnect();

        Part file = request.getPart("userImage");
        String userImage = file.getSubmittedFileName();
        String uploadPath="C:/Users/Msi/eclipse-workspace1/Versace/src/main/webapp/User Images/"+userImage;
        File image = new File(uploadPath);

            if(image.exists()) {
                System.out.println("Already Exits");

            }else {
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1,userImage);
                ps.setInt(2,userId);
                int rs = ps.executeUpdate();

                FileOutputStream fos=new FileOutputStream(uploadPath);
                InputStream is=file.getInputStream();

                byte[] data=new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();
                System.out.println("done");
            }


        } catch (ClassNotFoundException | SQLException e1) {
        // TODO Auto-generated catch block
        e1.printStackTrace();
        }

	}
}
