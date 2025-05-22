package com.versace.controller;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Base64;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.versace.databaseConnection.DatabaseConnection;

/**
 * Utility class for handling "Remember Me" functionality
 */
public class RememberMeUtil {
    
    // Constants
    private static final int TOKEN_LENGTH = 32; // 256 bits
    private static final int COOKIE_MAX_AGE = 2592000; // 30 days in seconds
    private static final String COOKIE_NAME = "rememberMe";
    
    /**
     * Creates a remember me token for the specified user
     * 
     * @param userId the ID of the user
     * @param response the HTTP response to add the cookie to
     */
    public static void createRememberMeToken(int userId, HttpServletResponse response) {
        Connection conn = null;
        PreparedStatement insertStmt = null;
        PreparedStatement deleteStmt = null;
        
        try {
            // Generate a secure random token
            String token = generateSecureToken();
            
            // Calculate expiry date (30 days from now)
            LocalDateTime expiryDate = LocalDateTime.now().plusDays(30);
            
            // Connect to the database
            DatabaseConnection dc = new DatabaseConnection();
            conn = dc.getConnect();
            
            if (conn == null) {
                System.err.println("Failed to establish database connection in createRememberMeToken");
                return;
            }
            
            // Delete any existing tokens for this user
            String deleteSql = "DELETE FROM remember_me_tokens WHERE user_id = ?";
            deleteStmt = conn.prepareStatement(deleteSql);
            deleteStmt.setInt(1, userId);
            deleteStmt.executeUpdate();
            
            // Store the token in the database
            String insertSql = "INSERT INTO remember_me_tokens (user_id, token, expiry_date) VALUES (?, ?, ?)";
            insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setInt(1, userId);
            insertStmt.setString(2, token);
            insertStmt.setTimestamp(3, Timestamp.valueOf(expiryDate));
            insertStmt.executeUpdate();
            
            // Create a cookie with the token
            Cookie rememberMeCookie = new Cookie(COOKIE_NAME, token);
            rememberMeCookie.setMaxAge(COOKIE_MAX_AGE);
            rememberMeCookie.setPath("/");
            rememberMeCookie.setHttpOnly(true); // For security
            
            // Add the cookie to the response
            response.addCookie(rememberMeCookie);
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(null, insertStmt, deleteStmt, conn);
        }
    }
    
    /**
     * Validates a remember me token and returns the associated user ID
     * 
     * @param token the token to validate
     * @return the user ID if valid, otherwise 0
     */
    public static int validateRememberMeToken(String token) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            DatabaseConnection dc = new DatabaseConnection();
            conn = dc.getConnect();
            
            if (conn == null) {
                System.err.println("Failed to establish database connection in validateRememberMeToken");
                return 0;
            }
            
            // Check if token exists and is not expired
            String sql = "SELECT user_id FROM remember_me_tokens WHERE token = ? AND expiry_date > NOW()";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, token);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt("user_id");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, stmt, null, conn);
        }
        
        return 0; // Invalid or expired token
    }
    
    /**
     * Clears the remember me token for a user
     * 
     * @param userId the ID of the user
     * @param request the HTTP request to get the cookie
     * @param response the HTTP response to update the cookie
     */
    public static void clearRememberMeToken(int userId, HttpServletRequest request, HttpServletResponse response) {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            // Connect to the database
            DatabaseConnection dc = new DatabaseConnection();
            conn = dc.getConnect();
            
            if (conn == null) {
                System.err.println("Failed to establish database connection in clearRememberMeToken");
                return;
            }
            
            // Delete the token from the database
            String sql = "DELETE FROM remember_me_tokens WHERE user_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.executeUpdate();
            
            // Get cookies from the request
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (COOKIE_NAME.equals(cookie.getName())) {
                        // Invalidate the cookie
                        Cookie rememberMeCookie = new Cookie(COOKIE_NAME, "");
                        rememberMeCookie.setMaxAge(0);
                        rememberMeCookie.setPath("/");
                        response.addCookie(rememberMeCookie);
                        break;
                    }
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(null, stmt, null, conn);
        }
    }
    
    /**
     * Generates a secure random token
     * 
     * @return a Base64-encoded secure random token
     */
    private static String generateSecureToken() {
        SecureRandom secureRandom = new SecureRandom();
        byte[] tokenBytes = new byte[TOKEN_LENGTH];
        secureRandom.nextBytes(tokenBytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(tokenBytes);
    }
    
    /**
     * Closes database resources
     */
    private static void closeResources(ResultSet rs, PreparedStatement stmt1, PreparedStatement stmt2, Connection conn) {
        try {
            if (rs != null) rs.close();
            if (stmt1 != null) stmt1.close();
            if (stmt2 != null) stmt2.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}