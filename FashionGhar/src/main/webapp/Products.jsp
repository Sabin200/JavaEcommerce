<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <!-- My CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/product.css">


    <title>VERSACE</title>
    <script>
function changeColor() {
  document.querySelector('.anchor-style').style.color = 'blue';
}
</script>
   <style>
.anchor-style {
  border: none;
  background: none;
  color: black;
  text-decoration: none;
  cursor: pointer;
  font-size: 16px;
  margin-left: 15px;
   margin-top: 18px;
}
.active {
  color: blue;
  background-color: black;
  border-radius: 50%;
}

.rounded-button1 {
  border-radius: 20px;
  padding: 10px 20px; 
  background-color: #dede1d; 
  color: white; 
  border: none; 
  text-align: center; 
  text-decoration: none; 
  display: inline-block; 
  font-size: 16px; 
  cursor: pointer; 
}
.rounded-button2 {
  border-radius: 20px;
  padding: 10px 20px; 
  background-color: #39cdfa; 
  color: white; 
  border: none; 
  text-align: center; 
  text-decoration: none; 
  display: inline-block; 
  font-size: 16px; 
  cursor: pointer; 
}
.rounded-button3 {
  border-radius: 20px;
  padding: 10px 20px; 
  background-color: #f27957; 
  color: white; 
  border: none; 
  text-align: center; 
  text-decoration: none; 
  display: inline-block; 
  font-size: 16px; 
  cursor: pointer; 
}


</style>
</head>
<body>
<!-- SIDEBAR -->
	<section id="sidebar">
		
		<ul class="side-menu top">
			<li >
				<a href="Admin.jsp">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
			<li>
			<form action="ViewProducts" method="post" class="anchor-style">
					&nbsp;&nbsp;&nbsp;&nbsp;<i class='bx bxs-shopping-bag-alt' ></i>
				  <input type="submit" value="Products" class="anchor-style">
				</form>
			</li>
			<li>
				<form action="GetCustomerList" method="post">
					&nbsp;&nbsp;&nbsp;&nbsp;<i class='bx bxs-doughnut-chart' ></i>
				  <input type="submit" value="Customers" class="anchor-style">
				</form>
			</li>

		</ul>
		<ul class="side-menu">
			<li>
				<a href="#">
					<i class='bx bxs-cog' ></i>
					<span class="text">Settings</span>
				</a>
			</li>
			<li>
				<a href="#" class="logout">
					<i class='bx bxs-log-out-circle' ></i>
					<span class="text">Logout</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- SIDEBAR -->



	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->
		<nav>
			<i class='bx bx-menu' ></i>
			<a href="#" class="nav-link"></a>
			<form action="#">
				<div class="form-input">
					<input type="search" placeholder="Search...">
					<button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
				</div>
			</form>
			
			<a href="#" class="notification">
				<i class='bx bxs-bell' ></i>
				<span class="num">0</span>
			</a>
			<a href="#" class="profile">
				<img src="img/people.png">
			</a>
		</nav>
		<!-- NAVBAR -->


		<!-- MAIN -->
		<main>
			<div class="head-title">
				<div class="left">
					<h1>Product</h1>
					<ul class="breadcrumb">
						<li>
							<a href="index.html">Home</a>
						</li>
						<li><i class='bx bx-chevron-right' ></i></li>
						<li>
							<p>Product</p>
						</li>
					</ul>
				</div>
			
			</div>

			<ul class="box-info">
				<li>
					<i class='bx bxs-group' ></i>
					<span class="text">
						<h3>12</h3>
						<p>Total Product</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-dollar-circle' ></i>
					<span class="text">
						<h3>$4000</h3>
						<p>Total Sales</p>
					</span>
				</li>

			</ul>
<%try{
ResultSet rs1 = (ResultSet) request.getAttribute("List_Result");
%>
<!-- recent orders -->
			<div class="product-data">
				<div class="products">
					<div class="head">
						<h3>Products</h3>
                        <a href="AddProduct.jsp">
                            <i class='bx bxs-plus-circle'></i>
                             Add Product
                        </a> 
                        </div>
					<table>
						<thead>
							<tr>
								<th>Product Name</th>
								<th>Product ID</th>
								<th>Product Price</th>
								<th>Stock</th>
                                <th>Brand</th>
                                <th>Rating</th>
								
							</tr>
						</thead>
  
  <%while(rs1.next()){ %>
  <tr>
    <td><p><%out.println(rs1.getString("product_name")); %><br></td>
    <td><%out.println(rs1.getInt("product_id")); %></td>
    <td><%out.println(rs1.getFloat("price")); %></td>
     <td><%out.println(rs1.getInt("stock")); %></td>
    <td><%out.println(rs1.getString("brand")); %></td>
    <td><%out.println(rs1.getFloat("ratings")); %></td>
    <td>
    <form action="GetProductInfo" method="post">
    <input type="hidden" name="function" value="view">
    <input type="hidden" name="product_id" value="<%=rs1.getInt("product_id")%>">
    <input type="submit" value="Overiew" class="rounded-button1">
    </form></td>
    <td>
    <form action="GetProductInfo" method="post">
    <input type="hidden" name="function" value="edit">
    <input type="hidden" name="product_id" value="<%=rs1.getInt("product_id")%>">
    <input type="submit" value="Edit" class="rounded-button2">
    </form></td>
	<td><form action="DeleteProduct" method="post">
	<input type="hidden" name="productId" value="<%=rs1.getInt("product_id")%>">
	<input type="submit" value="Delete" class="rounded-button3">
	</form>
  </tr>
  <%} %>
 </tbody>
</table>
</div>
</div>
<%}catch(Exception e){
	e.printStackTrace();
}%>
					
		</main>
		<!-- MAIN -->
	</section>
	<!-- CONTENT -->
	<script src="js/script.js"></script>

</body>
</html>