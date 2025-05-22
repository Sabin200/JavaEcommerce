package com.versace.controller;



import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.versace.controller.RememberMeUtil;

/**
 * Servlet implementation class Logout
 * Handles user logout with Remember Me token cleanup
 */
public class Logout extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * Handles logout requests
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        if (session != null) {
            // Get userId before invalidating the session
            Object userIdObj = session.getAttribute("userId");
            
            // Invalidate the session
            session.invalidate();
            
            // Clear Remember Me token if userId exists
            if (userIdObj != null) {
                int userId = (Integer) userIdObj;
                RememberMeUtil.clearRememberMeToken(userId, request, response);
            }
        }
        
        // Redirect to the login page
        response.sendRedirect("Login.jsp");
    }
    
    /**
     * Handles POST requests by forwarding to doGet
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}