package com.versace.controller;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.versace.databaseConnection.DatabaseConnection;
import com.versace.controller.RememberMeUtil;

/**
 * Filter to protect secure pages and handle "Remember Me" functionality
 * Applies to all pages that require authentication
 */
@WebFilter(urlPatterns = {"/ForHim.jsp", "/ForHer.jsp", "/uuni.jsp", "/cart.jsp", "/profile.jsp", "/checkout.jsp"})
public class AuthenticationFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        boolean isLoggedIn = (session != null && session.getAttribute("loggedIn") != null);
        String uri = httpRequest.getRequestURI();

        if (isLoggedIn) {
            String role = (String) session.getAttribute("userRole");

            // Check if admin page is being accessed
            if (uri.contains("adminDashboard.jsp") || uri.contains("/admin")) {
                if ("admin".equalsIgnoreCase(role)) {
                    // Allow admin to continue
                    chain.doFilter(request, response);
                } else {
                    // Block access for non-admins
                    httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Access denied. Admins only.");
                }
            } else {
                // Allow access to normal user pages
                chain.doFilter(request, response);
            }
            return;
        }

        // Not logged in – redirect to Login page
        httpResponse.sendRedirect(httpRequest.getContextPath() + "/Login.jsp");
    }

    
    @Override
    public void destroy() {
        // Cleanup code if needed
    }
    
    /**
     * Loads user data and creates a new session
     * 
     * @param userId the ID of the user to load
     * @param request the HTTP request
     */
    private void loadUserAndCreateSession(int userId, HttpServletRequest request) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            DatabaseConnection dc = new DatabaseConnection();
            conn = dc.getConnect();
            
            if (conn == null) {
                throw new SQLException("Failed to establish database connection in loadUserAndCreateSession");
            }
            
            // Get user data from the user table
            String sql = "SELECT user_id, username, username, user_role, address, phone FROM user WHERE user_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                // Create a new session or use the existing one
                HttpSession session = request.getSession(true);
                
                // Store user info in session
                session.setAttribute("loggedIn", true);
                session.setAttribute("userId", rs.getInt("user_id"));
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("fullName", rs.getString("fullname"));
                session.setAttribute("userRole", rs.getString("user_role"));
                session.setAttribute("address", rs.getString("address"));
                session.setAttribute("phone", rs.getString("phone"));
                
                // For backward compatibility
                String role = rs.getString("role");
                if ("customer".equalsIgnoreCase(role)) {
                    session.setAttribute("user", rs.getString("username"));
                } else if ("admin".equalsIgnoreCase(role)) {
                    session.setAttribute("admin", rs.getString("username"));
                }
                
                // Set session timeout (30 minutes)
                session.setMaxInactiveInterval(1800);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close all resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}