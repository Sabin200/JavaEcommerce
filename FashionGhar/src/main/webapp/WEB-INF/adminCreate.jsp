<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FashionGhar - Add Product</title>
<meta name="description" content="FashionGhar Admin - Add new products to inventory">
<meta name="keywords" content="HTML, CSS, JavaScript">
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
  --success: #4CAF50;
  --error: #f44336;
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
  min-height: 100vh;
  display: flex;
  flex-direction: column;
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

.admin-label {
  position: absolute;
  top: 15px;
  left: 30px;
  color: var(--white);
  font-weight: 600;
  letter-spacing: 1px;
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

/* Admin Content Styles */
.admin-container {
    max-width: 1200px;
    margin: 40px auto;
    padding: 30px;
    background-color: var(--white);
    border-radius: 8px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    flex: 1;
}

.admin-header {
    margin-bottom: 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.admin-header h1 {
    font-size: 28px;
    color: var(--black);
    position: relative;
    padding-bottom: 10px;
}

.admin-header h1:after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    width: 80px;
    height: 3px;
    background-color: var(--black);
}

.back-to-dashboard {
    display: inline-block;
    padding: 10px 20px;
    background-color: var(--black);
    color: var(--white);
    text-decoration: none;
    border-radius: 4px;
    transition: all 0.3s ease;
}

.back-to-dashboard:hover {
    background-color: var(--dark-gray);
}

/* Form Styles */
.product-form {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 30px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: 500;
}

.form-control {
    width: 100%;
    padding: 12px 15px;
    border: 1px solid var(--mid-gray);
    border-radius: 4px;
    background-color: var(--white);
    font-size: 16px;
    transition: border-color 0.3s ease;
}

.form-control:focus {
    border-color: var(--black);
    outline: none;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

textarea.form-control {
    resize: vertical;
    min-height: 120px;
}

.image-preview-container {
    grid-column: 1 / 3;
    display: flex;
    flex-direction: column;
    align-items: center;
    border: 2px dashed var(--mid-gray);
    border-radius: 4px;
    padding: 30px;
    text-align: center;
    margin-bottom: 30px;
    transition: all 0.3s ease;
    cursor: pointer;
}

.image-preview-container:hover {
    border-color: var(--black);
}

.image-preview {
    max-width: 100%;
    max-height: 300px;
    margin-top: 20px;
    display: none;
}

.custom-file-upload {
    display: inline-block;
    cursor: pointer;
    background-color: var(--black);
    color: var(--white);
    padding: 10px 20px;
    border-radius: 4px;
    margin-top: 15px;
    transition: all 0.3s ease;
}

.custom-file-upload:hover {
    background-color: var(--dark-gray);
}

.file-upload-input {
    display: none;
}

.submit-row {
    grid-column: 1 / 3;
    margin-top: 20px;
    text-align: center;
}

.submit-button {
    padding: 12px 30px;
    background-color: var(--black);
    color: var(--white);
    border: none;
    border-radius: 4px;
    font-size: 18px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    letter-spacing: 1px;
    text-transform: uppercase;
}

.submit-button:hover {
    background-color: var(--dark-gray);
    transform: translateY(-2px);
}

.notification {
    padding: 15px;
    margin-bottom: 20px;
    border-radius: 4px;
    display: none;
}

.success {
    background-color: #dff0d8;
    border: 1px solid #d0e9c6;
    color: #3c763d;
}

.error {
    background-color: #f2dede;
    border: 1px solid #ebcccc;
    color: #a94442;
}

/* Responsive Adjustments */
@media (max-width: 992px) {
    .product-form {
        grid-template-columns: 1fr;
    }
    
    .image-preview-container {
        grid-column: 1;
    }
    
    .submit-row {
        grid-column: 1;
    }
    
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
}

@media (max-width: 768px) {
    .admin-header {
        flex-direction: column;
        gap: 15px;
        align-items: flex-start;
    }
    
    .admin-container {
        padding: 20px;
        margin: 20px;
    }
    
    .nav-links ul {
        flex-wrap: wrap;
        justify-content: center;
    }
    
    .nav-links ul li {
        margin: 5px 10px;
    }
}

/* Switch toggle for product availability */
.switch {
    position: relative;
    display: inline-block;
    width: 60px;
    height: 34px;
    margin-top: 8px;
}

.switch input {
    opacity: 0;
    width: 0;
    height: 0;
}

.slider {
    position: absolute;
    cursor: pointer;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #ccc;
    transition: .4s;
    border-radius: 34px;
}

.slider:before {
    position: absolute;
    content: "";
    height: 26px;
    width: 26px;
    left: 4px;
    bottom: 4px;
    background-color: white;
    transition: .4s;
    border-radius: 50%;
}

input:checked + .slider {
    background-color: var(--black);
}

input:focus + .slider {
    box-shadow: 0 0 1px var(--black);
}

input:checked + .slider:before {
    transform: translateX(26px);
}

/* Category tags style */
.category-container {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 10px;
}

.category-tag {
    display: inline-block;
    padding: 8px 12px;
    background-color: var(--light-gray);
    border-radius: 20px;
    font-size: 14px;
    margin-right: 10px;
    margin-bottom: 10px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.category-tag:hover {
    background-color: var(--mid-gray);
    color: var(--white);
}

.category-tag.selected {
    background-color: var(--black);
    color: var(--white);
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

/* Footer Styles */
.footer-bottom {
  background-color: var(--black);
  color: var(--mid-gray);
  text-align: center;
  padding: 20px 0;
  border-top: 1px solid var(--dark-gray);
  margin-top: auto;
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

// For image preview functionality
function previewImage(input) {
  var preview = document.getElementById('imagePreview');
  
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    
    reader.onload = function(e) {
      preview.src = e.target.result;
      preview.style.display = 'block';
    };
    
    reader.readAsDataURL(input.files[0]);
  }
}

// Add category tag functionality
function toggleCategoryTag(tag) {
  tag.classList.toggle('selected');
  
  // Update hidden input with selected categories
  updateSelectedCategories();
}

function updateSelectedCategories() {
  var selectedTags = document.querySelectorAll('.category-tag.selected');
  var categories = Array.from(selectedTags).map(tag => tag.getAttribute('data-value'));
  document.getElementById('selectedCategories').value = categories.join(',');
}

// Form validation
function validateForm() {
  var productName = document.getElementById('productName').value;
  var productPrice = document.getElementById('productPrice').value;
  var productImage = document.getElementById('productImage').value;
  var notification = document.getElementById('notification');
  
  if (productName === '' || productPrice === '' || productImage === '') {
    notification.textContent = 'Please fill in all required fields';
    notification.className = 'notification error';
    notification.style.display = 'block';
    return false;
  }
  
  return true;
}
</script>
</head>
<body>
<!-- for admin label and sign in -->
<div class="abc">
  <span class="admin-label">ADMIN PANEL</span>
  <a href="adminDashboard.jsp"><i class="fa fa-user-shield" aria-hidden="true"></i>&nbsp;Admin Dashboard</a>
</div>
<div class="dropdown">
  <button onclick="myFunction()" class="dropbtn">Admin</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="adminDashboard.jsp"><i class="fa fa-tachometer-alt"></i> Dashboard</a>
    <a href="adminProducts.jsp"><i class="fa fa-box"></i> Products</a>
    <a href="adminCustomers.jsp"><i class="fa fa-users"></i> Customers</a>
    <a href="adminOrders.jsp"><i class="fa fa-shopping-cart"></i> Orders</a>
    <a href="adminSettings.jsp"><i class="fa fa-cog"></i> Settings</a>
    <a href="logout.jsp"><i class="fa fa-sign-out-alt"></i> Logout</a>
  </div>
</div>
<hr>

<!-- for navigation -->
<div class="main">
  <nav class="stroke">
    <!-- for logo -->
    <div class="logo">
      <a href="Home.jsp">
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
          <text x="90" y="72" font-family="Montserrat, sans-serif" font-size="10" font-style="italic" font-weight="300" text-anchor="middle" fill="#ffffff">WHERE CLASSIC MEETS COOL</text>
        </svg>
      </a>
    </div>

    <!-- for navigation bar -->
    <div class="nav-links">
      <ul>
        <li><a href="adminDashboard.jsp">DASHBOARD</a></li>
        <li><a href="adminProducts.jsp">PRODUCTS</a></li>
        <li><a href="adminOrders.jsp">ORDERS</a></li>
        <li><a href="adminCustomers.jsp">CUSTOMERS</a></li>
        <li><a href="adminReports.jsp">REPORTS</a></li>
      </ul>
    </div>
  </nav>
</div>

<!-- Admin content container -->
<div class="admin-container">
    <div class="admin-header">
        <h1>Add New Product</h1>
        <a href="adminProducts.jsp" class="back-to-dashboard">
            <i class="fas fa-arrow-left"></i> Back to Products
        </a>
    </div>
    
    <!-- Notification area -->
    <div id="notification" class="notification"></div>
    
    <!-- Product form -->
    <form action="AddProductServlet" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
        <div class="product-form">
            <!-- Image upload section -->
            <div class="image-preview-container" onclick="document.getElementById('productImage').click()">
                <i class="fas fa-cloud-upload-alt" style="font-size: 48px; color: var(--mid-gray);"></i>
                <h3 style="margin-top: 15px;">Upload Product Image</h3>
                <p style="color: var(--mid-gray);">Click to browse or drag and drop</p>
                <label class="custom-file-upload">
                    Choose File
                    <input type="file" id="productImage" name="productImage" class="file-upload-input" accept="image/*" onchange="previewImage(this)" required>
                </label>
                <img id="imagePreview" class="image-preview" src="#" alt="Image Preview">
            </div>
            
            <!-- First column -->
            <div>
                <div class="form-group">
                    <label for="productName">Product Name*</label>
                    <input type="text" id="productName" name="productName" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="productPrice">Price (₹)*</label>
                    <input type="number" id="productPrice" name="productPrice" class="form-control" min="0" step="0.01" required>
                </div>
                
                <div class="form-group">
                    <label for="productSKU">SKU (Stock Keeping Unit)</label>
                    <input type="text" id="productSKU" name="productSKU" class="form-control">
                </div>
                
                <div class="form-group">
                    <label>Category*</label>
                    <div class="category-container">
                        <span class="category-tag" data-value="men" onclick="toggleCategoryTag(this)">Men</span>
                        <span class="category-tag" data-value="women" onclick="toggleCategoryTag(this)">Women</span>
                        <span class="category-tag" data-value="unisex" onclick="toggleCategoryTag(this)">Unisex</span>
                        <span class="category-tag" data-value="new-arrivals" onclick="toggleCategoryTag(this)">New Arrivals</span>
                        <span class="category-tag" data-value="sale" onclick="toggleCategoryTag(this)">Sale</span>
                    </div>
                    <input type="hidden" id="selectedCategories" name="categories" value="">
                </div>
            </div>
            
            <!-- Second column -->
            <div>
                <div class="form-group">
                    <label for="productStock">Stock Quantity*</label>
                    <input type="number" id="productStock" name="productStock" class="form-control" min="0" required>
                </div>
                
                <div class="form-group">
                    <label for="productSize">Available Sizes</label>
                    <input type="text" id="productSize" name="productSize" class="form-control" placeholder="S,M,L,XL">
                    <small style="color: var(--mid-gray);">Enter sizes separated by commas</small>
                </div>
                
                <div class="form-group">
                    <label>Product Availability</label>
                    <div>
                        <label class="switch">
                            <input type="checkbox" id="productAvailability" name="productAvailability" checked>
                            <span class="slider"></span>
                        </label>
                        <span style="margin-left: 10px;">Available for purchase</span>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="featuredProduct">Featured Product</label>
                    <div>
                        <label class="switch">
                            <input type="checkbox" id="featuredProduct" name="featuredProduct">
                            <span class="slider"></span>
                        </label>
                        <span style="margin-left: 10px;">Show on homepage</span>
                    </div>
                </div>
            </div>
            
            <!-- Full width description -->
            <div class="form-group" style="grid-column: 1 / 3;">
                <label for="productDescription">Product Description</label>
                <textarea id="productDescription" name="productDescription" class="form-control"></textarea>
            </div>
            
            <!-- Submit button -->
            <div class="submit-row">
                <button type="submit" class="submit-button">
                    <i class="fas fa-plus-circle"></i> Add Product
                </button>
            </div>
        </div>
    </form>
</div>

<!-- for scroll up button -->
<a class="gotopbtn" href="#"><i class="fa fa-arrow-up" aria-hidden="true"></i></a>

<!-- Footer (simplified for admin) -->
<div class="footer-bottom">
  Copyright &copy; 2025 FashionGhar. All Rights Reserved.
</div>

<script>
// Additional JavaScript to handle form validation and submission
document.addEventListener('DOMContentLoaded', function() {
    // Initialize category selection
    updateSelectedCategories();
});
</script>
</body>
</html>