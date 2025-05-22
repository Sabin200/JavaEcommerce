<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

	
     <!-- Vendor CSS Files -->
     <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- My CSS -->
	<link rel="stylesheet" href="css/style.css">


	<title>Profile Overview</title>

  <style> 
  * 
  {
    padding-top: 5px;

  }
  </style>
</head>
<body>
<%try{
	ResultSet rs = (ResultSet) request.getAttribute("productInfo");
	if(rs.next()){
%>
<div class="container rounded bg-white mt-5">
    <div class="row">
        <div class="col-md-4 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" src="${pageContext.request.contextPath}/Product Images/<%=rs.getString("product_image") %>" width="170"><span><div><%=rs.getString("product_name") %></div></span></div>
            	<form action="UpdateProductImage" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="productId" value="<%=rs.getString("product_id")%>">
            	<input type="file" name="productImage">
            	<button type="submit" class="btn btn-primary btn-sm"><i class='bx bx-upload' ></i>
            	</button>
            	</form>
           
        </div>
        <div class="col-md-8">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="d-flex flex-row align-items-center back"><i class='bx bx-chevron-left' ></i>
                      <a href="Admin.jsp"><h6>Back to home</h6></a>
                    </div>
                    <h6 class="text-right">Product Overview</h6>
                </div>
                <div class="row mt-2">
                 	<div class="col-md-6">
                        <div class="col-lg-3 col-md-4 label "><b>Name</b></div>
                        <div class="col-lg-9 col-md-8"><%=rs.getString("product_name") %></div>
                    </div>
                
	                <div class="col-md-6">
                        <div class="col-lg-3 col-md-4 label "><b>For</b></div>
                        <div class="col-lg-9 col-md-8"><%=rs.getString("cloth_cat_name") %></div>
                    </div>

                    <div class="col-md-6">
                        <div class="col-lg-3 col-md-4 label "><b>Category</b></div>
                        <div class="col-lg-9 col-md-8"><%=rs.getString("prod_category_name") %></div>
                    </div>

                    <div class="col-md-6">
                        <div class="col-lg-3 col-md-4 label "><b>Brand</b></div>
                        <div class="col-lg-9 col-md-8"><%=rs.getString("brand") %></div>
                    </div>
                </div>

                <div class="row mt-3">

                    <div class="col-md-6">
                        <div class="col-lg-3 col-md-4 label "><b>Price</b></div>
                        <div class="col-lg-9 col-md-8">$<%=rs.getString("price") %></div>
                    </div>

                    <div class="col-md-6">
                        <div class="col-lg-3 col-md-4 label "><b>Ratings</b></div>
                        <div class="col-lg-9 col-md-8"><%=rs.getString("ratings") %></div>
                    </div>
                </div>

                <div class="row mt-4">

                    <div class="col-md-6">
                        <div class="col-lg-3 col-md-4 label "><b>Stock</b></div>
                        <div class="col-lg-9 col-md-8"><%=rs.getString("stock") %></div>
                    </div>

                    <div class="col-md-6">
                        <div class="col-lg-3 col-md-4 label "><b>Description</b></div>
                        <div class="col-lg-9 col-md-8"><%=rs.getString("product_description") %></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%}}catch(Exception e){e.printStackTrace();}  %>