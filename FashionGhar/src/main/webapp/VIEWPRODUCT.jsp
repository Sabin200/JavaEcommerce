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

<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Raleway:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<!-- Custom CSS -->
<style>
  /* Global Styles */
  :root {
    --white: #ffffff;
    --light-gray: #f8f8f8;
    --mid-gray: #9e9e9e;
    --dark-gray: #333333;
    --black: #000000;
    --text: #000000;
    --text-light: #ffffff;
    --success: #4caf50;
    --error: #f44336;
    --accent: #e0e0e0;
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

  .container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
  }

  /* Navigation Styles */
  .main {
    background-color: var(--black);
    padding: 15px 0;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    position: sticky;
    top: 0;
    z-index: 1000;
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
    font-size: 18px;
    font-weight: 500;
    position: relative;
    padding: 10px 15px;
    letter-spacing: 1px;
    white-space: nowrap;
    display: block;
    font-family: 'Raleway', sans-serif;
    transition: color 0.3s ease;
  }

  .nav-links ul li a:hover {
    color: var(--accent);
  }

  .nav-icons {
    display: flex;
    align-items: center;
  }

  .nav-icons a {
    color: var(--white);
    font-size: 20px;
    margin-left: 20px;
    transition: color 0.3s ease;
  }

  .nav-icons a:hover {
    color: var(--accent);
  }

  /* Breadcrumb */
  .breadcrumb {
    padding: 20px 0;
    background-color: var(--light-gray);
  }

  .breadcrumb ul {
    display: flex;
    list-style: none;
  }

  .breadcrumb ul li {
    margin-right: 10px;
    font-size: 14px;
  }

  .breadcrumb ul li a {
    text-decoration: none;
    color: var(--mid-gray);
  }

  .breadcrumb ul li:last-child {
    color: var(--text);
    font-weight: 500;
  }

  .breadcrumb ul li:not(:last-child)::after {
    content: "/";
    margin-left: 10px;
    color: var(--mid-gray);
  }

  /* Product Section */
  .product-section {
    padding: 40px 0;
  }

  .product-container {
    display: flex;
    flex-wrap: wrap;
    gap: 30px;
  }

  .product-gallery {
    width: 100%;
    max-width: 500px;
  }

  .product-main-image {
    width: 100%;
    height: 500px;
    overflow: hidden;
    border-radius: 8px;
    margin-bottom: 15px;
  }

  .product-main-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.5s ease;
  }

  .product-main-image img:hover {
    transform: scale(1.05);
  }

  .product-info {
    flex: 1;
    min-width: 300px;
  }

  .product-name {
    font-size: 32px;
    font-weight: 600;
    margin-bottom: 10px;
  }

  .product-price {
    font-size: 28px;
    color: var(--black);
    font-weight: 600;
    margin-bottom: 10px;
  }

  .product-rating {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
  }

  .product-rating i {
    color: #ffc107;
    margin-right: 3px;
  }

  .product-rating span {
    margin-left: 10px;
    color: var(--mid-gray);
    font-size: 14px;
  }

  .product-description {
    font-size: 16px;
    color: var(--dark-gray);
    margin-bottom: 30px;
    line-height: 1.6;
  }

  .product-options {
    margin-bottom: 30px;
  }

  .option-group {
    margin-bottom: 20px;
  }

  .option-label {
    font-size: 16px;
    font-weight: 600;
    margin-bottom: 10px;
    display: block;
  }

  .size-options {
    display: flex;
    gap: 10px;
  }

  .size-option {
    width: 50px;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 1px solid var(--mid-gray);
    border-radius: 4px;
    cursor: pointer;
    transition: all 0.3s ease;
  }

  .size-option:hover, .size-option.active {
    background-color: var(--black);
    color: var(--white);
    border-color: var(--black);
  }

  .size-option.active span {
    color: var(--white);
  }

  .color-options {
    display: flex;
    gap: 10px;
  }

  .color-option {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    cursor: pointer;
    position: relative;
  }

  .color-option.active::after {
    content: "";
    position: absolute;
    top: -5px;
    left: -5px;
    right: -5px;
    bottom: -5px;
    border: 2px solid var(--black);
    border-radius: 50%;
  }

  .quantity-selector {
    display: flex;
    align-items: center;
    margin-bottom: 30px;
  }

  .quantity-btn {
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: var(--light-gray);
    border: none;
    cursor: pointer;
    font-size: 18px;
  }

  .quantity-input {
    width: 60px;
    height: 40px;
    text-align: center;
    border: 1px solid var(--light-gray);
    margin: 0 10px;
    font-size: 16px;
  }

  .product-actions {
    display: flex;
    gap: 15px;
    margin-bottom: 30px;
  }

  .add-to-cart-btn {
    flex: 1;
    padding: 15px 0;
    background-color: var(--black);
    color: var(--white);
    border: none;
    border-radius: 4px;
    font-size: 16px;
    font-weight: 500;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .add-to-cart-btn:hover {
    background-color: var(--dark-gray);
  }

  .wishlist-btn {
    width: 50px;
    height: 50px;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: var(--light-gray);
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .wishlist-btn:hover {
    background-color: #ffebee;
  }

  .wishlist-btn i {
    color: var(--dark-gray);
    font-size: 20px;
    transition: color 0.3s ease;
  }

  .wishlist-btn:hover i {
    color: #e91e63;
  }

  /* Payment Methods Section */
  .payment-methods {
    margin-top: 30px;
    padding: 20px;
    background-color: var(--light-gray);
    border-radius: 8px;
  }

  .payment-methods h3 {
    font-size: 18px;
    margin-bottom: 15px;
  }

  .payment-icons {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
  }

  .payment-icon {
    width: 60px;
    height: 40px;
    background-color: var(--white);
    border-radius: 4px;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 2px 5px rgba(0,0,0,0.05);
  }

  .payment-icon i {
    font-size: 24px;
  }

  /* Product Details Tabs */
  .product-details {
    margin-top: 60px;
  }

  .tabs {
    display: flex;
    border-bottom: 1px solid var(--light-gray);
    margin-bottom: 30px;
  }

  .tab {
    padding: 15px 30px;
    cursor: pointer;
    font-weight: 500;
    position: relative;
  }

  .tab.active {
    color: var(--black);
  }

  .tab.active::after {
    content: "";
    position: absolute;
    bottom: -1px;
    left: 0;
    width: 100%;
    height: 3px;
    background-color: var(--black);
  }

  .tab-content {
    display: none;
  }

  .tab-content.active {
    display: block;
  }

  .tab-content p {
    line-height: 1.6;
    margin-bottom: 15px;
  }

  /* Explore More Section */
  .explore-more {
    margin: 80px 0;
  }

  .section-title {
    text-align: center;
    font-size: 28px;
    margin-bottom: 40px;
    position: relative;
  }

  .section-title::after {
    content: "";
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 50px;
    height: 3px;
    background-color: var(--black);
  }

  .product-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 30px;
  }

  .product-card {
    background-color: var(--white);
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }

  .product-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
  }

  .product-card-image {
    height: 250px;
    overflow: hidden;
    position: relative;
  }

  .product-card-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.5s ease;
  }

  .product-card:hover .product-card-image img {
    transform: scale(1.05);
  }

  .product-card-badge {
    position: absolute;
    top: 10px;
    left: 10px;
    background-color: var(--black);
    color: var(--white);
    padding: 5px 10px;
    font-size: 12px;
    border-radius: 4px;
  }

  .product-card-wishlist {
    position: absolute;
    top: 10px;
    right: 10px;
    width: 30px;
    height: 30px;
    background-color: var(--white);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .product-card-wishlist:hover {
    background-color: #ffebee;
  }

  .product-card-wishlist i {
    color: var(--dark-gray);
    font-size: 16px;
    transition: color 0.3s ease;
  }

  .product-card-wishlist:hover i {
    color: #e91e63;
  }

  .product-card-content {
    padding: 20px;
  }

  .product-card-title {
    font-size: 16px;
    font-weight: 500;
    margin-bottom: 10px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  .product-card-price {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
  }

  .current-price {
    font-size: 18px;
    font-weight: 600;
  }

  .original-price {
    font-size: 14px;
    color: var(--mid-gray);
    text-decoration: line-through;
    margin-left: 10px;
  }

  .discount {
    font-size: 14px;
    color: var(--success);
    margin-left: 10px;
  }

  .product-card-rating {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
  }

  .product-card-rating i {
    color: #ffc107;
    font-size: 14px;
    margin-right: 2px;
  }

  .product-card-rating span {
    margin-left: 5px;
    font-size: 14px;
    color: var(--mid-gray);
  }

  .product-card-button {
    width: 100%;
    padding: 10px 0;
    background-color: var(--black);
    color: var(--white);
    border: none;
    border-radius: 4px;
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .product-card-button:hover {
    background-color: var(--dark-gray);
  }

  /* Footer */
  .footer {
    background-color: var(--black);
    padding: 60px 0 30px;
    color: var(--white);
  }

  .footer-content {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 30px;
  }

  .footer-column h3 {
    color: var(--white);
    font-size: 18px;
    margin-bottom: 20px;
    position: relative;
  }

  .footer-column h3::after {
    content: "";
    position: absolute;
    bottom: -10px;
    left: 0;
    width: 30px;
    height: 2px;
    background-color: var(--white);
  }

  .footer-column p {
    color: var(--mid-gray);
    line-height: 1.6;
    margin-bottom: 20px;
  }

  .footer-links {
    list-style: none;
  }

  .footer-links li {
    margin-bottom: 10px;
  }

  .footer-links li a {
    color: var(--mid-gray);
    text-decoration: none;
    transition: color 0.3s ease;
  }

  .footer-links li a:hover {
    color: var(--white);
  }

  .social-links {
    display: flex;
    gap: 15px;
  }

  .social-link {
    width: 40px;
    height: 40px;
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: background-color 0.3s ease;
  }

  .social-link:hover {
    background-color: rgba(255, 255, 255, 0.2);
  }

  .social-link i {
    color: var(--white);
    font-size: 18px;
  }

  .footer-bottom {
    margin-top: 40px;
    padding-top: 20px;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    text-align: center;
  }

  .footer-bottom p {
    color: var(--mid-gray);
    font-size: 14px;
  }

  /* Scroll Up Button */
  .scroll-top {
    position: fixed;
    bottom: 30px;
    right: 30px;
    width: 50px;
    height: 50px;
    background-color: var(--black);
    color: var(--white);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    z-index: 999;
    opacity: 0;
    visibility: hidden;
    transition: all 0.3s ease;
  }

  .scroll-top.active {
    opacity: 1;
    visibility: visible;
  }

  .scroll-top i {
    font-size: 20px;
  }

  /* Responsive Styles */
  @media (max-width: 1200px) {
    .product-grid {
      grid-template-columns: repeat(3, 1fr);
    }
  }

  @media (max-width: 992px) {
    .product-grid {
      grid-template-columns: repeat(2, 1fr);
    }
    
    .footer-content {
      grid-template-columns: repeat(2, 1fr);
    }
  }

  @media (max-width: 768px) {
    .nav-links ul {
      display: none;
    }
    
    .product-gallery, .product-info {
      width: 100%;
    }
    
    .product-actions {
      flex-direction: column;
    }
    
    .wishlist-btn {
      width: 100%;
    }
    
    .tabs {
      flex-wrap: wrap;
    }
    
    .tab {
      padding: 10px 15px;
    }
  }

  @media (max-width: 576px) {
    .product-grid {
      grid-template-columns: 1fr;
    }
    
    .footer-content {
      grid-template-columns: 1fr;
    }
  }
</style>
</head>
<body>
  <!-- Navigation Section -->
  <div class="main">
    <nav class="stroke">
      <div class="logo">
        <a href="index.jsp">
          <svg width="180" height="60" viewBox="0 0 180 60">
            <defs>
              <linearGradient id="logoGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                <stop offset="0%" stop-color="#ffffff" />
                <stop offset="100%" stop-color="#cccccc" />
              </linearGradient>
            </defs>
            <rect x="20" y="10" width="140" height="40" rx="3" fill="none" stroke="#ffffff" stroke-width="2" />
            <text x="90" y="37" font-family="Raleway, sans-serif" font-size="24" font-weight="600" text-anchor="middle" fill="url(#logoGradient)">Fashion Ghar</text>
          </svg>
        </a>
      </div>
      <div class="nav-links">
        <ul>
          <li><a href="index.jsp">Home</a></li>
          <li><a href="men.jsp">Men</a></li>
          <li><a href="women.jsp">Women</a></li>
          <li><a href="unisex.jsp">Unisex</a></li>
          <li><a href="contact.jsp">Contact</a></li>
        </ul>
      </div>
      <div class="nav-icons">
        <a href="search.jsp"><i class="fas fa-search"></i></a>
        <a href="account.jsp"><i class="fas fa-user"></i></a>
        <a href="wishlist.jsp"><i class="fas fa-heart"></i></a>
        <a href="cart.jsp"><i class="fas fa-shopping-bag"></i></a>
      </div>
    </nav>
  </div>

  <!-- Breadcrumb -->
  <div class="breadcrumb">
    <div class="container">
      <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="men.jsp">Men</a></li>
        <li>Premium Cotton Shirt</li>
      </ul>
    </div>
  </div>

  <!-- Product Section -->
  <section class="product-section">
    <div class="container">
      <div class="product-container">
        <div class="product-gallery">
          <div class="product-main-image">
            <img src="<%=request.getContextPath()%>/images/placeholder.jpg" alt="Premium Cotton Shirt" />
          </div>
          <!-- Thumbnail section removed as requested -->
        </div>
        <div class="product-info">
          <h1 class="product-name">Premium Cotton Shirt</h1>
          <div class="product-price">Rs. 1,499.00</div>
          <div class="product-rating">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
            <span>(120 reviews)</span>
          </div>
          <div class="product-description">
            <p>A high-quality premium cotton shirt designed for both casual and formal occasions. Made from 100% organic cotton that's soft on your skin and durable for long-lasting wear. The classic fit ensures comfort while maintaining a stylish silhouette.</p>
          </div>
          <div class="product-options">
            <div class="option-group">
              <label class="option-label">Size</label>
              <div class="size-options">
                <div class="size-option"><span>S</span></div>
                <div class="size-option active"><span>M</span></div>
                <div class="size-option"><span>L</span></div>
                <div class="size-option"><span>XL</span></div>
                <div class="size-option"><span>XXL</span></div>
              </div>
            </div>
            <div class="option-group">
              <label class="option-label">Color</label>
              <div class="color-options">
                <div class="color-option active" style="background-color: #ffffff; border: 1px solid #e0e0e0;"></div>
                <div class="color-option" style="background-color: #000000;"></div>
                <div class="color-option" style="background-color: #3f51b5;"></div>
                <div class="color-option" style="background-color: #f44336;"></div>
              </div>
            </div>
          </div>
          <div class="option-group">
            <label class="option-label">Quantity</label>
            <div class="quantity-selector">
              <button class="quantity-btn">-</button>
              <input type="number" class="quantity-input" value="1" min="1" max="10">
              <button class="quantity-btn">+</button>
            </div>
          </div>
          <div class="product-actions">
            <button class="add-to-cart-btn" onclick="addToCart(1)">Add to Cart</button>
            <button class="wishlist-btn" onclick="addToWishlist(1)"><i class="far fa-heart"></i></button>
          </div>
          
          <!-- Payment Methods Section -->
          <div class="payment-methods">
            <h3>Payment Methods</h3>
            <div class="payment-icons">
              <div class="payment-icon"><i class="fab fa-cc-visa"></i></div>
              <div class="payment-icon"><i class="fab fa-cc-mastercard"></i></div>
              <div class="payment-icon"><i class="fab fa-cc-amex"></i></div>
              <div class="payment-icon"><i class="fab fa-cc-paypal"></i></div>
              <div class="payment-icon"><i class="fas fa-wallet"></i></div>
              <div class="payment-icon"><i class="fas fa-money-bill-wave"></i></div>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Product Details Tabs -->
      <div class="product-details">
        <div class="tabs">
          <div class="tab active" data-tab="description">Description</div>
          <div class="tab" data-tab="specifications">Specifications</div>
          <div class="tab" data-tab="reviews">Reviews</div>
          <div class="tab" data-tab="shipping">Shipping & Returns</div>
        </div>
        <div id="description" class="tab-content active">
          <p>Our Premium Cotton Shirt is crafted from the finest organic cotton, ensuring both comfort and durability. The classic design features a regular fit that's perfect for any occasion, whether you're dressing up for a formal event or keeping it casual for a day out.</p>
          <p>The breathable fabric makes it ideal for all-day wear, while the meticulous stitching and high-quality buttons add a touch of luxury. Available in multiple colors and sizes, this versatile shirt is a must-have addition to any wardrobe.</p>
        </div>
        <div id="specifications" class="tab-content">
          <p><strong>Material:</strong> 100% Organic Cotton</p>
          <p><strong>Fit:</strong> Regular</p>
          <p><strong>Care:</strong> Machine wash cold, tumble dry low</p>
          <p><strong>Origin:</strong> Made in India</p>
        </div>
        <div id="reviews" class="tab-content">
          <p>No reviews yet. Be the first to review this product!</p>
        </div>
        <div id="shipping" class="tab-content">
          <p><strong>Shipping:</strong> Free shipping on orders over Rs. 1,000. Standard delivery takes 3-5 business days.</p>
          <p><strong>Returns:</strong> Easy returns within 30 days of purchase. Return shipping is free for exchanges.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- Explore More Section -->
  <section class="explore-more">
    <div class="container">
      <h2 class="section-title">Explore More</h2>
      <div class="product-grid">
        <!-- Product Card 1 -->
        <div class="product-card">
          <div class="product-card-image">
            <img src="<%=request.getContextPath()%>/images/product1.jpg" alt="Slim Fit Jeans" />
            <div class="product-card-badge">New</div>
            <div class="product-card-wishlist"><i class="far fa-heart"></i></div>
          </div>
          <div class="product-card-content">
            <h3 class="product-card-title">Slim Fit Jeans</h3>
            <div class="product-card-price">
              <span class="current-price">Rs. 1,799.00</span>
              <span class="original-price">Rs. 2,499.00</span>
              <span class="discount">-28%</span>
            </div>
            <div class="product-card-rating">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="far fa-star"></i>
              <span>(85)</span>
            </div>
            <button class="product-card-button">View Product</button>
          </div>
        </div>
        
        <!-- Product Card 2 -->
        <div class="product-card">
          <div class="product-card-image">
            <img src="<%=request.getContextPath()%>/images/product2.jpg" alt="Casual T-Shirt" />
            <div class="product-card-wishlist"><i class="far fa-heart"></i></div>
          </div>
          <div class="product-card-content">
            <h3 class="product-card-title">Casual T-Shirt</h3>
            <div class="product-card-price">
              <span class="current-price">Rs. 899.00</span>
              <span class="original-price">Rs. 1,199.00</span>
              <span class="discount">-25%</span>
            </div>
            <div class="product-card-rating">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star-half-alt"></i>
              <i class="far fa-star"></i>
              <span>(42)</span>
            </div>
            <button class="product-card-button">View Product</button>
          </div>
        </div>
        
        <!-- Product Card 3 -->
        <div class="product-card">
          <div class="product-card-image">
            <img src="<%=request.getContextPath()%>/images/product3.jpg" alt="Leather Jacket" />
            <div class="product-card-badge">Bestseller</div>
            <div class="product-card-wishlist"><i class="far fa-heart"></i></div>
          </div>
          <div class="product-card-content">
            <h3 class="product-card-title">Leather Jacket</h3>
            <div class="product-card-price">
              <span class="current-price">Rs. 4,999.00</span>
              <span class="original-price">Rs. 6,999.00</span>
              <span class="discount">-29%</span>
            </div>
            <div class="product-card-rating">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <span>(128)</span>
            </div>
            <button class="product-card-button">View Product</button>
          </div>
        </div>
        
        <!-- Product Card 4 -->
        <div class="product-card">
          <div class="product-card-image">
            <img src="<%=request.getContextPath()%>/images/product4.jpg" alt="Formal Pants" />
            <div class="product-card-wishlist"><i class="far fa-heart"></i></div>
          </div>
          <div class="product-card-content">
            <h3 class="product-card-title">Formal Pants</h3>
            <div class="product-card-price">
              <span class="current-price">Rs. 2,199.00</span>
            </div>
            <div class="product-card-rating">
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="fas fa-star"></i>
              <i class="far fa-star"></i>
              <span>(56)</span>
            </div>
            <button class="product-card-button">View Product</button>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="footer">
    <div class="container">
      <div class="footer-content">
        <div class="footer-column">
          <h3>About Us</h3>
          <p>Fashion Ghar is a premium clothing brand dedicated to providing high-quality, stylish apparel for men and women. Our mission is to make fashion accessible and sustainable.</p>
          <div class="social-links">
            <a href="#" class="social-link"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
            <a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
            <a href="#" class="social-link"><i class="fab fa-pinterest"></i></a>
          </div>
        </div>
        <div class="footer-column">
          <h3>Quick Links</h3>
          <ul class="footer-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="shop.jsp">Shop</a></li>
            <li><a href="about.jsp">About Us</a></li>
            <li><a href="contact.jsp">Contact</a></li>
            <li><a href="blog.jsp">Blog</a></li>
          </ul>
        </div>
        <div class="footer-column">
          <h3>Customer Service</h3>
          <ul class="footer-links">
            <li><a href="account.jsp">My Account</a></li>
            <li><a href="orders.jsp">Order Tracking</a></li>
            <li><a href="wishlist.jsp">Wishlist</a></li>
            <li><a href="shipping.jsp">Shipping & Returns</a></li>
            <li><a href="faq.jsp">FAQs</a></li>
          </ul>
        </div>
        <div class="footer-column">
          <h3>Contact Us</h3>
          <ul class="footer-links">
            <li><i class="fas fa-map-marker-alt"></i> 123 Fashion Street, Delhi</li>
            <li><i class="fas fa-phone"></i> +91 98765 43210</li>
            <li><i class="fas fa-envelope"></i> info@fashionghar.com</li>
          </ul>
        </div>
      </div>
      <div class="footer-bottom">
        <p>&copy; <%= new java.util.Date().getYear() + 1900 %> Fashion Ghar. All Rights Reserved.</p>
      </div>
    </div>
  </footer>

  <!-- Scroll Up Button -->
  <div class="scroll-top">
    <i class="fas fa-arrow-up"></i>
  </div>

  <!-- JavaScript -->
  <script>
    // Quantity Selector
    const minusBtn = document.querySelector('.quantity-btn:first-child');
    const plusBtn = document.querySelector('.quantity-btn:last-child');
    const quantityInput = document.querySelector('.quantity-input');

    minusBtn.addEventListener('click', () => {
      const currentValue = parseInt(quantityInput.value);
      if (currentValue > 1) {
        quantityInput.value = currentValue - 1;
      }
    });

    plusBtn.addEventListener('click', () => {
      const currentValue = parseInt(quantityInput.value);
      const maxStock = parseInt(quantityInput.getAttribute('max'));
      if (currentValue < maxStock) {
        quantityInput.value = currentValue + 1;
      }
    });

    // Size Options
    const sizeOptions = document.querySelectorAll('.size-option');
    sizeOptions.forEach(option => {
      option.addEventListener('click', () => {
        sizeOptions.forEach(opt => opt.classList.remove('active'));
        option.classList.add('active');
      });
    });

    // Color Options
    const colorOptions = document.querySelectorAll('.color-option');
    colorOptions.forEach(option => {
      option.addEventListener('click', () => {
        colorOptions.forEach(opt => opt.classList.remove('active'));
        option.classList.add('active');
      });
    });

    // Tabs
    const tabs = document.querySelectorAll('.tab');
    
    tabs.forEach(tab => {
      tab.addEventListener('click', () => {
        const tabId = tab.getAttribute('data-tab');
        
        // Hide all tab contents
        document.querySelectorAll('.tab-content').forEach(content => {
          content.classList.remove('active');
        });
        
        // Remove active class from all tabs
        tabs.forEach(t => t.classList.remove('active'));
        
        // Show the selected tab content
        document.getElementById(tabId).classList.add('active');
        
        // Add active class to the clicked tab
        tab.classList.add('active');
      });
    });

    // Scroll Top Button
    const scrollTopBtn = document.querySelector('.scroll-top');
    
    window.addEventListener('scroll', () => {
      if (window.pageYOffset > 300) {
        scrollTopBtn.classList.add('active');
      } else {
        scrollTopBtn.classList.remove('active');
      }
    });
    
    scrollTopBtn.addEventListener('click', () => {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    });
    
    // Add to Cart Function
    function addToCart(productId) {
      const size = document.querySelector('.size-option.active span').textContent;
      const color = document.querySelector('.color-option.active').style.backgroundColor;
      const quantity = document.querySelector('.quantity-input').value;
      
      // AJAX call to add product to cart
      // This is a placeholder - implement actual AJAX call in production
      console.log(`Adding product ${productId} to cart: Size ${size}, Color ${color}, Quantity ${quantity}`);
      
      // Show success message
      alert('Product added to cart successfully!');
    }
    
    // Add to Wishlist Function
    function addToWishlist(productId) {
      // AJAX call to add product to wishlist
      // This is a placeholder - implement actual AJAX call in production
      console.log(`Adding product ${productId} to wishlist`);
      
      // Toggle heart icon
      const wishlistBtn = event.currentTarget;
      const heartIcon = wishlistBtn.querySelector('i');
      
      if (heartIcon.classList.contains('far')) {
        heartIcon.classList.remove('far');
        heartIcon.classList.add('fas');
        heartIcon.style.color = '#e91e63';
        
        // Show success message
        alert('Product added to wishlist!');
      } else {
        heartIcon.classList.remove('fas');
        heartIcon.classList.add('far');
        heartIcon.style.color = '';
        
        // Show success message
        alert('Product removed from wishlist!');
      }
    }
  </script>
</body>
</html>