

DELETE THIS



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Zefex Admin - Management Portal</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Vendor CSS Files -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- for fonts and icons -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,300&family=Raleway:wght@300;400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">

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
  --accent: #444444;
  --danger: #d32f2f;
  --success: #388e3c;
  --warning: #f57c00;
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
.admin-header {
  background-color: var(--black);
  padding: 15px 30px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.admin-header h1 {
  color: var(--white);
  font-size: 24px;
  font-weight: 600;
  letter-spacing: 1px;
}

.admin-user {
  display: flex;
  align-items: center;
}

.admin-user a {
  color: var(--white);
  text-decoration: none;
  margin-left: 20px;
  font-size: 14px;
  transition: all 0.3s ease;
}

.admin-user a:hover {
  color: var(--mid-gray);
}

.admin-user .fa-user-circle {
  font-size: 24px;
  margin-right: 10px;
}

/* Sidebar styles */
.admin-container {
  display: flex;
  flex: 1;
}

.sidebar {
  width: 250px;
  background-color: var(--black);
  color: var(--white);
  padding: 20px 0;
  position: sticky;
  top: 0;
  height: calc(100vh - 60px);
}

.sidebar-logo {
  text-align: center;
  padding: 20px 0;
  border-bottom: 1px solid var(--dark-gray);
}

.sidebar-menu {
  padding: 20px 0;
}

.sidebar-menu h3 {
  color: var(--mid-gray);
  font-size: 14px;
  padding: 10px 20px;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.sidebar-menu ul {
  list-style: none;
}

.sidebar-menu ul li {
  margin: 5px 0;
}

.sidebar-menu ul li a {
  color: var(--white);
  text-decoration: none;
  padding: 10px 20px;
  display: block;
  transition: all 0.3s ease;
  border-left: 3px solid transparent;
}

.sidebar-menu ul li a:hover,
.sidebar-menu ul li a.active {
  background-color: var(--dark-gray);
  border-left: 3px solid var(--white);
}

.sidebar-menu ul li a i {
  color: var(--white);
  margin-right: 10px;
  width: 20px;
  text-align: center;
}

/* Main content area */
.main-content {
  flex: 1;
  padding: 30px;
}

.page-title {
  margin-bottom: 30px;
  position: relative;
  padding-bottom: 10px;
}

.page-title:after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  width: 60px;
  height: 3px;
  background-color: var(--black);
}

/* Dashboard cards */
.dashboard-stats {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 20px;
  margin-bottom: 30px;
}

.stat-card {
  background-color: var(--white);
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
  display: flex;
  align-items: center;
}

.stat-icon {
  width: 60px;
  height: 60px;
  background-color: var(--accent);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-right: 15px;
}

.stat-icon i {
  font-size: 24px;
  color: var(--white);
}

.stat-details h3 {
  margin: 0;
  font-size: 24px;
  font-weight: 600;
}

.stat-details p {
  margin: 5px 0 0 0;
  color: var(--mid-gray);
  font-size: 14px;
}

/* Products table */
.data-section {
  background-color: var(--white);
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
  margin-bottom: 30px;
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.section-header h2 {
  margin: 0;
  font-size: 20px;
}

.data-table {
  width: 100%;
  border-collapse: collapse;
}

.data-table th,
.data-table td {
  padding: 12px 15px;
  text-align: left;
  border-bottom: 1px solid var(--light-gray);
}

.data-table th {
  background-color: var(--light-gray);
  color: var(--dark-gray);
  font-weight: 600;
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.data-table tr:hover {
  background-color: var(--light-gray);
}

.data-table .product-img {
  width: 50px;
  height: 50px;
  border-radius: 4px;
  object-fit: cover;
}

.action-btns a {
  display: inline-block;
  margin-right: 10px;
  text-decoration: none;
}

.action-btns i {
  font-size: 16px;
}

.action-btns .edit {
  color: var(--info);
}

.action-btns .delete {
  color: var(--danger);
}

.action-btns .view {
  color: var(--success);
}

/* Form styles */
.admin-form {
  background-color: var(--white);
  border-radius: 8px;
  padding: 30px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

.form-section {
  margin-bottom: 20px;
}

.form-section h3 {
  font-size: 18px;
  margin-bottom: 15px;
  padding-bottom: 10px;
  border-bottom: 1px solid var(--light-gray);
}

.form-row {
  display: flex;
  flex-wrap: wrap;
  margin: -10px;
}

.form-group {
  padding: 10px;
  flex: 1 0 300px;
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
  font-size: 14px;
  transition: all 0.3s ease;
}

.form-control:focus {
  border-color: var(--dark-gray);
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  outline: none;
}

.form-actions {
  margin-top: 30px;
  display: flex;
  justify-content: flex-end;
}

.btn {
  display: inline-block;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
  text-decoration: none;
}

.btn-primary {
  background-color: var(--black);
  color: var(--white);
}

.btn-primary:hover {
  background-color: var(--dark-gray);
}

.btn-danger {
  background-color: var(--danger);
  color: var(--white);
}

.btn-danger:hover {
  background-color: #b71c1c;
}

.btn-secondary {
  background-color: var(--mid-gray);
  color: var(--white);
}

.btn-secondary:hover {
  background-color: var(--dark-gray);
}

.btn-success {
  background-color: var(--success);
  color: var(--white);
}

.btn-success:hover {
  background-color: #2e7d32;
}

.form-actions .btn {
  margin-left: 10px;
}

/* Product Image Upload Section */
.image-upload {
  margin-top: 10px;
}

.image-preview {
  width: 200px;
  height: 200px;
  border: 2px dashed var(--mid-gray);
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 10px;
  position: relative;
  overflow: hidden;
}

.image-preview img {
  max-width: 100%;
  max-height: 100%;
  object-fit: contain;
}

.image-preview .placeholder {
  color: var(--mid-gray);
  font-size: 14px;
  text-align: center;
}

.image-preview .placeholder i {
  font-size: 32px;
  margin-bottom: 10px;
  color: var(--mid-gray);
}

/* Pagination */
.pagination {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.pagination a {
  padding: 8px 12px;
  margin: 0 5px;
  background-color: var(--white);
  border: 1px solid var(--mid-gray);
  color: var(--black);
  text-decoration: none;
  border-radius: 4px;
  transition: all 0.3s ease;
}

.pagination a:hover,
.pagination a.active {
  background-color: var(--black);
  color: var(--white);
  border-color: var(--black);
}

/* Modal styles */
.modal-backdrop {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  display: none;
}

.modal-content {
  background-color: var(--white);
  border-radius: 8px;
  width: 90%;
  max-width: 600px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

.modal-header {
  padding: 15px 20px;
  border-bottom: 1px solid var(--light-gray);
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.modal-header h2 {
  margin: 0;
  font-size: 20px;
}

.modal-close {
  background: none;
  border: none;
  font-size: 20px;
  cursor: pointer;
  color: var(--mid-gray);
}

.modal-body {
  padding: 20px;
}

.modal-footer {
  padding: 15px 20px;
  border-top: 1px solid var(--light-gray);
  text-align: right;
}

.show-modal {
  display: flex;
}

/* Alerts */
.alert {
  padding: 15px;
  border-radius: 4px;
  margin-bottom: 20px;
  border-left: 4px solid transparent;
}

.alert-success {
  background-color: #e8f5e9;
  border-left-color: var(--success);
  color: #2e7d32;
}

.alert-danger {
  background-color: #ffebee;
  border-left-color: var(--danger);
  color: #b71c1c;
}

.alert-warning {
  background-color: #fff8e1;
  border-left-color: var(--warning);
  color: #e65100;
}

.alert-info {
  background-color: #e3f2fd;
  border-left-color: var(--info);
  color: #0277bd;
}

/* Responsive styles */
@media (max-width: 992px) {
  .admin-container {
    flex-direction: column;
  }
  
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  
  .sidebar-menu ul {
    display: flex;
    flex-wrap: wrap;
  }
  
  .sidebar-menu ul li {
    flex: 1 0 auto;
  }
  
  .stat-card {
    flex-direction: column;
    text-align: center;
  }
  
  .stat-icon {
    margin-right: 0;
    margin-bottom: 15px;
  }
}

@media (max-width: 768px) {
  .admin-header {
    flex-direction: column;
    text-align: center;
  }
  
  .admin-user {
    margin-top: 10px;
  }
  
  .form-row {
    flex-direction: column;
  }
  
  .data-table {
    display: block;
    overflow-x: auto;
  }
  
  .sidebar-menu ul li a {
    padding: 10px;
    text-align: center;
  }
  
  .sidebar-menu ul li a i {
    margin-right: 0;
    display: block;
    width: 100%;
    text-align: center;
    margin-bottom: 5px;
  }
}

@media (max-width: 480px) {
  .main-content {
    padding: 15px;
  }
  
  .dashboard-stats {
    grid-template-columns: 1fr;
  }
  
  .section-header {
    flex-direction: column;
    align-items: flex-start;
  }
  
  .section-header .btn {
    margin-top: 10px;
    width: 100%;
    text-align: center;
  }
  
  .form-actions {
    flex-direction: column;
  }
  
  .form-actions .btn {
    margin: 5px 0;
    width: 100%;
  }
}
</style>

<script>
// Function to toggle sidebar on mobile
function toggleSidebar() {
  const sidebar = document.querySelector('.sidebar');
  sidebar.classList.toggle('mobile-show');
}

// Function to show modals
function showModal(modalId) {
  const modal = document.getElementById(modalId);
  if (modal) {
    modal.classList.add('show-modal');
  }
}

// Function to hide modals
function hideModal(modalId) {
  const modal = document.getElementById(modalId);
  if (modal) {
    modal.classList.remove('show-modal');
  }
}

// Function to toggle between products list and product form
function showProductForm() {
  document.getElementById('productsListSection').style.display = 'none';
  document.getElementById('productFormSection').style.display = 'block';
}

function showProductsList() {
  document.getElementById('productsListSection').style.display = 'block';
  document.getElementById('productFormSection').style.display = 'none';
}

// Function to preview image before upload
function previewImage(input) {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = function(e) {
      const preview = document.querySelector('.image-preview');
      preview.innerHTML = `<img src="${e.target.result}" alt="Product Image Preview">`;
    }
    reader.readAsDataURL(input.files[0]);
  }
}

// Confirm delete
function confirmDelete(productId) {
  if (confirm('Are you sure you want to delete this product?')) {
    // Here you would add the code to delete the product
    alert('Product deleted successfully!');
  }
}
</script>
</head>
<body>
  <!-- Admin Header -->
  <header class="admin-header">
    <h1>ZEFEX Admin Dashboard</h1>
    <div class="admin-user">
      <i class="fas fa-user-circle"></i>
      <span style="color: var(--white);">Admin User</span>
      <a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
  </header>

  <!-- Admin Container with Sidebar and Main Content -->
  <div class="admin-container">
    <!-- Sidebar -->
    <aside class="sidebar">
      <div class="sidebar-logo">
        <svg width="150" height="60" viewBox="0 0 180 80">
          <defs>
            <linearGradient id="logoGradient" x1="0%" y1="0%" x2="100%" y2="100%">
              <stop offset="0%" stop-color="#ffffff" />
              <stop offset="100%" stop-color="#cccccc" />
            </linearGradient>
          </defs>
          <!-- Background shape -->
          <rect x="35" y="15" width="110" height="45" rx="3" fill="none" stroke="#ffffff" stroke-width="2" />
          
          <!-- Main text -->
          <text x="90" y="45" font-family="Raleway, sans-serif" font-size="28" font-weight="600" text-anchor="middle" fill="url(#logoGradient)">ZEFEX</text>
          
          <!-- Admin text -->
          <text x="90" y="62" font-family="Montserrat, sans-serif" font-size="10" font-weight="300" text-anchor="middle" fill="#ffffff">ADMIN PORTAL</text>
        </svg>
      </div>
      
      <div class="sidebar-menu">
        <h3>Management</h3>
        <ul>
          <li><a href="#" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
          <li><a href="#"><i class="fas fa-tshirt"></i> Products</a></li>
          <li><a href="#"><i class="fas fa-tags"></i> Categories</a></li>
          <li><a href="#"><i class="fas fa-shopping-cart"></i> Orders</a></li>
          <li><a href="#"><i class="fas fa-users"></i> Customers</a></li>
        </ul>
        
        <h3>Settings</h3>
        <ul>
          <li><a href="#"><i class="fas fa-cog"></i> General Settings</a></li>
          <li><a href="#"><i class="fas fa-user-circle"></i> Profile</a></li>
          <li><a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
      </div>
    </aside>

    <!-- Main Content Area -->
    <main class="main-content">
      <h1 class="page-title">Dashboard</h1>
      
      <!-- Dashboard Stats -->
      <div class="dashboard-stats">
        <div class="stat-card">
          <div class="stat-icon" style="background-color: var(--info);">
            <i class="fas fa-tshirt"></i>
          </div>
          <div class="stat-details">
            <h3>154</h3>
            <p>Total Products</p>
          </div>
        </div>
        
        <div class="stat-card">
          <div class="stat-icon" style="background-color: var(--success);">
            <i class="fas fa-shopping-cart"></i>
          </div>
          <div class="stat-details">
            <h3>87</h3>
            <p>New Orders</p>
          </div>
        </div>
        
        <div class="stat-card">
          <div class="stat-icon" style="background-color: var(--warning);">
            <i class="fas fa-users"></i>
          </div>
          <div class="stat-details">
            <h3>623</h3>
            <p>Total Customers</p>
          </div>
        </div>
        
        <div class="stat-card">
          <div class="stat-icon" style="background-color: var(--danger);">
            <i class="fas fa-dollar-sign"></i>
          </div>
          <div class="stat-details">
            <h3>$12,458</h3>
            <p>Monthly Revenue</p>
          </div>
        </div>
      </div>
      
      <!-- Products Section -->
      <div id="productsListSection" class="data-section">
        <div class="section-header">
          <h2>Product Management</h2>
          <button class="btn btn-primary" onclick="showProductForm()">
            <i class="fas fa-plus"></i> Add New Product
          </button>
        </div>
        
        <!-- Alert message example -->
        <div class="alert alert-success">
          <i class="fas fa-check-circle"></i> Product successfully updated!
        </div>
        
        <!-- Products Table -->
        <table class="data-table">
          <thead>
            <tr>
              <th>Image</th>
              <th>Product Name</th>
              <th>Category</th>
              <th>Price</th>
              <th>Stock</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><img src="Images/p1.webp" alt="Product" class="product-img"></td>
              <td>Chiffon Dress</td>
              <td>Women</td>
              <td>$120</td>
              <td>25</td>
              <td>In Stock</td>
              <td class="action-btns">
                <a href="#" class="view"><i class="fas fa-eye"></i></a>
                <a href="#" class="edit" onclick="showProductForm()"><i class="fas fa-edit"></i></a>
                <a href="#" class="delete" onclick="confirmDelete(1)"><i class="fas fa-trash"></i></a>
              </td>
            </tr>
            <tr>
              <td><img src="Images/p2.webp" alt="Product" class="product-img"></td>
              <td>Button Up Shirt</td>
              <td>Men</td>
              <td>$240</td>
              <td>18</td>
              <td>In Stock</td>
              <td class="action-btns">
                <a href="#" class="view"><i class="fas fa-eye"></i></a>
                <a href="#" class="edit" onclick="showProductForm()"><i class="fas fa-edit"></i></a>
                <a href="#" class="delete" onclick="confirmDelete(2)"><i class="fas fa-trash"></i></a>
              </td>
            </tr>
            <tr>
              <td><img src="Images/f3.webp" alt="Product" class="product-img"></td>
              <td>Knot Side Blouse</td>
              <td>Women</td>
              <td>$420</td>
              <td>12</td>
              <td>Low Stock</td>
              <td class="action-btns">
                <a href="#" class="view"><i class="fas fa-eye"></i></a>
                <a href="#" class="edit" onclick="showProductForm()"><i class="fas fa-edit"></i></a>
                <a href="#" class="delete" onclick="confirmDelete(3)"><i class="fas fa-trash"></i></a>
              </td>
            </tr>
            <tr>
              <td><img src="Images/p4.webp" alt="Product" class="product-img"></td>
              <td>Straight Leg Pants</td>
              <td>Men</td>
              <td>$360</td>
              <td>0</td>
              <td>Out of Stock</td>
              <td class="action-btns">
                <a href="#" class="view"><i class="fas fa-eye"></i></a>
                <a href="#" class="edit" onclick="showProductForm()"><i class="fas fa-edit"></i></a>
                <a href="#" class="delete" onclick="confirmDelete(4)"><i class="fas fa-trash"></i></a>
              </td>
            </tr>
            <tr>
              <td><img src="Images/p5.webp" alt="Product" class="product-img"></td>
              <td>Teddy Hoodie</td>
              <td>Men</td>
              <td>$450</td>
              <td>32</td>
              <td>In Stock</td>
              <td class="action-btns">
                <a href="#" class="view"><i class="fas fa-eye"></i></a>
                <a href="#" class="edit" onclick="showProductForm()"><i class="fas fa-edit"></i></a>
                <a href="#" class="delete" onclick="confirmDelete(5)"><i class="fas fa-trash"></i></a>
              </td>
            </tr>
          </tbody>
        </table>
        
        <!-- Pagination -->
        <div class="pagination">
          <a href="#">&laquo;</a>
          <a href="#" class="active">1</a>
          <a href="#">2</a>
          <a href="#">3</a>
          <a href="#">4</a>
          <a href="#">&raquo;</a>
        </div>
      </div>
      
      <!-- Product Form Section (hidden by default) -->
      <div id="productFormSection" class="admin-form" style="display: none;">
        <div class="section-header">
          <h2>Edit Product</h2>
          <button class="btn btn-secondary" onclick="showProductsList()">
            <i class="fas fa-arrow-left"></i> Back to Products
          </button>
        </div>
        
        <form action="productUpdate.jsp" method="post" enctype="multipart/form-data">
          <input type="hidden" name="productId" value="1">
          
          <div class="form-section">
            <h3>Basic Information</h3>
            <div class="form-row">
              <div class="form-group">
                <label for="productName">Product Name</label>
                <input type="text" id="productName" name="productName" class="form-control" value="Chiffon Dress" required>
              </div>
              
              <div class="form-group">
                <label for="productCategory">Category</label>
                <select id="productCategory" name="productCategory" class="form-control" required>
                  <option value="">Select Category</option>
                  <option value="men" selected>Men</option>
                  <option value="women" selected>Women</option>
                  <option value="unisex">Unisex</option>
                </select>
              </div>
            </div>
            
            <div class="form-row">
              <div class="form-group">
                <label for="productPrice">Price ($)</label>
                <input type="number" id="productPrice" name="productPrice" class="form-control" value="120" step="0.01" required>
              </div>
              
              <div class="form-group">
                <label for="productStock">Stock Quantity</label>
                <input type="number" id="productStock" name="productStock" class="form-control" value="25" required>
              </div>
            </div>
          </div>
          
          <div class="form-section">
            <h3>Product Details</h3>
            <div class="form-group">
              <label for="productDescription">Description</label>
              <textarea id="productDescription" name="productDescription" class="form-control" rows="4" required>Elegant chiffon dress with a flattering silhouette. Perfect for both casual and formal occasions.</textarea>
            </div>
            
            <div class="form-row">
              <div class="form-group">
                <label for="productSizes">Available Sizes</label>
                <div style="display: flex; flex-wrap: wrap; gap: 10px;">
                  <label style="display: flex; align-items: center;">
                    <input type="checkbox" name="sizes" value="XS"> XS
                  </label>
                  <label style="display: flex; align-items: center;">
                    <input type="checkbox" name="sizes" value="S" checked> S
                  </label>
                  <label style="display: flex; align-items: center;">
                    <input type="checkbox" name="sizes" value="M" checked> M
                  </label>
                  <label style="display: flex; align-items: center;">
                    <input type="checkbox" name="sizes" value="L" checked> L
                  </label>
                  <label style="display: flex; align-items: center;">
                    <input type="checkbox" name="sizes" value="XL"> XL
                  </label>
                </div>
              </div>
              
              <div class="form-group">
                <label for="productStatus">Status</label>
                <select id="productStatus" name="productStatus" class="form-control" required>
                  <option value="instock" selected>In Stock</option>
                  <option value="lowstock">Low Stock</option>
                  <option value="outofstock">Out of Stock</option>
                  <option value="discontinued">Discontinued</option>
                </select>
              </div>
            </div>
          </div>
          
          <div class="form-section">
            <h3>Product Image</h3>
            <div class="form-row">
              <div class="form-group">
                <label for="productImage">Upload Image</label>
                <input type="file" id="productImage" name="productImage" class="form-control" onchange="previewImage(this)">
                <div class="image-upload">
                  <div class="image-preview">
                    <img src="Images/p1.webp" alt="Product Image Preview">
                  </div>
                </div>
              </div>
              
              <div class="form-group">
                <label>Featured Product</label>
                <div style="margin-top: 10px;">
                  <label style="display: flex; align-items: center;">
                    <input type="checkbox" name="featuredProduct" checked>
                    Display on homepage
                  </label>
                </div>
                <div style="margin-top: 15px;">
                  <label for="productRating">Rating</label>
                  <select id="productRating" name="productRating" class="form-control">
                    <option value="5">5 Stars</option>
                    <option value="4" selected>4 Stars</option>
                    <option value="3">3 Stars</option>
                    <option value="2">2 Stars</option>
                    <option value="1">1 Star</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          
          <div class="form-actions">
            <button type="button" class="btn btn-secondary" onclick="showProductsList()">Cancel</button>
            <button type="button" class="btn btn-danger">Delete</button>
            <button type="submit" class="btn btn-primary">Save Changes</button>
          </div>
        </form>
      </div>
      
      <!-- Orders Section -->
      <div class="data-section">
        <div class="section-header">
          <h2>Recent Orders</h2>
          <a href="#" class="btn btn-secondary">View All Orders</a>
        </div>
        
        <table class="data-table">
          <thead>
            <tr>
              <th>Order ID</th>
              <th>Customer</th>
              <th>Date</th>
              <th>Amount</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>#ORD-2845</td>
              <td>John Doe</td>
              <td>Apr 18, 2025</td>
              <td>$540.00</td>
              <td><span style="padding: 5px 10px; background-color: #e8f5e9; color: #2e7d32; border-radius: 20px; font-size: 12px;">Completed</span></td>
              <td class="action-btns">
                <a href="#" class="view"><i class="fas fa-eye"></i></a>
              </td>
            </tr>
            <tr>
              <td>#ORD-2844</td>
              <td>Jane Smith</td>
              <td>Apr 17, 2025</td>
              <td>$290.00</td>
              <td><span style="padding: 5px 10px; background-color: #fff8e1; color: #e65100; border-radius: 20px; font-size: 12px;">Processing</span></td>
              <td class="action-btns">
                <a href="#" class="view"><i class="fas fa-eye"></i></a>
              </td>
            </tr>
            <tr>
              <td>#ORD-2843</td>
              <td>Robert Johnson</td>
              <td>Apr 17, 2025</td>
              <td>$360.00</td>
              <td><span style="padding: 5px 10px; background-color: #e3f2fd; color: #0277bd; border-radius: 20px; font-size: 12px;">Shipped</span></td>
              <td class="action-btns">
                <a href="#" class="view"><i class="fas fa-eye"></i></a>
              </td>
            </tr>
            <tr>
              <td>#ORD-2842</td>
              <td>Emily Williams</td>
              <td>Apr 16, 2025</td>
              <td>$120.00</td>
              <td><span style="padding: 5px 10px; background-color: #ffebee; color: #b71c1c; border-radius: 20px; font-size: 12px;">Cancelled</span></td>
              <td class="action-btns">
                <a href="#" class="view"><i class="fas fa-eye"></i></a>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      
      <!-- Quick Stats Section -->
      <div class="data-section">
        <div class="section-header">
          <h2>Category Distribution</h2>
        </div>
        
        <div style="display: flex; flex-wrap: wrap; gap: 20px; margin-top: 20px;">
          <div style="flex: 1; min-width: 250px;">
            <div style="background-color: var(--light-gray); border-radius: 8px; padding: 20px;">
              <h3 style="margin-bottom: 15px;">Products by Category</h3>
              
              <!-- Men Category -->
              <div style="margin-bottom: 15px;">
                <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
                  <span>Men</span>
                  <span>65 (42%)</span>
                </div>
                <div style="height: 8px; background-color: var(--mid-gray); border-radius: 4px; overflow: hidden;">
                  <div style="width: 42%; height: 100%; background-color: var(--black);"></div>
                </div>
              </div>
              
              <!-- Women Category -->
              <div style="margin-bottom: 15px;">
                <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
                  <span>Women</span>
                  <span>78 (51%)</span>
                </div>
                <div style="height: 8px; background-color: var(--mid-gray); border-radius: 4px; overflow: hidden;">
                  <div style="width: 51%; height: 100%; background-color: var(--black);"></div>
                </div>
              </div>
              
              <!-- Unisex Category -->
              <div>
                <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
                  <span>Unisex</span>
                  <span>11 (7%)</span>
                </div>
                <div style="height: 8px; background-color: var(--mid-gray); border-radius: 4px; overflow: hidden;">
                  <div style="width: 7%; height: 100%; background-color: var(--black);"></div>
                </div>
              </div>
            </div>
          </div>
          
          <div style="flex: 1; min-width: 250px;">
            <div style="background-color: var(--light-gray); border-radius: 8px; padding: 20px;">
              <h3 style="margin-bottom: 15px;">Stock Status</h3>
              
              <!-- In Stock -->
              <div style="margin-bottom: 15px;">
                <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
                  <span>In Stock</span>
                  <span>124 (80%)</span>
                </div>
                <div style="height: 8px; background-color: var(--mid-gray); border-radius: 4px; overflow: hidden;">
                  <div style="width: 80%; height: 100%; background-color: var(--success);"></div>
                </div>
              </div>
              
              <!-- Low Stock -->
              <div style="margin-bottom: 15px;">
                <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
                  <span>Low Stock</span>
                  <span>18 (12%)</span>
                </div>
                <div style="height: 8px; background-color: var(--mid-gray); border-radius: 4px; overflow: hidden;">
                  <div style="width: 12%; height: 100%; background-color: var(--warning);"></div>
                </div>
              </div>
              
              <!-- Out of Stock -->
              <div>
                <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
                  <span>Out of Stock</span>
                  <span>12 (8%)</span>
                </div>
                <div style="height: 8px; background-color: var(--mid-gray); border-radius: 4px; overflow: hidden;">
                  <div style="width: 8%; height: 100%; background-color: var(--danger);"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
  
  <!-- Delete Confirmation Modal -->
  <div id="deleteModal" class="modal-backdrop">
    <div class="modal-content">
      <div class="modal-header">
        <h2>Confirm Delete</h2>
        <button class="modal-close" onclick="hideModal('deleteModal')">&times;</button>
      </div>
      <div class="modal-body">
        <p>Are you sure you want to delete this product? This action cannot be undone.</p>
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" onclick="hideModal('deleteModal')">Cancel</button>
        <button class="btn btn-danger">Delete</button>
      </div>
    </div>
  </div>

</body>
</html>