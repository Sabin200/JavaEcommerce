<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Orders - FashionGhar</title>
<meta name="description" content="FashionGhar Admin - Manage your customer orders">
<meta name="keywords" content="HTML, CSS, JavaScript, Admin, Orders">
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

/* Orders Management Styles */
.orders-container {
  max-width: 1200px;
  margin: 40px auto;
  padding: 0 20px;
}

.orders-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
}

.orders-title {
  font-size: 32px;
  color: var(--black);
  position: relative;
  padding-bottom: 10px;
}

.orders-title:after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  width: 60px;
  height: 3px;
  background-color: var(--black);
}

.orders-stats {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 20px;
  margin-bottom: 40px;
}

.stat-card {
  background-color: var(--white);
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  display: flex;
  flex-direction: column;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.stat-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
}

.stat-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;
}

.stat-title {
  font-size: 16px;
  color: var(--dark-gray);
}

.stat-icon {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--white);
}

.stat-icon.pending {
  background-color: var(--warning);
}

.stat-icon.processing {
  background-color: var(--info);
}

.stat-icon.shipped {
  background-color: var(--accent);
}

.stat-icon.delivered {
  background-color: var(--success);
}

.stat-value {
  font-size: 28px;
  font-weight: 600;
  margin-bottom: 5px;
}

.stat-change {
  font-size: 14px;
  color: var(--success);
}

.stat-change.negative {
  color: var(--danger);
}

.filter-section {
  background-color: var(--white);
  border-radius: 8px;
  padding: 25px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  margin-bottom: 30px;
}

.filter-title {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 20px;
}

.filter-form {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 20px;
}

.form-group {
  margin-bottom: 15px;
}

.form-label {
  display: block;
  font-size: 14px;
  font-weight: 500;
  margin-bottom: 8px;
}

.form-input, .form-select {
  width: 100%;
  padding: 10px 12px;
  border: 1px solid var(--mid-gray);
  border-radius: 4px;
  font-size: 14px;
}

.form-actions {
  display: flex;
  justify-content: flex-end;
  gap: 15px;
  margin-top: 20px;
}

.reset-btn {
  padding: 10px 20px;
  background-color: var(--light-gray);
  color: var(--dark-gray);
  border: none;
  border-radius: 4px;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.apply-btn {
  padding: 10px 20px;
  background-color: var(--black);
  color: var(--white);
  border: none;
  border-radius: 4px;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.reset-btn:hover {
  background-color: var(--mid-gray);
  color: var(--white);
}

.apply-btn:hover {
  background-color: var(--dark-gray);
}

.orders-table-container {
  background-color: var(--white);
  border-radius: 8px;
  padding: 25px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  margin-bottom: 40px;
  overflow-x: auto;
}

.table-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.table-title {
  font-size: 20px;
  font-weight: 600;
}

.export-btn {
  padding: 8px 16px;
  background-color: var(--black);
  color: var(--white);
  border: none;
  border-radius: 4px;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  gap: 8px;
}

.export-btn:hover {
  background-color: var(--dark-gray);
}

.orders-table {
  width: 100%;
  border-collapse: collapse;
}

.orders-table th {
  text-align: left;
  padding: 12px 15px;
  border-bottom: 1px solid var(--light-gray);
  font-size: 14px;
  font-weight: 600;
  color: var(--dark-gray);
}

.orders-table td {
  padding: 12px 15px;
  border-bottom: 1px solid var(--light-gray);
  font-size: 14px;
}

.status {
  display: inline-block;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 12px;
  font-weight: 500;
}

.status.pending {
  background-color: rgba(255, 152, 0, 0.1);
  color: var(--warning);
}

.status.processing {
  background-color: rgba(2, 136, 209, 0.1);
  color: var(--info);
}

.status.shipped {
  background-color: rgba(74, 74, 74, 0.1);
  color: var(--accent);
}

.status.delivered {
  background-color: rgba(46, 125, 50, 0.1);
  color: var(--success);
}

.status.cancelled {
  background-color: rgba(198, 40, 40, 0.1);
  color: var(--danger);
}

.status.returned {
  background-color: rgba(123, 31, 162, 0.1);
  color: #7b1fa2;
}

.action-btn {
  padding: 6px 12px;
  border: none;
  border-radius: 4px;
  font-size: 12px;
  cursor: pointer;
  transition: all 0.3s ease;
  margin-right: 5px;
}

.view-btn {
  background-color: var(--accent);
  color: var(--white);
}

.edit-btn {
  background-color: var(--info);
  color: var(--white);
}

.delete-btn {
  background-color: var(--danger);
  color: var(--white);
}

.action-btn:hover {
  opacity: 0.8;
}

.pagination {
  display: flex;
  justify-content: center;
  margin-top: 30px;
}

.pagination-btn {
  padding: 8px 12px;
  margin: 0 5px;
  border: 1px solid var(--mid-gray);
  background-color: var(--white);
  color: var(--dark-gray);
  border-radius: 4px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.pagination-btn.active {
  background-color: var(--black);
  color: var(--white);
  border-color: var(--black);
}

.pagination-btn:hover:not(.active) {
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

.order-details {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 30px;
  margin-bottom: 30px;
}

.detail-section {
  margin-bottom: 20px;
}

.detail-title {
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 10px;
  padding-bottom: 5px;
  border-bottom: 1px solid var(--light-gray);
}

.detail-item {
  display: flex;
  justify-content: space-between;
  margin-bottom: 8px;
}

.detail-label {
  font-weight: 500;
  color: var(--dark-gray);
}

.detail-value {
  text-align: right;
}

.order-items {
  margin-bottom: 30px;
}

.item-table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

.item-table th {
  text-align: left;
  padding: 10px;
  background-color: var(--light-gray);
  font-size: 14px;
}

.item-table td {
  padding: 10px;
  border-bottom: 1px solid var(--light-gray);
  font-size: 14px;
}

.item-image {
  width: 50px;
  height: 50px;
  object-fit: cover;
  border-radius: 4px;
}

.order-totals {
  width: 300px;
  margin-left: auto;
}

.total-row {
  display: flex;
  justify-content: space-between;
  padding: 8px 0;
  border-bottom: 1px solid var(--light-gray);
}

.total-row.final {
  font-weight: 600;
  font-size: 16px;
  border-bottom: 2px solid var(--black);
  padding: 10px 0;
  margin-top: 10px;
}

.status-update {
  margin-top: 30px;
  padding-top: 20px;
  border-top: 1px solid var(--light-gray);
}

.status-form {
  display: flex;
  gap: 15px;
  align-items: flex-end;
}

.status-form .form-group {
  flex: 1;
  margin-bottom: 0;
}

.update-btn {
  padding: 10px 20px;
  background-color: var(--black);
  color: var(--white);
  border: none;
  border-radius: 4px;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.update-btn:hover {
  background-color: var(--dark-gray);
}

.timeline {
  margin-top: 30px;
  padding-top: 20px;
  border-top: 1px solid var(--light-gray);
}

.timeline-title {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 20px;
}

.timeline-item {
  display: flex;
  margin-bottom: 15px;
  position: relative;
}

.timeline-item:not(:last-child):before {
  content: "";
  position: absolute;
  left: 15px;
  top: 30px;
  bottom: -15px;
  width: 2px;
  background-color: var(--light-gray);
}

.timeline-icon {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  background-color: var(--light-gray);
  display: flex;
  align-items: center;
  justify-content: center;
  margin-right: 15px;
  z-index: 1;
}

.timeline-icon.completed {
  background-color: var(--success);
  color: var(--white);
}

.timeline-content {
  flex: 1;
}

.timeline-date {
  font-size: 12px;
  color: var(--mid-gray);
  margin-bottom: 5px;
}

.timeline-text {
  font-size: 14px;
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
  
  .orders-stats {
    grid-template-columns: repeat(2, 1fr);
  }
  
  .filter-form {
    grid-template-columns: repeat(2, 1fr);
  }
  
  .order-details {
    grid-template-columns: 1fr;
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
  
  .orders-stats {
    grid-template-columns: 1fr;
  }
  
  .filter-form {
    grid-template-columns: 1fr;
  }
  
  .status-form {
    flex-direction: column;
    align-items: stretch;
  }
  
  .status-form .form-group {
    margin-bottom: 15px;
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

// Confirm delete
function confirmDelete(orderId) {
  return confirm("Are you sure you want to delete order #" + orderId + "? This action cannot be undone.");
}

// Print order
function printOrder() {
  window.print();
}

// Export orders
function exportOrders(format) {
  alert("Exporting orders as " + format + "...");
  // In a real application, this would trigger a download
}

// Update order status
function updateStatus(orderId, newStatus) {
  alert("Order #" + orderId + " status updated to: " + newStatus);
  // In a real application, this would submit to the server
  closeModal('orderDetailModal');
  // Refresh the page or update the UI
  location.reload();
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

<!-- Orders Management Content -->
<div class="orders-container">
  <div class="orders-header">
    <div>
      <h1 class="orders-title">Manage Orders</h1>
      <p class="admin-welcome">View and process customer orders, track shipments, and manage returns.</p>
    </div>
    <div>
      <span id="currentDate"></span>
    </div>
  </div>

  <!-- Order Stats Cards -->
  <div class="orders-stats">
    <div class="stat-card">
      <div class="stat-header">
        <span class="stat-title">Pending Orders</span>
        <div class="stat-icon pending">
          <i class="fas fa-clock"></i>
        </div>
      </div>
      <div class="stat-value">24</div>
      <div class="stat-change">+3 from yesterday</div>
    </div>

    <div class="stat-card">
      <div class="stat-header">
        <span class="stat-title">Processing Orders</span>
        <div class="stat-icon processing">
          <i class="fas fa-cogs"></i>
        </div>
      </div>
      <div class="stat-value">18</div>
      <div class="stat-change">-2 from yesterday</div>
    </div>

    <div class="stat-card">
      <div class="stat-header">
        <span class="stat-title">Shipped Orders</span>
        <div class="stat-icon shipped">
          <i class="fas fa-shipping-fast"></i>
        </div>
      </div>
      <div class="stat-value">32</div>
      <div class="stat-change">+5 from yesterday</div>
    </div>

    <div class="stat-card">
      <div class="stat-header">
        <span class="stat-title">Delivered Orders</span>
        <div class="stat-icon delivered">
          <i class="fas fa-check-circle"></i>
        </div>
      </div>
      <div class="stat-value">1,248</div>
      <div class="stat-change">+42 this month</div>
    </div>
  </div>

  <!-- Filter Section -->
  <div class="filter-section">
    <h3 class="filter-title">Filter Orders</h3>
    <form action="manageOrders.jsp" method="get">
      <div class="filter-form">
        <div class="form-group">
          <label class="form-label">Order ID</label>
          <input type="text" class="form-input" name="orderId" placeholder="e.g. ORD-5723">
        </div>
        <div class="form-group">
          <label class="form-label">Customer Name</label>
          <input type="text" class="form-input" name="customerName" placeholder="Enter customer name">
        </div>
        <div class="form-group">
          <label class="form-label">Status</label>
          <select class="form-select" name="status">
            <option value="">All Statuses</option>
            <option value="pending">Pending</option>
            <option value="processing">Processing</option>
            <option value="shipped">Shipped</option>
            <option value="delivered">Delivered</option>
            <option value="cancelled">Cancelled</option>
            <option value="returned">Returned</option>
          </select>
        </div>
        <div class="form-group">
          <label class="form-label">Date Range</label>
          <select class="form-select" name="dateRange">
            <option value="">All Time</option>
            <option value="today">Today</option>
            <option value="yesterday">Yesterday</option>
            <option value="last7days">Last 7 Days</option>
            <option value="last30days">Last 30 Days</option>
            <option value="thisMonth">This Month</option>
            <option value="lastMonth">Last Month</option>
            <option value="custom">Custom Range</option>
          </select>
        </div>
      </div>
      <div class="form-actions">
        <button type="reset" class="reset-btn">Reset Filters</button>
        <button type="submit" class="apply-btn">Apply Filters</button>
      </div>
    </form>
  </div>

  <!-- Orders Table -->
  <div class="orders-table-container">
    <div class="table-header">
      <h3 class="table-title">All Orders</h3>
      <div>
        <button class="export-btn" onclick="exportOrders('csv')">
          <i class="fas fa-file-csv"></i> Export CSV
        </button>
      </div>
    </div>
    <table class="orders-table">
      <thead>
        <tr>
          <th>Order ID</th>
          <th>Customer</th>
          <th>Date</th>
          <th>Items</th>
          <th>Total</th>
          <th>Payment</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>#ORD-5723</td>
          <td>Rahul Sharma</td>
          <td>May 15, 2025</td>
          <td>3</td>
          <td>$128.50</td>
          <td>Credit Card</td>
          <td><span class="status delivered">Delivered</span></td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('orderDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="location.href='editOrder.jsp?id=5723'">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('5723')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>#ORD-5722</td>
          <td>Priya Patel</td>
          <td>May 15, 2025</td>
          <td>2</td>
          <td>$85.00</td>
          <td>PayPal</td>
          <td><span class="status processing">Processing</span></td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('orderDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="location.href='editOrder.jsp?id=5722'">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('5722')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>#ORD-5721</td>
          <td>Amit Kumar</td>
          <td>May 14, 2025</td>
          <td>5</td>
          <td>$210.75</td>
          <td>Credit Card</td>
          <td><span class="status pending">Pending</span></td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('orderDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="location.href='editOrder.jsp?id=5721'">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('5721')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>#ORD-5720</td>
          <td>Neha Singh</td>
          <td>May 14, 2025</td>
          <td>1</td>
          <td>$65.25</td>
          <td>UPI</td>
          <td><span class="status cancelled">Cancelled</span></td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('orderDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="location.href='editOrder.jsp?id=5720'">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('5720')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>#ORD-5719</td>
          <td>Vikram Joshi</td>
          <td>May 13, 2025</td>
          <td>4</td>
          <td>$145.00</td>
          <td>Credit Card</td>
          <td><span class="status shipped">Shipped</span></td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('orderDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="location.href='editOrder.jsp?id=5719'">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('5719')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>#ORD-5718</td>
          <td>Ananya Desai</td>
          <td>May 13, 2025</td>
          <td>2</td>
          <td>$92.50</td>
          <td>PayPal</td>
          <td><span class="status delivered">Delivered</span></td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('orderDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="location.href='editOrder.jsp?id=5718'">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('5718')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>#ORD-5717</td>
          <td>Rajesh Gupta</td>
          <td>May 12, 2025</td>
          <td>3</td>
          <td>$135.25</td>
          <td>Credit Card</td>
          <td><span class="status returned">Returned</span></td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('orderDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="location.href='editOrder.jsp?id=5717'">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('5717')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>#ORD-5716</td>
          <td>Meera Kapoor</td>
          <td>May 12, 2025</td>
          <td>1</td>
          <td>$45.00</td>
          <td>UPI</td>
          <td><span class="status delivered">Delivered</span></td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('orderDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="location.href='editOrder.jsp?id=5716'">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('5716')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>#ORD-5715</td>
          <td>Arjun Mehta</td>
          <td>May 11, 2025</td>
          <td>2</td>
          <td>$78.50</td>
          <td>Credit Card</td>
          <td><span class="status delivered">Delivered</span></td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('orderDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="location.href='editOrder.jsp?id=5715'">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('5715')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>#ORD-5714</td>
          <td>Kavita Reddy</td>
          <td>May 11, 2025</td>
          <td>4</td>
          <td>$165.75</td>
          <td>PayPal</td>
          <td><span class="status delivered">Delivered</span></td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('orderDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="location.href='editOrder.jsp?id=5714'">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('5714')">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
    
    <!-- Pagination -->
    <div class="pagination">
      <button class="pagination-btn"><i class="fas fa-chevron-left"></i></button>
      <button class="pagination-btn active">1</button>
      <button class="pagination-btn">2</button>
      <button class="pagination-btn">3</button>
      <button class="pagination-btn">4</button>
      <button class="pagination-btn">5</button>
      <button class="pagination-btn"><i class="fas fa-chevron-right"></i></button>
    </div>
  </div>
</div>

<!-- Order Detail Modal -->
<div id="orderDetailModal" class="modal">
  <div class="modal-content">
    <span class="close-modal" onclick="closeModal('orderDetailModal')">&times;</span>
    <h2 class="modal-title">Order #ORD-5723</h2>
    
    <div class="order-details">
      <div>
        <div class="detail-section">
          <h4 class="detail-title">Order Information</h4>
          <div class="detail-item">
            <span class="detail-label">Order Date:</span>
            <span class="detail-value">May 15, 2025 - 14:32</span>
          </div>
          <div class="detail-item">
            <span class="detail-label">Status:</span>
            <span class="detail-value"><span class="status delivered">Delivered</span></span>
          </div>
          <div class="detail-item">
            <span class="detail-label">Payment Method:</span>
            <span class="detail-value">Credit Card (XXXX-XXXX-XXXX-4582)</span>
          </div>
          <div class="detail-item">
            <span class="detail-label">Payment Status:</span>
            <span class="detail-value">Paid</span>
          </div>
        </div>
        
        <div class="detail-section">
          <h4 class="detail-title">Customer Information</h4>
          <div class="detail-item">
            <span class="detail-label">Name:</span>
            <span class="detail-value">Rahul Sharma</span>
          </div>
          <div class="detail-item">
            <span class="detail-label">Email:</span>
            <span class="detail-value">rahul.sharma@example.com</span>
          </div>
          <div class="detail-item">
            <span class="detail-label">Phone:</span>
            <span class="detail-value">+91 98765 43210</span>
          </div>
          <div class="detail-item">
            <span class="detail-label">Customer Since:</span>
            <span class="detail-value">January 12, 2024</span>
          </div>
        </div>
      </div>
      
      <div>
        <div class="detail-section">
          <h4 class="detail-title">Shipping Address</h4>
          <div class="detail-item">
            <span class="detail-label">Name:</span>
            <span class="detail-value">Rahul Sharma</span>
          </div>
          <div class="detail-item">
            <span class="detail-label">Address:</span>
            <span class="detail-value">123 Lakeside Apartments, MG Road</span>
          </div>
          <div class="detail-item">
            <span class="detail-label">City:</span>
            <span class="detail-value">Bangalore</span>
          </div>
          <div class="detail-item">
            <span class="detail-label">State:</span>
            <span class="detail-value">Karnataka</span>
          </div>
          <div class="detail-item">
            <span class="detail-label">Postal Code:</span>
            <span class="detail-value">560001</span>
          </div>
          <div class="detail-item">
            <span class="detail-label">Country:</span>
            <span class="detail-value">India</span>
          </div>
        </div>
        
        <div class="detail-section">
          <h4 class="detail-title">Shipping Information</h4>
          <div class="detail-item">
            <span class="detail-label">Shipping Method:</span>
            <span class="detail-value">Express Delivery</span>
          </div>
          <div class="detail-item">
            <span class="detail-label">Tracking Number:</span>
            <span class="detail-value">DLEX1234567890IN</span>
          </div>
          <div class="detail-item">
            <span class="detail-label">Shipped Date:</span>
            <span class="detail-value">May 16, 2025</span>
          </div>
          <div class="detail-item">
            <span class="detail-label">Delivered Date:</span>
            <span class="detail-value">May 18, 2025</span>
          </div>
        </div>
      </div>
    </div>
    
    <div class="order-items">
      <h4 class="detail-title">Order Items</h4>
      <table class="item-table">
        <thead>
          <tr>
            <th>Image</th>
            <th>Product</th>
            <th>SKU</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><img src="images/products/shirt1.jpg" alt="Premium Cotton Shirt" class="item-image"></td>
            <td>Premium Cotton Shirt<br><small>Size: L, Color: White</small></td>
            <td>PRD-1025-L-WHT</td>
            <td>$78.00</td>
            <td>1</td>
            <td>$78.00</td>
          </tr>
          <tr>
            <td><img src="images/products/jeans1.jpg" alt="Slim Fit Denim Jeans" class="item-image"></td>
            <td>Slim Fit Denim Jeans<br><small>Size: 32, Color: Blue</small></td>
            <td>PRD-1023-32-BLU</td>
            <td>$65.00</td>
            <td>1</td>
            <td>$65.00</td>
          </tr>
          <tr>
            <td><img src="images/products/belt1.jpg" alt="Leather Belt" class="item-image"></td>
            <td>Leather Belt<br><small>Size: M, Color: Black</small></td>
            <td>PRD-1045-M-BLK</td>
            <td>$35.00</td>
            <td>1</td>
            <td>$35.00</td>
          </tr>
        </tbody>
      </table>
      
      <div class="order-totals">
        <div class="total-row">
          <span>Subtotal:</span>
          <span>$178.00</span>
        </div>
        <div class="total-row">
          <span>Shipping:</span>
          <span>$10.00</span>
        </div>
        <div class="total-row">
          <span>Tax (10%):</span>
          <span>$17.80</span>
        </div>
        <div class="total-row">
          <span>Discount:</span>
          <span>-$77.30</span>
        </div>
        <div class="total-row final">
          <span>Total:</span>
          <span>$128.50</span>
        </div>
      </div>
    </div>
    
    <div class="status-update">
      <h4 class="detail-title">Update Order Status</h4>
      <div class="status-form">
        <div class="form-group">
          <label class="form-label">New Status</label>
          <select class="form-select" id="newStatus">
            <option value="pending">Pending</option>
            <option value="processing">Processing</option>
            <option value="shipped">Shipped</option>
            <option value="delivered" selected>Delivered</option>
            <option value="cancelled">Cancelled</option>
            <option value="returned">Returned</option>
          </select>
        </div>
        <div class="form-group">
          <label class="form-label">Notes</label>
          <input type="text" class="form-input" id="statusNotes" placeholder="Add notes about this status change">
        </div>
        <button class="update-btn" onclick="updateStatus('5723', document.getElementById('newStatus').value)">Update Status</button>
      </div>
    </div>
    
    <div class="timeline">
      <h4 class="timeline-title">Order Timeline</h4>
      <div class="timeline-item">
        <div class="timeline-icon completed">
          <i class="fas fa-check"></i>
        </div>
        <div class="timeline-content">
          <div class="timeline-date">May 18, 2025 - 14:25</div>
          <div class="timeline-text">Order delivered to customer</div>
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-icon completed">
          <i class="fas fa-check"></i>
        </div>
        <div class="timeline-content">
          <div class="timeline-date">May 16, 2025 - 09:12</div>
          <div class="timeline-text">Order shipped via Express Delivery (Tracking: DLEX1234567890IN)</div>
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-icon completed">
          <i class="fas fa-check"></i>
        </div>
        <div class="timeline-content">
          <div class="timeline-date">May 15, 2025 - 16:45</div>
          <div class="timeline-text">Payment confirmed and order processing started</div>
        </div>
      </div>
      <div class="timeline-item">
        <div class="timeline-icon completed">
          <i class="fas fa-check"></i>
        </div>
        <div class="timeline-content">
          <div class="timeline-date">May 15, 2025 - 14:32</div>
          <div class="timeline-text">Order placed by customer</div>
        </div>
      </div>
    </div>
    
    <div class="form-actions" style="margin-top: 30px;">
      <button class="reset-btn" onclick="printOrder()"><i class="fas fa-print"></i> Print Order</button>
      <button class="apply-btn" onclick="location.href='editOrder.jsp?id=5723'"><i class="fas fa-edit"></i> Edit Order</button>
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
  const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
  const today = new Date();
  dateElement.textContent = today.toLocaleDateString('en-US', options);
</script>

</body>
</html>