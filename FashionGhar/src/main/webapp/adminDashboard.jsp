<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard - FashionGhar</title>
<meta name="description" content="FashionGhar Admin Dashboard - Manage your online clothing store">
<meta name="keywords" content="HTML, CSS, JavaScript, Admin, Dashboard">
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

/* Admin Dashboard Styles */
.admin-container {
  max-width: 1200px;
  margin: 40px auto;
  padding: 0 20px;
}

.admin-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
}

.admin-title {
  font-size: 32px;
  color: var(--black);
  position: relative;
  padding-bottom: 10px;
}

.admin-title:after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  width: 60px;
  height: 3px;
  background-color: var(--black);
}

.admin-welcome {
  font-size: 16px;
  color: var(--dark-gray);
  margin-top: 10px;
}

.admin-stats {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
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

.stat-icon.products {
  background-color: var(--info);
}

.stat-icon.orders {
  background-color: var(--success);
}

.stat-icon.users {
  background-color: var(--warning);
}

.stat-icon.revenue {
  background-color: var(--accent);
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

.admin-actions {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
  margin-bottom: 40px;
}

.action-card {
  background-color: var(--white);
  border-radius: 8px;
  padding: 25px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  cursor: pointer;
}

.action-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
}

.action-icon {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 15px;
  color: var(--white);
  font-size: 24px;
}

.action-icon.products {
  background-color: var(--info);
}

.action-icon.categories {
  background-color: var(--accent);
}

.action-icon.orders {
  background-color: var(--success);
}

.action-icon.users {
  background-color: var(--warning);
}

.action-title {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 10px;
}

.action-description {
  font-size: 14px;
  color: var(--dark-gray);
  margin-bottom: 15px;
}

.action-link {
  display: inline-block;
  padding: 8px 16px;
  background-color: var(--black);
  color: var(--white);
  border-radius: 4px;
  text-decoration: none;
  font-size: 14px;
  font-weight: 500;
  transition: all 0.3s ease;
}

.action-link:hover {
  background-color: var(--dark-gray);
  color: var(--white);
}

.recent-section {
  background-color: var(--white);
  border-radius: 8px;
  padding: 25px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  margin-bottom: 40px;
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.section-title {
  font-size: 20px;
  font-weight: 600;
}

.view-all {
  font-size: 14px;
  color: var(--info);
  text-decoration: none;
  transition: all 0.3s ease;
}

.view-all:hover {
  color: var(--accent);
  text-decoration: underline;
}

.recent-table {
  width: 100%;
  border-collapse: collapse;
}

.recent-table th {
  text-align: left;
  padding: 12px 15px;
  border-bottom: 1px solid var(--light-gray);
  font-size: 14px;
  font-weight: 600;
  color: var(--dark-gray);
}

.recent-table td {
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

.status.completed {
  background-color: rgba(46, 125, 50, 0.1);
  color: var(--success);
}

.status.processing {
  background-color: rgba(2, 136, 209, 0.1);
  color: var(--info);
}

.status.pending {
  background-color: rgba(255, 152, 0, 0.1);
  color: var(--warning);
}

.status.cancelled {
  background-color: rgba(198, 40, 40, 0.1);
  color: var(--danger);
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
  
  .admin-stats, .admin-actions {
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
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
  
  .admin-stats, .admin-actions {
    grid-template-columns: 1fr;
  }
  
  .recent-table {
    display: block;
    overflow-x: auto;
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

<!-- Admin Dashboard Content -->
<div class="admin-container">
  <div class="admin-header">
    <div>
      <h1 class="admin-title">Admin Dashboard</h1>
      <p class="admin-welcome">Welcome back, Admin. Here's what's happening with your store today.</p>
    </div>
    <div>
      <span id="currentDate"></span>
    </div>
  </div>

  <!-- Stats Cards -->
  <div class="admin-stats">
    <div class="stat-card">
      <div class="stat-header">
        <span class="stat-title">Total Products</span>
        <div class="stat-icon products">
          <i class="fas fa-tshirt"></i>
        </div>
      </div>
      <div class="stat-value">248</div>
      <div class="stat-change">+12% from last month</div>
    </div>

    <div class="stat-card">
      <div class="stat-header">
        <span class="stat-title">Total Orders</span>
        <div class="stat-icon orders">
          <i class="fas fa-shopping-bag"></i>
        </div>
      </div>
      <div class="stat-value">1,543</div>
      <div class="stat-change">+8% from last month</div>
    </div>

    <div class="stat-card">
      <div class="stat-header">
        <span class="stat-title">Total Users</span>
        <div class="stat-icon users">
          <i class="fas fa-users"></i>
        </div>
      </div>
      <div class="stat-value">3,721</div>
      <div class="stat-change">+15% from last month</div>
    </div>

    <div class="stat-card">
      <div class="stat-header">
        <span class="stat-title">Total Revenue</span>
        <div class="stat-icon revenue">
          <i class="fas fa-dollar-sign"></i>
        </div>
      </div>
      <div class="stat-value">$42,850</div>
      <div class="stat-change">+5% from last month</div>
    </div>
  </div>

  <!-- CRUD Operation Cards -->
  <div class="admin-actions">
    <div class="action-card">
      <div class="action-icon products">
        <i class="fas fa-tshirt"></i>
      </div>
      <h3 class="action-title">Manage Products</h3>
      <p class="action-description">Add, edit, delete, and view all products in your inventory</p>
      <a href="manageProducts.jsp" class="action-link">Manage Products</a>
    </div>

    <div class="action-card">
      <div class="action-icon categories">
        <i class="fas fa-tags"></i>
      </div>
      <h3 class="action-title">Manage Categories</h3>
      <p class="action-description">Create and organize product categories and collections</p>
      <a href="manageCategories.jsp" class="action-link">Manage Categories</a>
    </div>

    <div class="action-card">
      <div class="action-icon orders">
        <i class="fas fa-shopping-bag"></i>
      </div>
      <h3 class="action-title">Manage Orders</h3>
      <p class="action-description">View and process customer orders and track shipments</p>
      <a href="manageOrders.jsp" class="action-link">Manage Orders</a>
    </div>

    <div class="action-card">
      <div class="action-icon users">
        <i class="fas fa-users"></i>
      </div>
      <h3 class="action-title">Manage Users</h3>
      <p class="action-description">View and manage customer accounts and admin users</p>
      <a href="manageUsers.jsp" class="action-link">Manage Users</a>
    </div>
  </div>

  <!-- Recent Orders Section -->
  <div class="recent-section">
    <div class="section-header">
      <h3 class="section-title">Recent Orders</h3>
      <a href="manageOrders.jsp" class="view-all">View All</a>
    </div>
    <table class="recent-table">
      <thead>
        <tr>
          <th>Order ID</th>
          <th>Customer</th>
          <th>Date</th>
          <th>Amount</th>
          <th>Status</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>#ORD-5723</td>
          <td>Rahul Sharma</td>
          <td>May 15, 2025</td>
          <td>$128.50</td>
          <td><span class="status completed">Completed</span></td>
          <td><a href="viewOrder.jsp?id=5723">View</a></td>
        </tr>
        <tr>
          <td>#ORD-5722</td>
          <td>Priya Patel</td>
          <td>May 15, 2025</td>
          <td>$85.00</td>
          <td><span class="status processing">Processing</span></td>
          <td><a href="viewOrder.jsp?id=5722">View</a></td>
        </tr>
        <tr>
          <td>#ORD-5721</td>
          <td>Amit Kumar</td>
          <td>May 14, 2025</td>
          <td>$210.75</td>
          <td><span class="status pending">Pending</span></td>
          <td><a href="viewOrder.jsp?id=5721">View</a></td>
        </tr>
        <tr>
          <td>#ORD-5720</td>
          <td>Neha Singh</td>
          <td>May 14, 2025</td>
          <td>$65.25</td>
          <td><span class="status cancelled">Cancelled</span></td>
          <td><a href="viewOrder.jsp?id=5720">View</a></td>
        </tr>
        <tr>
          <td>#ORD-5719</td>
          <td>Vikram Joshi</td>
          <td>May 13, 2025</td>
          <td>$145.00</td>
          <td><span class="status completed">Completed</span></td>
          <td><a href="viewOrder.jsp?id=5719">View</a></td>
        </tr>
      </tbody>
    </table>
  </div>

  <!-- Recent Products Section -->
  <div class="recent-section">
    <div class="section-header">
      <h3 class="section-title">Recently Added Products</h3>
      <a href="manageProducts.jsp" class="view-all">View All</a>
    </div>
    <table class="recent-table">
      <thead>
        <tr>
          <th>Product ID</th>
          <th>Name</th>
          <th>Category</th>
          <th>Price</th>
          <th>Stock</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>#PRD-1025</td>
          <td>Premium Cotton Shirt</td>
          <td>Men's Shirts</td>
          <td>$78.00</td>
          <td>45</td>
          <td><a href="editProduct.jsp?id=1025">Edit</a></td>
        </tr>
        <tr>
          <td>#PRD-1024</td>
          <td>Floral Summer Dress</td>
          <td>Women's Dresses</td>
          <td>$95.50</td>
          <td>32</td>
          <td><a href="editProduct.jsp?id=1024">Edit</a></td>
        </tr>
        <tr>
          <td>#PRD-1023</td>
          <td>Slim Fit Denim Jeans</td>
          <td>Men's Pants</td>
          <td>$65.00</td>
          <td>28</td>
          <td><a href="editProduct.jsp?id=1023">Edit</a></td>
        </tr>
        <tr>
          <td>#PRD-1022</td>
          <td>Casual Hoodie</td>
          <td>Unisex</td>
          <td>$55.25</td>
          <td>50</td>
          <td><a href="editProduct.jsp?id=1022">Edit</a></td>
        </tr>
        <tr>
          <td>#PRD-1021</td>
          <td>Winter Overcoat</td>
          <td>Women's Outerwear</td>
          <td>$190.00</td>
          <td>15</td>
          <td><a href="editProduct.jsp?id=1021">Edit</a></td>
        </tr>
      </tbody>
    </table>
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