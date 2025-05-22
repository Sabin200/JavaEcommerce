package com.versace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.versace.EncryptDecrypt.EncryptionDecryption;
import com.versace.databaseConnection.DatabaseConnection;
import com.versace.controller.RememberMeUtil;

/**
 * Servlet implementation class Login
 * Handles user authentication with Remember Me functionality
 */
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * Handles login form submissions
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("uname");  // User input username
        String password = request.getParameter("upass");  // User input password
        String rememberMe = request.getParameter("rememberMe");  // Remember Me checkbox
        
        // Check if username or password is empty
        if (username == null || password == null) {
            request.setAttribute("message", "Username and password cannot be empty");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }
        
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = getDBConnection();  // Establish connection to DB
            
            if (conn == null) {
                throw new SQLException("Failed to establish database connection");
            }
            
            // Query to get user information from the user table
            String query = "SELECT user_id, username, user_role, address, phone, password FROM user WHERE username = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, username);  // Match user input username with the DB column

            rs = ps.executeQuery();  // Execute query to fetch user data
            
            if (rs.next()) {
                int userId = rs.getInt("user_id");
                String storedUsername = rs.getString("username");  // Get the stored username from DB
                String role = rs.getString("user_role");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                String encryptedPassword = rs.getString("password");  // Get encrypted password
                
                // Decrypt and verify password
                EncryptionDecryption encryptor = new EncryptionDecryption();
                String decryptedPassword = encryptor.decrypt(encryptedPassword);
                
                // Check if decrypted password matches user input password
                if (decryptedPassword.equals(password)) {
                    // Password is correct, create session
                    HttpSession session = request.getSession();
                    session.setAttribute("loggedIn", true);
                    session.setAttribute("userId", userId);
                    session.setAttribute("username", storedUsername);
                    session.setAttribute("userRole", role);
                    session.setAttribute("address", address);
                    session.setAttribute("phone", phone);
                    
                    // Set session timeout (30 minutes)
                    session.setMaxInactiveInterval(1800);
                    
                    // For backward compatibility (if required)
                    if ("customer".equalsIgnoreCase(role)) {
                        session.setAttribute("user", storedUsername);
                    } else if ("admin".equalsIgnoreCase(role)) {
                        session.setAttribute("admin", storedUsername);
                    }
                    
                    // Handle "Remember Me" functionality
                    if (rememberMe != null && rememberMe.equals("on")) {
                        RememberMeUtil.createRememberMeToken(userId, response);
                    }
                    
                    // Redirect based on user role
                    if ("admin".equalsIgnoreCase(role)) {
                        response.sendRedirect("adminDashboard.jsp");
                    } else {
                        response.sendRedirect("Home.jsp");
                    }
                } else {
                    // Password is incorrect
                    request.setAttribute("message", "Incorrect password. Please try again.");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
            } else {
                // Username not found
                request.setAttribute("message", "Username not found. Please register first.");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Login error: " + e.getMessage());
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } finally {
            // Close all resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    /**
     * Helper method to get database connection
     */
    private Connection getDBConnection() throws Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            DatabaseConnection dc = new DatabaseConnection();
            return dc.getConnect();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }
}
