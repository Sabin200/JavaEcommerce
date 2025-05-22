<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout - FashionGhar</title>
<meta name="description" content="Complete your purchase at FashionGhar">
<meta name="keywords" content="checkout, payment, fashion, clothing, Nepal">
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
  
  /* Nepali payment brand colors */
  --esewa: #60BB46;
  --khalti: #5C2D91;
  --connectips: #0052A3;
  --imepay: #ED1C24;
  --fonepay: #F37022;
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
  justify-content: space-between;
  padding: 15px 30px;
  background-color: var(--black);
}

.abc a {
  color: var(--white);
  text-decoration: none;
  font-size: 14px;
  transition: all 0.3s ease;
}

.abc a:hover {
  color: var(--mid-gray);
  text-decoration: none;
}

.dropdown {
  position: relative;
  display: inline-block;
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
  justify-content: space-between;
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
  font-size: 16px;
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

/* Checkout Styles */
.checkout-container {
  max-width: 1200px;
  margin: 40px auto;
  padding: 0 20px;
}

.checkout-header {
  margin-bottom: 30px;
}

.checkout-title {
  font-size: 32px;
  color: var(--black);
  position: relative;
  padding-bottom: 10px;
}

.checkout-title:after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  width: 60px;
  height: 3px;
  background-color: var(--black);
}

.checkout-content {
  display: grid;
  grid-template-columns: 3fr 2fr;
  gap: 30px;
}

.checkout-form {
  background-color: var(--white);
  border-radius: 8px;
  padding: 25px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
}

.form-section {
  margin-bottom: 30px;
}

.section-title {
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 1px solid var(--light-gray);
}

.form-row {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 20px;
  margin-bottom: 20px;
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

.form-input:focus, .form-select:focus {
  outline: none;
  border-color: var(--black);
  box-shadow: 0 0 0 2px rgba(0, 0, 0, 0.1);
}

.payment-methods {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 15px;
  margin-bottom: 20px;
}

.payment-method {
  border: 1px solid var(--mid-gray);
  border-radius: 8px;
  padding: 15px;
  text-align: center;
  cursor: pointer;
  transition: all 0.3s ease;
}

.payment-method:hover {
  border-color: var(--black);
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.payment-method.active {
  border-color: var(--black);
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.payment-logo {
  height: 40px;
  margin-bottom: 10px;
  object-fit: contain;
}

.payment-name {
  font-size: 14px;
  font-weight: 500;
}

.order-summary {
  background-color: var(--white);
  border-radius: 8px;
  padding: 25px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  position: sticky;
  top: 20px;
}

.summary-title {
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 1px solid var(--light-gray);
}

.cart-items {
  margin-bottom: 20px;
}

.cart-item {
  display: flex;
  margin-bottom: 15px;
  padding-bottom: 15px;
  border-bottom: 1px solid var(--light-gray);
}

.item-image {
  width: 60px;
  height: 80px;
  object-fit: cover;
  border-radius: 4px;
  margin-right: 15px;
}

.item-details {
  flex: 1;
}

.item-name {
  font-weight: 500;
  margin-bottom: 5px;
}

.item-variant {
  font-size: 12px;
  color: var(--dark-gray);
  margin-bottom: 5px;
}

.item-price {
  font-weight: 600;
}

.item-quantity {
  font-size: 14px;
  color: var(--dark-gray);
}

.summary-row {
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
}

.summary-label {
  font-size: 14px;
  color: var(--dark-gray);
}

.summary-value {
  font-weight: 500;
}

.summary-total {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
  padding-top: 15px;
  border-top: 2px solid var(--light-gray);
}

.total-label {
  font-size: 16px;
  font-weight: 600;
}

.total-value {
  font-size: 20px;
  font-weight: 700;
}

.checkout-btn {
  width: 100%;
  padding: 12px;
  background-color: var(--black);
  color: var(--white);
  border: none;
  border-radius: 4px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  margin-top: 20px;
}

.checkout-btn:hover {
  background-color: var(--dark-gray);
}

.secure-checkout {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 15px;
  font-size: 12px;
  color: var(--dark-gray);
}

.secure-checkout i {
  margin-right: 5px;
  color: var(--success);
}

.promo-code {
  margin-top: 20px;
  padding-top: 15px;
  border-top: 1px solid var(--light-gray);
}

.promo-input {
  display: flex;
  margin-top: 10px;
}

.promo-input input {
  flex: 1;
  padding: 10px 12px;
  border: 1px solid var(--mid-gray);
  border-radius: 4px 0 0 4px;
  font-size: 14px;
}

.promo-input button {
  padding: 10px 15px;
  background-color: var(--black);
  color: var(--white);
  border: none;
  border-radius: 0 4px 4px 0;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.promo-input button:hover {
  background-color: var(--dark-gray);
}

/* Suggestions Section */
.suggestions-section {
  margin-top: 60px;
  margin-bottom: 40px;
}

.suggestions-title {
  font-size: 24px;
  font-weight: 600;
  margin-bottom: 30px;
  text-align: center;
  position: relative;
}

.suggestions-title:after {
  content: "";
  position: absolute;
  bottom: -10px;
  left: 50%;
  transform: translateX(-50%);
  width: 60px;
  height: 3px;
  background-color: var(--black);
}

.suggestions-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
  gap: 25px;
}

.suggestion-card {
  background-color: var(--white);
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.suggestion-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
}

.suggestion-image {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.suggestion-details {
  padding: 15px;
}

.suggestion-category {
  font-size: 12px;
  color: var(--dark-gray);
  margin-bottom: 5px;
}

.suggestion-name {
  font-weight: 600;
  margin-bottom: 10px;
  font-size: 16px;
}

.suggestion-price {
  font-weight: 700;
  font-size: 18px;
}

.suggestion-original-price {
  font-size: 14px;
  color: var(--dark-gray);
  text-decoration: line-through;
  margin-left: 5px;
}

.add-to-cart {
  display: block;
  width: 100%;
  padding: 8px 0;
  background-color: var(--black);
  color: var(--white);
  border: none;
  border-radius: 4px;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
  margin-top: 10px;
  text-align: center;
}

.add-to-cart:hover {
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
  
  .checkout-content {
    grid-template-columns: 1fr;
  }
  
  .payment-methods {
    grid-template-columns: repeat(3, 1fr);
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
  
  .payment-methods {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 480px) {
  .payment-methods {
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

// Select payment method
function selectPaymentMethod(method) {
  // Remove active class from all payment methods
  var paymentMethods = document.getElementsByClassName("payment-method");
  for (var i = 0; i < paymentMethods.length; i++) {
    paymentMethods[i].classList.remove("active");
  }
  
  // Add active class to selected payment method
  document.getElementById(method).classList.add("active");
  
  // Set the payment method value in the hidden input
  document.getElementById("payment-method-input").value = method;
}

// Apply promo code
function applyPromoCode() {
  var promoCode = document.getElementById("promo-code").value;
  if (promoCode.trim() === "") {
    alert("Please enter a promo code");
    return;
  }
  
  // In a real application, you would validate the promo code with the server
  // For now, we'll just show a success message
  alert("Promo code applied successfully!");
}

// Form validation
function validateForm() {
  var requiredFields = document.querySelectorAll("[required]");
  var valid = true;
  
  for (var i = 0; i < requiredFields.length; i++) {
    if (requiredFields[i].value.trim() === "") {
      requiredFields[i].style.borderColor = "red";
      valid = false;
    } else {
      requiredFields[i].style.borderColor = "";
    }
  }
  
  if (!valid) {
    alert("Please fill in all required fields");
    return false;
  }
  
  // Check if a payment method is selected
  var paymentMethod = document.getElementById("payment-method-input").value;
  if (!paymentMethod) {
    alert("Please select a payment method");
    return false;
  }
  
  return true;
}

// Add to cart from suggestions
function addToCart(productId, productName) {
  alert(productName + " added to cart!");
  // In a real application, you would add the product to the cart
}
</script>
</head>
<body>
<!-- for sign in/ log in -->
<div class="abc">
  <a href="#"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;Sign in</a>
  <a href="#"><i class="fa fa-user-plus" aria-hidden="true"></i>&nbsp;Register</a>
</div>
<div class="dropdown">
  <button onclick="myFunction()" class="dropbtn">My Account</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="profile.jsp">Profile</a>
    <a href="orders.jsp">Orders</a>
    <a href="wishlist.jsp">Wishlist</a>
    <a href="logout.jsp">Logout</a>
  </div>
</div>
<hr>

<!-- for navigation -->
<div class="main">
  <nav class="stroke">
    <!-- for logo -->
    <div class="logo">
      <a href="index.jsp">
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
          <text x="90" y="72" font-family="Montserrat, sans-serif" font-size="10" font-style="italic" font-weight="300" text-anchor="middle" fill="#ffffff">Where Classic Meets Cool</text>
        </svg>
      </a>
    </div>

    <!-- for navigation bar -->
    <div class="nav-links">
      <ul>
        <li><a href="index.jsp">HOME</a></li>
        <li><a href="men.jsp">MEN</a></li>
        <li><a href="women.jsp">WOMEN</a></li>
        <li><a href="uuni.jsp">UNISEX</a></li>
        <li><a href="sale.jsp">SALE</a></li>
        <li><a href="contact.jsp">CONTACT</a></li>
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

<!-- Checkout Content -->
<div class="checkout-container">
  <div class="checkout-header">
    <h1 class="checkout-title">Checkout</h1>
    <p>Complete your purchase securely</p>
  </div>
  
  <div class="checkout-content">
    <!-- Checkout Form -->
    <div class="checkout-form">
      <form action="processOrder.jsp" method="post" onsubmit="return validateForm()">
        <!-- Shipping Information -->
        <div class="form-section">
          <h3 class="section-title">Delivery Information</h3>
          <div class="form-row">
            <div class="form-group">
              <label class="form-label">Full Name*</label>
              <input type="text" class="form-input" name="fullName" required>
            </div>
            <div class="form-group">
              <label class="form-label">Phone Number*</label>
              <input type="tel" class="form-input" name="phone" required>
            </div>
          </div>
          
          <div class="form-group">
            <label class="form-label">Email Address*</label>
            <input type="email" class="form-input" name="email" required>
          </div>
          
          <div class="form-group">
            <label class="form-label">Delivery Address*</label>
            <input type="text" class="form-input" name="address" placeholder="Street address, apartment, etc." required>
          </div>
          
          <div class="form-row">
            <div class="form-group">
              <label class="form-label">City*</label>
              <input type="text" class="form-input" name="city" required>
            </div>
            <div class="form-group">
              <label class="form-label">Province*</label>
              <select class="form-select" name="province" required>
                <option value="">Select Province</option>
                <option value="Province 1">Province 1</option>
                <option value="Province 2">Province 2</option>
                <option value="Bagmati">Bagmati</option>
                <option value="Gandaki">Gandaki</option>
                <option value="Lumbini">Lumbini</option>
                <option value="Karnali">Karnali</option>
                <option value="Sudurpashchim">Sudurpashchim</option>
              </select>
            </div>
          </div>
        </div>
        
        <!-- Payment Method -->
        <div class="form-section">
          <h3 class="section-title">Payment Method</h3>
          <p style="margin-bottom: 20px;">Select your preferred payment method</p>
          
          <input type="hidden" id="payment-method-input" name="paymentMethod" value="">
          
          <div class="payment-methods">
            <div id="esewa" class="payment-method" onclick="selectPaymentMethod('esewa')">
              <img src="images/payments/esewa.png" alt="eSewa" class="payment-logo">
              <div class="payment-name">eSewa</div>
            </div>
            
            <div id="khalti" class="payment-method" onclick="selectPaymentMethod('khalti')">
              <img src="images/payments/khalti.png" alt="Khalti" class="payment-logo">
              <div class="payment-name">Khalti</div>
            </div>
            
            <div id="connectips" class="payment-method" onclick="selectPaymentMethod('connectips')">
              <img src="images/payments/connectips.png" alt="Connect IPS" class="payment-logo">
              <div class="payment-name">Connect IPS</div>
            </div>
            
            <div id="imepay" class="payment-method" onclick="selectPaymentMethod('imepay')">
              <img src="images/payments/imepay.png" alt="IME Pay" class="payment-logo">
              <div class="payment-name">IME Pay</div>
            </div>
            
            <div id="fonepay" class="payment-method" onclick="selectPaymentMethod('fonepay')">
              <img src="images/payments/fonepay.png" alt="Fonepay" class="payment-logo">
              <div class="payment-name">Fonepay</div>
            </div>
            
            <div id="cod" class="payment-method" onclick="selectPaymentMethod('cod')">
              <img src="images/payments/cod.png" alt="Cash on Delivery" class="payment-logo">
              <div class="payment-name">Cash on Delivery</div>
            </div>
          </div>
        </div>
        
        <button type="submit" class="checkout-btn">Complete Order</button>
      </form>
    </div>
    
    <!-- Order Summary -->
    <div class="order-summary">
      <h3 class="summary-title">Order Summary</h3>
      
      <div class="cart-items">
        <div class="cart-item">
          <img src="images/products/shirt1.jpg" alt="Premium Cotton Shirt" class="item-image">
          <div class="item-details">
            <div class="item-name">Premium Cotton Shirt</div>
            <div class="item-variant">Size: L | Color: White</div>
            <div class="item-price">Rs. 2,500</div>
            <div class="item-quantity">Qty: 1</div>
          </div>
        </div>
        
        <div class="cart-item">
          <img src="images/products/jeans1.jpg" alt="Slim Fit Denim Jeans" class="item-image">
          <div class="item-details">
            <div class="item-name">Slim Fit Denim Jeans</div>
            <div class="item-variant">Size: 32 | Color: Blue</div>
            <div class="item-price">Rs. 3,200</div>
            <div class="item-quantity">Qty: 1</div>
          </div>
        </div>
      </div>
      
      <div class="summary-row">
        <span class="summary-label">Subtotal</span>
        <span class="summary-value">Rs. 5,700</span>
      </div>
      
      <div class="summary-row">
        <span class="summary-label">Shipping</span>
        <span class="summary-value">Rs. 150</span>
      </div>
      
      <div class="summary-row">
        <span class="summary-label">Tax (13% VAT)</span>
        <span class="summary-value">Rs. 741</span>
      </div>
      
      <div class="summary-total">
        <span class="total-label">Total</span>
        <span class="total-value">Rs. 6,591</span>
      </div>
      
      <div class="promo-code">
        <label class="form-label">Promo Code</label>
        <div class="promo-input">
          <input type="text" id="promo-code" placeholder="Enter promo code">
          <button type="button" onclick="applyPromoCode()">Apply</button>
        </div>
      </div>
      
      <div class="secure-checkout">
        <i class="fas fa-lock"></i> Secure Checkout
      </div>
    </div>
  </div>
  
  <!-- Product Suggestions -->
  <div class="suggestions-section">
    <h2 class="suggestions-title">You May Also Like</h2>
    
    <div class="suggestions-grid">
      <!-- Suggestion 1 -->
      <div class="suggestion-card">
        <img src="images/products/tshirt1.jpg" alt="Graphic Print T-Shirt" class="suggestion-image">
        <div class="suggestion-details">
          <div class="suggestion-category">Men's T-Shirts</div>
          <div class="suggestion-name">Graphic Print T-Shirt</div>
          <div class="suggestion-price">Rs. 1,200 <span class="suggestion-original-price">Rs. 1,500</span></div>
          <a href="#" class="add-to-cart" onclick="addToCart('tshirt1', 'Graphic Print T-Shirt')">Add to Cart</a>
        </div>
      </div>
      
      <!-- Suggestion 2 -->
      <div class="suggestion-card">
        <img src="images/products/dress1.jpg" alt="Floral Summer Dress" class="suggestion-image">
        <div class="suggestion-details">
          <div class="suggestion-category">Women's Dresses</div>
          <div class="suggestion-name">Floral Summer Dress</div>
          <div class="suggestion-price">Rs. 2,800 <span class="suggestion-original-price">Rs. 3,500</span></div>
          <a href="#" class="add-to-cart" onclick="addToCart('dress1', 'Floral Summer Dress')">Add to Cart</a>
        </div>
      </div>
      
      <!-- Suggestion 3 -->
      <div class="suggestion-card">
        <img src="images/products/hoodie1.jpg" alt="Casual Hoodie" class="suggestion-image">
        <div class="suggestion-details">
          <div class="suggestion-category">Unisex</div>
          <div class="suggestion-name">Casual Hoodie</div>
          <div class="suggestion-price">Rs. 1,800</div>
          <a href="#" class="add-to-cart" onclick="addToCart('hoodie1', 'Casual Hoodie')">Add to Cart</a>
        </div>
      </div>
      
      <!-- Suggestion 4 -->
      <div class="suggestion-card">
        <img src="images/products/accessory1.jpg" alt="Leather Belt" class="suggestion-image">
        <div class="suggestion-details">
          <div class="suggestion-category">Accessories</div>
          <div class="suggestion-name">Leather Belt</div>
          <div class="suggestion-price">Rs. 950 <span class="suggestion-original-price">Rs. 1,200</span></div>
          <a href="#" class="add-to-cart" onclick="addToCart('accessory1', 'Leather Belt')">Add to Cart</a>
        </div>
      </div>
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

    <!--  Quick links section -->
    <div class="footer-items">
      <h3>Quick Links</h3>
      <div class="border1"></div>
      <ul class="footcss">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="men.jsp">Men</a></li>
        <li><a href="women.jsp">Women</a></li>
        <li><a href="uuni.jsp">Unisex</a></li>
        <li><a href="sale.jsp">Sale</a></li>
      </ul>
    </div>

    <!--  Help & Support section -->
    <div class="footer-items">
      <h3>Help & Support</h3>
      <div class="border1"></div>
      <ul class="footcss">
        <li><a href="shipping.jsp">Shipping & Returns</a></li>
        <li><a href="size-guide.jsp">Size Guide</a></li>
        <li><a href="faq.jsp">FAQ</a></li>
        <li><a href="privacy-policy.jsp">Privacy Policy</a></li>
        <li><a href="terms.jsp">Terms & Conditions</a></li>
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
<!--   Footer Bottom end -->
<!--   FOOTER END -->

</body>
</html>