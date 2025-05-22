<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Details</title>
    <!-- Stylesheet -->
    <link rel="stylesheet" href="css/ProductView.css">
    <!---Boxicons CDN Setup for icons-->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
</head>
<body>
<%try{
ResultSet rs = (ResultSet) request.getAttribute("productInfo");
if(rs.next()){

%>

<div class="container">
        <div class="single-product">
            <div class="row">
                <div class="col-6">
                    <div class="product-image">
                        <div class="product-image-main">
                            <img src="${pageContext.request.contextPath}/Product Images/<%=rs.getString("product_image") %>" alt="" id="product-main-image">
                        </div>
                        <div class="product-image-slider">
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="breadcrumb">
                        <span><a href="Website.jsp">Home</a></span>
                        <span><a href="ForHim.jsp">Product</a></span>
                        <span class="active"><%=rs.getString("prod_category_name") %></span>
                    </div>

                    <div class="product">
                        <div class="product-title">
                            <h2><%=rs.getString("product_name") %></h2>
                        </div>
                        <div class="product-rating">
                            <span class="fa fa-star checked" style="color: gold;"></span>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("ratings") %>
                           
                        </div>
                        <div class="product-price">
                            <span class="offer-price">$<%=rs.getString("price") %></span>
                        </div>

                        <div class="product-details">
                        		<h3>Description</h3><br>
                                Composition : <%=rs.getString("product_description") %><br><br>
                                Brand : <%=rs.getString("brand") %> <br><br>
                                Stock :  <%=rs.getString("stock") %>&nbsp;left</p>
                        </div>
                        <span class="divider"></span>

                        <div class="product-btn-group">
                           <%if(rs.getString("cloth_cat_id").equals("1") || rs.getString("cloth_cat_id").equals("2")){ %>
                           <form action="AddToCart" method="post">
                            <input type="hidden" name="productId" value = "<%=rs.getString("product_id")%>">
                           <input type="submit" class ="button add-cart" value="Add to Cart">
                           </form>
                         
                           <%}else{ 
                        	   out.println("Error");
                           %>
                          	
                           <%}%>
                           
                           <a href = "Website.jsp" style="text-decoration: none;"><div class="button add-cart"><i class='bx bx-home' ></i>Go Back</div></a> 
                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<%}}catch(Exception e){e.printStackTrace();} %>
    

</body>
</html>
