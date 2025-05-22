<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.versace.databaseConnection.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!--  html code for male products of 1st page  -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- for fonts and icons -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Questrial&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel="stylesheet" href="css/HimHer.css">
<!--   css for sign in and log in link at top of the home page  -->
<style>
    .abc {
      color: black;
      padding-left: 730px;
    }
    
    a:link {
      color: rgb(0, 0, 0);
      background-color: transparent;
      text-decoration: none;
    }
    a:visited {
      color: black;
      background-color: transparent;
      text-decoration: none;
    }
    a:hover {
      color: red;
      background-color: transparent;
      text-decoration: underline;
    }
    
    </style>

<!-- for star icon -->
<style>
  .checked {
    color: orange;
  }
  </style>

<!--   css for page numbers at the bottom of the page  -->
<style>
    .pageButton{
    padding: 15px 15px 15px 650px;
    }
    .button {
      display: inline-block;
      border-radius: 31px;
      background-color: #000000;
      border: none;
      color: white;
      text-align: center;
      font-size: 15px;
      padding: 10px;
      width: 110px;
      transition: all 0.5s;
      cursor: pointer;
      margin: 5px;
    }
    
    .button span {
      cursor: pointer;
      display: inline-block;
      position: relative;
      transition: 0.5s;
    }
    
    .button span:after {
      content: '\00bb';
      position: absolute;
      opacity: 0;
      top: 0;
      right: -20px;
      transition: 0.5s;
    }
    
    .button:hover span {
      padding-right: 25px;
    }
    
    .button:hover span:after {
      opacity: 1;
      right: 0;
    }
    </style>
    
</head>
<body>
<div class="main">
<nav class="stroke">

 <!-- for logo -->
<div class="logo">
<a href="Website.jsp"><img src="Images/logo.png" class="brand-logo" alt="logo">
</a></div>
<br>

     <!-- for navigation bar -->
  <div class="nav-links">
    <ul>
      <li><a href="Website.jsp">HOME</a></li>
      <li><a href="ForHim.jsp">FOR HIM</a></li>
      <li><a href="ForHer.jsp">FOR HER</a></li>
      <li><a href="contact.html">CONTACT</a></li>
    </ul>
  </div>

  <!-- for research box -->
  <div class="wrapper">
    
  </div>
 
  <div class="box">
      <form name="search">
        <input type="text" class="input" name="txt" onmouseout="this.value = ''; this.blur();">
      </form>
      <i class="fas fa-search"></i>
    </div>
</nav>
</div>

<%try{
	String query = "SELECT *,pc.prod_category_name,cc.cloth_cat_name"
			+ " FROM products p "
			+ "INNER JOIN product_category pc ON p.prod_category_id = pc.prod_category_id "
			+ "INNER JOIN cloth_category cc ON p.cloth_cat_id = cc.cloth_cat_id "
			+ "where p.cloth_cat_id =1";
Class.forName("com.mysql.cj.jdbc.Driver");
DatabaseConnection dc = new DatabaseConnection();
Connection con = dc.getConnect();
PreparedStatement ps = con.prepareStatement(query);
ResultSet rs = ps.executeQuery();
if(rs.next()){

%>

<!--   html code for filter product box  -->
       <div class="container2">
        <form class="filter" action="FilterProducts" method="post">
        <input type="hidden" name ="gender" value=<%=rs.getString("cloth_cat_id") %>>
              <div class="item">
                <label for="min price">Min Price</label>
                <input type="text" name="minPrice">
            </div>
            <div class="item">
                <label for="max price">Max Price</label>
                <input type="text" name="maxPrice">
            </div>
            <div class="item submit">
                <button type="submit">Search</button>
            </div>
            </form>
            </div>
<%}}catch(Exception e){e.printStackTrace();} %>
   
       <!-- for featured products -->
  <section class="category">       
<%try{
	ResultSet rs1 = (ResultSet) request.getAttribute("FilteredProducts");
%>
    <h1 class="heading"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MEN COLLECTION</h1>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="cart.html" class="fa fa-shopping-cart"></a>

    <div class="box-container">
	<%while(rs1.next()){ %>
	   <div class="box">
            <img src="${pageContext.request.contextPath}/Product Images/<%=rs1.getString("product_image") %>" >
            <h3><%=rs1.getString("product_name") %></h3>
           <br>
            $<%=rs1.getString("price") %><br>
<span class="fa fa-star checked"></span><%=rs1.getString("ratings") %>
<br><br>
            <form action="GetProductInfo" method="post">
            <input type="hidden" value="display" name="function">
            <input type="hidden" value="<%=rs1.getString("product_id") %>" name="product_id">
            <button type="submit" class="btn" style="text-decoration: none;">
            View
            </button>
            </form>
        </div>
<%}}catch(Exception e){e.printStackTrace();} %>
</div>
</section>
    <br>
   
   

    <!--  FOOTER START -->
  
<div class="footer">
    <div class="inner-footer">
  
  <!--  for company name and description -->
      <div class="footer-items">
        <h1>VERSACE</h1>
        <p>Quality at best prices.</p>
      </div>
  
  <!--  for contact us info -->
      <div class="footer-items">
        <h3>Contact us</h3>
        <div class="border1"></div>
          <ul class="footcss">
            <li><i class="fa fa-map-marker" aria-hidden="true"></i>Demo Address, Demo Location</li>
            <li><i class="fa fa-phone" aria-hidden="true"></i>+977 9876543210</li>
            <li><i class="fa fa-envelope" aria-hidden="true"></i>versace@gmail.com</li>
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
      Copyright &copy; Developed By Versace & Co.
  
    </div>
  </div>
    
  <!--   Footer Bottom end -->

  
  <!--   FOOTER END -->

    <script src="js/HimHer.js"></script>
</body>
</html>