<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.versace.databaseConnection.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FashionGhar - Women's Collection</title>
<meta name="description" content="FashionGhar - Women's Collection. Premium monochromatic fashion.">
<meta name="keywords" content="fashion, women's clothing, premium, FashionGhar">
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

/* Banner Styles */
.banner {
  position: relative;
  width: 100%;
  height: 300px;
  overflow: hidden;
  margin-bottom: 40px;
}

.banner img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center;
}

.banner-caption {
  position: absolute;
  bottom: 50px;
  left: 50px;
  background-color: rgba(0, 0, 0, 0.75);
  padding: 25px 40px;
  max-width: 500px;
  border-radius: 4px;
}

.banner-caption h1 {
  font-size: 36px;
  margin-bottom: 10px;
  color: var(--white);
}

.banner-caption p {
  font-size: 18px;
  color: var(--light-gray);
}

/* Main Products Section Styles */
.main-products {
  padding: 40px 0;
  background-color: var(--white);
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

.section-title {
  text-align: center;
  font-size: 32px;
  margin-bottom: 40px;
  color: var(--black);
  position: relative;
  padding-bottom: 15px;
}

.section-title:after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 80px;
  height: 3px;
  background-color: var(--black);
}

.product-boxes {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 30px;
}

.product-box {
  background-color: var(--white);
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
  border: 1px solid var(--light-gray);
}

.product-box:hover {
  transform: translateY(-5px);
}

.product-image {
  position: relative;
  height: 300px;
  overflow: hidden;
}

.product-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s ease;
}

.product-box:hover .product-image img {
  transform: scale(1.05);
}

.product-badge {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: var(--black);
  color: var(--white);
  padding: 5px 10px;
  font-size: 12px;
  border-radius: 4px;
  font-weight: 500;
  text-transform: uppercase;
}

.product-info {
  padding: 20px;
}

.product-info h3 {
  font-size: 18px;
  margin-bottom: 10px;
  color: var(--black);
}

.price {
  font-size: 24px;
  font-weight: 600;
  color: var(--black);
  margin-bottom: 15px;
}

.product-actions {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.quantity-selector {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 10px;
}

.quantity-selector label {
  font-size: 14px;
  font-weight: 500;
}

.quantity-selector input {
  width: 60px;
  padding: 5px;
  border: 1px solid var(--light-gray);
  border-radius: 4px;
  text-align: center;
}

.add-to-cart, .checkout {
  padding: 12px;
  border: none;
  border-radius: 25px;
  cursor: pointer;
  font-weight: 500;
  font-size: 14px;
  transition: all 0.3s ease;
  text-transform: uppercase;
  letter-spacing: 1px;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 5px;
}

.add-to-cart {
  background-color: var(--black);
  color: var(--white);
}

.checkout {
  background-color: var(--white);
  color: var(--black);
  border: 1px solid var(--black);
}

.add-to-cart:hover {
  background-color: var(--dark-gray);
}

.checkout:hover {
  background-color: var(--light-gray);
}

/* Popup Message Styles */
.popup-message {
  position: fixed;
  top: 20px;
  right: 20px;
  background-color: var(--black);
  color: var(--white);
  padding: 15px 25px;
  border-radius: 4px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  z-index: 1000;
  display: none;
  animation: slideIn 0.5s ease-out;
}

@keyframes slideIn {
  from {
    transform: translateX(100%);
    opacity: 0;
  }
  to {
    transform: translateX(0);
    opacity: 1;
  }
}

/* Footer Styles */
.footer {
  background-color: var(--black);
  padding: 60px 0 0;
  margin-top: 40px;
}

.inner-footer {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
  padding: 0 50px;
}

.footer-items {
  width: 30%;
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

/* Responsive Adjustments */
@media (max-width: 1200px) {
  .product-boxes {
    grid-template-columns: repeat(3, 1fr);
  }
}

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
  
  .product-boxes {
    grid-template-columns: repeat(2, 1fr);
  }
  
  .footer-items {
    width: 100%;
    text-align: center;
  }
  
  .border1 {
    margin: 0 auto 20px;
  }
  
  .banner-caption {
    left: 20px;
    right: 20px;
    bottom: 20px;
    max-width: none;
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
}

@media (max-width: 576px) {
  .product-boxes {
    grid-template-columns: 1fr;
  }
  
  .product-image {
    height: 250px;
  }
  
  .banner-caption h1 {
    font-size: 28px;
  }
  
  .banner-caption p {
    font-size: 16px;
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

// Popup message functionality
function showPopup(message) {
  const popup = document.createElement('div');
  popup.className = 'popup-message';
  popup.textContent = message;
  document.body.appendChild(popup);
  
  // Show the popup
  popup.style.display = 'block';
  
  // Remove the popup after 3 seconds
  setTimeout(() => {
    popup.style.display = 'none';
    document.body.removeChild(popup);
  }, 3000);
}

// Add event listeners to all add to cart forms
document.addEventListener('DOMContentLoaded', function() {
  const addToCartForms = document.querySelectorAll('form[action="AddToCart"]');
  addToCartForms.forEach(form => {
    form.addEventListener('submit', function(e) {
      e.preventDefault();
      const productName = this.querySelector('input[name="productName"]').value;
      const quantity = this.querySelector('input[name="quantity"]').value;
      
      // Show popup message
      showPopup(`${productName} (${quantity}) has been added to cart!`);
      
      // Submit the form after showing popup
      setTimeout(() => {
        this.submit();
      }, 100);
    });
  });
});
</script>
</head>
<body>
<!-- for sign in/ log in -->

<hr>

<!-- for navigation -->
<div class="main">
  <nav class="stroke">
    <!-- for logo -->
    <div class="logo">
      <a href="website.html">
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

<!-- Banner Section -->
<div class="banner">
  <img src="Images/women.jpg" alt="Women's Collection Banner">
  <div class="banner-caption">
    <h1>Women's Collection</h1>
    <p>Discover our premium selection of women's clothing - where style meets comfort</p>
  </div>
</div>

<!-- Main Product Section -->
<section class="main-products">
  <div class="container">
    <h2 class="section-title">Featured Products</h2>
    
    <div class="product-boxes">
      <!-- Product Box 1 -->
      <div class="product-box">
        <div class="product-image">
          <img src="Images/p1.webp" alt="Product 1">
          <div class="product-badge">New</div>
        </div>
        <div class="product-info">
          <h3>Elegant Black Dress</h3>
          <p class="price">Rs. 2,499</p>
          <div class="product-actions">
            <form action="AddToCart" method="post">
              <input type="hidden" name="productId" value="1">
              <input type="hidden" name="productName" value="Elegant Black Dress">
              <input type="hidden" name="price" value="2499">
              <div class="quantity-selector">
                <label for="qty1">Quantity:</label>
                <input type="number" id="qty1" name="quantity" value="1" min="1" max="99">
              </div>
              <button type="submit" class="add-to-cart">
                <i class="fas fa-shopping-cart"></i> Add to Cart
              </button>
            </form>
            <form action="checkoutPage.jsp" method="post">
              <input type="hidden" name="productId" value="1">
              <input type="hidden" name="quantity" value="1">
              <button type="submit" class="checkout">
                <i class="fas fa-credit-card"></i> Checkout
              </button>
            </form>
          </div>
        </div>
      </div>

      <!-- Product Box 2 -->
      <div class="product-box">
        <div class="product-image">
          <img src="Images/f3.webp" alt="Product 2">
          <div class="product-badge">Sale</div>
        </div>
        <div class="product-info">
          <h3>Casual White Top</h3>
          <p class="price">Rs. 1,299</p>
          <div class="product-actions">
            <form action="AddToCart" method="post">
              <input type="hidden" name="productId" value="2">
              <input type="hidden" name="productName" value="Casual White Top">
              <input type="hidden" name="price" value="1299">
              <div class="quantity-selector">
                <label for="qty2">Quantity:</label>
                <input type="number" id="qty2" name="quantity" value="1" min="1" max="99">
              </div>
              <button type="submit" class="add-to-cart">
                <i class="fas fa-shopping-cart"></i> Add to Cart
              </button>
            </form>
            <form action="checkoutPage.jsp" method="post">
              <input type="hidden" name="productId" value="2">
              <input type="hidden" name="quantity" value="1">
              <button type="submit" class="checkout">
                <i class="fas fa-credit-card"></i> Checkout
              </button>
            </form>
          </div>
        </div>
      </div>

      <!-- Product Box 3 -->
      <div class="product-box">
        <div class="product-image">
          <img src="Images/f5.webp" alt="Product 3">
        </div>
        <div class="product-info">
          <h3>Designer Jeans</h3>
          <p class="price">Rs. 3,999</p>
          <div class="product-actions">
            <form action="AddToCart" method="post">
              <input type="hidden" name="productId" value="3">
              <input type="hidden" name="productName" value="Designer Jeans">
              <input type="hidden" name="price" value="3999">
              <div class="quantity-selector">
                <label for="qty3">Quantity:</label>
                <input type="number" id="qty3" name="quantity" value="1" min="1" max="99">
              </div>
              <button type="submit" class="add-to-cart">
                <i class="fas fa-shopping-cart"></i> Add to Cart
              </button>
            </form>
            <form action="checkoutPage.jsp" method="post">
              <input type="hidden" name="productId" value="3">
              <input type="hidden" name="quantity" value="1">
              <button type="submit" class="checkout">
                <i class="fas fa-credit-card"></i> Checkout
              </button>
            </form>
          </div>
        </div>
      </div>

      <!-- Product Box 4 -->
      <div class="product-box">
        <div class="product-image">
          <img src="Images/slider3.jpg" alt="Product 4">
          <div class="product-badge">New</div>
        </div>
        <div class="product-info">
          <h3>Summer Collection</h3>
          <p class="price">Rs. 1,999</p>
          <div class="product-actions">
            <form action="AddToCart" method="post">
              <input type="hidden" name="productId" value="4">
              <input type="hidden" name="productName" value="Summer Collection">
              <input type="hidden" name="price" value="1999">
              <div class="quantity-selector">
                <label for="qty4">Quantity:</label>
                <input type="number" id="qty4" name="quantity" value="1" min="1" max="99">
              </div>
              <button type="submit" class="add-to-cart">
                <i class="fas fa-shopping-cart"></i> Add to Cart
              </button>
            </form>
            <form action="checkoutPage.jsp" method="post">
              <input type="hidden" name="productId" value="4">
              <input type="hidden" name="quantity" value="1">
              <button type="submit" class="checkout">
                <i class="fas fa-credit-card"></i> Checkout
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- for scroll up button -->
<a class="gotopbtn" href="#"><i class="fa fa-arrow-up" aria-hidden="true"></i></a>

<!--  FOOTER START -->
<div class="footer">
  <div class="inner-footer">
    <!--  for company name and description -->
    <div class="footer-items">
      <h1>FashionGhar</h1>
      <p>Where Classic Meets Cool</p>
    </div>

    <!--  for contact us info -->
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
        <a href="#"><i class="fab fa-google-plus-square"></i></a>
      </div> 
    </div>
  </div>
  
  <!--   Footer Bottom start  -->
  <div class="footer-bottom">
    Copyright &copy; Developed By FashionGhar
  </div>
</div>
<!--   Footer Bottom end -->
<!--   FOOTER END -->

</body>
</html>