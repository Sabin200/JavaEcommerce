<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Overview</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>


     <!-- Vendor CSS Files -->
     <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- My CSS -->
    <link rel="stylesheet" href="css/style.css">
  <style> 
  .main img {
    max-width: 250px;
  }
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
<main id="main" class="main">
<img src="${pageContext.request.contextPath}/Product Images/<%=rs.getString("product_image") %>" width ="400" height="220">

<form action="UpdateProductImage" method="post" enctype="multipart/form-data">
<input type="file" name="productImage">
<input type="hidden" value="<%=rs.getString("product_id")%>" name="productId">
<input type="submit" value="UPDATE">
</form>

      <section class="section profile">
        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                </li>
              </ul>
              
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  <h5 class="card-title">Product Description</h5>
                  <p class="small fst-italic"><%=rs.getString("product_description") %></p>

                  <h5 class="card-title">Product Details</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">Product Name</div>
                    <div class="col-lg-9 col-md-8"><%=rs.getString("product_name") %></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Product Brand</div>
                    <div class="col-lg-9 col-md-8"><%=rs.getString("brand") %></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Product Price ($)</div>
                    <div class="col-lg-9 col-md-8">$<%=rs.getString("price") %></div>
                  </div>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Available Stock</div>
                    <div class="col-lg-9 col-md-8">$<%=rs.getString("stock") %></div>
                  </div>
                   <div class="row">
                    <div class="col-lg-3 col-md-4 label">Gender</div>
                    <div class="col-lg-9 col-md-8"><%=rs.getString("cloth_cat_name")%></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Category</div>
                    <div class="col-lg-9 col-md-8"<%=rs.getString("product_cat_name") %>></div>
                  </div>
                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Rating</div>
                    <div class="col-lg-9 col-md-8">$<%=rs.getString("raitngs") %></div>
                  </div>

                  
                 
                </div>
            </div>
          </div>

        </div>
      </div>
    </section>

		</main>
		<!-- MAIN -->
	</section>
	<!-- CONTENT -->
	<script src="js/script.js"></script>
  <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

<% }}catch(Exception e){
	e.printStackTrace();} %>
</body>
</html>