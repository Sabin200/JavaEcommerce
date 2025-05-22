<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FashionGhar - Where Classic Meets Cool</title>
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

/* Carousel Styles */
.carousel {
  position: relative;
  width: 100%;
  height: 600px;
  min-height: 600px;
  max-height: 600px;
  margin: 0 auto;
  overflow: hidden;
}
.carousel-button {
  position: absolute;
  z-index: 2;
  background: none;
  border: none;
  font-size: 2.5rem;
  top: 50%;
  transform: translateY(-50%);
  color: var(--white);
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0.6);
  border-radius: 50%;
  padding: 0 12px;
  transition: all 0.3s ease;
}

.carousel-button:hover {
  background-color: var(--black);
}

.carousel-button.prev {
  left: 1rem;
}

.carousel-button.next {
  right: 1rem;
}

[data-slides] {
  list-style: none;
  margin: 0;
  padding: 0;
}

.slide {
  position: absolute;
  inset: 0;
  opacity: 0;
  transition: opacity 0.5s ease-in-out;
}

.slide[data-active] {
  opacity: 1;
}

.slide img {
  width: 100%;
  height: 600px;  /* Fixed height */
  object-fit: cover;
  object-position: center;
  filter: none;
}

.captionslider {
  position: absolute;
  bottom: 100px;
  left: 50px;
  background-color: rgba(0, 0, 0, 0.75);
  padding: 25px 40px;
  max-width: 500px;
  border-radius: 4px;
}

.captionslider h2 {
  font-size: 30px;
  margin-bottom: 10px;
  color: var(--white);
}

.captionslider p {
  font-size: 18px;
  color: var(--light-gray);
}

/* Products Section - UPDATED CSS START */
.category {
  padding: 80px 50px;
  background-color: var(--white);
}

.heading {
  text-align: center;
  font-size: 36px;
  margin-bottom: 50px;
  color: var(--black);
  position: relative;
  padding-bottom: 15px;
}

.heading:after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 80px;
  height: 3px;
  background-color: var(--black);
}

/* MODIFIED: Changed to 2 columns layout with wider boxes */
.box-container {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 30px;
  max-width: 1200px;
  margin: 0 auto;
}

/* MODIFIED: Made boxes wider and shorter */
.box-container .box {
  background-color: var(--white);
  border-radius: 8px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
  border: 1px solid var(--light-gray);
  min-height: 380px;
  display: flex;
  flex-direction: column;
  overflow: hidden;
  padding: 0;
}

.box-container .box:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

/* MODIFIED: Made image container shorter */
.box-container .box .image-container {
  position: relative;
  width: 100%;
  height: 220px;
  overflow: hidden;
}

.box-container .box .image-container img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s ease;
}

.box-container .box:hover .image-container img {
  transform: scale(1.05);
}

.box-container .box .content {
  padding: 15px 20px;
  display: flex;
  flex-direction: column;
  flex-grow: 1;
  background-color: var(--white);
}

.box-container .box h3 {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 5px;
  color: var(--black);
  letter-spacing: 0.5px;
}

.box-container .box .product-desc {
  font-size: 14px;
  margin-bottom: 5px;
  line-height: 1.4;
  color: var(--dark-gray);
}

.box-container .box .product-meta {
  font-size: 13px;
  color: var(--mid-gray);
  margin-bottom: 8px;
  font-weight: 500;
}

.box-container .box .product-price {
  font-size: 16px;
  margin: 3px 0 8px;
  color: var(--black);
}

.box-container .box .rating {
  margin: 3px 0 10px;
}

.box-container .box .checked {
  color: var(--dark-gray);
}

/* MODIFIED: Added button container for multiple buttons */
.box-container .box .button-container {
  display: flex;
  gap: 10px;
  margin-top: auto;
  justify-content: center;
}

.box-container .box .btn {
  display: inline-block;
  padding: 8px 15px;
  background-color: var(--black);
  color: var(--white);
  border-radius: 25px;
  transition: all 0.3s ease;
  font-weight: 500;
  font-size: 13px;
  text-transform: uppercase;
  letter-spacing: 1px;
  flex: 1;
  text-align: center;
  max-width: 120px;
}

.box-container .box .btn:hover {
  background-color: var(--dark-gray);
  transform: translateY(-2px);
}

/* MODIFIED: Added style for View More button */
.box-container .box .btn-outline {
  background-color: transparent;
  color: var(--black);
  border: 1px solid var(--black);
}

.box-container .box .btn-outline:hover {
  background-color: var(--black);
  color: var(--white);
}
/* Products Section - UPDATED CSS END */

/* Text Animation - Enhanced */
.container {
  padding: 80px 0;
  text-align: center;
  background-color: var(--black);
}

/* Updated container for text animation */
.text-animation-container {
  position: relative;
  padding: 100px 0;
  text-align: center;
  background-color: var(--black);
  overflow: hidden;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

/* Add subtle pattern overlay */
.text-animation-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.05) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.05) 50%, rgba(255, 255, 255, 0.05) 75%, transparent 75%, transparent);
  background-size: 20px 20px;
  opacity: 0.3;
}

/* Content positioning */
.text-animation-content {
  position: relative;
  z-index: 2;
}

.title {
  font-size: 42px;
  font-weight: 700;
  letter-spacing: 3px;
  margin-bottom: 30px;
  text-transform: uppercase;
}

.title-word {
  display: inline-block;
  margin: 0 8px;
  animation: color-animation 4s linear infinite;
  text-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
}

.title-word-1 {
  --color-1: var(--white);
  --color-2: var(--mid-gray);
  --color-3: var(--light-gray);
}

.title-word-2 {
  --color-1: var(--mid-gray);
  --color-2: var(--light-gray);
  --color-3: var(--white);
}

.title-word-3 {
  --color-1: var(--light-gray);
  --color-2: var(--white);
  --color-3: var(--mid-gray);
}

.title-word-4 {
  --color-1: var(--mid-gray);
  --color-2: var(--white);
  --color-3: var(--light-gray);
}

/* Animated underline */
.animated-underline {
  height: 3px;
  width: 0;
  background: linear-gradient(90deg, var(--white), var(--mid-gray), var(--white));
  margin: 0 auto;
  animation: expand-line 2s ease-in-out forwards;
  box-shadow: 0 2px 8px rgba(255, 255, 255, 0.2);
}
@media (max-width: 992px) {
  /* Your existing media query content stays here */
  
  /* Add these new rules */
  .carousel {
    height: 500px;
    min-height: 500px;
    max-height: 500px;
  }
  
  .slide img {
    height: 500px;
  }
}

@media (max-width: 768px) {
  /* Your existing media query content stays here */
  
  /* Add these new rules */
  .carousel {
    height: 400px;
    min-height: 400px;
    max-height: 400px;
  }
  
  .slide img {
    height: 400px;
  }
  
  /* MODIFIED: Changed to 1 column for mobile */
  .box-container {
    grid-template-columns: 1fr;
  }
  
  .box-container .box .image-container {
    height: 200px;
  }
  
  .box-container .box {
    min-height: 350px;
  }
  
  .box-container .box .content {
    padding: 15px;
  }
}

@media (max-width: 480px) {
  /* Your existing media query content stays here */
  
  /* Add these new rules */
  .carousel {
    height: 300px;
    min-height: 300px;
    max-height: 300px;
  }
  
  .slide img {
    height: 300px;
  }
}

@keyframes expand-line {
  0% {
    width: 0;
  }
  100% {
    width: 280px;
  }
}

@keyframes color-animation {
  0% {
    color: var(--color-1);
  }
  32% {
    color: var(--color-1);
  }
  33% {
    color: var(--color-2);
  }
  65% {
    color: var(--color-2);
  }
  66% {
    color: var(--color-3);
  }
  99% {
    color: var(--color-3);
  }
  100% {
    color: var(--color-1);
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

/* For button below product images */
.container6 .btn {
  position: absolute;
  transform: translate(710%, 800%);
  -ms-transform: translate(-50%, 500%);
  background-color: #f1f1f1;
  color: black;
  font-size: 20px;
  padding: 14px 40px;
  border: none;
  cursor: pointer;
  border-radius: 32px;
  text-align: center;
}

.container6 .btn:hover {
  background-color: grey;
  color: white;
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
  
  .text-animation-container .title {
    font-size: 32px;
  }
  
  .title-word {
    margin: 0 4px;
  }
  
  @keyframes expand-line {
    100% {
      width: 200px;
    }
  }
}

@media (max-width: 480px) {
  .text-animation-container .title {
    font-size: 24px;
  }
  
  @keyframes expand-line {
    100% {
      width: 160px;
    }
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

<!-- for image slider -->
<section aria-label="Newest Photos">
  <div class="carousel" data-carousel>
    <button class="carousel-button prev" data-carousel-button="prev">&#8656;</button>
    <button class="carousel-button next" data-carousel-button="next">&#8658;</button>
    <ul data-slides>
      <!-- for first slide -->
      <li class="slide" data-active>
        <img src="Images/sab1.jpg" alt="photo">
        <div class="captionslider">
          <h2>Your Go-To Brand Lineup</h2>
          <p>Driven by Care, Inspired by You</p>
        </div>
      </li>

      <!-- for second slide -->
      <li class="slide">
        <img src="D:\java\java\Versace\Versace\src\main\webapp\Images\Dropping tonight at 8pm (9).jpg" alt="photo">
        <div class="captionslider">
          <h2>Top Denim Picks</h2>
          <p>Score Up to 20% Savings</p>
        </div>
      </li>

      <!-- for third slide -->
      <li class="slide">
        <img src="Images/trial.webp" alt="photo">
        <div class="captionslider">
          <h2>Upgrade From Ordinary to Outstanding</h2>
          <p>Unleash Your Fashion Frenzy.</p>
        </div>
      </li>

      <!-- for fourth slide -->
      <li class="slide">
        <img src="Images/5.jpg" alt="photo">
        <div class="captionslider">
          <h2>Snag Your Favorites at Budget-Friendly Prices</h2>
        </div>
      </li>
    </ul>
  </div>
</section>
<!-- end of image slider -->

<!-- for featured products -->
<section class="category">
  <h1 class="heading">Tailored Trends Just for You</h1>
  <div class="box-container">
    <!-- MODIFIED SECTION START -->
    <!-- for product 1 -->
    <div class="box">
      <div class="image-container">
        <img src="Images/dress.jpg" alt="Chiffon Dress">
      </div>
      <div class="content">
        <h3>Chiffon Dress</h3>
        <p class="product-desc">Elegant floral pattern with adjustable straps</p>
        <p class="product-meta">S, M, L | 100% Chiffon</p>
        <p class="product-price"><strong>Rs. 5,999</strong></p>
        <div class="rating">
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star"></span>
        </div>
        <div class="button-container">
          <a href="ForHer.jsp" class="btn" style="text-decoration: none;">View</a>
          <a href="#" class="btn btn-outline" style="text-decoration: none;">View More</a>
        </div>
      </div>
    </div>

    <!-- for product 2 -->
    <div class="box">
      <div class="image-container">
        <img src="Images/shirt.jpg" alt="Formal Shirt">
      </div>
      <div class="content">
        <h3>Formal Shirt</h3>
        <p class="product-desc">Premium cotton with slim fit design</p>
        <p class="product-meta">M, L, XL | Cotton Blend</p>
        <p class="product-price"><strong>Rs. 3,499</strong></p>
        <div class="rating">
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
        </div>
        <div class="button-container">
          <a href="ForHim.jsp" class="btn" style="text-decoration: none;">View</a>
          <a href="#" class="btn btn-outline" style="text-decoration: none;">View More</a>
        </div>
      </div>
    </div>

    <!-- for product 3 -->
    <div class="box">
      <div class="image-container">
        <img src="Images/crop.jpg" alt="Floral Crop">
      </div>
      <div class="content">
        <h3>Floral Crop</h3>
        <p class="product-desc">Trendy top with adjustable tie-back</p>
        <p class="product-meta">XS, S, M | Polyester</p>
        <p class="product-price"><strong>Rs. 1,999</strong></p>
        <div class="rating">
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
        </div>
        <div class="button-container">
          <a href="ForHer.jsp" class="btn" style="text-decoration: none;">View</a>
          <a href="#" class="btn btn-outline" style="text-decoration: none;">View More</a>
        </div>
      </div>
    </div>

    <!-- for product 4 -->
    <div class="box">
      <div class="image-container">
        <img src="Images/pant.jpg" alt="Slim-Fit Pants">
      </div>
      <div class="content">
        <h3>Slim-Fit Pants</h3>
        <p class="product-desc">Cotton chinos with stretch comfort</p>
        <p class="product-meta">30-38 | Cotton with Elastane</p>
        <p class="product-price"><strong>Rs. 2,799</strong></p>
        <div class="rating">
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star"></span>
        </div>
        <div class="button-container">
          <a href="ForHim.jsp" class="btn" style="text-decoration: none;">View</a>
          <a href="#" class="btn btn-outline" style="text-decoration: none;">View More</a>
        </div>
      </div>
    </div>

    <!-- for product 5 -->
    <div class="box">
      <div class="image-container">
        <img src="Images/hoodie.jpg" alt="Cozy Hoodie">
      </div>
      <div class="content">
        <h3>Cozy Hoodie</h3>
        <p class="product-desc">Fleece-lined with kangaroo pocket</p>
        <p class="product-meta">M, L, XL | Cotton Blend</p>
        <p class="product-price"><strong>Rs. 2,499</strong></p>
        <div class="rating">
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star"></span>
          <span class="fa fa-star"></span>
        </div>
        <div class="button-container">
          <a href="ForHim.jsp" class="btn" style="text-decoration: none;">View</a>
          <a href="#" class="btn btn-outline" style="text-decoration: none;">View More</a>
        </div>
      </div>
    </div>

    <!-- for product 6 -->
    <div class="box">
      <div class="image-container">
        <img src="Images/overcoat.jpg" alt="Premium Over-Coat">
      </div>
      <div class="content">
        <h3>Premium Over-Coat</h3>
        <p class="product-desc">Wool-blend with elegant design</p>
        <p class="product-meta">S, M, L | Wool Blend</p>
        <p class="product-price"><strong>Rs. 8,999</strong></p>
        <div class="rating">
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star"></span>
          <span class="fa fa-star"></span>
        </div>
        <div class="button-container">
          <a href="ForHer.jsp" class="btn" style="text-decoration: none;">View</a>
          <a href="#" class="btn btn-outline" style="text-decoration: none;">View More</a>
        </div>
      </div>
    </div>
    <!-- MODIFIED SECTION END -->
  </div>
</section>
<!-- end of featured products -->

<!-- for text animation -->
<div class="text-animation-container">
  <div class="text-animation-overlay"></div>
  <div class="text-animation-content">
    <h2 class="title">
      <span class="title-word title-word-1">UNTIL</span>
      <span class="title-word title-word-2">NEXT</span>
      <span class="title-word title-word-3">TIME,</span>
      <span class="title-word title-word-4">STAY</span>
      <span class="title-word title-word-4">STYLED.</span>
    </h2>
    <div class="animated-underline"></div>
  </div>
</div>
<!-- end of text animation -->

<center><div class="word"></div></center><!-- for text animation -->

<br>
 
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