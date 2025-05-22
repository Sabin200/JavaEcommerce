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

import com.versace.EncryptDecrypt.EncryptionDecryption;
import com.versace.databaseConnection.DatabaseConnection;
import com.versace.models.ChangedUserDetails;
import com.versace.models.SaveUserDetails;
import com.versace.models.UserDetails;

/**
 * Servlet implementation class UpdateProfile
 */
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String function = request.getParameter("function");
		
		if (function.equals("profile")) {
			
			int userId =Integer.parseInt((request.getParameter("userId")));
	        String userName = request.getParameter("username");
	        String firstName= request.getParameter("firstName");
	        String lastName = (request.getParameter("lastName"));
	        String email =(request.getParameter("email"));
	        int contact = Integer.parseInt((request.getParameter("contact")));
	       String address = request.getParameter("address");
	        
	        try {
	            ChangedUserDetails user = new ChangedUserDetails(userId,firstName, lastName,userName, address, email,contact);
	            SaveUserDetails update = new SaveUserDetails();
	            int result = update.updateUser(user,request);
	            
	            if(result>0) {
	                RequestDispatcher dispatcher = request.getRequestDispatcher("Website.jsp");
	                dispatcher.forward(request, response);
	            }
	        }catch(Exception e) {
	            e.printStackTrace();
	        
		}}else if(function.equals("password")) {
			String password = request.getParameter("newpassword");
			String username = request.getParameter("username");
			 try {
				 	Class.forName("com.mysql.cj.jdbc.Driver");
			        DatabaseConnection dc = new DatabaseConnection();
			        Connection con = dc.getConnect();
			        EncryptionDecryption AED = new  EncryptionDecryption ();
	                String decrypt_data =AED.encrypt(password);
			        
			        String query = "Update users set password = ? where username = ?";
			        PreparedStatement ps = con.prepareStatement(query);
			        ps.setString(1, decrypt_data);
			        ps.setString(2, username);
			        int result = ps.executeUpdate();
			        if(result>0) {
			        	RequestDispatcher dispatcher = request.getRequestDispatcher("Website.jsp");
		                dispatcher.forward(request, response);
			        }
			        
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		}
		
	}

}
