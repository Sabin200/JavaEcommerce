package com.versace.controller;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.versace.models.ChangedProductDetails;
import com.versace.models.SaveProductDetails;

/**
 * Servlet implementation class UpdateProduct
 */
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId =Integer.parseInt((request.getParameter("productId")));
        String productName = request.getParameter("productName");
        String brand = request.getParameter("brand");
        float price = Float.parseFloat((request.getParameter("price")));
        int stock =Integer.parseInt((request.getParameter("stock")));
        float ratings = Float.parseFloat((request.getParameter("ratings")));
        int clothCategoryId = Integer.parseInt(request.getParameter("gender"));
        int productCategoryId =  Integer.parseInt(request.getParameter("item"));
        String productDescription = request.getParameter("description");
        
        System.out.println(productDescription);
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            ChangedProductDetails changedProduct = new ChangedProductDetails( productId, productName, clothCategoryId, productCategoryId,
        			brand, price, stock,ratings,productDescription);
            SaveProductDetails update = new SaveProductDetails();
            int result = update.updateProduct(changedProduct);
            if(result>0) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("Admin.jsp");
                dispatcher.forward(request, response);
            }
        }catch(Exception e) {
            e.printStackTrace();
        }	 
	}
}
