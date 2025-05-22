<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.versace.databaseConnection.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
  
    />
    <title>Edit Product</title>

    <!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

    <!-- ========== All CSS files linkup ========= -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="bootstrap/css/main.css" />
  </head>
  <body>
  <form action="UpdateProduct" method="post">
 
      <!-- ========== tab components start ========== -->
      <section class="tab-components">
        <div class="container-fluid">
          <!-- ========== title-wrapper start ========== -->
          <div class="title-wrapper pt-30">
            <div class="row align-items-center">
              <div class="col-md-6">
                <div class="title mb-30">
                  <h2>Edit Product</h2>
                </div>
              </div>
              <!-- end col -->

            </div>
            <!-- end row -->
          </div>
          <!-- ========== title-wrapper end ========== -->

          <!-- ========== form-elements-wrapper start ========== -->
          <div class="form-elements-wrapper">
            <div class="row">
              <div class="col-lg-6">

				<div class="card-style mb-30">
				
 <%try{
	ResultSet rs = (ResultSet) request.getAttribute("productInfo");
	if(rs.next()){
%>
<% 
                        	  Class.forName("com.mysql.cj.jdbc.Driver");
						  	  DatabaseConnection dc = new DatabaseConnection();
							  Connection con = dc.getConnect();
							  String query = "select * from product_category";
							  PreparedStatement ps = con.prepareStatement(query);
							  ResultSet rs1 = ps.executeQuery();

						  %>
                  <div class="select-style-1">
                    <h6><label>Category</label></h6>
                    <div class="select-position">
                      <select name="item">
                        <option value="<%=rs.getString("prod_category_id")%>"><%out.println(rs.getString("prod_category_name"));%></option>
                        <%while(rs1.next()){ %>
                        <option value="<%=rs1.getString("prod_category_id")%>"><%out.println(rs1.getString("prod_category_name"));%></option>
                        <%} %>
                      </select>
                    </div>
                  </div>
                  <!-- end select -->
                </div>
                
 <input name="productId" type="hidden"  value="<%=rs.getString("product_id")%>">


                <!-- input style start -->
                <div class="card-style mb-30">
                  <h6 class="mb-25">Product Details</h6>


                  <div class="input-style-1">
                    <label>Product Name</label>
                    <input type="text" placeholder="Product Name"  value="<%=rs.getString("product_name")%>" name="productName">
                  </div>

                  <!-- end input -->


                  <div class="input-style-1">
                    <label>Product Brand</label>
                    <input type="text" placeholder="Product Brand" value="<%=rs.getString("brand")%>" name="brand">
                  </div>

                  <!-- end input -->



                  <div class="input-style-1">
                    <label>Product Price</label>
                    <input type="text" placeholder="Price in ($)" value="$ <%=rs.getString("price")%>" name="price">
                  </div>

                  <!-- end input -->


                  
                </div>
                <!-- end card -->
                <!-- ======= input style end ======= -->

                <!-- ======= select style start ======= -->
                <!-- end card -->

                

                <div class="card-style mb-30">
                 <div class="col-12">
                  <button class="btn btn-primary" type="submit">Save Changes</button>
                </div>

                  <!-- end select -->
                </div>
                <!-- end card -->


                <!-- ======= select style end ======= --> 
              </div>


              <!-- end col -->
              <div class="col-lg-6">
                <!-- ======= textarea style start ======= -->
                <div class="card-style mb-30">
                  <h6 class="mb-25">Product Description</h6>
                  <div class="input-style-1">
                    <textarea  name ="description" placeholder="description" rows="5" ><%=rs.getString("product_description")%></textarea>
                  </div>
                  <!-- end textarea -->
                </div>
                <!-- ======= textarea style end ======= -->


                
                <div class="card-style mb-30">
                  <h6 class="mb-25">Gender</h6>
                  <div class="form-check checkbox-style">
                    <input class="form-check-input" type="radio" name="gender" id="checkbox-1" value="1" <% if (rs.getInt("cloth_cat_id") == 1) out.print("checked"); %>>
                    <label class="form-check-label" for="checkbox-1">
                      Male
                    </label>
                  </div>

                  <div class="form-check checkbox-style">
                    <input class="form-check-input" type="radio" name="gender" id="checkbox-1" value="2" <% if (rs.getInt("cloth_cat_id") == 2) out.print("checked"); %>>
                    <label class="form-check-label" for="checkbox-1">
                      Female
                    </label>
                  </div>
                </div>
                

                <!-- input style start -->
                <div class="card-style mb-30">
                  


                  <div class="input-style-1">
                    <label>Product Stock</label>
                    <input type="text" placeholder="Stock"  value="<%=rs.getString("stock")%>" name="stock">
                  </div>

                  <!-- end input -->


                  <div class="input-style-1">
                    <label>Product Rating</label>
                    <input type="text" placeholder="Rating"  value="<%=rs.getString("ratings")%>" name="ratings">
                  </div>

                  <!-- end input -->
 				

                  <!-- end input -->


                  
                </div>
                <!-- end card -->
                <!-- ======= input style end ======= -->
                

               
              </div>
              <!-- end col -->


            </div>
            <!-- end row -->
          </div>
          <!-- ========== form-elements-wrapper end ========== -->
        </div>
        <!-- end container -->
      </section>
      <!-- ========== tab components end ========== -->

     
      <!-- ========== footer end =========== -->
 
    <!-- ======== main-wrapper end =========== -->
</form>

<%}}catch(Exception e){
	e.printStackTrace();
} %>
  </body>
</html>