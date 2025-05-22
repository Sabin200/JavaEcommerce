<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Categories - FashionGhar</title>
<meta name="description" content="FashionGhar Admin - Manage your product categories">
<meta name="keywords" content="HTML, CSS, JavaScript, Admin, Categories">
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

/* Category Management Styles */
.category-container {
  max-width: 1200px;
  margin: 40px auto;
  padding: 0 20px;
}

.category-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
}

.category-title {
  font-size: 32px;
  color: var(--black);
  position: relative;
  padding-bottom: 10px;
}

.category-title:after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  width: 60px;
  height: 3px;
  background-color: var(--black);
}

.add-category-btn {
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

.add-category-btn:hover {
  background-color: var(--dark-gray);
}

.category-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 20px;
  margin-bottom: 40px;
}

.category-card {
  background-color: var(--white);
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  position: relative;
}

.category-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
}

.category-card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;
}

.category-name {
  font-size: 18px;
  font-weight: 600;
}

.category-icon {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: var(--accent);
  color: var(--white);
}

.category-details {
  margin-bottom: 15px;
}

.category-description {
  font-size: 14px;
  color: var(--dark-gray);
  margin-bottom: 10px;
}

.category-meta {
  display: flex;
  justify-content: space-between;
  font-size: 14px;
  color: var(--dark-gray);
}

.category-actions {
  display: flex;
  gap: 10px;
  margin-top: 15px;
}

.category-btn {
  padding: 8px 12px;
  border: none;
  border-radius: 4px;
  font-size: 12px;
  cursor: pointer;
  transition: all 0.3s ease;
  flex: 1;
  text-align: center;
}

.edit-btn {
  background-color: var(--info);
  color: var(--white);
}

.delete-btn {
  background-color: var(--danger);
  color: var(--white);
}

.view-btn {
  background-color: var(--accent);
  color: var(--white);
}

.category-btn:hover {
  opacity: 0.8;
}

.category-status {
  position: absolute;
  top: 20px;
  right: 20px;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 12px;
  font-weight: 500;
}

.active-status {
  background-color: rgba(46, 125, 50, 0.1);
  color: var(--success);
}

.inactive-status {
  background-color: rgba(198, 40, 40, 0.1);
  color: var(--danger);
}

.category-tree-container {
  background-color: var(--white);
  border-radius: 8px;
  padding: 25px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  margin-bottom: 40px;
}

.tree-title {
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 20px;
}

.category-tree {
  margin-left: 20px;
}

.tree-item {
  margin-bottom: 10px;
}

.tree-parent {
  font-weight: 600;
  font-size: 16px;
  margin-bottom: 5px;
  display: flex;
  align-items: center;
}

.tree-parent i {
  margin-right: 10px;
  cursor: pointer;
  transition: transform 0.3s ease;
}

.tree-parent i.rotated {
  transform: rotate(90deg);
}

.tree-children {
  margin-left: 30px;
  display: none;
}

.tree-children.show {
  display: block;
}

.tree-child {
  padding: 5px 0;
  font-size: 14px;
  display: flex;
  align-items: center;
}

.tree-child:before {
  content: "—";
  margin-right: 10px;
  color: var(--mid-gray);
}

.tree-actions {
  margin-left: auto;
  display: flex;
  gap: 10px;
}

.tree-action {
  cursor: pointer;
  color: var(--dark-gray);
  transition: all 0.3s ease;
}

.tree-action:hover {
  color: var(--black);
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
  max-width: 600px;
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

.image-preview-container {
  width: 100px;
  height: 100px;
  border: 1px dashed var(--mid-gray);
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 10px;
  overflow: hidden;
}

.image-preview {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.upload-placeholder {
  color: var(--mid-gray);
  font-size: 12px;
  text-align: center;
}

.upload-placeholder i {
  font-size: 24px;
  margin-bottom: 5px;
  color: var(--mid-gray);
}

/* Empty state styles */
.empty-state {
  text-align: center;
  padding: 40px 20px;
  background-color: var(--white);
  border-radius: 8px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  margin-bottom: 40px;
}

.empty-state-icon {
  font-size: 48px;
  color: var(--mid-gray);
  margin-bottom: 20px;
}

.empty-state-title {
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 10px;
}

.empty-state-description {
  font-size: 14px;
  color: var(--dark-gray);
  margin-bottom: 20px;
  max-width: 500px;
  margin-left: auto;
  margin-right: auto;
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
  
  .category-grid {
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
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
  
  .category-grid {
    grid-template-columns: 1fr;
  }
  
  .category-header {
    flex-direction: column;
    align-items: flex-start;
    gap: 15px;
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

// Toggle category tree items
function toggleTreeItem(element) {
  element.classList.toggle('rotated');
  var parent = element.parentElement;
  var children = parent.nextElementSibling;
  children.classList.toggle('show');
}

// Preview uploaded image
function previewImage(input, previewId) {
  var preview = document.getElementById(previewId);
  var placeholder = preview.querySelector('.upload-placeholder');
  var img = preview.querySelector('img') || document.createElement('img');
  img.className = 'image-preview';
  
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    
    reader.onload = function(e) {
      img.src = e.target.result;
      if (placeholder) {
        placeholder.style.display = 'none';
      }
      if (!img.parentElement) {
        preview.appendChild(img);
      }
    }
    
    reader.readAsDataURL(input.files[0]);
  }
}

// Confirm delete
function confirmDelete(categoryId, categoryName) {
  return confirm("Are you sure you want to delete the category: " + categoryName + "?\n\nThis will also delete all subcategories and may affect products in these categories.");
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
        <li><a href="manageProducts.jsp">PRODUCTS</a></li>
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

<!-- Category Management Content -->
<div class="category-container">
  <div class="category-header">
    <div>
      <h1 class="category-title">Manage Categories</h1>
      <p class="admin-welcome">Create and organize product categories for your clothing store.</p>
    </div>
    <button class="add-category-btn" onclick="openModal('addCategoryModal')">
      <i class="fas fa-plus"></i> Add New Category
    </button>
  </div>

  <!-- Category Tree View -->
  <div class="category-tree-container">
    <h3 class="tree-title">Category Hierarchy</h3>
    <div class="category-tree">
      <!-- Men's Category -->
      <div class="tree-item">
        <div class="tree-parent">
          <i class="fas fa-chevron-right" onclick="toggleTreeItem(this)"></i>
          Men's
          <div class="tree-actions">
            <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
            <span class="tree-action" onclick="confirmDelete('men', 'Men\'s')"><i class="fas fa-trash"></i></span>
          </div>
        </div>
        <div class="tree-children">
          <div class="tree-child">
            Shirts
            <div class="tree-actions">
              <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
              <span class="tree-action" onclick="confirmDelete('men-shirts', 'Men\'s Shirts')"><i class="fas fa-trash"></i></span>
            </div>
          </div>
          <div class="tree-child">
            T-Shirts
            <div class="tree-actions">
              <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
              <span class="tree-action" onclick="confirmDelete('men-tshirts', 'Men\'s T-Shirts')"><i class="fas fa-trash"></i></span>
            </div>
          </div>
          <div class="tree-child">
            Pants
            <div class="tree-actions">
              <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
              <span class="tree-action" onclick="confirmDelete('men-pants', 'Men\'s Pants')"><i class="fas fa-trash"></i></span>
            </div>
          </div>
          <div class="tree-child">
            Jeans
            <div class="tree-actions">
              <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
              <span class="tree-action" onclick="confirmDelete('men-jeans', 'Men\'s Jeans')"><i class="fas fa-trash"></i></span>
            </div>
          </div>
          <div class="tree-child">
            Outerwear
            <div class="tree-actions">
              <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
              <span class="tree-action" onclick="confirmDelete('men-outerwear', 'Men\'s Outerwear')"><i class="fas fa-trash"></i></span>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Women's Category -->
      <div class="tree-item">
        <div class="tree-parent">
          <i class="fas fa-chevron-right" onclick="toggleTreeItem(this)"></i>
          Women's
          <div class="tree-actions">
            <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
            <span class="tree-action" onclick="confirmDelete('women', 'Women\'s')"><i class="fas fa-trash"></i></span>
          </div>
        </div>
        <div class="tree-children">
          <div class="tree-child">
            Dresses
            <div class="tree-actions">
              <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
              <span class="tree-action" onclick="confirmDelete('women-dresses', 'Women\'s Dresses')"><i class="fas fa-trash"></i></span>
            </div>
          </div>
          <div class="tree-child">
            Tops
            <div class="tree-actions">
              <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
              <span class="tree-action" onclick="confirmDelete('women-tops', 'Women\'s Tops')"><i class="fas fa-trash"></i></span>
            </div>
          </div>
          <div class="tree-child">
            Skirts
            <div class="tree-actions">
              <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
              <span class="tree-action" onclick="confirmDelete('women-skirts', 'Women\'s Skirts')"><i class="fas fa-trash"></i></span>
            </div>
          </div>
          <div class="tree-child">
            Pants
            <div class="tree-actions">
              <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
              <span class="tree-action" onclick="confirmDelete('women-pants', 'Women\'s Pants')"><i class="fas fa-trash"></i></span>
            </div>
          </div>
          <div class="tree-child">
            Outerwear
            <div class="tree-actions">
              <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
              <span class="tree-action" onclick="confirmDelete('women-outerwear', 'Women\'s Outerwear')"><i class="fas fa-trash"></i></span>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Unisex Category -->
      <div class="tree-item">
        <div class="tree-parent">
          <i class="fas fa-chevron-right" onclick="toggleTreeItem(this)"></i>
          Unisex
          <div class="tree-actions">
            <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
            <span class="tree-action" onclick="confirmDelete('unisex', 'Unisex')"><i class="fas fa-trash"></i></span>
          </div>
        </div>
        <div class="tree-children">
          <div class="tree-child">
            T-Shirts
            <div class="tree-actions">
              <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
              <span class="tree-action" onclick="confirmDelete('unisex-tshirts', 'Unisex T-Shirts')"><i class="fas fa-trash"></i></span>
            </div>
          </div>
          <div class="tree-child">
            Hoodies
            <div class="tree-actions">
              <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
              <span class="tree-action" onclick="confirmDelete('unisex-hoodies', 'Unisex Hoodies')"><i class="fas fa-trash"></i></span>
            </div>
          </div>
          <div class="tree-child">
            Jackets
            <div class="tree-actions">
              <span class="tree-action" onclick="openModal('editCategoryModal')"><i class="fas fa-edit"></i></span>
              <span class="tree-action" onclick="confirmDelete('unisex-jackets', 'Unisex Jackets')"><i class="fas fa-trash"></i></span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Category Cards -->
  <h3 class="section-title" style="margin-bottom: 20px;">Main Categories</h3>
  <div class="category-grid">
    <!-- Men's Category Card -->
    <div class="category-card">
      <div class="category-card-header">
        <h3 class="category-name">Men's</h3>
        <div class="category-icon">
          <i class="fas fa-male"></i>
        </div>
      </div>
      <div class="category-details">
        <p class="category-description">Men's clothing collection including shirts, pants, suits, and more.</p>
        <div class="category-meta">
          <span>5 Subcategories</span>
          <span>85 Products</span>
        </div>
      </div>
      <div class="category-actions">
        <button class="category-btn view-btn" onclick="window.location.href='viewCategory.jsp?id=men'">View</button>
        <button class="category-btn edit-btn" onclick="openModal('editCategoryModal')">Edit</button>
        <button class="category-btn delete-btn" onclick="confirmDelete('men', 'Men\'s')">Delete</button>
      </div>
      <span class="category-status active-status">Active</span>
    </div>
    
    <!-- Women's Category Card -->
    <div class="category-card">
      <div class="category-card-header">
        <h3 class="category-name">Women's</h3>
        <div class="category-icon">
          <i class="fas fa-female"></i>
        </div>
      </div>
      <div class="category-details">
        <p class="category-description">Women's fashion including dresses, tops, skirts, and outerwear.</p>
        <div class="category-meta">
          <span>5 Subcategories</span>
          <span>112 Products</span>
        </div>
      </div>
      <div class="category-actions">
        <button class="category-btn view-btn" onclick="window.location.href='viewCategory.jsp?id=women'">View</button>
        <button class="category-btn edit-btn" onclick="openModal('editCategoryModal')">Edit</button>
        <button class="category-btn delete-btn" onclick="confirmDelete('women', 'Women\'s')">Delete</button>
      </div>
      <span class="category-status active-status">Active</span>
    </div>
    
    <!-- Unisex Category Card -->
    <div class="category-card">
      <div class="category-card-header">
        <h3 class="category-name">Unisex</h3>
        <div class="category-icon">
          <i class="fas fa-user-friends"></i>
        </div>
      </div>
      <div class="category-details">
        <p class="category-description">Unisex clothing suitable for all genders including t-shirts, hoodies, and jackets.</p>
        <div class="category-meta">
          <span>3 Subcategories</span>
          <span>45 Products</span>
        </div>
      </div>
      <div class="category-actions">
        <button class="category-btn view-btn" onclick="window.location.href='viewCategory.jsp?id=unisex'">View</button>
        <button class="category-btn edit-btn" onclick="openModal('editCategoryModal')">Edit</button>
        <button class="category-btn delete-btn" onclick="confirmDelete('unisex', 'Unisex')">Delete</button>
      </div>
      <span class="category-status active-status">Active</span>
    </div>
  </div>
  
  <!-- Empty State for New Categories -->
  <div class="empty-state">
    <div class="empty-state-icon">
      <i class="fas fa-folder-plus"></i>
    </div>
    <h3 class="empty-state-title">Need More Categories?</h3>
    <p class="empty-state-description">
      You can add more main categories like Kids, Accessories, Seasonal Collections, or any other category that fits your inventory needs.
    </p>
    <button class="add-category-btn" onclick="openModal('addCategoryModal')">
      <i class="fas fa-plus"></i> Add New Category
    </button>
  </div>
</div>

<!-- Add Category Modal -->
<div id="addCategoryModal" class="modal">
  <div class="modal-content">
    <span class="close-modal" onclick="closeModal('addCategoryModal')">&times;</span>
    <h2 class="modal-title">Add New Category</h2>
    <form action="addCategory" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label class="form-label">Category Name*</label>
        <input type="text" class="form-input" name="categoryName" required>
      </div>
      <div class="form-group">
        <label class="form-label">Parent Category</label>
        <select class="form-select" name="parentCategory">
          <option value="">None (Top Level)</option>
          <option value="men">Men's</option>
          <option value="women">Women's</option>
          <option value="unisex">Unisex</option>
        </select>
      </div>
      <div class="form-group">
        <label class="form-label">Description</label>
        <textarea class="form-textarea" name="description"></textarea>
      </div>
      <div class="form-group">
        <label class="form-label">Category Image</label>
        <input type="file" name="categoryImage" accept="image/*" onchange="previewImage(this, 'imagePreview')">
        <div class="image-preview-container" id="imagePreview">
          <div class="upload-placeholder">
            <i class="fas fa-cloud-upload-alt"></i>
            <div>Upload Image</div>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label class="form-label">Display Order</label>
        <input type="number" class="form-input" name="displayOrder" min="1" value="1">
      </div>
      <div class="form-group">
        <label class="form-label">Status</label>
        <select class="form-select" name="status">
          <option value="active">Active</option>
          <option value="inactive">Inactive</option>
        </select>
      </div>
      <div class="form-group">
        <label class="form-label">Meta Title (SEO)</label>
        <input type="text" class="form-input" name="metaTitle">
      </div>
      <div class="form-group">
        <label class="form-label">Meta Description (SEO)</label>
        <textarea class="form-textarea" name="metaDescription"></textarea>
      </div>
      <div class="form-actions">
        <button type="button" class="cancel-btn" onclick="closeModal('addCategoryModal')">Cancel</button>
        <button type="submit" class="save-btn">Add Category</button>
      </div>
    </form>
  </div>
</div>

<!-- Edit Category Modal -->
<div id="editCategoryModal" class="modal">
  <div class="modal-content">
    <span class="close-modal" onclick="closeModal('editCategoryModal')">&times;</span>
    <h2 class="modal-title">Edit Category</h2>
    <form action="updateCategory" method="post" enctype="multipart/form-data">
      <input type="hidden" name="categoryId" value="men">
      <div class="form-group">
        <label class="form-label">Category Name*</label>
        <input type="text" class="form-input" name="categoryName" value="Men's" required>
      </div>
      <div class="form-group">
        <label class="form-label">Parent Category</label>
        <select class="form-select" name="parentCategory">
          <option value="" selected>None (Top Level)</option>
          <option value="women">Women's</option>
          <option value="unisex">Unisex</option>
        </select>
      </div>
      <div class="form-group">
        <label class="form-label">Description</label>
        <textarea class="form-textarea" name="description">Men's clothing collection including shirts, pants, suits, and more.</textarea>
      </div>
      <div class="form-group">
        <label class="form-label">Current Image</label>
        <div class="image-preview-container">
          <img src="images/categories/men.jpg" alt="Category Image" class="image-preview">
        </div>
        <label class="form-label" style="margin-top: 15px;">Upload New Image</label>
        <input type="file" name="categoryImage" accept="image/*" onchange="previewImage(this, 'editImagePreview')">
        <div class="image-preview-container" id="editImagePreview">
          <div class="upload-placeholder">
            <i class="fas fa-cloud-upload-alt"></i>
            <div>Upload Image</div>
          </div>
        </div>
      </div>
      <div class="form-group">
        <label class="form-label">Display Order</label>
        <input type="number" class="form-input" name="displayOrder" min="1" value="1">
      </div>
      <div class="form-group">
        <label class="form-label">Status</label>
        <select class="form-select" name="status">
          <option value="active" selected>Active</option>
          <option value="inactive">Inactive</option>
        </select>
      </div>
      <div class="form-group">
        <label class="form-label">Meta Title (SEO)</label>
        <input type="text" class="form-input" name="metaTitle" value="Men's Clothing - FashionGhar">
      </div>
      <div class="form-group">
        <label class="form-label">Meta Description (SEO)</label>
        <textarea class="form-textarea" name="metaDescription">Shop the latest men's fashion at FashionGhar. Find shirts, pants, suits, and more with premium quality and stylish designs.</textarea>
      </div>
      <div class="form-actions">
        <button type="button" class="cancel-btn" onclick="closeModal('editCategoryModal')">Cancel</button>
        <button type="submit" class="save-btn">Update Category</button>
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