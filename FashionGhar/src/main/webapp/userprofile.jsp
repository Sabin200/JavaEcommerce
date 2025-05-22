<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FashionGhar- My Profile</title>
<meta name="description" content="FashionGhar - User Profile. Manage your account details and orders.">
<meta name="keywords" content="fashion, profile, account, FashionGhar">
<meta name="author" content="FashionGhar">
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
  --success: #4caf50;
  --danger: #f44336;
  --warning: #ff9800;
  --info: #2196f3;
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

/* Search Box Styles */
.box {
  flex: 0 0 200px;
  position: relative;
  margin-left: auto;
}

.box .input {
  padding: 12px 15px;
  width: 100%;
  border: 1px solid var(--white);
  border-radius: 25px;
  background-color: var(--white);
  outline: none;
  transition: all 0.3s ease;
}

.box .input:focus {
  border-color: var(--mid-gray);
  box-shadow: 0 0 5px rgba(255, 255, 255, 0.3);
}

.box .fas {
  position: absolute;
  right: 15px;
  top: 50%;
  transform: translateY(-50%);
  color: var(--black);
  cursor: pointer;
  font-size: 16px;
}

/* Profile Container */
.profile-container {
  max-width: 1200px;
  margin: 40px auto;
  padding: 0 20px;
  display: flex;
  flex-wrap: wrap;
  gap: 30px;
}

/* Sidebar Navigation */
.profile-sidebar {
  flex: 0 0 250px;
  background-color: var(--white);
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
  padding: 20px 0;
  position: sticky;
  top: 20px;
  height: fit-content;
}

.profile-user {
  padding: 20px;
  text-align: center;
  border-bottom: 1px solid var(--light-gray);
}

.profile-avatar {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  background-color: var(--light-gray);
  margin: 0 auto 15px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 40px;
  color: var(--mid-gray);
  overflow: hidden;
}

.profile-avatar img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.profile-name {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 5px;
}

.profile-email {
  font-size: 14px;
  color: var(--mid-gray);
}

.profile-menu {
  padding: 10px 0;
}

.profile-menu h3 {
  padding: 10px 20px;
  font-size: 14px;
  color: var(--mid-gray);
  text-transform: uppercase;
  letter-spacing: 1px;
}

.profile-menu ul {
  list-style: none;
}

.profile-menu li {
  margin-bottom: 5px;
}

.profile-menu a {
  display: block;
  padding: 10px 20px;
  color: var(--black);
  text-decoration: none;
  font-size: 14px;
  transition: all 0.3s ease;
  border-left: 3px solid transparent;
}

.profile-menu a.active,
.profile-menu a:hover {
  background-color: var(--light-gray);
  border-left-color: var(--black);
}

.profile-menu i {
  margin-right: 10px;
  width: 20px;
  text-align: center;
}

/* Main Content Area */
.profile-content {
  flex: 1;
  min-width: 0;
}

.profile-card {
  background-color: var(--white);
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
  margin-bottom: 30px;
  overflow: hidden;
}

.profile-card-header {
  padding: 20px;
  border-bottom: 1px solid var(--light-gray);
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.profile-card-title {
  font-size: 18px;
  font-weight: 600;
  margin: 0;
}

.profile-card-body {
  padding: 20px;
}

/* Form Styles */
.form-row {
  display: flex;
  flex-wrap: wrap;
  margin: -10px;
}

.form-group {
  padding: 10px;
  flex: 1 0 250px;
}

.form-group.full-width {
  flex: 0 0 100%;
}

.form-label {
  display: block;
  margin-bottom: 8px;
  font-weight: 500;
}

.form-control {
  width: 100%;
  padding: 12px 15px;
  border: 1px solid var(--mid-gray);
  border-radius: 4px;
  font-size: 14px;
  transition: all 0.3s ease;
}

.form-control:focus {
  border-color: var(--black);
  box-shadow: 0 0 5px rgba(0,0,0,0.1);
  outline: none;
}

.form-control:disabled {
  background-color: var(--light-gray);
  cursor: not-allowed;
}

.form-actions {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}

.btn {
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
  font-size: 14px;
  text-decoration: none;
  display: inline-block;
  text-align: center;
}

.btn-primary {
  background-color: var(--black);
  color: var(--white);
}

.btn-primary:hover {
  background-color: var(--dark-gray);
}

.btn-outline {
  background-color: transparent;
  border: 1px solid var(--black);
  color: var(--black);
}

.btn-outline:hover {
  background-color: var(--light-gray);
}

.btn-danger {
  background-color: var(--danger);
  color: var(--white);
}

.btn-danger:hover {
  background-color: #d32f2f;
}

/* Orders Table */
.orders-table {
  width: 100%;
  border-collapse: collapse;
}

.orders-table th,
.orders-table td {
  padding: 12px 15px;
  text-align: left;
  border-bottom: 1px solid var(--light-gray);
}

.orders-table th {
  font-weight: 600;
  color: var(--dark-gray);
  font-size: 14px;
}

.orders-table tbody tr:hover {
  background-color: var(--light-gray);
}

.status-badge {
  display: inline-block;
  padding: 5px 10px;
  border-radius: 20px;
  font-size: 12px;
  font-weight: 500;
  text-align: center;
}

.status-completed {
  background-color: rgba(76, 175, 80, 0.1);
  color: var(--success);
}

.status-processing {
  background-color: rgba(33, 150, 243, 0.1);
  color: var(--info);
}

.status-pending {
  background-color: rgba(255, 152, 0, 0.1);
  color: var(--warning);
}

.status-cancelled {
  background-color: rgba(244, 67, 54, 0.1);
  color: var(--danger);
}

/* Address Cards */
.address-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 20px;
}

.address-card {
  border: 1px solid var(--light-gray);
  border-radius: 8px;
  padding: 20px;
  position: relative;
}

.address-card.default {
  border-color: var(--black);
}

.default-badge {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: var(--black);
  color: var(--white);
  font-size: 12px;
  padding: 3px 8px;
  border-radius: 4px;
}

.address-type {
  font-weight: 600;
  margin-bottom: 10px;
  font-size: 16px;
}

.address-details {
  margin-bottom: 15px;
  line-height: 1.6;
  font-size: 14px;
}

.address-actions {
  display: flex;
  gap: 10px;
}

.address-actions a {
  font-size: 13px;
  text-decoration: none;
  color: var(--black);
  transition: all 0.3s ease;
}

.address-actions a:hover {
  color: var(--mid-gray);
}

.address-actions i {
  margin-right: 5px;
}

/* Wishlist */
.wishlist-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
  gap: 20px;
}

.wishlist-item {
  background-color: var(--white);
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 5px rgba(0,0,0,0.05);
  border: 1px solid var(--light-gray);
  transition: all 0.3s ease;
}

.wishlist-item:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 15px rgba(0,0,0,0.1);
}

.wishlist-image {
  height: 200px;
  position: relative;
}

.wishlist-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.wishlist-remove {
  position: absolute;
  top: 10px;
  right: 10px;
  width: 30px;
  height: 30px;
  background-color: rgba(255, 255, 255, 0.9);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.3s ease;
}

.wishlist-remove:hover {
  background-color: var(--danger);
}

.wishlist-remove:hover i {
  color: var(--white);
}

.wishlist-details {
  padding: 15px;
}

.wishlist-title {
  font-size: 14px;
  font-weight: 500;
  margin-bottom: 5px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.wishlist-price {
  color: var(--dark-gray);
  font-weight: 600;
  margin-bottom: 10px;
}

.wishlist-actions {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.btn-sm {
  padding: 8px 12px;
  font-size: 12px;
}

/* Alert Messages */
.alert {
  padding: 15px;
  border-radius: 4px;
  margin-bottom: 20px;
  display: flex;
  align-items: center;
}

.alert i {
  font-size: 18px;
  margin-right: 10px;
}

.alert-success {
  background-color: rgba(76, 175, 80, 0.1);
  border-left: 4px solid var(--success);
  color: var(--success);
}

.alert-success i {
  color: var(--success);
}

.alert-danger {
  background-color: rgba(244, 67, 54, 0.1);
  border-left: 4px solid var(--danger);
  color: var(--danger);
}

.alert-danger i {
  color: var(--danger);
}

.alert-info {
  background-color: rgba(33, 150, 243, 0.1);
  border-left: 4px solid var(--info);
  color: var(--info);
}

.alert-info i {
  color: var(--info);
}

/* Footer */
.footer {
  background-color: var(--black);
  padding: 60px 0 0;
  margin-top: auto;
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

/* Responsive Adjustments */
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
  
  .profile-container {
    flex-direction: column;
  }
  
  .profile-sidebar {
    flex: 0 0 100%;
    position: static;
    margin-bottom: 30px;
  }
  
  .footer-items {
    width: 45%;
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
  
  .form-row {
    flex-direction: column;
  }
  
  .form-group {
    flex: 0 0 100%;
  }
  
  .footer-items {
    width: 100%;
  }
  
  .wishlist-grid {
    grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
  }
  
  .orders-table thead {
    display: none;
  }
  
  .orders-table tbody tr {
    display: block;
    margin-bottom: 15px;
    border: 1px solid var(--light-gray);
    border-radius: 4px;
  }
  
  .orders-table tbody td {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid var(--light-gray);
  }
  
  .orders-table tbody td:before {
    content: attr(data-label);
    font-weight: 600;
    margin-right: 10px;
  }
}

@media (max-width: 480px) {
  .profile-container {
    padding: 0 10px;
    margin: 20px auto;
  }
  
  .profile-card-header {
    flex-direction: column;
    align-items: flex-start;
  }
  
  .profile-card-header .btn {
    margin-top: 10px;
  }
  
  .wishlist-grid {
    grid-template-columns: 1fr;
  }
  
  .address-grid {
    grid-template-columns: 1fr;
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

// Tab switching functionality
function openTab(evt, tabName) {
  // Hide all tab content
  var tabcontent = document.getElementsByClassName("profile-tab-content");
  for (var i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  
  // Show the specific tab content
  document.getElementById(tabName).style.display = "block";
  
  // Update active class on sidebar menu items
  var tablinks = document.getElementsByClassName("profile-menu-link");
  for (var i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  
  // Add active class to the clicked tab
  evt.currentTarget.className += " active";
}

// Open the first tab by default
document.addEventListener('DOMContentLoaded', function() {
  // Get the first tab link and simulate a click
  const defaultTab = document.querySelector('.profile-menu-link');
  if (defaultTab) {
    defaultTab.click();
  }
});
</script>
</head>
<body>
<!-- for sign in/ log in -->
<div class="abc">
  <a href="#"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;Sign Up/Login in</a>
</div>
<div class="dropdown">
  <button onclick="myFunction()" class="dropbtn">Profile</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="userprofile.jsp">Edit</a>
    <a href="userprofile.jsp?tab=password">Change password</a>
    <a href="logout.jsp">Logout</a>
    <a href="userprofile.jsp?tab=settings">Settings</a>
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
        <rect x="-35" y="10" width="250" height="90" rx="3" fill="none" stroke="#ffffff" stroke-width="2" />

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
        <li><a href="Home.jsp">HOME</a></li>
        <li><a href="ForHim.jsp">MEN</a></li>
        <li><a href="ForHer.jsp">WOMEN</a></li>
        <li><a href="uuni.jsp">UNISEX</a></li>
        <li><a href="contact.html">CONTACT</a></li>
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

<!-- Profile Container -->
<div class="profile-container">
  <!-- Sidebar Navigation -->
  <aside class="profile-sidebar">
    <div class="profile-user">
      <div class="profile-avatar">
        <i class="fas fa-user"></i>
      </div>
      <h2 class="profile-name">Robert Smith</h2>
      <p class="profile-email">robert.smith@example.com</p>
    </div>
    
    <div class="profile-menu">
      <h3>Account</h3>
      <ul>
        <li><a href="#" class="profile-menu-link active" onclick="openTab(event, 'profile-info')">
          <i class="fas fa-user"></i> Personal Information
        </a></li>
        <li><a href="#" class="profile-menu-link" onclick="openTab(event, 'address-book')">
          <i class="fas fa-map-marker-alt"></i> Address Book
        </a></li>
        <li><a href="#" class="profile-menu-link" onclick="openTab(event, 'change-password')">
          <i class="fas fa-lock"></i> Change Password
        </a></li>
      </ul>
      
      <h3>Orders</h3>
      <ul>
        <li><a href="#" class="profile-menu-link" onclick="openTab(event, 'order-history')">
          <i class="fas fa-shopping-bag"></i> Order History
        </a></li>
        <li><a href="#" class="profile-menu-link" onclick="openTab(event, 'wishlist')">
          <i class="fas fa-heart"></i> Wishlist
        </a></li>
        <li><a href="#" class="profile-menu-link" onclick="openTab(event, 'reviews')">
          <i class="fas fa-star"></i> Reviews
        </a></li>
      </ul>
      
      <h3>Other</h3>
      <ul>
        <li><a href="#" class="profile-menu-link" onclick="openTab(event, 'account-settings')">
          <i class="fas fa-cog"></i> Account Settings
        </a></li>
        <li><a href="logout.jsp" class="profile-menu-link">
          <i class="fas fa-sign-out-alt"></i> Logout
        </a></li>
      </ul>
    </div>
  </aside>
  
  <!-- Main Content Area -->
  <div class="profile-content">
    <!-- Personal Information Tab -->
    <div id="profile-info" class="profile-tab-content">
      <!-- Success Alert -->
      <div class="alert alert-success">
        <i class="fas fa-check-circle"></i>
        <span>Your profile has been updated successfully!</span>
      </div>
      
      <div class="profile-card">
        <div class="profile-card-header">
          <h2 class="profile-card-title">Personal Information</h2>
        </div>
        <div class="profile-card-body">
          <form action="updateProfile" method="post">
            <div class="form-row">
              <div class="form-group">
                <label class="form-label" for="firstName">First Name</label>
                <input type="text" id="firstName" name="firstName" class="form-control" value="Robert" required>
              </div>
              
              <div class="form-group">
                <label class="form-label" for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastName" class="form-control" value="Edward" required>
              </div>
            </div>
            
            <div class="form-row">
              <div class="form-group">
                <label class="form-label" for="email">Email Address</label>
                <input type="email" id="email" name="email" class="form-control" value="robert.smith@example.com" required>
              </div>
              
              <div class="form-group">
                <label class="form-label" for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" class="form-control" value="+1 (555) 123-4567">
              </div>
            </div>
            
            <div class="form-row">
              <div class="form-group">
                <label class="form-label" for="birthdate">Birth Date</label>
                <input type="date" id="birthdate" name="birthdate" class="form-control" value="1990-05-15">
              </div>
              
              <div class="form-group">
                <label class="form-label" for="gender">Gender</label>
                <select id="gender" name="gender" class="form-control">
                  <option value="">Select Gender</option>
                  <option value="male" selected>Male</option>
                  <option value="female">Female</option>
                  <option value="other">Other</option>
                  <option value="prefer-not-to-say">Prefer not to say</option>
                </select>
              </div>
            </div>
            
            <div class="form-actions">
              <button type="submit" class="btn btn-primary">Save Changes</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    
    <!-- Address Book Tab -->
    <div id="address-book" class="profile-tab-content" style="display: none;">
      <div class="profile-card">
        <div class="profile-card-header">
          <h2 class="profile-card-title">My Addresses</h2>
          <a href="#" class="btn btn-primary">Add New Address</a>
        </div>
        <div class="profile-card-body">
          <div class="address-grid">
            <!-- Default Address -->
            <div class="address-card default">
              <div class="default-badge">Default</div>
              <h3 class="address-type">Home</h3>
              <div class="address-details">
                Robert Smith<br>
                123 Main Street<br>
                Apt 4B<br>
                New York, NY 10001<br>
                United States<br>
                <strong>Phone:</strong> +1 (555) 123-4567
              </div>
              <div class="address-actions">
                <a href="#"><i class="fas fa-edit"></i> Edit</a>
                <a href="#"><i class="fas fa-trash"></i> Delete</a>
              </div>
            </div>
            
            <!-- Work Address -->
            <div class="address-card">
              <h3 class="address-type">Work</h3>
              <div class="address-details">
                John Doe<br>
                456 Business Ave<br>
                Suite 200<br>
                New York, NY 10002<br>
                United States<br>
                <strong>Phone:</strong> +1 (555) 987-6543
              </div>
              <div class="address-actions">
                <a href="#"><i class="fas fa-edit"></i> Edit</a>
                <a href="#"><i class="fas fa-trash"></i> Delete</a>
                <a href="#"><i class="fas fa-check-circle"></i> Set as Default</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Change Password Tab -->
    <div id="change-password" class="profile-tab-content" style="display: none;">
      <div class="profile-card">
        <div class="profile-card-header">
          <h2 class="profile-card-title">Change Password</h2>
        </div>
        <div class="profile-card-body">
          <form action="changePassword" method="post">
            <div class="form-row">
              <div class="form-group full-width">
                <label class="form-label" for="currentPassword">Current Password</label>
                <input type="password" id="currentPassword" name="currentPassword" class="form-control" required>
              </div>
            </div>
            
            <div class="form-row">
              <div class="form-group">
                <label class="form-label" for="newPassword">New Password</label>
                <input type="password" id="newPassword" name="newPassword" class="form-control" required>
              </div>
              
              <div class="form-group">
                <label class="form-label" for="confirmPassword">Confirm New Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
              </div>
            </div>
            
            <div class="form-row">
              <div class="form-group full-width">
                <ul style="font-size: 13px; color: var(--dark-gray); padding-left: 20px;">
                  <li>Password must be at least 8 characters long</li>
                  <li>Include at least one uppercase letter</li>
                  <li>Include at least one number</li>
                  <li>Include at least one special character</li>
                </ul>
              </div>
            </div>
            
            <div class="form-actions">
              <button type="submit" class="btn btn-primary">Update Password</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    
    <!-- Order History Tab -->
    <div id="order-history" class="profile-tab-content" style="display: none;">
      <div class="profile-card">
        <div class="profile-card-header">
          <h2 class="profile-card-title">Order History</h2>
        </div>
        <div class="profile-card-body">
          <table class="orders-table">
            <thead>
              <tr>
                <th>Order #</th>
                <th>Date</th>
                <th>Items</th>
                <th>Total</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td data-label="Order #">ZFX-10045</td>
                <td data-label="Date">Apr 15, 2025</td>
                <td data-label="Items">3</td>
                <td data-label="Total">$480.00</td>
                <td data-label="Status"><span class="status-badge status-completed">Completed</span></td>
                <td data-label="Actions"><a href="order-details.jsp?id=10045" class="btn btn-sm btn-outline">View</a></td>
              </tr>
              <tr>
                <td data-label="Order #">ZFX-10039</td>
                <td data-label="Date">Mar 28, 2025</td>
                <td data-label="Items">2</td>
                <td data-label="Total">$325.00</td>
                <td data-label="Status"><span class="status-badge status-processing">Processing</span></td>
                <td data-label="Actions"><a href="order-details.jsp?id=10039" class="btn btn-sm btn-outline">View</a></td>
              </tr>
              <tr>
                <td data-label="Order #">ZFX-10027</td>
                <td data-label="Date">Feb 14, 2025</td>
                <td data-label="Items">1</td>
                <td data-label="Total">$120.00</td>
                <td data-label="Status"><span class="status-badge status-completed">Completed</span></td>
                <td data-label="Actions"><a href="order-details.jsp?id=10027" class="btn btn-sm btn-outline">View</a></td>
              </tr>
              <tr>
                <td data-label="Order #">ZFX-10018</td>
                <td data-label="Date">Jan 05, 2025</td>
                <td data-label="Items">4</td>
                <td data-label="Total">$742.00</td>
                <td data-label="Status"><span class="status-badge status-cancelled">Cancelled</span></td>
                <td data-label="Actions"><a href="order-details.jsp?id=10018" class="btn btn-sm btn-outline">View</a></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    
    <!-- Wishlist Tab -->
    <div id="wishlist" class="profile-tab-content" style="display: none;">
      <div class="profile-card">
        <div class="profile-card-header">
          <h2 class="profile-card-title">My Wishlist</h2>
        </div>
        <div class="profile-card-body">
          <div class="wishlist-grid">
            <!-- Wishlist Item 1 -->
            <div class="wishlist-item">
              <div class="wishlist-image">
                <img src="Images/p2.webp" alt="Button Up Shirt">
                <div class="wishlist-remove">
                  <i class="fas fa-times"></i>
                </div>
              </div>
              <div class="wishlist-details">
                <h3 class="wishlist-title">Button Up Shirt</h3>
                <div class="wishlist-price">$240.00</div>
                <div class="wishlist-actions">
                  <a href="#" class="btn btn-primary btn-sm">Add to Cart</a>
                </div>
              </div>
            </div>
            
            <!-- Wishlist Item 2 -->
            <div class="wishlist-item">
              <div class="wishlist-image">
                <img src="Images/unisex1.jpg" alt="Oversized Hoodie">
                <div class="wishlist-remove">
                  <i class="fas fa-times"></i>
                </div>
              </div>
              <div class="wishlist-details">
                <h3 class="wishlist-title">Oversized Hoodie</h3>
                <div class="wishlist-price">$120.00</div>
                <div class="wishlist-actions">
                  <a href="#" class="btn btn-primary btn-sm">Add to Cart</a>
                </div>
              </div>
            </div>
            
            <!-- Wishlist Item 3 -->
            <div class="wishlist-item">
              <div class="wishlist-image">
                <img src="Images/p5.webp" alt="Teddy Hoodie">
                <div class="wishlist-remove">
                  <i class="fas fa-times"></i>
                </div>
              </div>
              <div class="wishlist-details">
                <h3 class="wishlist-title">Teddy Hoodie</h3>
                <div class="wishlist-price">$450.00</div>
                <div class="wishlist-actions">
                  <a href="#" class="btn btn-primary btn-sm">Add to Cart</a>
                </div>
              </div>
            </div>
            
            <!-- Wishlist Item 4 -->
            <div class="wishlist-item">
              <div class="wishlist-image">
                <img src="Images/unisex6.jpg" alt="Canvas Sneakers">
                <div class="wishlist-remove">
                  <i class="fas fa-times"></i>
                </div>
              </div>
              <div class="wishlist-details">
                <h3 class="wishlist-title">Canvas Sneakers</h3>
                <div class="wishlist-price">$95.00</div>
                <div class="wishlist-actions">
                  <a href="#" class="btn btn-primary btn-sm">Add to Cart</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Reviews Tab -->
    <div id="reviews" class="profile-tab-content" style="display: none;">
      <div class="profile-card">
        <div class="profile-card-header">
          <h2 class="profile-card-title">My Reviews</h2>
        </div>
        <div class="profile-card-body">
          <div class="alert alert-info">
            <i class="fas fa-info-circle"></i>
            <span>You haven't written any reviews yet. Share your experience with products you've purchased!</span>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Account Settings Tab -->
    <div id="account-settings" class="profile-tab-content" style="display: none;">
      <div class="profile-card">
        <div class="profile-card-header">
          <h2 class="profile-card-title">Account Settings</h2>
        </div>
        <div class="profile-card-body">
          <form action="updateSettings" method="post">
            <div class="form-row">
              <div class="form-group full-width">
                <label class="form-label">Email Notifications</label>
                <div style="margin-top: 10px;">
                  <label style="display: flex; align-items: center; margin-bottom: 10px;">
                    <input type="checkbox" name="notifyOrders" checked style="margin-right: 10px;"> 
                    Order updates and shipping notifications
                  </label>
                  <label style="display: flex; align-items: center; margin-bottom: 10px;">
                    <input type="checkbox" name="notifyPromotions" checked style="margin-right: 10px;"> 
                    Promotions and discounts
                  </label>
                  <label style="display: flex; align-items: center; margin-bottom: 10px;">
                    <input type="checkbox" name="notifyNewArrivals" checked style="margin-right: 10px;"> 
                    New arrivals and products
                  </label>
                </div>
              </div>
            </div>
            
            <div class="form-row">
              <div class="form-group full-width">
                <label class="form-label">Privacy Settings</label>
                <div style="margin-top: 10px;">
                  <label style="display: flex; align-items: center; margin-bottom: 10px;">
                    <input type="checkbox" name="allowDataAnalytics" checked style="margin-right: 10px;"> 
                    Allow FashionGhar to analyze my shopping preferences for better recommendations
                  </label>
                </div>
              </div>
            </div>
            
            <div class="form-row">
              <div class="form-group full-width">
                <label class="form-label">Currency</label>
                <select class="form-control" name="currency">
                  <option value="USD" selected>USD - US Dollar</option>
                  <option value="EUR">EUR - Euro</option>
                  <option value="GBP">GBP - British Pound</option>
                  <option value="CAD">CAD - Canadian Dollar</option>
                  <option value="AUD">AUD - Australian Dollar</option>
                </select>
              </div>
            </div>
            
            <div class="form-actions">
              <button type="submit" class="btn btn-primary">Save Settings</button>
            </div>
          </form>
          
          <hr style="margin: 30px 0;">
          
          <div style="margin-top: 20px;">
            <h3 style="color: var(--danger); margin-bottom: 15px;">Delete Account</h3>
            <p style="margin-bottom: 15px; font-size: 14px; color: var(--dark-gray);">
              Once you delete your account, all your personal information, order history, and saved items will be permanently removed. This action cannot be undone.
            </p>
            <button type="button" class="btn btn-danger">Delete My Account</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<div class="footer">
  <div class="inner-footer">
    <!--  Company info section -->
    <div class="footer-items">
      <h1>FashionGhar</h1>
      <p>Where Classic Meets Cool</p>
      <p style="margin-top: 15px; line-height: 1.6;">Premium monochromatic fashion for those who appreciate timeless elegance with a modern twist.</p>
    </div>

    <!--  Shop categories section -->
    <div class="footer-items">
      <h3>Shop</h3>
      <div class="border1"></div>
      <ul class="footcss">
        <li><a href="ForHim.jsp">Men's Collection</a></li>
        <li><a href="ForHer.jsp">Women's Collection</a></li>
        <li><a href="uuni.jsp">Unisex Styles</a></li>
        <li><a href="#">New Arrivals</a></li>
        <li><a href="#">Sale</a></li>
      </ul>
    </div>

    <!--  Customer service section -->
    <div class="footer-items">
      <h3>Customer Service</h3>
      <div class="border1"></div>
      <ul class="footcss">
        <li><a href="#">Size Guide</a></li>
        <li><a href="#">Shipping & Returns</a></li>
        <li><a href="#">Order Tracking</a></li>
        <li><a href="contact.html">Contact Us</a></li>
        <li><a href="#">FAQ</a></li>
      </ul>
    </div>

    <!--  Contact us info -->
    <div class="footer-items">
      <h3>Contact us</h3>
      <div class="border1"></div>
      <ul class="footcss">
        <li><i class="fa fa-map-marker" aria-hidden="true"></i>Mahendrapool, Pokhara</li>
        <li><i class="fa fa-phone" aria-hidden="true"></i>+977 9876543210</li>
        <li><i class="fa fa-envelope" aria-hidden="true"></i>info@fashionghar.com</li>
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

</body>
</html>