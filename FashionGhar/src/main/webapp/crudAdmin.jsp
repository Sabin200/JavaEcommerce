<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Products - FashionGhar</title>
<meta name="description" content="FashionGhar Admin - Manage your clothing products">
<meta name="keywords" content="HTML, CSS, JavaScript, Admin, Products">
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
  margin-right: 150px;
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

/* Navigation Styles */
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
  padding: 10px 20px;
  background-color: var(--black);
  color: var(--white);
  border: none;
  border-radius: 4px;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
}

.add-product-btn:hover {
  background-color: var(--dark-gray);
}

.product-filters {
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
  gap: 5px;
}

.filter-label {
  font-size: 14px;
  font-weight: 500;
}

.filter-select, .filter-input {
  padding: 8px 12px;
  border: 1px solid var(--mid-gray);
  border-radius: 4px;
  font-size: 14px;
  min-width: 150px;
}

.filter-btn {
  padding: 8px 16px;
  background-color: var(--black);
  color: var(--white);
  border: none;
  border-radius: 4px;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
  align-self: flex-end;
}

.filter-btn:hover {
  background-color: var(--dark-gray);
}

.product-table-container {
  background-color: var(--white);
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  margin-bottom: 40px;
  overflow-x: auto;
}

.product-table {
  width: 100%;
  border-collapse: collapse;
}

.product-table th {
  text-align: left;
  padding: 12px 15px;
  border-bottom: 2px solid var(--light-gray);
  font-size: 14px;
  font-weight: 600;
  color: var(--dark-gray);
}

.product-table td {
  padding: 12px 15px;
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

.product-actions {
  display: flex;
  gap: 10px;
}

.action-btn {
  padding: 6px 12px;
  border: none;
  border-radius: 4px;
  font-size: 12px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.view-btn {
  background-color: var(--info);
  color: var(--white);
}

.edit-btn {
  background-color: var(--warning);
  color: var(--white);
}

.delete-btn {
  background-color: var(--danger);
  color: var(--white);
}

.action-btn:hover {
  opacity: 0.8;
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

.pagination {
  display: flex;
  justify-content: center;
  gap: 10px;
  margin-top: 20px;
}

.page-btn {
  width: 36px;
  height: 36px;
  display: flex;
  align-items: center;
  justify-content: center;
  border: 1px solid var(--mid-gray);
  border-radius: 4px;
  background-color: var(--white);
  cursor: pointer;
  transition: all 0.3s ease;
}

.page-btn.active {
  background-color: var(--black);
  color: var(--white);
  border-color: var(--black);
}

.page-btn:hover:not(.active) {
  background-color: var(--light-gray);
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
  margin: 50px auto;
  padding: 30px;
  border-radius: 8px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
  width: 90%;
  max-width: 800px;
  position: relative;
}

.close-modal {
  position: absolute;
  top: 20px;
  right: 20px;
  font-size: 24px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.close-modal:hover {
  color: var(--danger);
}

.modal-title {
  font-size: 24px;
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 2px solid var(--light-gray);
}

.form-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 20px;
}

.form-group {
  margin-bottom: 20px;
}

.form-label {
  display: block;
  font-size: 14px;
  font-weight: 500;
  margin-bottom: 8px;
}

.form-input, .form-select, .form-textarea {
  width: 100%;
  padding: 10px 12px;
  border: 1px solid var(--mid-gray);
  border-radius: 4px;
  font-size: 14px;
}

.form-textarea {
  min-height: 100px;
  resize: vertical;
}

.form-group.full-width {
  grid-column: span 2;
}

.color-options, .size-options {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  margin-top: 10px;
}

.color-option, .size-option {
  display: flex;
  align-items: center;
  gap: 5px;
}

.color-checkbox, .size-checkbox {
  margin-right: 5px;
}

.image-preview-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
  gap: 10px;
  margin-top: 10px;
}

.image-preview {
  width: 100px;
  height: 100px;
  object-fit: cover;
  border-radius: 4px;
  border: 1px solid var(--mid-gray);
}

.form-actions {
  display: flex;
  justify-content: flex-end;
  gap: 15px;
  margin-top: 30px;
}

.cancel-btn {
  padding: 10px 20px;
  background-color: var(--light-gray);
  color: var(--dark-gray);
  border: none;
  border-radius: 4px;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.save-btn {
  padding: 10px 20px;
  background-color: var(--black);
  color: var(--white);
  border: none;
  border-radius: 4px;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.cancel-btn:hover {
  background-color: var(--mid-gray);
  color: var(--white);
}

.save-btn:hover {
  background-color: var(--dark-gray);
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

/* Responsive adjustments */
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
  
  .form-grid {
    grid-template-columns: 1fr;
  }
  
  .form-group.full-width {
    grid-column: span 1;
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
  
  .product-filters {
    flex-direction: column;
  }
  
  .filter-group {
    width: 100%;
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

// Open modal
function openModal(modalId) {
  document.getElementById(modalId).style.display = "block";
}

// Close modal
function closeModal(modalId) {
  document.getElementById(modalId).style.display = "none";
}

// Preview uploaded images
function previewImages() {
  var preview = document.querySelector('.image-preview-container');
  var files = document.querySelector('input[type=file]').files;
  
  preview.innerHTML = '';
  
  if (files) {
    [].forEach.call(files, function(file) {
      var reader = new FileReader();
      
      reader.onloadend = function() {
        var img = document.createElement('img');
        img.src = reader.result;
        img.className = 'image-preview';
        preview.appendChild(img);
      }
      
      if (file) {
        reader.readAsDataURL(file);
      }
    });
  }
}

// Confirm delete
function confirmDelete(productId, productName) {
  return confirm("Are you sure you want to delete the product: " + productName + "?");
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
  <div class="product-header">
    <h1 class="product-title">Manage Products</h1>
    <button class="add-product-btn" onclick="openModal('addProductModal')">
      <i class="fas fa-plus"></i> Add New Product
    </button>
  </div>

  <!-- Product Filters -->
  <div class="product-filters">
    <div class="filter-group">
      <label class="filter-label">Category</label>
      <select class="filter-select">
        <option value="">All Categories</option>
        <option value="men-shirts">Men's Shirts</option>
        <option value="men-pants">Men's Pants</option>
        <option value="women-dresses">Women's Dresses</option>
        <option value="women-tops">Women's Tops</option>
        <option value="accessories">Accessories</option>
      </select>
    </div>
    <div class="filter-group">
      <label class="filter-label">Price Range</label>
      <select class="filter-select">
        <option value="">All Prices</option>
        <option value="0-50">$0 - $50</option>
        <option value="50-100">$50 - $100</option>
        <option value="100-200">$100 - $200</option>
        <option value="200+">$200+</option>
      </select>
    </div>
    <div class="filter-group">
      <label class="filter-label">Stock Status</label>
      <select class="filter-select">
        <option value="">All Status</option>
        <option value="in-stock">In Stock</option>
        <option value="low-stock">Low Stock</option>
        <option value="out-of-stock">Out of Stock</option>
      </select>
    </div>
    <div class="filter-group">
      <label class="filter-label">Search</label>
      <input type="text" class="filter-input" placeholder="Search products...">
    </div>
    <button class="filter-btn">Apply Filters</button>
  </div>

  <!-- Product Table -->
  <div class="product-table-container">
    <table class="product-table">
      <thead>
        <tr>
          <th>Image</th>
          <th>Product ID</th>
          <th>Name</th>
          <th>Category</th>
          <th>Price</th>
          <th>Stock</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><img src="images/products/shirt1.jpg" alt="Premium Cotton Shirt" class="product-image"></td>
          <td>#PRD-1025</td>
          <td>Premium Cotton Shirt</td>
          <td>Men's Shirts</td>
          <td>$78.00</td>
          <td>45</td>
          <td><span class="stock-status in-stock">In Stock</span></td>
          <td>
            <div class="product-actions">
              <button class="action-btn view-btn" onclick="window.location.href='viewProduct.jsp?id=1025'">View</button>
              <button class="action-btn edit-btn" onclick="openModal('editProductModal')">Edit</button>
              <button class="action-btn delete-btn" onclick="confirmDelete('1025', 'Premium Cotton Shirt')">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="images/products/dress1.jpg" alt="Floral Summer Dress" class="product-image"></td>
          <td>#PRD-1024</td>
          <td>Floral Summer Dress</td>
          <td>Women's Dresses</td>
          <td>$95.50</td>
          <td>32</td>
          <td><span class="stock-status in-stock">In Stock</span></td>
          <td>
            <div class="product-actions">
              <button class="action-btn view-btn" onclick="window.location.href='viewProduct.jsp?id=1024'">View</button>
              <button class="action-btn edit-btn" onclick="openModal('editProductModal')">Edit</button>
              <button class="action-btn delete-btn" onclick="confirmDelete('1024', 'Floral Summer Dress')">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="images/products/jeans1.jpg" alt="Slim Fit Denim Jeans" class="product-image"></td>
          <td>#PRD-1023</td>
          <td>Slim Fit Denim Jeans</td>
          <td>Men's Pants</td>
          <td>$65.00</td>
          <td>28</td>
          <td><span class="stock-status low-stock">Low Stock</span></td>
          <td>
            <div class="product-actions">
              <button class="action-btn view-btn" onclick="window.location.href='viewProduct.jsp?id=1023'">View</button>
              <button class="action-btn edit-btn" onclick="openModal('editProductModal')">Edit</button>
              <button class="action-btn delete-btn" onclick="confirmDelete('1023', 'Slim Fit Denim Jeans')">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="images/products/hoodie1.jpg" alt="Casual Hoodie" class="product-image"></td>
          <td>#PRD-1022</td>
          <td>Casual Hoodie</td>
          <td>Unisex</td>
          <td>$55.25</td>
          <td>50</td>
          <td><span class="stock-status in-stock">In Stock</span></td>
          <td>
            <div class="product-actions">
              <button class="action-btn view-btn" onclick="window.location.href='viewProduct.jsp?id=1022'">View</button>
              <button class="action-btn edit-btn" onclick="openModal('editProductModal')">Edit</button>
              <button class="action-btn delete-btn" onclick="confirmDelete('1022', 'Casual Hoodie')">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="images/products/coat1.jpg" alt="Winter Overcoat" class="product-image"></td>
          <td>#PRD-1021</td>
          <td>Winter Overcoat</td>
          <td>Women's Outerwear</td>
          <td>$190.00</td>
          <td>0</td>
          <td><span class="stock-status out-of-stock">Out of Stock</span></td>
          <td>
            <div class="product-actions">
              <button class="action-btn view-btn" onclick="window.location.href='viewProduct.jsp?id=1021'">View</button>
              <button class="action-btn edit-btn" onclick="openModal('editProductModal')">Edit</button>
              <button class="action-btn delete-btn" onclick="confirmDelete('1021', 'Winter Overcoat')">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="images/products/tshirt1.jpg" alt="Graphic T-Shirt" class="product-image"></td>
          <td>#PRD-1020</td>
          <td>Graphic T-Shirt</td>
          <td>Men's T-Shirts</td>
          <td>$35.99</td>
          <td>75</td>
          <td><span class="stock-status in-stock">In Stock</span></td>
          <td>
            <div class="product-actions">
              <button class="action-btn view-btn" onclick="window.location.href='viewProduct.jsp?id=1020'">View</button>
              <button class="action-btn edit-btn" onclick="openModal('editProductModal')">Edit</button>
              <button class="action-btn delete-btn" onclick="confirmDelete('1020', 'Graphic T-Shirt')">Delete</button>
            </div>
          </td>
        </tr>
        <tr>
          <td><img src="images/products/skirt1.jpg" alt="Pleated Midi Skirt" class="product-image"></td>
          <td>#PRD-1019</td>
          <td>Pleated Midi Skirt</td>
          <td>Women's Bottoms</td>
          <td>$49.99</td>
          <td>18</td>
          <td><span class="stock-status low-stock">Low Stock</span></td>
          <td>
            <div class="product-actions">
              <button class="action-btn view-btn" onclick="window.location.href='viewProduct.jsp?id=1019'">View</button>
              <button class="action-btn edit-btn" onclick="openModal('editProductModal')">Edit</button>
              <button class="action-btn delete-btn" onclick="confirmDelete('1019', 'Pleated Midi Skirt')">Delete</button>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    
    <!-- Pagination -->
    <div class="pagination">
      <button class="page-btn"><i class="fas fa-chevron-left"></i></button>
      <button class="page-btn active">1</button>
      <button class="page-btn">2</button>
      <button class="page-btn">3</button>
      <button class="page-btn">4</button>
      <button class="page-btn">5</button>
      <button class="page-btn"><i class="fas fa-chevron-right"></i></button>
    </div>
  </div>
</div>

<!-- Add Product Modal -->
<div id="addProductModal" class="modal">
  <div class="modal-content">
    <span class="close-modal" onclick="closeModal('addProductModal')">&times;</span>
    <h2 class="modal-title">Add New Product</h2>
    <form action="addProduct" method="post" enctype="multipart/form-data">
      <div class="form-grid">
        <div class="form-group">
          <label class="form-label">Product Name*</label>
          <input type="text" class="form-input" name="productName" required>
        </div>
        <div class="form-group">
          <label class="form-label">SKU/Product ID*</label>
          <input type="text" class="form-input" name="productSku" required>
        </div>
        <div class="form-group">
          <label class="form-label">Category*</label>
          <select class="form-select" name="category" required>
            <option value="">Select Category</option>
            <option value="men-shirts">Men's Shirts</option>
            <option value="men-tshirts">Men's T-Shirts</option>
            <option value="men-pants">Men's Pants</option>
            <option value="men-outerwear">Men's Outerwear</option>
            <option value="women-dresses">Women's Dresses</option>
            <option value="women-tops">Women's Tops</option>
            <option value="women-bottoms">Women's Bottoms</option>
            <option value="women-outerwear">Women's Outerwear</option>
            <option value="accessories">Accessories</option>
            <option value="footwear">Footwear</option>
            <option value="unisex">Unisex</option>
          </select>
        </div>
        <div class="form-group">
          <label class="form-label">Price ($)*</label>
          <input type="number" class="form-input" name="price" step="0.01" min="0" required>
        </div>
        <div class="form-group">
          <label class="form-label">Sale Price ($)</label>
          <input type="number" class="form-input" name="salePrice" step="0.01" min="0">
        </div>
        <div class="form-group">
          <label class="form-label">Stock Quantity*</label>
          <input type="number" class="form-input" name="stock" min="0" required>
        </div>
        <div class="form-group full-width">
          <label class="form-label">Short Description*</label>
          <textarea class="form-textarea" name="shortDescription" required></textarea>
        </div>
        <div class="form-group full-width">
          <label class="form-label">Full Description</label>
          <textarea class="form-textarea" name="fullDescription"></textarea>
        </div>
        <div class="form-group">
          <label class="form-label">Colors Available</label>
          <div class="color-options">
            <div class="color-option">
              <input type="checkbox" class="color-checkbox" name="colors" value="black" id="color-black">
              <label for="color-black">Black</label>
            </div>
            <div class="color-option">
              <input type="checkbox" class="color-checkbox" name="colors" value="white" id="color-white">
              <label for="color-white">White</label>
            </div>
            <div class="color-option">
              <input type="checkbox" class="color-checkbox" name="colors" value="red" id="color-red">
              <label for="color-red">Red</label>
            </div>
            <div class="color-option">
              <input type="checkbox" class="color-checkbox" name="colors" value="blue" id="color-blue">
              <label for="color-blue">Blue</label>
            </div>
            <div class="color-option">
              <input type="checkbox" class="color-checkbox" name="colors" value="green" id="color-green">
              <label for="color-green">Green</label>
            </div>
            <div class="color-option">
              <input type="checkbox" class="color-checkbox" name="colors" value="gray" id="color-gray">
              <label for="color-gray">Gray</label>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label class="form-label">Sizes Available</label>
          <div class="size-options">
            <div class="size-option">
              <input type="checkbox" class="size-checkbox" name="sizes" value="xs" id="size-xs">
              <label for="size-xs">XS</label>
            </div>
            <div class="size-option">
              <input type="checkbox" class="size-checkbox" name="sizes" value="s" id="size-s">
              <label for="size-s">S</label>
            </div>
            <div class="size-option">
              <input type="checkbox" class="size-checkbox" name="sizes" value="m" id="size-m">
              <label for="size-m">M</label>
            </div>
            <div class="size-option">
              <input type="checkbox" class="size-checkbox" name="sizes" value="l" id="size-l">
              <label for="size-l">L</label>
            </div>
            <div class="size-option">
              <input type="checkbox" class="size-checkbox" name="sizes" value="xl" id="size-xl">
              <label for="size-xl">XL</label>
            </div>
            <div class="size-option">
              <input type="checkbox" class="size-checkbox" name="sizes" value="xxl" id="size-xxl">
              <label for="size-xxl">XXL</label>
            </div>
          </div>
        </div>
        <div class="form-group full-width">
          <label class="form-label">Product Images (Max 5)*</label>
          <input type="file" name="productImages" multiple accept="image/*" onchange="previewImages()" required>
          <div class="image-preview-container"></div>
        </div>
        <div class="form-group">
          <label class="form-label">Featured Product</label>
          <select class="form-select" name="featured">
            <option value="no">No</option>
            <option value="yes">Yes</option>
          </select>
        </div>
        <div class="form-group">
          <label class="form-label">Status</label>
          <select class="form-select" name="status">
            <option value="active">Active</option>
            <option value="draft">Draft</option>
            <option value="hidden">Hidden</option>
          </select>
        </div>
      </div>
      <div class="form-actions">
        <button type="button" class="cancel-btn" onclick="closeModal('addProductModal')">Cancel</button>
        <button type="submit" class="save-btn">Add Product</button>
      </div>
    </form>
  </div>
</div>

<!-- Edit Product Modal (similar structure to Add Product) -->
<div id="editProductModal" class="modal">
  <div class="modal-content">
    <span class="close-modal" onclick="closeModal('editProductModal')">&times;</span>
    <h2 class="modal-title">Edit Product</h2>
    <form action="updateProduct" method="post" enctype="multipart/form-data">
      <input type="hidden" name="productId" value="1025">
      <div class="form-grid">
        <div class="form-group">
          <label class="form-label">Product Name*</label>
          <input type="text" class="form-input" name="productName" value="Premium Cotton Shirt" required>
        </div>
        <div class="form-group">
          <label class="form-label">SKU/Product ID*</label>
          <input type="text" class="form-input" name="productSku" value="PRD-1025" required>
        </div>
        <div class="form-group">
          <label class="form-label">Category*</label>
          <select class="form-select" name="category" required>
            <option value="">Select Category</option>
            <option value="men-shirts" selected>Men's Shirts</option>
            <option value="men-tshirts">Men's T-Shirts</option>
            <option value="men-pants">Men's Pants</option>
            <option value="men-outerwear">Men's Outerwear</option>
            <option value="women-dresses">Women's Dresses</option>
            <option value="women-tops">Women's Tops</option>
            <option value="women-bottoms">Women's Bottoms</option>
            <option value="women-outerwear">Women's Outerwear</option>
            <option value="accessories">Accessories</option>
            <option value="footwear">Footwear</option>
            <option value="unisex">Unisex</option>
          </select>
        </div>
        <div class="form-group">
          <label class="form-label">Price ($)*</label>
          <input type="number" class="form-input" name="price" step="0.01" min="0" value="78.00" required>
        </div>
        <div class="form-group">
          <label class="form-label">Sale Price ($)</label>
          <input type="number" class="form-input" name="salePrice" step="0.01" min="0" value="0">
        </div>
        <div class="form-group">
          <label class="form-label">Stock Quantity*</label>
          <input type="number" class="form-input" name="stock" min="0" value="45" required>
        </div>
        <div class="form-group full-width">
          <label class="form-label">Short Description*</label>
          <textarea class="form-textarea" name="shortDescription" required>Premium cotton shirt with a classic fit and button-down collar.</textarea>
        </div>
        <div class="form-group full-width">
          <label class="form-label">Full Description</label>
          <textarea class="form-textarea" name="fullDescription">This premium cotton shirt features a classic fit with a button-down collar. Made from 100% high-quality cotton, it offers exceptional comfort and breathability. Perfect for both casual and formal occasions, this versatile shirt is a must-have addition to any wardrobe. The durable construction ensures it will maintain its shape and color through multiple washes.</textarea>
        </div>
        <div class="form-group">
          <label class="form-label">Colors Available</label>
          <div class="color-options">
            <div class="color-option">
              <input type="checkbox" class="color-checkbox" name="colors" value="black" id="edit-color-black" checked>
              <label for="edit-color-black">Black</label>
            </div>
            <div class="color-option">
              <input type="checkbox" class="color-checkbox" name="colors" value="white" id="edit-color-white" checked>
              <label for="edit-color-white">White</label>
            </div>
            <div class="color-option">
              <input type="checkbox" class="color-checkbox" name="colors" value="red" id="edit-color-red">
              <label for="edit-color-red">Red</label>
            </div>
            <div class="color-option">
              <input type="checkbox" class="color-checkbox" name="colors" value="blue" id="edit-color-blue" checked>
              <label for="edit-color-blue">Blue</label>
            </div>
            <div class="color-option">
              <input type="checkbox" class="color-checkbox" name="colors" value="green" id="edit-color-green">
              <label for="edit-color-green">Green</label>
            </div>
            <div class="color-option">
              <input type="checkbox" class="color-checkbox" name="colors" value="gray" id="edit-color-gray">
              <label for="edit-color-gray">Gray</label>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label class="form-label">Sizes Available</label>
          <div class="size-options">
            <div class="size-option">
              <input type="checkbox" class="size-checkbox" name="sizes" value="xs" id="edit-size-xs">
              <label for="edit-size-xs">XS</label>
            </div>
            <div class="size-option">
              <input type="checkbox" class="size-checkbox" name="sizes" value="s" id="edit-size-s" checked>
              <label for="edit-size-s">S</label>
            </div>
            <div class="size-option">
              <input type="checkbox" class="size-checkbox" name="sizes" value="m" id="edit-size-m" checked>
              <label for="edit-size-m">M</label>
            </div>
            <div class="size-option">
              <input type="checkbox" class="size-checkbox" name="sizes" value="l" id="edit-size-l" checked>
              <label for="edit-size-l">L</label>
            </div>
            <div class="size-option">
              <input type="checkbox" class="size-checkbox" name="sizes" value="xl" id="edit-size-xl" checked>
              <label for="edit-size-xl">XL</label>
            </div>
            <div class="size-option">
              <input type="checkbox" class="size-checkbox" name="sizes" value="xxl" id="edit-size-xxl">
              <label for="edit-size-xxl">XXL</label>
            </div>
          </div>
        </div>
        <div class="form-group full-width">
          <label class="form-label">Current Images</label>
          <div class="image-preview-container">
            <img src="images/products/shirt1.jpg" alt="Product Image" class="image-preview">
            <img src="images/products/shirt1-2.jpg" alt="Product Image" class="image-preview">
            <img src="images/products/shirt1-3.jpg" alt="Product Image" class="image-preview">
          </div>
          <label class="form-label" style="margin-top: 15px;">Add New Images</label>
          <input type="file" name="productImages" multiple accept="image/*" onchange="previewImages()">
          <div class="image-preview-container" id="newImagePreviews"></div>
        </div>
        <div class="form-group">
          <label class="form-label">Featured Product</label>
          <select class="form-select" name="featured">
            <option value="no">No</option>
            <option value="yes" selected>Yes</option>
          </select>
        </div>
        <div class="form-group">
          <label class="form-label">Status</label>
          <select class="form-select" name="status">
            <option value="active" selected>Active</option>
            <option value="draft">Draft</option>
            <option value="hidden">Hidden</option>
          </select>
        </div>
      </div>
      <div class="form-actions">
        <button type="button" class="cancel-btn" onclick="closeModal('editProductModal')">Cancel</button>
        <button type="submit" class="save-btn">Update Product</button>
      </div>
    </form>
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

</body>
</html>