<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Wishlist - FashionGhar</title>
<meta name="description" content="FashionGhar - Where Classic Meets Cool. View and manage your wishlist.">
<meta name="keywords" content="HTML, CSS, JavaScript, wishlist, fashion">
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

/* Wishlist Page Specific Styles */
.wishlist-container {
  max-width: 1200px;
  margin: 40px auto;
  padding: 0 20px;
}

.wishlist-header {
  text-align: center;
  margin-bottom: 40px;
}

.wishlist-header h1 {
  font-size: 36px;
  color: var(--black);
  margin-bottom: 10px;
  position: relative;
  display: inline-block;
  padding-bottom: 15px;
}

.wishlist-header h1:after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 80px;
  height: 3px;
  background-color: var(--black);
}

.wishlist-header p {
  color: var(--dark-gray);
  font-size: 16px;
}

.wishlist-empty {
  text-align: center;
  padding: 60px 0;
  background-color: var(--light-gray);
  border-radius: 8px;
  margin-bottom: 30px;
}

.wishlist-empty i {
  font-size: 60px;
  color: var(--mid-gray);
  margin-bottom: 20px;
}

.wishlist-empty h2 {
  font-size: 24px;
  margin-bottom: 15px;
  color: var(--dark-gray);
}

.wishlist-empty p {
  margin-bottom: 25px;
  color: var(--mid-gray);
}

.wishlist-empty .btn {
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

.wishlist-empty .btn:hover {
  background-color: var(--dark-gray);
  transform: translateY(-2px);
}

.wishlist-items {
  display: grid;
  grid-template-columns: repeat(1, 1fr);
  gap: 20px;
}

.wishlist-item {
  display: flex;
  background-color: var(--white);
  border-radius: 8px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
  overflow: hidden;
  transition: all 0.3s ease;
  border: 1px solid var(--light-gray);
}

.wishlist-item:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.wishlist-item-image {
  flex: 0 0 180px;
  height: 180px;
}

.wishlist-item-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.wishlist-item-details {
  flex: 1;
  padding: 20px;
  display: flex;
  flex-direction: column;
}

.wishlist-item-title {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 5px;
}

.wishlist-item-meta {
  font-size: 14px;
  color: var(--mid-gray);
  margin-bottom: 5px;
}

.wishlist-item-price {
  font-size: 18px;
  font-weight: 600;
  margin: 5px 0 15px;
}

.wishlist-item-actions {
  display: flex;
  gap: 10px;
  margin-top: auto;
}

.wishlist-item-actions .btn {
  padding: 8px 15px;
  border-radius: 25px;
  font-size: 13px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 1px;
  text-decoration: none;
  text-align: center;
  transition: all 0.3s ease;
}

.wishlist-item-actions .btn-primary {
  background-color: var(--black);
  color: var(--white);
}

.wishlist-item-actions .btn-primary:hover {
  background-color: var(--dark-gray);
}

.wishlist-item-actions .btn-outline {
  background-color: transparent;
  color: var(--black);
  border: 1px solid var(--black);
}

.wishlist-item-actions .btn-outline:hover {
  background-color: var(--black);
  color: var(--white);
}

.wishlist-item-actions .btn-danger {
  background-color: #f44336;
  color: var(--white);
}

.wishlist-item-actions .btn-danger:hover {
  background-color: #d32f2f;
}

.wishlist-summary {
  margin-top: 40px;
  text-align: right;
}

.wishlist-summary .btn {
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
  margin-left: 10px;
}

.wishlist-summary .btn:hover {
  background-color: var(--dark-gray);
  transform: translateY(-2px);
}

.wishlist-summary .btn-outline {
  background-color: transparent;
  color: var(--black);
  border: 1px solid var(--black);
}

.wishlist-summary .btn-outline:hover {
  background-color: var(--black);
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
}

@media (max-width: 768px) {
  .nav-links ul {
    flex-wrap: wrap;
    justify-content: center;
  }
  
  .nav-links ul li {
    margin: 5px 10px;
  }
  
  .wishlist-item {
    flex-direction: column;
  }
  
  .wishlist-item-image {
    flex: 0 0 auto;
    height: 200px;
    width: 100%;
  }
}

@media (max-width: 480px) {
  .wishlist-item-actions {
    flex-direction: column;
  }
  
  .wishlist-summary {
    text-align: center;
  }
  
  .wishlist-summary .btn {
    display: block;
    margin: 10px 0;
  }
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

// Function to remove item from wishlist
function removeFromWishlist(itemId) {
  // In a real application, you would send an AJAX request to remove the item
  // For this example, we'll just hide the element
  document.getElementById('wishlist-item-' + itemId).style.display = 'none';
  
  // Check if there are any visible wishlist items left
  var items = document.querySelectorAll('.wishlist-item');
  var visibleItems = 0;
  
  for (var i = 0; i < items.length; i++) {
    if (items[i].style.display !== 'none') {
      visibleItems++;
    }
  }
  
  // If no visible items, show the empty wishlist message
  if (visibleItems === 0) {
    document.getElementById('wishlist-items').style.display = 'none';
    document.getElementById('wishlist-summary').style.display = 'none';
    document.getElementById('wishlist-empty').style.display = 'block';
  }
}

// Function to add item to cart
function addToCart(itemId) {
  // In a real application, you would send an AJAX request to add the item to cart
  alert('Item added to cart!');
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

<!-- Wishlist Content -->
<div class="wishlist-container">
  <div class="wishlist-header">
    <h1>My Wishlist</h1>
    <p>Items you've saved for later</p>
  </div>
  
  <!-- Empty wishlist message (hidden by default) -->
  <div id="wishlist-empty" class="wishlist-empty" style="display: none;">
    <i class="far fa-heart"></i>
    <h2>Your wishlist is empty</h2>
    <p>Add items to your wishlist to save them for later.</p>
    <a href="Home.jsp" class="btn">Continue Shopping</a>
  </div>
  
  <!-- Wishlist items -->
  <div id="wishlist-items" class="wishlist-items">
    <!-- Item 1 -->
    <div id="wishlist-item-1" class="wishlist-item">
      <div class="wishlist-item-image">
        <img src="Images/dress.jpg" alt="Chiffon Dress">
      </div>
      <div class="wishlist-item-details">
        <h3 class="wishlist-item-title">Chiffon Dress</h3>
        <p class="wishlist-item-meta">Size: M | Color: Floral | 100% Chiffon</p>
        <p class="wishlist-item-price">Rs. 5,999</p>
        <div class="wishlist-item-actions">
          <a href="#" class="btn btn-primary" onclick="addToCart(1); return false;">Add to Cart</a>
          <a href="ForHer.jsp" class="btn btn-outline">View Details</a>
          <a href="#" class="btn btn-danger" onclick="removeFromWishlist(1); return false;">Remove</a>
        </div>
      </div>
    </div>
    
    <!-- Item 2 -->
    <div id="wishlist-item-2" class="wishlist-item">
      <div class="wishlist-item-image">
        <img src="Images/shirt.jpg" alt="Formal Shirt">
      </div>
      <div class="wishlist-item-details">
        <h3 class="wishlist-item-title">Formal Shirt</h3>
        <p class="wishlist-item-meta">Size: L | Color: White | Cotton Blend</p>
        <p class="wishlist-item-price">Rs. 3,499</p>
        <div class="wishlist-item-actions">
          <a href="#" class="btn btn-primary" onclick="addToCart(2); return false;">Add to Cart</a>
          <a href="ForHim.jsp" class="btn btn-outline">View Details</a>
          <a href="#" class="btn btn-danger" onclick="removeFromWishlist(2); return false;">Remove</a>
        </div>
      </div>
    </div>
    
    <!-- Item 3 -->
    <div id="wishlist-item-3" class="wishlist-item">
      <div class="wishlist-item-image">
        <img src="Images/hoodie.jpg" alt="Cozy Hoodie">
      </div>
      <div class="wishlist-item-details">
        <h3 class="wishlist-item-title">Cozy Hoodie</h3>
        <p class="wishlist-item-meta">Size: XL | Color: Black | Cotton Blend</p>
        <p class="wishlist-item-price">Rs. 2,499</p>
        <div class="wishlist-item-actions">
          <a href="#" class="btn btn-primary" onclick="addToCart(3); return false;">Add to Cart</a>
          <a href="ForHim.jsp" class="btn btn-outline">View Details</a>
          <a href="#" class="btn btn-danger" onclick="removeFromWishlist(3); return false;">Remove</a>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Wishlist summary -->
  <div id="wishlist-summary" class="wishlist-summary">
    <a href="Home.jsp" class="btn btn-outline">Continue Shopping</a>
    <a href="#" class="btn">Add All to Cart</a>
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
        <li><a href="contact.jsp">Contact Us</a></li>
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