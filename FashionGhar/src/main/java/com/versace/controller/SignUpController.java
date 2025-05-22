package com.versace.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.versace.EncryptDecrypt.EncryptionDecryption;
import com.versace.databaseConnection.DatabaseConnection;

/**
 * Servlet implementation class SignUpController
 * Handles user registration
 */
@MultipartConfig
public class SignUpController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Processes user registration requests
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameters from the form
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Basic validation
        if (firstName == null || lastName == null || username == null ||
            email == null || password == null) {
            request.setAttribute("message", "All required fields must be filled");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Check if username already exists
            conn = getDBConnection();

            if (conn == null) {
                throw new SQLException("Failed to establish database connection");
            }

            String checkQuery = "SELECT username FROM user WHERE username = ?";
            ps = conn.prepareStatement(checkQuery);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("message", "Username already exists");
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                return;
            }

            rs.close();
            ps.close();

            // Check if email already exists
            checkQuery = "SELECT email FROM user WHERE email = ?";
            ps = conn.prepareStatement(checkQuery);
            ps.setString(1, email);
            rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("message", "Email already registered");
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
                return;
            }

            rs.close();
            ps.close();

            // Encrypt password
            EncryptionDecryption encryptor = new EncryptionDecryption();
            String encryptedPassword = encryptor.encrypt(password);
            
           

            // Insert new user into the database
            String fullName = firstName + " " + lastName;
            String sql = "INSERT INTO user (first_name, last_name, username, address, email, password, user_role, user_image, contact) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);

            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, username);
            ps.setString(4, address == null ? "" : address);
            ps.setString(5, email);
            ps.setString(6, encryptedPassword);
            String role = "customer";
            if ("admin".equalsIgnoreCase(username)) {
                role = "admin";
            }

            ps.setString(7, role);
            ps.setString(8, ""); // default image (can be updated later)
            ps.setString(9, phone == null ? "" : phone);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                request.setAttribute("message", "Registration successful! Please login.");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Registration failed. Please try again.");
                request.getRequestDispatcher("SignUp.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Registration error: " + e.getMessage());
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
        } finally {
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
