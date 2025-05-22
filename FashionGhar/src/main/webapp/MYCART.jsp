<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Cart - FashionGhar</title>
<meta name="description" content="FashionGhar - Where Classic Meets Cool. Premium monochromatic fashion.">
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
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Montserrat', sans-serif;
  color: var(--text);
}

body {
  background-color: var(--white);
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

/* Cart Page Specific Styles */
.cart-container {
  max-width: 1200px;
  margin: 40px auto;
  padding: 0 20px;
}

.cart-header {
  text-align: center;
  margin-bottom: 40px;
}

.cart-header h1 {
  font-size: 36px;
  font-weight: 600;
  margin-bottom: 10px;
  color: var(--black);
}

.cart-header p {
  color: var(--mid-gray);
  font-size: 16px;
}

.cart-empty {
  text-align: center;
  padding: 60px 0;
  background-color: var(--light-gray);
  border-radius: 8px;
  margin-bottom: 30px;
}

.cart-empty i {
  font-size: 60px;
  color: var(--mid-gray);
  margin-bottom: 20px;
}

.cart-empty h2 {
  font-size: 24px;
  margin-bottom: 15px;
}

.cart-empty p {
  margin-bottom: 25px;
  color: var(--mid-gray);
}

.cart-empty .btn {
  display: inline-block;
  padding: 12px 25px;
  background-color: var(--black);
  color: var(--white);
  border-radius: 25px;
  transition: all 0.3s ease;
  font-weight: 500;
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 1px;
  text-decoration: none;
}

.cart-empty .btn:hover {
  background-color: var(--dark-gray);
  transform: translateY(-2px);
}

.cart-items {
  margin-bottom: 30px;
}

.cart-item {
  display: flex;
  align-items: center;
  padding: 20px;
  border-bottom: 1px solid var(--light-gray);
  position: relative;
}

.cart-item:last-child {
  border-bottom: none;
}

.cart-item-image {
  width: 120px;
  height: 120px;
  border-radius: 8px;
  overflow: hidden;
  margin-right: 20px;
  flex-shrink: 0;
}

.cart-item-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.cart-item-details {
  flex: 1;
}

.cart-item-name {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 5px;
}

.cart-item-meta {
  font-size: 14px;
  color: var(--mid-gray);
  margin-bottom: 10px;
}

.cart-item-price {
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 10px;
}

.cart-item-quantity {
  display: flex;
  align-items: center;
}

.quantity-btn {
  width: 30px;
  height: 30px;
  background-color: var(--light-gray);
  border: none;
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.3s ease;
}

.quantity-btn:hover {
  background-color: var(--mid-gray);
  color: var(--white);
}

.quantity-input {
  width: 40px;
  height: 30px;
  text-align: center;
  margin: 0 10px;
  border: 1px solid var(--light-gray);
  border-radius: 4px;
}

.cart-item-remove {
  position: absolute;
  top: 20px;
  right: 20px;
  background: none;
  border: none;
  cursor: pointer;
  font-size: 16px;
  color: var(--mid-gray);
  transition: all 0.3s ease;
}

.cart-item-remove:hover {
  color: #ff0000;
}

.cart-summary {
  background-color: var(--light-gray);
  padding: 30px;
  border-radius: 8px;
  margin-bottom: 30px;
}

.summary-row {
  display: flex;
  justify-content: space-between;
  margin-bottom: 15px;
}

.summary-row:last-child {
  margin-bottom: 0;
  padding-top: 15px;
  border-top: 1px solid var(--mid-gray);
}

.summary-label {
  font-weight: 500;
}

.summary-value {
  font-weight: 600;
}

.cart-actions {
  display: flex;
  justify-content: space-between;
  margin-bottom: 60px;
}

.continue-shopping {
  display: inline-block;
  padding: 12px 25px;
  background-color: transparent;
  color: var(--black);
  border: 1px solid var(--black);
  border-radius: 25px;
  transition: all 0.3s ease;
  font-weight: 500;
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 1px;
  text-decoration: none;
}

.continue-shopping:hover {
  background-color: var(--black);
  color: var(--white);
}

.checkout-btn {
  display: inline-block;
  padding: 12px 25px;
  background-color: var(--black);
  color: var(--white);
  border: none;
  border-radius: 25px;
  transition: all 0.3s ease;
  font-weight: 500;
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 1px;
  text-decoration: none;
  cursor: pointer;
}

.checkout-btn:hover {
  background-color: var(--dark-gray);
  transform: translateY(-2px);
}

.recommended-products {
  margin-bottom: 60px;
}

.recommended-header {
  text-align: center;
  margin-bottom: 30px;
}

.recommended-header h2 {
  font-size: 28px;
  font-weight: 600;
  margin-bottom: 10px;
}

.recommended-header p {
  color: var(--mid-gray);
}

.recommended-items {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
}

.recommended-item {
  border: 1px solid var(--light-gray);
  border-radius: 8px;
  overflow: hidden;
  transition: all 0.3s ease;
}

.recommended-item:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.recommended-item-image {
  height: 200px;
  overflow: hidden;
}

.recommended-item-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s ease;
}

.recommended-item:hover .recommended-item-image img {
  transform: scale(1.05);
}

.recommended-item-details {
  padding: 15px;
}

.recommended-item-name {
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 5px;
}

.recommended-item-price {
  font-size: 14px;
  font-weight: 600;
  margin-bottom: 10px;
}

.add-to-cart-btn {
  display: block;
  width: 100%;
  padding: 8px 0;
  background-color: var(--black);
  color: var(--white);
  border: none;
  border-radius: 4px;
  transition: all 0.3s ease;
  font-weight: 500;
  font-size: 13px;
  text-transform: uppercase;
  letter-spacing: 1px;
  text-align: center;
  text-decoration: none;
  cursor: pointer;
}

.add-to-cart-btn:hover {
  background-color: var(--dark-gray);
}

/* Coupon Code Section */
.coupon-section {
  margin-bottom: 30px;
  display: flex;
  align-items: center;
}

.coupon-input {
  flex: 1;
  padding: 12px 15px;
  border: 1px solid var(--light-gray);
  border-radius: 4px;
  margin-right: 10px;
  outline: none;
  transition: all 0.3s ease;
}

.coupon-input:focus {
  border-color: var(--mid-gray);
}

.apply-coupon-btn {
  padding: 12px 20px;
  background-color: var(--black);
  color: var(--white);
  border: none;
  border-radius: 4px;
  transition: all 0.3s ease;
  font-weight: 500;
  font-size: 14px;
  text-transform: uppercase;
  letter-spacing: 1px;
  cursor: pointer;
}

.apply-coupon-btn:hover {
  background-color: var(--dark-gray);
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
  
  .recommended-items {
    grid-template-columns: repeat(2, 1fr);
  }
  
  .cart-actions {
    flex-direction: column;
    gap: 15px;
  }
  
  .continue-shopping, .checkout-btn {
    width: 100%;
    text-align: center;
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
  
  .cart-item {
    flex-direction: column;
    align-items: flex-start;
  }
  
  .cart-item-image {
    margin-bottom: 15px;
    margin-right: 0;
  }
  
  .cart-item-remove {
    top: 20px;
    right: 20px;
  }
  
  .recommended-items {
    grid-template-columns: 1fr;
  }
  
  .coupon-section {
    flex-direction: column;
  }
  
  .coupon-input {
    width: 100%;
    margin-right: 0;
    margin-bottom: 10px;
  }
  
  .apply-coupon-btn {
    width: 100%;
  }
}

@media (max-width: 480px) {
  .cart-header h1 {
    font-size: 28px;
  }
  
  .cart-summary {
    padding: 20px;
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

// Function to update quantity
function updateQuantity(itemId, change) {
  var inputElement = document.getElementById('quantity-' + itemId);
  var currentValue = parseInt(inputElement.value);
  var newValue = currentValue + change;
  
  if (newValue >= 1) {
    inputElement.value = newValue;
    // You would typically make an AJAX call here to update the cart on the server
    updateItemTotal(itemId);
    updateCartTotal();
  }
}

// Function to update item total price
function updateItemTotal(itemId) {
  var quantityElement = document.getElementById('quantity-' + itemId);
  var priceElement = document.getElementById('price-' + itemId);
  var totalElement = document.getElementById('total-' + itemId);
  
  var quantity = parseInt(quantityElement.value);
  var price = parseFloat(priceElement.getAttribute('data-price'));
  
  var total = quantity * price;
  totalElement.textContent = 'Rs. ' + total.toFixed(2);
}

// Function to update cart total
function updateCartTotal() {
  var subtotal = 0;
  var itemTotals = document.querySelectorAll('[id^="total-"]');
  
  itemTotals.forEach(function(element) {
    var value = element.textContent.replace('Rs. ', '');
    subtotal += parseFloat(value);
  });
  
  var shipping = 150; // Fixed shipping cost
  var total = subtotal + shipping;
  
  document.getElementById('subtotal-value').textContent = 'Rs. ' + subtotal.toFixed(2);
  document.getElementById('total-value').textContent = 'Rs. ' + total.toFixed(2);
}

// Function to remove item from cart
function removeItem(itemId) {
  var itemElement = document.getElementById('item-' + itemId);
  itemElement.remove();
  
  // Check if cart is empty
  var cartItems = document.querySelectorAll('.cart-item');
  if (cartItems.length === 0) {
    document.getElementById('cart-items-container').style.display = 'none';
    document.getElementById('cart-empty-container').style.display = 'block';
  }
  
  updateCartTotal();
}

// Function to apply coupon
function applyCoupon() {
  var couponInput = document.getElementById('coupon-input');
  var couponCode = couponInput.value.trim();
  
  if (couponCode === 'FASHION20') {
    alert('Coupon applied successfully! 20% discount has been applied to your order.');
    // Here you would update the cart total with the discount
  } else {
    alert('Invalid coupon code. Please try again.');
  }
}
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
    <a href="user.html">Edit</a>
    <a href="user.html">Change password</a>
    <a href="user.html">Logout</a>
    <a href="user.html">Settings</a>
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

<!-- Cart Content Section -->
<div class="cart-container">
  <div class="cart-header">
    <h1>Your Shopping Cart</h1>
    <p>Review your items and proceed to checkout</p>
  </div>
  
  <!-- Empty Cart (hidden by default, shown when cart is empty) -->
  <div id="cart-empty-container" class="cart-empty" style="display: none;">
    <i class="fas fa-shopping-cart"></i>
    <h2>Your cart is empty</h2>
    <p>Looks like you haven't added anything to your cart yet.</p>
    <a href="Home.jsp" class="btn">Continue Shopping</a>
  </div>
  
  <!-- Cart Items -->
  <div id="cart-items-container">
    <div class="cart-items">
      <!-- Cart Item 1 -->
      <c:forEach var="item" items="${cartItems}" varStatus="status">
        <div id="item-${status.index + 1}" class="cart-item">
          <div class="cart-item-image">
            <img src="${item.imageUrl}" alt="${item.name}">
          </div>
          <div class="cart-item-details">
            <h3 class="cart-item-name">${item.name}</h3>
            <p class="cart-item-meta">${item.size} | ${item.color} | ${item.material}</p>
            <p class="cart-item-price" id="price-${status.index + 1}" data-price="${item.price}">Rs. ${item.price}</p>
            <div class="cart-item-quantity">
              <button class="quantity-btn" onclick="updateQuantity(${status.index + 1}, -1)">-</button>
              <input type="number" id="quantity-${status.index + 1}" class="quantity-input" value="${item.quantity}" min="1" readonly>
              <button class="quantity-btn" onclick="updateQuantity(${status.index + 1}, 1)">+</button>
            </div>
          </div>
          <p class="cart-item-price" id="total-${status.index + 1}">Rs. ${item.price * item.quantity}</p>
          <button class="cart-item-remove" onclick="removeItem(${status.index + 1})">
            <i class="fas fa-times"></i>
          </button>
        </div>
      </c:forEach>
      
      <!-- If no items in cart from server, show these demo items -->
      <c:if test="${empty cartItems}">
        <div id="item-1" class="cart-item">
          <div class="cart-item-image">
            <img src="Images/dress.jpg" alt="Chiffon Dress">
          </div>
          <div class="cart-item-details">
            <h3 class="cart-item-name">Chiffon Dress</h3>
            <p class="cart-item-meta">S | Floral | 100% Chiffon</p>
            <p class="cart-item-price" id="price-1" data-price="5999">Rs. 5,999</p>
            <div class="cart-item-quantity">
              <button class="quantity-btn" onclick="updateQuantity(1, -1)">-</button>
              <input type="number" id="quantity-1" class="quantity-input" value="1" min="1" readonly>
              <button class="quantity-btn" onclick="updateQuantity(1, 1)">+</button>
            </div>
          </div>
          <p class="cart-item-price" id="total-1">Rs. 5,999</p>
          <button class="cart-item-remove" onclick="removeItem(1)">
            <i class="fas fa-times"></i>
          </button>
        </div>
        
        <div id="item-2" class="cart-item">
          <div class="cart-item-image">
            <img src="Images/shirt.jpg" alt="Formal Shirt">
          </div>
          <div class="cart-item-details">
            <h3 class="cart-item-name">Formal Shirt</h3>
            <p class="cart-item-meta">L | Black | Cotton Blend</p>
            <p class="cart-item-price" id="price-2" data-price="3499">Rs. 3,499</p>
            <div class="cart-item-quantity">
              <button class="quantity-btn" onclick="updateQuantity(2, -1)">-</button>
              <input type="number" id="quantity-2" class="quantity-input" value="2" min="1" readonly>
              <button class="quantity-btn" onclick="updateQuantity(2, 1)">+</button>
            </div>
          </div>
          <p class="cart-item-price" id="total-2">Rs. 6,998</p>
          <button class="cart-item-remove" onclick="removeItem(2)">
            <i class="fas fa-times"></i>
          </button>
        </div>
      </c:if>
    </div>
    
    <!-- Coupon Code Section -->
    <div class="coupon-section">
      <input type="text" id="coupon-input" class="coupon-input" placeholder="Enter coupon code">
      <button class="apply-coupon-btn" onclick="applyCoupon()">Apply Coupon</button>
    </div>
    
    <!-- Cart Summary -->
    <div class="cart-summary">
      <div class="summary-row">
        <span class="summary-label">Subtotal</span>
        <span class="summary-value" id="subtotal-value">Rs. 12,997</span>
      </div>
      <div class="summary-row">
        <span class="summary-label">Shipping</span>
        <span class="summary-value">Rs. 150</span>
      </div>
      <div class="summary-row">
        <span class="summary-label">Total</span>
        <span class="summary-value" id="total-value">Rs. 13,147</span>
      </div>
    </div>
    
    <!-- Cart Actions -->
    <div class="cart-actions">
      <a href="Home.jsp" class="continue-shopping">Continue Shopping</a>
      <a href="checkout.jsp" class="checkout-btn">Proceed to Checkout</a>
    </div>
  </div>
  
  <!-- Recommended Products -->
  <div class="recommended-products">
    <div class="recommended-header">
      <h2>You May Also Like</h2>
      <p>Based on your shopping preferences</p>
    </div>
    
    <div class="recommended-items">
      <!-- Recommended Item 1 -->
      <div class="recommended-item">
        <div class="recommended-item-image">
          <img src="Images/hoodie.jpg" alt="Cozy Hoodie">
        </div>
        <div class="recommended-item-details">
          <h3 class="recommended-item-name">Cozy Hoodie</h3>
          <p class="recommended-item-price">Rs. 2,499</p>
          <a href="#" class="add-to-cart-btn">Add to Cart</a>
        </div>
      </div>
      
      <!-- Recommended Item 2 -->
      <div class="recommended-item">
        <div class="recommended-item-image">
          <img src="Images/pant.jpg" alt="Slim-Fit Pants">
        </div>
        <div class="recommended-item-details">
          <h3 class="recommended-item-name">Slim-Fit Pants</h3>
          <p class="recommended-item-price">Rs. 2,799</p>
          <a href="#" class="add-to-cart-btn">Add to Cart</a>
        </div>
      </div>
      
      <!-- Recommended Item 3 -->
      <div class="recommended-item">
        <div class="recommended-item-image">
          <img src="Images/crop.jpg" alt="Floral Crop">
        </div>
        <div class="recommended-item-details">
          <h3 class="recommended-item-name">Floral Crop</h3>
          <p class="recommended-item-price">Rs. 1,999</p>
          <a href="#" class="add-to-cart-btn">Add to Cart</a>
        </div>
      </div>
      
      <!-- Recommended Item 4 -->
      <div class="recommended-item">
        <div class="recommended-item-image">
          <img src="Images/overcoat.jpg" alt="Premium Over-Coat">
        </div>
        <div class="recommended-item-details">
          <h3 class="recommended-item-name">Premium Over-Coat</h3>
          <p class="recommended-item-price">Rs. 8,999</p>
          <a href="#" class="add-to-cart-btn">Add to Cart</a>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- for scroll up button -->
<a class="gotopbtn" href="#"><i class="fa fa-arrow-up" aria-hidden="true"></i></a>

<!--  FOOTER START -->
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
        <li><a href="Uuni.jsp">Unisex Styles</a></li>
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
<!--   Footer Bottom end -->
<!--   FOOTER END -->

</body>
</html>