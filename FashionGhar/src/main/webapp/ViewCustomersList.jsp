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

</style>
</head>
<body>

<!-- SIDEBAR -->
	<section id="sidebar">
		
		<ul class="side-menu top">
			<li>
				<a href="Admin.jsp">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
			<li>
			</li>
			<form action="ViewProducts" method="post" class="anchor-style">
					&nbsp;&nbsp;&nbsp;&nbsp;<i class='bx bxs-shopping-bag-alt' ></i>
				  <input type="submit" value="Products" class="anchor-style" style="margin-bottom:50px;">
				</form>
			   </a>
			</li>
			<li class="active">
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
					<h1>Customers</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">Home</a>
						</li>
						<li><i class='bx bx-chevron-right' ></i></li>
						<li>
							Customers
						</li>
					</ul>
				</div>
			
			</div>

			<ul class="box-info">
				<li>
					<i class='bx bxs-group' ></i>
					<span class="text">
						<h3>0</h3>
						<p>Total Users</p>
					</span>
			<form action="ViewOrders" method="post">
			<input type ="text" name="customerId" placeholder="Enter Customer Id" style="display: flex; flex-direction: column; align-items: center; font-size: 18px; padding: 10px; border: 2px solid #ccc; border-radius: 10px; background-color: #f2f2f2; margin-left:300px">
			<input type ="submit" value="Display Orders" style="margin-left:315px; margin-top:10px; font-size:18px; width: 40%; padding: 12px 20px; box-sizing: border-box; border: none; border-radius: 4px; background-color: #3e99fa;">
			</form>
				</li>
			</ul>
<%try{
ResultSet rs = (ResultSet) request.getAttribute("User_List");
%>
			<!-- recent orders -->
			<div class="product-data">
				<div class="products">
					<div class="head">
						<h3>Customers</h3>
	
					</div>
					
					<table>
						<thead>
							<tr>
								<th>Users name</th>
								<th>User ID</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Contact</th>
								<th>Address</th>
								<th>Email</th>								
							</tr>
						</thead>
						<tbody>
							<%while(rs.next()){ %>
							<tr>
								<td><%=rs.getString("username") %></td>
								<td><%=rs.getString("user_id") %></td>
								<td><%=rs.getString("first_name") %></td>
								<td><%=rs.getString("last_name") %></td>
                                <td><%=rs.getString("contact") %></td>
                                <td><%=rs.getString("address") %></td>
                                <td><%=rs.getString("email") %></td>
							</tr>
							<%} %>

							


						</tbody>
					</table>
<% }catch(Exception e){
	e.printStackTrace();
}
%>
				</div>

			</div>
		</main>
		<!-- MAIN -->
	</section>
	<!-- CONTENT -->
	<script src="js/script.js"></script>
</body>
</html>