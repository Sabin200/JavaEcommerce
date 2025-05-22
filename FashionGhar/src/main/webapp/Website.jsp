
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
   
<%@page import="com.versace.databaseConnection.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<title>Versace</title>
<meta charset="UTF-8">
  <meta name="description" content="Website for clothing">
  <meta name="keywords" content="HTML, CSS, JavaScript">
  <meta name="author" content="Versace & Co.">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  
   <!-- Vendor CSS Files -->
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

 <!-- for fonts and icons -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Questrial&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="css/website.css">


<script src="js/website.js" defer></script>


 <!-- for button below product images -->
  <style>
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
</style>

 <!-- for star icon -->
<style>
.checked {
  color: orange;
}
</style>

 <!-- for sign in/log in -->
<style>
.abc {
  color: black;
  padding-left: 700px;
  display: inline-block;
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

<style>

.dropbtn {
  position: fixed;
  top: 10px;
  right: 10px;
  background-color: #000000;
  color: white;
  padding: 2px;
  font-size: 16px;
  border: none;
  cursor: pointer;
  border-radius: 10%;
}

.dropbtn:hover,
.dropbtn:focus {
  background-color: #000000;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
margin-left: 1300px;
margin-down: 40px;
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  z-index: 999;
}


.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown a:hover {
  background-color: #ddd;
}

.show {
  display: block;
}

  </style>

<style>
 input[type="submit"]:hover {
    background-color: #ddd;
  }
  .button {
    background-color: #000000;
    border: none;
    color: white;
    padding: 0px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 1px 1px;
    cursor: pointer;
   
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
 <!-- body section starts -->
<body>
<%if(session.getAttribute("user")==null) {%>
<div class="abc">
              <a href="Login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;Sign Up/Login in</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
          </div>


<%}else{
 String username = (String)session.getAttribute("user");
%>

          <div class="dropdown">
            <button onclick="myFunction()" class="dropbtn">Profile</button>
            <div id="myDropdown" class="dropdown-content">
            
            <form action="GetUserInfo" method="post">
            <input type ="hidden" value="overview" name="function">
            <input type ="hidden" value="<%=username%>" name="username">
            <input type="submit" value="     OverView" style="border: none; margin-top: 10px;">
            </form>
            
            <form action="GetUserInfo" method="post">
            <input type ="hidden" value="edit" name="function">
             <input type ="hidden" value="<%=username%>" name="username">
            <input type="submit" value="     Edit Profile" style="border: none; margin-top: 10px;">
            </form>
            
              <form action="GetUserInfo" method="post">
  			  <input type ="hidden" value="password" name="function">
              <input type ="hidden" value="<%=username%>" name="username">
              <input type="submit" value="     Change Password" style="border: none; margin-top: 10px;">
            </form>
            
             <form action="Logout.jsp">
            <input type="submit" value="     Logout" style="border: none; margin-top: 10px; margin-bottom: 10px;">
            </form>
            </div>
          </div>

<%}%>

   <!-- for sign in/ log in -->

          
          <hr>

<!-- for navigation -->
<div class="main">
  <nav class="stroke">

     <!-- for logo -->
    <div class="logo">
      <a href="website.html"><img src="Images/logo.png" class="brand-logo" alt="logo"></a>
    </div>
    <br>

    <!-- for navigation bar -->
    <div class="nav-links">
      <ul>
        <li><a href="Home.jsp">HOME</a></li>
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

  <!-- for image slider -->
<section aria-label="Newest Photos">
    <div class="carousel" data-carousel>
      <button class="carousel-button prev" data-carousel-button="prev">&#8656;</button>
      <button class="carousel-button next" data-carousel-button="next">&#8658;</button>
      <ul data-slides>

        <!-- for first slide -->
        <li class="slide" data-active>
          <img src="Images/slider1.jpg" alt="photo">
          <div class="captionslider">
            <h2>Your Favourite Brands Collection</h2>
            <p>Ensuring the best welfare of the our customers</p>
          </div>
        </li>

        <!-- for second slide -->
        <li class="slide">
          <img src="Images/slider2.jpg" alt="photo">
          <div class="captionslider">
            <h2>Best Jeans Collection</h2>
            <p>Offers upto 20%</p>
          </div>
        </li>

        <!-- for third slide -->
        <li class="slide">
          <img src="Images/slider3.jpg" alt="photo">
          <div class="captionslider">
            <h2>Say bye to your boring dresses.</h2>
            <h2>Go crazy with fashion.</h2>
          </div>
        </li>

        <!-- for fourth slide -->
        <li class="slide">
          <img src="Images/slider4.jpg" alt="photo">
          <div class="captionslider">
            <h2>Get your favorites with affordable price</h2>
          </div>
        </li>
      </ul>
    </div>
  </section>
  <!-- end of image slider -->

  <!-- for featured products -->
  <section class="category">

    <h1 class="heading">Fashion to match your needs</h1>

    <div class="box-container">
<%try{
String sql = "select * from products";
Class.forName("com.mysql.cj.jdbc.Driver");
DatabaseConnection dc = new DatabaseConnection();
Connection con = dc.getConnect();
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
int count = 0;
while(rs.next()){
%>
<%if(count<3) {%>
<div class="box">
            <img src="${pageContext.request.contextPath}/Product Images/<%=rs.getString("product_image") %>" >
            <h3><%=rs.getString("product_name") %></h3>
           <br>
            $<%=rs.getString("price") %><br>
<span class="fa fa-star checked"></span><%=rs.getString("ratings") %>
<br><br>
            <form action="GetProductInfo" method="post">
            <input type="hidden" value="display" name="function">
            <input type="hidden" value="<%=rs.getString("product_id") %>" name="product_id">
            <button type="submit" class="btn" style="text-decoration: none;">
            View
            </button>
            </form>
        </div>
        <%} %>
       <% if(count>5 && count < 9){%>
<div class="box">
            <img src="${pageContext.request.contextPath}/Product Images/<%=rs.getString("product_image") %>" >
            <h3><%=rs.getString("product_name") %></h3>
           <br>
            $<%=rs.getString("price") %><br>
<span class="fa fa-star checked"></span><%=rs.getString("ratings") %>
<br><br>
            <form action="GetProductInfo" method="post">
            <input type="hidden" value="display" name="function">
            <input type="hidden" value="<%=rs.getString("product_id") %>" name="product_id">
            <button type="submit" class="btn" style="text-decoration: none;">View
            </button>
            </form>
        </div>

<% }count++; } }catch(Exception e){e.printStackTrace();}%> 

    </div>

</section>
<!-- end of featured products -->

<!-- for text animation -->
  <div class="container">
  <h2 class="title">
    <span class="title-word title-word-1">YOUR</span>
    <span class="title-word title-word-2">ARE</span>
    <span class="title-word title-word-3">IN</span>
    <span class="title-word title-word-4">GOOD</span>
    <span class="title-word title-word-4">HANDS</span>
    <span class="title-word title-word-4">WITH</span>
    <span class="title-word title-word-4">VERSACE</span>
  </h2>
</div>
<!-- end of text animation -->



  <center><div class="word"></div></center><!-- for text animation -->



<br>
 
<!-- for scroll up button -->
<a class="gotopbtn" href=""><i class="fa fa-arrow-up" aria-hidden="true"></i></a>

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
          <li><i class="fa fa-envelope" aria-hidden="true"></i>nb14@gmail.com</li>
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
</body>
</html>