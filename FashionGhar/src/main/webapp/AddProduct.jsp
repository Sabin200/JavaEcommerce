<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>

// Database connection parameters
String dbURL = "jdbc:mysql://localhost:3306/zefex?useUnicode=true&characterEncoding=UTF-8";
String dbUser = "root";
String dbPassword = ""; // Add your database password here

// Process form submission for adding a new product
String message = "";
String messageType = "";

// Check if the request is a multipart request (contains file uploads)
boolean isMultipart = ServletFileUpload.isMultipartContent(request);

if (isMultipart && request.getMethod().equalsIgnoreCase("POST")) {
    try {
        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();
        
        // Configure a repository for temporary files
        File repository = (File) getServletContext().getAttribute("javax.servlet.context.tempdir");
        factory.setRepository(repository);
        
        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        
        // Parse the request
        List<FileItem> items = upload.parseRequest(request);
        
        // Process the uploaded items
        String productName = "";
        String sku = "";
        String category = "";
        String price = "";
        String stock = "";
        String discount = "0";
        String shortDescription = "";
        String fullDescription = "";
        String brand = ""; // Added for brand
        String featured = "0";
        String status = "active";
        String[] sizes = {};
        String[] colors = {};
        String imagePath = "";
        
        // Extract form fields
        for (FileItem item : items) {
            if (item.isFormField()) {
                // Process regular form fields
                String fieldName = item.getFieldName();
                String fieldValue = item.getString("UTF-8");
                
                switch (fieldName) {
                    case "productName":
                        productName = fieldValue;
                        break;
                    case "sku":
                        sku = fieldValue;
                        break;
                    case "category":
                        category = fieldValue;
                        break;
                    case "price":
                        price = fieldValue;
                        break;
                    case "stock":
                        stock = fieldValue;
                        break;
                    case "discount":
                        discount = fieldValue;
                        break;
                    case "shortDescription":
                        shortDescription = fieldValue;
                        break;
                    case "fullDescription":
                        fullDescription = fieldValue;
                        break;
                    case "brand":
                        brand = fieldValue;
                        break;
                    case "featured":
                        featured = fieldValue;
                        break;
                    case "status":
                        status = fieldValue;
                        break;
                    case "sizes":
                        // Collect all selected sizes
                        if (sizes.length == 0) {
                            sizes = new String[]{fieldValue};
                        } else {
                            String[] newSizes = new String[sizes.length + 1];
                            System.arraycopy(sizes, 0, newSizes, 0, sizes.length);
                            newSizes[sizes.length] = fieldValue;
                            sizes = newSizes;
                        }
                        break;
                    case "colors":
                        // Collect all selected colors
                        if (colors.length == 0) {
                            colors = new String[]{fieldValue};
                        } else {
                            String[] newColors = new String[colors.length + 1];
                            System.arraycopy(colors, 0, newColors, 0, colors.length);
                            newColors[colors.length] = fieldValue;
                            colors = newColors;
                        }
                        break;
                }
            } else {
                // Process file uploads
                String fieldName = item.getFieldName();
                String fileName = item.getName();
                
                if (fieldName.equals("productImage") && fileName != null && !fileName.isEmpty()) {
                    // Create a unique filename to prevent overwriting
                    String timestamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
                    String uniqueFileName = timestamp + "_" + fileName;
                    
                    // Define the upload directory path
                    String uploadPath = getServletContext().getRealPath("/") + "images/products/";
                    
                    // Create the directory if it doesn't exist
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }
                    
                    // Save the file
                    File uploadedFile = new File(uploadPath + uniqueFileName);
                    item.write(uploadedFile);
                    
                    // Store the relative path for database
                    imagePath = "images/products/" + uniqueFileName;
                }
                
                // Additional images can be handled similarly if needed
            }
        }
        
        // Convert arrays to comma-separated strings for database storage
        String sizesStr = String.join(",", sizes);
        String colorsStr = String.join(",", colors);
        
        // Get product_category_id based on category
        int productCategoryId = 0;
        
        // Map category values to product_category_id
        // This is a simple mapping - you might want to fetch this from a categories table
        if (category.startsWith("men")) {
            productCategoryId = 1; // Men's category
        } else if (category.startsWith("women")) {
            productCategoryId = 2; // Women's category
        } else if (category.equals("kids")) {
            productCategoryId = 3; // Kids category
        } else if (category.equals("accessories")) {
            productCategoryId = 4; // Accessories category
        }
        
        // Extract cloth category from the selected category
        String clothCategory = category;
        
        // Database connection and insertion
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            
            // Prepare SQL statement for insertion
            String sql = "INSERT INTO product (product_name, cloth_category, product_category_id, brand, " +
                         "sku, price, stock_quantity, discount_percentage, short_description, full_description, " +
                         "image_path, available_sizes, available_colors, is_featured, status) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, productName);
            pstmt.setString(2, clothCategory);
            pstmt.setInt(3, productCategoryId);
            pstmt.setString(4, brand);
            pstmt.setString(5, sku);
            pstmt.setDouble(6, Double.parseDouble(price));
            pstmt.setInt(7, Integer.parseInt(stock));
            pstmt.setInt(8, Integer.parseInt(discount));
            pstmt.setString(9, shortDescription);
            pstmt.setString(10, fullDescription);
            pstmt.setString(11, imagePath);
            pstmt.setString(12, sizesStr);
            pstmt.setString(13, colorsStr);
            pstmt.setInt(14, Integer.parseInt(featured));
            pstmt.setString(15, status);
            
            // Execute the query
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                message = "Product added successfully!";
                messageType = "success";
            } else {
                message = "Failed to add product. Please try again.";
                messageType = "error";
            }
            
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
            messageType = "error";
            e.printStackTrace();
        } finally {
            // Close resources
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    } catch (Exception e) {
        message = "Error processing form: " + e.getMessage();
        messageType = "error";
        e.printStackTrace();
    }
}

// Process form submission for updating a product
if (request.getMethod().equalsIgnoreCase("POST") && request.getParameter("action") != null && request.getParameter("action").equals("update")) {
    // Similar code as above for updating a product
    // This would be implemented if needed
}

// Process form submission for deleting a product
if (request.getMethod().equalsIgnoreCase("POST") && request.getParameter("action") != null && request.getParameter("action").equals("delete")) {
    String productId = request.getParameter("productId");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        
        // Prepare SQL statement for deletion
        String sql = "DELETE FROM product WHERE product_id = ?";
        
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(productId));
        
        // Execute the query
        int rowsAffected = pstmt.executeUpdate();
        
        if (rowsAffected > 0) {
            message = "Product deleted successfully!";
            messageType = "success";
        } else {
            message = "Failed to delete product. Please try again.";
            messageType = "error";
        }
        
    } catch (Exception e) {
        message = "Error: " + e.getMessage();
        messageType = "error";
        e.printStackTrace();
    } finally {
        // Close resources
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
}

// Fetch products from database for display
List<Map<String, Object>> products = new ArrayList<>();
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    // Establish database connection
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
    
    // Prepare SQL statement for fetching products
    String sql = "SELECT * FROM product ORDER BY product_id DESC";
    
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    
    // Process result set
    while (rs.next()) {
        Map<String, Object> product = new HashMap<>();
        product.put("id", rs.getInt("product_id"));
        product.put("name", rs.getString("product_name"));
        product.put("sku", rs.getString("sku"));
        product.put("category", rs.getString("cloth_category"));
        product.put("price", rs.getDouble("price"));
        product.put("stock", rs.getInt("stock_quantity"));
        product.put("image", rs.getString("image_path"));
        
        // Determine stock status
        int stockQuantity = rs.getInt("stock_quantity");
        if (stockQuantity <= 0) {
            product.put("stockStatus", "out-of-stock");
            product.put("stockStatusText", "Out of Stock");
        } else if (stockQuantity <= 10) {
            product.put("stockStatus", "low-stock");
            product.put("stockStatusText", "Low Stock");
        } else {
            product.put("stockStatus", "in-stock");
            product.put("stockStatusText", "In Stock");
        }
        
        products.add(product);
    }
    
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // Close resources
    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Products - FashionGhar</title>
<meta name="description" content="FashionGhar Admin Dashboard - Manage your clothing products">
<meta name="keywords" content="HTML, CSS, JavaScript, Admin, Dashboard, Products">
<meta name="author" content="FashionGhar">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Vendor CSS Files -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- for fonts and icons -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,300&family=Raleway:wght@300;400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="css/website.css">

<script src="js/website.js" defer></script>

<style>
/* Global Styles with Black, White & Gray Color Palette */
:root {
  --white: #ffffff;
  --light-gray: #f5f5f5;
  --mid-gray: #9e9e9e;
  --dark-gray: #333333;
  --black: #000000;
  --text: #000000;
  --text-light: #ffffff;
  --accent: #4a4a4a;
  --success: #2e7d32;
  --warning: #ff9800;
  --danger: #c62828;
  --info: #0288d1;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Montserrat', sans-serif;
  color: var(--text);
}

body {
  background-color: var(--light-gray);
}

h1, h2, h3, h4, h5 {
  font-family: 'Raleway', sans-serif;
  font-weight: 500;
}

hr {
  border-color: var(--mid-gray);
  opacity: 0.3;
  margin: 0;
}

/* Alert Messages */
.alert {
  padding: 15px;
  margin-bottom: 20px;
  border: 1px solid transparent;
  border-radius: 4px;
}

.alert-success {
  color: #155724;
  background-color: #d4edda;
  border-color: #c3e6cb;
}

.alert-danger {
  color: #721c24;
  background-color: #f8d7da;
  border-color: #f5c6cb;
}

/* Header Section Styles */
.abc {
  display: flex;
  justify-content: flex-end;
  padding: 15px 30px;
  background-color: var(--black);
}

.abc a {
  color: var(--white);
  text-decoration: none;
  font-size: 14px;
  transition: all 0.3s ease;
  margin-right: 150px; /* Increased from 100px to 150px for more space */
}

.abc a:hover {
  color: var(--mid-gray);
  text-decoration: none;
}

.dropdown {
  position: absolute;
  top: 15px;
  right: 30px;
}

.dropbtn {
  background-color: var(--black);
  color: var(--white);
  padding: 8px 16px;
  font-size: 14px;
  border: 1px solid var(--white);
  cursor: pointer;
  border-radius: 4px;
  transition: all 0.3s ease;
  letter-spacing: 1px;
  text-transform: uppercase;
  font-weight: 500;
}

.dropbtn:hover, .dropbtn:focus {
  background-color: var(--white);
  color: var(--black);
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: var(--white);
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.1);
  right: 0;
  z-index: 999;
  border-radius: 4px;
}

.dropdown-content a {
  color: var(--black);
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  transition: all 0.3s ease;
}

.dropdown-content a:hover {
  background-color: var(--light-gray);
}

.show {
  display: block;
}

/* Navigation Styles - ADJUSTED FOR BETTER LAYOUT */
.main {
  background-color: var(--black);
  padding: 20px 0;
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

nav.stroke {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  padding: 0 20px;
  max-width: 1400px;
  margin: 0 auto;
}

.logo {
  flex: 0 0 180px;
  margin-right: 20px;
}

.nav-links {
  flex: 1;
  display: flex;
  justify-content: center;
}

.nav-links ul {
  display: flex;
  list-style: none;
  background-color: var(--black);
  padding: 10px 20px;
  border-radius: 8px;
}

.nav-links ul li {
  margin: 0 15px;
}

.nav-links ul li a {
  text-decoration: none;
  color: var(--white);
  font-size: 20px;
  font-weight: 600;
  position: relative;
  padding: 10px 15px;
  letter-spacing: 1px;
  white-space: nowrap;
  display: block;
  font-family: 'Raleway', sans-serif;
}

.nav-links ul li a:hover {
  color: var(--mid-gray);
}

.nav-links ul li a:after {
  content: '';
  position: absolute;
  width: 0;
  height: 3px;
  display: block;
  margin-top: 5px;
  right: 0;
  background: var(--white);
  transition: width .3s ease;
}

.nav-links ul li a:hover:after {
  width: 100%;
  left: 0;
}

/* Product Management Styles */
.product-container {
  max-width: 1200px;
  margin: 40px auto;
  padding: 0 20px;
}

.product-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
}

.product-title {
  font-size: 32px;
  color: var(--black);
  position: relative;
  padding-bottom: 10px;
}

.product-title:after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  width: 60px;
  height: 3px;
  background-color: var(--black);
}

.add-product-btn {
  display: inline-block;
  padding: 10px 20px;
  background-color: var(--black);
  color: var(--white);
  border-radius: 4px;
  text-decoration: none;
  font-size: 14px;
  font-weight: 500;
  transition: all 0.3s ease;
  border: none;
  cursor: pointer;
}

.add-product-btn:hover {
  background-color: var(--dark-gray);
}

.add-product-btn i {
  margin-right: 8px;
  color: var(--white);
}

/* Filter and Search Section */
.filter-section {
  display: flex;
  flex-wrap: wrap;
  gap: 15px;
  margin-bottom: 30px;
  background-color: var(--white);
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
}

.filter-group {
  display: flex;
  flex-direction: column;
  min-width: 200px;
  flex: 1;
}

.filter-group label {
  font-size: 14px;
  margin-bottom: 8px;
  font-weight: 500;
}

.filter-group select, .filter-group input {
  padding: 10px;
  border: 1px solid var(--mid-gray);
  border-radius: 4px;
  font-size: 14px;
}

.search-group {
  display: flex;
  flex-direction: column;
  min-width: 300px;
  flex: 2;
}

.search-group label {
  font-size: 14px;
  margin-bottom: 8px;
  font-weight: 500;
}

.search-input-wrapper {
  position: relative;
}

.search-input-wrapper input {
  width: 100%;
  padding: 10px;
  padding-right: 40px;
  border: 1px solid var(--mid-gray);
  border-radius: 4px;
  font-size: 14px;
}

.search-input-wrapper i {
  position: absolute;
  right: 15px;
  top: 50%;
  transform: translateY(-50%);
  color: var(--mid-gray);
}

.filter-buttons {
  display: flex;
  gap: 10px;
  align-items: flex-end;
}

.filter-btn {
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
}

.apply-btn {
  background-color: var(--black);
  color: var(--white);
}

.apply-btn:hover {
  background-color: var(--dark-gray);
}

.reset-btn {
  background-color: var(--light-gray);
  color: var(--dark-gray);
}

.reset-btn:hover {
  background-color: var(--mid-gray);
  color: var(--white);
}

/* Products Table */
.products-table-container {
  background-color: var(--white);
  border-radius: 8px;
  padding: 25px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  margin-bottom: 40px;
  overflow-x: auto;
}

.products-table {
  width: 100%;
  border-collapse: collapse;
}

.products-table th {
  text-align: left;
  padding: 15px;
  border-bottom: 2px solid var(--light-gray);
  font-size: 14px;
  font-weight: 600;
  color: var(--dark-gray);
}

.products-table td {
  padding: 15px;
  border-bottom: 1px solid var(--light-gray);
  font-size: 14px;
  vertical-align: middle;
}

.product-image {
  width: 60px;
  height: 60px;
  object-fit: cover;
  border-radius: 4px;
}

.stock-status {
  display: inline-block;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 12px;
  font-weight: 500;
}

.in-stock {
  background-color: rgba(46, 125, 50, 0.1);
  color: var(--success);
}

.low-stock {
  background-color: rgba(255, 152, 0, 0.1);
  color: var(--warning);
}

.out-of-stock {
  background-color: rgba(198, 40, 40, 0.1);
  color: var(--danger);
}

.action-buttons {
  display: flex;
  gap: 10px;
}

.action-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 32px;
  height: 32px;
  border-radius: 4px;
  border: none;
  cursor: pointer;
  transition: all 0.3s ease;
}

.view-btn {
  background-color: rgba(2, 136, 209, 0.1);
  color: var(--info);
}

.view-btn:hover {
  background-color: var(--info);
  color: var(--white);
}

.edit-btn {
  background-color: rgba(255, 152, 0, 0.1);
  color: var(--warning);
}

.edit-btn:hover {
  background-color: var(--warning);
  color: var(--white);
}

.delete-btn {
  background-color: rgba(198, 40, 40, 0.1);
  color: var(--danger);
}

.delete-btn:hover {
  background-color: var(--danger);
  color: var(--white);
}

.action-btn i {
  color: inherit;
}

/* Pagination */
.pagination {
  display: flex;
  justify-content: center;
  margin-top: 30px;
  gap: 5px;
}

.pagination-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  border-radius: 4px;
  border: 1px solid var(--mid-gray);
  background-color: var(--white);
  color: var(--dark-gray);
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.pagination-btn:hover {
  background-color: var(--light-gray);
}

.pagination-btn.active {
  background-color: var(--black);
  color: var(--white);
  border-color: var(--black);
}

.pagination-btn.disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.pagination-btn i {
  color: inherit;
}

/* Modal Styles */
.modal {
  display: none;
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
  background-color: var(--white);
  margin: 5% auto;
  padding: 30px;
  border-radius: 8px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
  width: 90%;
  max-width: 800px;
  position: relative;
  animation: modalFadeIn 0.3s;
}

@keyframes modalFadeIn {
  from {opacity: 0; transform: translateY(-20px);}
  to {opacity: 1; transform: translateY(0);}
}

.modal-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
  padding-bottom: 15px;
  border-bottom: 1px solid var(--light-gray);
}

.modal-title {
  font-size: 24px;
  font-weight: 600;
}

.close-modal {
  font-size: 24px;
  cursor: pointer;
  color: var(--mid-gray);
  transition: all 0.3s ease;
}

.close-modal:hover {
  color: var(--black);
}

.modal-body {
  margin-bottom: 30px;
}

.form-row {
  display: flex;
  flex-wrap: wrap;
  margin: -10px;
  margin-bottom: 10px;
}

.form-group {
  flex: 1 0 calc(50% - 20px);
  margin: 10px;
}

.form-group.full-width {
  flex: 1 0 calc(100% - 20px);
}

.form-group label {
  display: block;
  margin-bottom: 8px;
  font-weight: 500;
  font-size: 14px;
}

.form-group input, .form-group select, .form-group textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid var(--mid-gray);
  border-radius: 4px;
  font-size: 14px;
}

.form-group textarea {
  min-height: 100px;
  resize: vertical;
}

.image-preview {
  width: 100%;
  height: 200px;
  border: 2px dashed var(--mid-gray);
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 10px;
  overflow: hidden;
  position: relative;
}

.image-preview img {
  max-width: 100%;
  max-height: 100%;
  object-fit: contain;
}

.image-preview-placeholder {
  color: var(--mid-gray);
  font-size: 14px;
  text-align: center;
}

.image-preview-placeholder i {
  font-size: 40px;
  display: block;
  margin-bottom: 10px;
  color: var(--mid-gray);
}

.modal-footer {
  display: flex;
  justify-content: flex-end;
  gap: 15px;
  padding-top: 20px;
  border-top: 1px solid var(--light-gray);
}

.modal-btn {
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
}

.save-btn {
  background-color: var(--black);
  color: var(--white);
}

.save-btn:hover {
  background-color: var(--dark-gray);
}

.cancel-btn {
  background-color: var(--light-gray);
  color: var(--dark-gray);
}

.cancel-btn:hover {
  background-color: var(--mid-gray);
  color: var(--white);
}

/* Delete Confirmation Modal */
.delete-modal .modal-content {
  max-width: 500px;
}

.delete-modal .modal-body {
  text-align: center;
  padding: 20px 0;
}

.delete-modal .warning-icon {
  font-size: 60px;
  color: var(--danger);
  margin-bottom: 20px;
}

.delete-modal p {
  font-size: 16px;
  margin-bottom: 10px;
}

.delete-modal .product-name {
  font-weight: 600;
  font-size: 18px;
  margin-bottom: 20px;
}

.delete-confirm-btn {
  background-color: var(--danger);
  color: var(--white);
}

.delete-confirm-btn:hover {
  background-color: #b71c1c;
}

/* Footer Styles */
.footer {
  background-color: var(--black);
  padding: 60px 0 0;
}

.inner-footer {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  padding: 0 50px;
  max-width: 1400px;
  margin: 0 auto;
}

.footer-items {
  width: 22%;
  margin-bottom: 40px;
}

.footer-items h1 {
  color: var(--white);
  font-size: 32px;
  margin-bottom: 10px;
  letter-spacing: 2px;
}

.footer-items p {
  color: var(--light-gray);
  font-size: 16px;
}

.footer-items h3 {
  color: var(--white);
  font-size: 22px;
  margin-bottom: 20px;
}

.border1 {
  height: 3px;
  width: 50px;
  background-color: var(--white);
  margin-bottom: 20px;
}

.footcss {
  list-style: none;
}

.footcss li {
  color: var(--light-gray);
  margin-bottom: 15px;
  font-size: 16px;
}

.footcss li a {
  color: var(--light-gray);
  text-decoration: none;
  transition: all 0.3s ease;
}

.footcss li a:hover {
  color: var(--white);
  text-decoration: underline;
}

.footcss li i {
  color: var(--mid-gray);
  margin-right: 10px;
}

.social-media {
  margin-top: 30px;
}

.social-media a {
  margin-right: 15px;
  font-size: 22px;
  color: var(--light-gray);
  transition: all 0.3s ease;
}

.social-media a:hover {
  color: var(--white);
}

.footer-bottom {
  background-color: var(--black);
  color: var(--mid-gray);
  text-align: center;
  padding: 20px 0;
  border-top: 1px solid var(--dark-gray);
}

/* Scroll Up Button */
.gotopbtn {
  position: fixed;
  bottom: 30px;
  right: 30px;
  width: 50px;
  height: 50px;
  background-color: var(--black);
  text-decoration: none;
  text-align: center;
  line-height: 50px;
  border-radius: 50%;
  color: var(--white);
  font-size: 22px;
  transition: all 0.3s ease;
  z-index: 999;
  border: 2px solid var(--white);
}

.gotopbtn:hover {
  background-color: var(--white);
}

.gotopbtn:hover i {
  color: var(--black);
}

.gotopbtn i {
  color: var(--white);
}

/* Responsive adjustments for smaller screens */
@media (max-width: 992px) {
  nav.stroke {
    flex-wrap: wrap;
  }
  
  .logo {
    flex: 0 0 100%;
    margin-bottom: 15px;
    text-align: center;
  }
  
  .nav-links {
    flex: 1 0 100%;
    margin-bottom: 15px;
  }
  
  .box {
    flex: 0 0 100%;
  }
  
  .footer-items {
    width: 45%;
  }
  
  .form-group {
    flex: 1 0 calc(100% - 20px);
  }
}

@media (max-width: 768px) {
  .nav-links ul {
    flex-wrap: wrap;
    justify-content: center;
  }
  
  .nav-links ul li {
    margin: 5px 10px;
  }
  
  .footer-items {
    width: 100%;
  }
  
  .product-header {
    flex-direction: column;
    align-items: flex-start;
    gap: 15px;
  }
  
  .filter-section {
    flex-direction: column;
  }
  
  .filter-buttons {
    width: 100%;
  }
  
  .filter-btn {
    flex: 1;
  }
}
</style>

<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

// Open Add Product Modal
function openAddModal() {
  document.getElementById("addProductModal").style.display = "block";
  document.body.style.overflow = "hidden";
}

// Open Edit Product Modal
function openEditModal(productId) {
  // In a real application, you would fetch the product details based on the ID
  // and populate the form fields
  document.getElementById("editProductModal").style.display = "block";
  document.getElementById("editProductId").value = productId;
  document.body.style.overflow = "hidden";
  
  // AJAX call to get product details
  fetch('getProductDetails?id=' + productId)
    .then(response => response.json())
    .then(data => {
      // Populate form fields with product data
      document.getElementById("editProductName").value = data.productName;
      document.getElementById("editSku").value = data.sku;
      document.getElementById("editCategory").value = data.category;
      document.getElementById("editPrice").value = data.price;
      document.getElementById("editStock").value = data.stock;
      document.getElementById("editDiscount").value = data.discount;
      document.getElementById("editShortDescription").value = data.shortDescription;
      document.getElementById("editFullDescription").value = data.fullDescription;
      document.getElementById("editFeatured").value = data.featured;
      document.getElementById("editStatus").value = data.status;
      
      // Set image preview
      if (data.imagePath) {
        const preview = document.getElementById('editImagePreview');
        const img = preview.querySelector('img') || document.createElement('img');
        img.src = data.imagePath;
        img.alt = data.productName;
        if (!preview.contains(img)) {
          preview.appendChild(img);
        }
      }
      
      // Set sizes and colors checkboxes
      if (data.sizes) {
        const sizeCheckboxes = document.querySelectorAll('input[name="sizes"]');
        sizeCheckboxes.forEach(checkbox => {
          checkbox.checked = data.sizes.includes(checkbox.value);
        });
      }
      
      if (data.colors) {
        const colorCheckboxes = document.querySelectorAll('input[name="colors"]');
        colorCheckboxes.forEach(checkbox => {
          checkbox.checked = data.colors.includes(checkbox.value);
        });
      }
    })
    .catch(error => console.error('Error fetching product details:', error));
}

// Open Delete Confirmation Modal
function openDeleteModal(productId, productName) {
  document.getElementById("deleteProductModal").style.display = "block";
  document.getElementById("deleteProductId").value = productId;
  document.getElementById("deleteProductName").textContent = productName;
  document.body.style.overflow = "hidden";
}

// Close Modal
function closeModal(modalId) {
  document.getElementById(modalId).style.display = "none";
  document.body.style.overflow = "auto";
}

// Handle Image Preview
function previewImage(input, previewId) {
  const preview = document.getElementById(previewId);
  const placeholder = preview.querySelector('.image-preview-placeholder');
  const img = preview.querySelector('img') || document.createElement('img');
  
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    
    reader.onload = function(e) {
      img.src = e.target.result;
      if (!preview.contains(img)) {
        preview.appendChild(img);
      }
      if (placeholder) {
        placeholder.style.display = 'none';
      }
    }
    
    reader.readAsDataURL(input.files[0]);
  } else {
    if (placeholder) {
      placeholder.style.display = 'block';
    }
    if (preview.contains(img)) {
      preview.removeChild(img);
    }
  }
}

// Close modal when clicking outside
window.onclick = function(event) {
  if (event.target.classList.contains('modal')) {
    closeModal(event.target.id);
  }
}
</script>
</head>
<body>
<!-- for sign in/ log in -->
<div class="abc">
  <a href="#"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;Admin Portal</a>
</div>
<div class="dropdown">
  <button onclick="myFunction()" class="dropbtn">Admin</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="adminProfile.jsp">Profile</a>
    <a href="changePassword.jsp">Change password</a>
    <a href="logout.jsp">Logout</a>
    <a href="adminSettings.jsp">Settings</a>
  </div>
</div>
<hr>

<!-- for navigation -->
<div class="main">
  <nav class="stroke">
    <!-- for logo -->
    <div class="logo">
      <a href="adminDashboard.jsp">
        <svg width="180" height="80" viewBox="0 0 180 80">
          <defs>
            <linearGradient id="logoGradient" x1="0%" y1="0%" x2="100%" y2="100%">
              <stop offset="0%" stop-color="#ffffff" />
              <stop offset="100%" stop-color="#cccccc" />
            </linearGradient>
          </defs>
          <!-- Background shape -->
          <rect x="-85" y="20" width="350" height="70" rx="3" fill="none" stroke="#ffffff" stroke-width="2" />

          <!-- Main text -->
          <text x="90" y="45" font-family="Raleway, sans-serif" font-size="28" font-weight="600" text-anchor="middle" fill="url(#logoGradient)">FashionGhar</text>
          
          <!-- Slogan - moved down -->
          <text x="90" y="72" font-family="Montserrat, sans-serif" font-size="10" font-style="italic" font-weight="300" text-anchor="middle" fill="#ffffff">ADMIN DASHBOARD</text>
        </svg>
      </a>
    </div>

    <!-- for navigation bar -->
    <div class="nav-links">
      <ul>
        <li><a href="adminDashboard.jsp">DASHBOARD</a></li>
        <li><a href="manageProducts.jsp" class="active">PRODUCTS</a></li>
        <li><a href="manageOrders.jsp">ORDERS</a></li>
        <li><a href="manageUsers.jsp">USERS</a></li>
        <li><a href="reports.jsp">REPORTS</a></li>
      </ul>
    </div>

    <!-- for search box -->
    <div class="box">
      <form name="search">
        <input type="text" class="input" name="txt" onmouseout="this.value = ''; this.blur();" placeholder="Search...">
      </form>
      <i class="fas fa-search"></i>
    </div>
  </nav>
</div>

<!-- Product Management Content -->
<div class="product-container">
  <!-- Alert Messages -->
  <% if (!message.isEmpty()) { %>
    <div class="alert <%= messageType.equals("success") ? "alert-success" : "alert-danger" %>">
      <%= message %>
    </div>
  <% } %>

  <div class="product-header">
    <div>
      <h1 class="product-title">Manage Products</h1>
    </div>
    <button class="add-product-btn" onclick="openAddModal()">
      <i class="fas fa-plus"></i> Add New Product
    </button>
  </div>

  <!-- Filter and Search Section -->
  <div class="filter-section">
    <div class="filter-group">
      <label for="category">Category</label>
      <select id="category" name="category">
        <option value="">All Categories</option>
        <option value="men">Men's Clothing</option>
        <option value="women">Women's Clothing</option>
        <option value="kids">Kids' Clothing</option>
        <option value="accessories">Accessories</option>
      </select>
    </div>
    
    <div class="filter-group">
      <label for="status">Status</label>
      <select id="status" name="status">
        <option value="">All Status</option>
        <option value="in-stock">In Stock</option>
        <option value="low-stock">Low Stock</option>
        <option value="out-of-stock">Out of Stock</option>
      </select>
    </div>
    
    <div class="filter-group">
      <label for="sort">Sort By</label>
      <select id="sort" name="sort">
        <option value="newest">Newest First</option>
        <option value="oldest">Oldest First</option>
        <option value="price-high">Price: High to Low</option>
        <option value="price-low">Price: Low to High</option>
        <option value="name-asc">Name: A to Z</option>
        <option value="name-desc">Name: Z to A</option>
      </select>
    </div>
    
    <div class="search-group">
      <label for="search">Search Products</label>
      <div class="search-input-wrapper">
        <input type="text" id="search" name="search" placeholder="Search by name, SKU, or description...">
        <i class="fas fa-search"></i>
      </div>
    </div>
    
    <div class="filter-buttons">
      <button class="filter-btn apply-btn">Apply Filters</button>
      <button class="filter-btn reset-btn">Reset</button>
    </div>
  </div>

  <!-- Products Table -->
  <div class="products-table-container">
    <table class="products-table">
      <thead>
        <tr>
          <th>Image</th>
          <th>Product Name</th>
          <th>SKU</th>
          <th>Category</th>
          <th>Price</th>
          <th>Stock</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <% if (products.isEmpty()) { %>
          <tr>
            <td colspan="8" style="text-align: center;">No products found</td>
          </tr>
        <% } else { %>
          <% for (Map<String, Object> product : products) { %>
            <tr>
              <td>
                <% if (product.get("image") != null && !product.get("image").toString().isEmpty()) { %>
                  <img src="<%= product.get("image") %>" alt="<%= product.get("name") %>" class="product-image">
                <% } else { %>
                  <img src="images/products/placeholder.jpg" alt="No Image" class="product-image">
                <% } %>
              </td>
              <td><%= product.get("name") %></td>
              <td><%= product.get("sku") %></td>
              <td><%= product.get("category") %></td>
              <td>₹<%= String.format("%,.2f", product.get("price")) %></td>
              <td><%= product.get("stock") %></td>
              <td><span class="stock-status <%= product.get("stockStatus") %>"><%= product.get("stockStatusText") %></span></td>
              <td>
                <div class="action-buttons">
                  <button class="action-btn view-btn" onclick="window.location.href='viewProduct.jsp?id=<%= product.get("id") %>'"><i class="fas fa-eye"></i></button>
                  <button class="action-btn edit-btn" onclick="openEditModal('<%= product.get("id") %>')"><i class="fas fa-edit"></i></button>
                  <button class="action-btn delete-btn" onclick="openDeleteModal('<%= product.get("id") %>', '<%= product.get("name") %>')"><i class="fas fa-trash-alt"></i></button>
                </div>
              </td>
            </tr>
          <% } %>
        <% } %>
      </tbody>
    </table>
  </div>

  <!-- Pagination -->
  <div class="pagination">
    <button class="pagination-btn disabled"><i class="fas fa-angle-double-left"></i></button>
    <button class="pagination-btn disabled"><i class="fas fa-angle-left"></i></button>
    <button class="pagination-btn active">1</button>
    <button class="pagination-btn">2</button>
    <button class="pagination-btn">3</button>
    <button class="pagination-btn">4</button>
    <button class="pagination-btn">5</button>
    <button class="pagination-btn"><i class="fas fa-angle-right"></i></button>
    <button class="pagination-btn"><i class="fas fa-angle-double-right"></i></button>
  </div>
</div>

<!-- Add Product Modal -->
<div id="addProductModal" class="modal">
  <div class="modal-content">
    <div class="modal-header">
      <h2 class="modal-title">Add New Product</h2>
      <span class="close-modal" onclick="closeModal('addProductModal')">&times;</span>
    </div>
    <div class="modal-body">
      <form id="addProductForm" action="manageProducts.jsp" method="post" enctype="multipart/form-data">
        <div class="form-row">
          <div class="form-group">
            <label for="productName">Product Name*</label>
            <input type="text" id="productName" name="productName" required>
          </div>
          <div class="form-group">
            <label for="sku">SKU*</label>
            <input type="text" id="sku" name="sku" required>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group">
            <label for="category">Category*</label>
            <select id="category" name="category" required>
              <option value="">Select Category</option>
              <option value="men-shirts">Men's Shirts</option>
              <option value="men-pants">Men's Pants</option>
              <option value="men-outerwear">Men's Outerwear</option>
              <option value="women-dresses">Women's Dresses</option>
              <option value="women-tops">Women's Tops</option>
              <option value="women-bottoms">Women's Bottoms</option>
              <option value="women-outerwear">Women's Outerwear</option>
              <option value="kids">Kids' Clothing</option>
              <option value="accessories">Accessories</option>
            </select>
          </div>
          <div class="form-group">
            <label for="brand">Brand*</label>
            <input type="text" id="brand" name="brand" required>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group">
            <label for="price">Price (₹)*</label>
            <input type="number" id="price" name="price" min="0" step="0.01" required>
          </div>
          <div class="form-group">
            <label for="stock">Stock Quantity*</label>
            <input type="number" id="stock" name="stock" min="0" required>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group">
            <label for="discount">Discount (%)</label>
            <input type="number" id="discount" name="discount" min="0" max="100" value="0">
          </div>
          <div class="form-group">
            <label for="featured">Featured Product</label>
            <select id="featured" name="featured">
              <option value="0">No</option>
              <option value="1">Yes</option>
            </select>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group full-width">
            <label for="shortDescription">Short Description*</label>
            <textarea id="shortDescription" name="shortDescription" required></textarea>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group full-width">
            <label for="fullDescription">Full Description</label>
            <textarea id="fullDescription" name="fullDescription"></textarea>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group">
            <label for="productImage">Product Image*</label>
            <input type="file" id="productImage" name="productImage" accept="image/*" onchange="previewImage(this, 'imagePreview')" required>
            <div class="image-preview" id="imagePreview">
              <div class="image-preview-placeholder">
                <i class="fas fa-image"></i>
                <p>No image selected</p>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="additionalImages">Additional Images</label>
            <input type="file" id="additionalImages" name="additionalImages" accept="image/*" multiple>
            <p class="help-text" style="font-size: 12px; color: var(--mid-gray); margin-top: 5px;">You can select multiple images</p>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group">
            <label for="size">Available Sizes</label>
            <div style="display: flex; flex-wrap: wrap; gap: 10px; margin-top: 10px;">
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="sizes" value="XS"> XS
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="sizes" value="S"> S
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="sizes" value="M" checked> M
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="sizes" value="L" checked> L
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="sizes" value="XL" checked> XL
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="sizes" value="XXL"> XXL
              </label>
            </div>
          </div>
          <div class="form-group">
            <label for="colors">Available Colors</label>
            <div style="display: flex; flex-wrap: wrap; gap: 10px; margin-top: 10px;">
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="colors" value="Black" checked> Black
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="colors" value="White" checked> White
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="colors" value="Red"> Red
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="colors" value="Blue" checked> Blue
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="colors" value="Green"> Green
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="colors" value="Yellow"> Yellow
              </label>
            </div>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group">
            <label for="status">Status</label>
            <select id="status" name="status">
              <option value="active">Active</option>
              <option value="draft">Draft</option>
              <option value="hidden">Hidden</option>
            </select>
          </div>
        </div>
      </form>
    </div>
    <div class="modal-footer">
      <button type="button" class="modal-btn cancel-btn" onclick="closeModal('addProductModal')">Cancel</button>
      <button type="submit" form="addProductForm" class="modal-btn save-btn">Add Product</button>
    </div>
  </div>
</div>

<!-- Edit Product Modal -->
<div id="editProductModal" class="modal">
  <div class="modal-content">
    <div class="modal-header">
      <h2 class="modal-title">Edit Product</h2>
      <span class="close-modal" onclick="closeModal('editProductModal')">&times;</span>
    </div>
    <div class="modal-body">
      <form id="editProductForm" action="manageProducts.jsp" method="post" enctype="multipart/form-data">
        <input type="hidden" id="editProductId" name="productId">
        <input type="hidden" name="action" value="update">
        
        <div class="form-row">
          <div class="form-group">
            <label for="editProductName">Product Name*</label>
            <input type="text" id="editProductName" name="productName" required>
          </div>
          <div class="form-group">
            <label for="editSku">SKU*</label>
            <input type="text" id="editSku" name="sku" required>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group">
            <label for="editCategory">Category*</label>
            <select id="editCategory" name="category" required>
              <option value="">Select Category</option>
              <option value="men-shirts">Men's Shirts</option>
              <option value="men-pants">Men's Pants</option>
              <option value="men-outerwear">Men's Outerwear</option>
              <option value="women-dresses">Women's Dresses</option>
              <option value="women-tops">Women's Tops</option>
              <option value="women-bottoms">Women's Bottoms</option>
              <option value="women-outerwear">Women's Outerwear</option>
              <option value="kids">Kids' Clothing</option>
              <option value="accessories">Accessories</option>
            </select>
          </div>
          <div class="form-group">
            <label for="editBrand">Brand*</label>
            <input type="text" id="editBrand" name="brand" required>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group">
            <label for="editPrice">Price (₹)*</label>
            <input type="number" id="editPrice" name="price" min="0" step="0.01" required>
          </div>
          <div class="form-group">
            <label for="editStock">Stock Quantity*</label>
            <input type="number" id="editStock" name="stock" min="0" required>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group">
            <label for="editDiscount">Discount (%)</label>
            <input type="number" id="editDiscount" name="discount" min="0" max="100">
          </div>
          <div class="form-group">
            <label for="editFeatured">Featured Product</label>
            <select id="editFeatured" name="featured">
              <option value="0">No</option>
              <option value="1">Yes</option>
            </select>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group full-width">
            <label for="editShortDescription">Short Description*</label>
            <textarea id="editShortDescription" name="shortDescription" required></textarea>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group full-width">
            <label for="editFullDescription">Full Description</label>
            <textarea id="editFullDescription" name="fullDescription"></textarea>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group">
            <label for="editProductImage">Product Image</label>
            <input type="file" id="editProductImage" name="productImage" accept="image/*" onchange="previewImage(this, 'editImagePreview')">
            <div class="image-preview" id="editImagePreview">
              <div class="image-preview-placeholder">
                <i class="fas fa-image"></i>
                <p>Current image will be displayed here</p>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="editAdditionalImages">Additional Images</label>
            <input type="file" id="editAdditionalImages" name="additionalImages" accept="image/*" multiple>
            <p class="help-text" style="font-size: 12px; color: var(--mid-gray); margin-top: 5px;">You can select multiple images</p>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group">
            <label for="editSize">Available Sizes</label>
            <div style="display: flex; flex-wrap: wrap; gap: 10px; margin-top: 10px;">
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="sizes" value="XS"> XS
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="sizes" value="S"> S
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="sizes" value="M"> M
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="sizes" value="L"> L
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="sizes" value="XL"> XL
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="sizes" value="XXL"> XXL
              </label>
            </div>
          </div>
          <div class="form-group">
            <label for="editColors">Available Colors</label>
            <div style="display: flex; flex-wrap: wrap; gap: 10px; margin-top: 10px;">
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="colors" value="Black"> Black
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="colors" value="White"> White
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="colors" value="Red"> Red
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="colors" value="Blue"> Blue
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="colors" value="Green"> Green
              </label>
              <label style="display: flex; align-items: center; gap: 5px;">
                <input type="checkbox" name="colors" value="Yellow"> Yellow
              </label>
            </div>
          </div>
        </div>
        
        <div class="form-row">
          <div class="form-group">
            <label for="editStatus">Status</label>
            <select id="editStatus" name="status">
              <option value="active">Active</option>
              <option value="draft">Draft</option>
              <option value="hidden">Hidden</option>
            </select>
          </div>
        </div>
      </form>
    </div>
    <div class="modal-footer">
      <button type="button" class="modal-btn cancel-btn" onclick="closeModal('editProductModal')">Cancel</button>
      <button type="submit" form="editProductForm" class="modal-btn save-btn">Update Product</button>
    </div>
  </div>
</div>

<!-- Delete Confirmation Modal -->
<div id="deleteProductModal" class="modal delete-modal">
  <div class="modal-content">
    <div class="modal-header">
      <h2 class="modal-title">Delete Product</h2>
      <span class="close-modal" onclick="closeModal('deleteProductModal')">&times;</span>
    </div>
    <div class="modal-body">
      <i class="fas fa-exclamation-triangle warning-icon"></i>
      <p>Are you sure you want to delete this product?</p>
      <p class="product-name" id="deleteProductName">Product Name</p>
      <p>This action cannot be undone.</p>
      <form id="deleteProductForm" action="manageProducts.jsp" method="post">
        <input type="hidden" id="deleteProductId" name="productId">
        <input type="hidden" name="action" value="delete">
      </form>
    </div>
    <div class="modal-footer">
      <button type="button" class="modal-btn cancel-btn" onclick="closeModal('deleteProductModal')">Cancel</button>
      <button type="submit" form="deleteProductForm" class="modal-btn delete-confirm-btn">Delete</button>
    </div>
  </div>
</div>

<!-- for scroll up button -->
<a class="gotopbtn" href=""><i class="fa fa-arrow-up" aria-hidden="true"></i></a>

<!--  FOOTER START -->
<div class="footer">
  <div class="inner-footer">
    <!--  Company info section -->
    <div class="footer-items">
      <h1>FashionGhar</h1>
      <p>Where Classic Meets Cool</p>
      <p style="margin-top: 15px; line-height: 1.6;">Premium monochromatic fashion for those who appreciate timeless elegance with a modern twist.</p>
    </div>

    <!--  Admin links section -->
    <div class="footer-items">
      <h3>Quick Links</h3>
      <div class="border1"></div>
      <ul class="footcss">
        <li><a href="adminDashboard.jsp">Dashboard</a></li>
        <li><a href="manageProducts.jsp">Products</a></li>
        <li><a href="manageOrders.jsp">Orders</a></li>
        <li><a href="manageUsers.jsp">Users</a></li>
        <li><a href="reports.jsp">Reports</a></li>
      </ul>
    </div>

    <!--  Admin tools section -->
    <div class="footer-items">
      <h3>Admin Tools</h3>
      <div class="border1"></div>
      <ul class="footcss">
        <li><a href="inventory.jsp">Inventory Management</a></li>
        <li><a href="discounts.jsp">Discount Codes</a></li>
        <li><a href="analytics.jsp">Sales Analytics</a></li>
        <li><a href="marketing.jsp">Marketing Tools</a></li>
        <li><a href="adminSettings.jsp">System Settings</a></li>
      </ul>
    </div>

    <!--  Contact us info -->
    <div class="footer-items">
      <h3>Contact us</h3>
      <div class="border1"></div>
      <ul class="footcss">
        <li><i class="fa fa-map-marker" aria-hidden="true"></i>Mahendrapool, Pokhara</li>
        <li><i class="fa fa-phone" aria-hidden="true"></i>+977 9876543210</li>
        <li><i class="fa fa-envelope" aria-hidden="true"></i>admin@fashionghar.com</li>
      </ul> 
      
      <!--   for social links -->
      <div class="social-media">
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-pinterest"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
      </div> 
    </div>
  </div>
  
  <!--   Footer Bottom start  -->
  <div class="footer-bottom">
    Copyright &copy; 2025 FashionGhar. All Rights Reserved.
  </div>
</div>
<!--   Footer Bottom end -->
<!--   FOOTER END -->

<script>
  // Display current date
  const dateElement = document.getElementById('currentDate');
  if (dateElement) {
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    const today = new Date();
    dateElement.textContent = today.toLocaleDateString('en-US', options);
  }
  
  // Auto-hide alert messages after 5 seconds
  document.addEventListener('DOMContentLoaded', function() {
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(function(alert) {
      setTimeout(function() {
        alert.style.opacity = '0';
        alert.style.transition = 'opacity 1s';
        setTimeout(function() {
          alert.style.display = 'none';
        }, 1000);
      }, 5000);
    });
  });
</script>

</body>
</html>