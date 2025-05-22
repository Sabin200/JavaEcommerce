<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="FashionGhar - Premium Monochromatic Fashion">
    <meta name="keywords" content="fashion, products, clothing, shop">
    <title>FashionGhar - Product Page</title>

    <!-- Vendor CSS Files -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/website.css" rel="stylesheet">

    <!-- Fonts and Icons -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600&family=Raleway:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        /* Add custom styles */
        .product-box {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            margin-bottom: 30px;
        }

        .product-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .product-content {
            padding: 15px;
        }

        .product-price {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }

        .product-name {
            font-size: 18px;
            color: #000;
            margin: 10px 0;
        }

        .product-description {
            font-size: 14px;
            color: #777;
            margin-bottom: 15px;
        }

        .view-btn {
            background-color: #000;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 25px;
            display: inline-block;
            text-align: center;
        }

        .view-btn:hover {
            background-color: #444;
        }
    </style>
</head>
<body>

    <!-- Navigation Section -->
    <div class="main">
        <nav class="stroke">
            <div class="logo">
                <a href="Home.jsp">FashionGhar</a>
            </div>
            <div class="nav-links">
                <ul>
                    <li><a href="Home.jsp">Home</a></li>
                    <li><a href="ForHim.jsp">Men</a></li>
                    <li><a href="ForHer.jsp">Women</a></li>
                    <li><a href="Uuni.jsp">Unisex</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
            </div>
        </nav>
    </div>

    <!-- Product Display Section -->
    <div class="container my-5">
        <h2 class="text-center mb-5">Our Featured Products</h2>

        <div class="row">
            
            <c:forEach var="product" items="${products}">
                <div class="col-md-4 col-sm-6">
                    <div class="product-box">
                        <div class="product-image">
                            <img src="${product.imageUrl}" alt="${product.name}" />
                        </div>
                        <div class="product-content">
                            <h4 class="product-name">${product.name}</h4>
                            <p class="product-description">${product.description}</p>
                            <p class="product-price">Rs. ${product.price}</p>
                            <a href="ProductDetails.jsp?id=${product.id}" class="view-btn">View Details</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer">
        <div class="inner-footer">
            <div class="footer-items">
                <h1>FashionGhar</h1>
                <p>Where Classic Meets Cool</p>
                <p>Premium monochromatic fashion for those who appreciate timeless elegance with a modern twist.</p>
            </div>
            <div class="footer-items">
                <h3>Shop</h3>
                <ul>
                    <li><a href="ForHim.jsp">Men's Collection</a></li>
                    <li><a href="ForHer.jsp">Women's Collection</a></li>
                    <li><a href="Uuni.jsp">Unisex Styles</a></li>
                </ul>
            </div>
            <div class="footer-items">
                <h3>Contact Us</h3>
                <ul>
                    <li>Mahendrapool, Pokhara</li>
                    <li>+977 9876543210</li>
                    <li>info@fashionghar.com</li>
                </ul>
            </div>
        </div>
    </div>

</body>
</html>
