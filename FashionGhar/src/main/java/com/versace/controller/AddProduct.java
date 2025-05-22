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
import java.util.UUID;

import com.versace.models.ProductDetails;
import com.versace.models.SaveProductDetails;

/**
 * Servlet implementation class AddProduct
 * Handles both GET and POST requests for adding new products
 */
@WebServlet("/addProduct")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1 MB
    maxFileSize = 1024 * 1024 * 10,  // 10 MB
    maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class AddProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * Handles GET requests by forwarding to the AddProduct.jsp page
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/AddProduct.jsp");
        dispatcher.forward(request, response);
    }
   
    /**
     * Handles POST requests for adding new products
     * Processes form data and file upload
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get form data
            String productName = request.getParameter("product_name");
            String clothCategory = request.getParameter("cloth_category");
            String brand = request.getParameter("brand");
            float price = Float.parseFloat(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            float ratings = Float.parseFloat(request.getParameter("ratings"));
            String productDescription = request.getParameter("product_description");
            
            // Handle file upload
            Part file = request.getPart("product_image");
            String originalFileName = file.getSubmittedFileName();
            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            String uniqueFileName = UUID.randomUUID().toString() + fileExtension;
            
            // Create upload directory if it doesn't exist
            String uploadPath = getServletContext().getRealPath("/Product Images/");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            
            String imageUploadPath = uploadPath + uniqueFileName;
            
            // Save the file
            try (FileOutputStream fos = new FileOutputStream(imageUploadPath);
                 InputStream is = file.getInputStream()) {
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Error uploading image: " + e.getMessage());
                RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/AddProduct.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // Create product object
            ProductDetails product = new ProductDetails(
                productName,
                clothCategory,
                getCategoryId(clothCategory),
                brand,
                price,
                stock,
                ratings,
                productDescription,
                "Product Images/" + uniqueFileName
            );

            // Save to database
            SaveProductDetails save = new SaveProductDetails();
            int result = save.saveProduct(product);

            if (result > 0) {
                request.setAttribute("successMessage", "Product added successfully!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/AddProduct.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Failed to add product. Please try again.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/AddProduct.jsp");
                dispatcher.forward(request, response);
            }
            
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid number format in form fields: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/AddProduct.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/AddProduct.jsp");
            dispatcher.forward(request, response);
        }
    }
    
    /**
     * Maps category strings to their corresponding IDs
     * @param category The category string from the form
     * @return The corresponding category ID
     */
    private int getCategoryId(String category) {
        switch (category) {
            case "men-tshirts": return 1;
            case "men-shirts": return 2;
            case "men-sweaters": return 3;
            case "men-jackets": return 4;
            case "men-jeans": return 5;
            case "men-pants": return 6;
            case "men-shorts": return 7;
            case "men-underwear": return 8;
            case "women-tops": return 9;
            case "women-dresses": return 10;
            case "women-sweaters": return 11;
            case "women-jackets": return 12;
            case "women-jeans": return 13;
            case "women-pants": return 14;
            case "women-skirts": return 15;
            case "women-lingerie": return 16;
            case "unisex-tshirts": return 17;
            case "unisex-hoodies": return 18;
            case "unisex-jackets": return 19;
            default: return 1; // Default category ID
        }
    }
}