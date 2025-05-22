<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

	
     <!-- Vendor CSS Files -->
     <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- My CSS -->
	<link rel="stylesheet" href="css/style.css">


	<title>Edit Profile</title>

  <style> 
  * 
  {
    padding-top: 5px;

  }
  </style>
   <script src="js/main.js"></script>
</head>
<body>
<form action="UpdateProfile" method="post">
<input type="hidden" value="profile" name="function">
<%try{
	ResultSet rs = (ResultSet) request.getAttribute("userInfo");
	if(rs.next()){
%>
<input type="hidden" name="userId" value="<%=rs.getString("user_id")%>">
<div class="container rounded bg-white mt-5">
    <div class="row">
        <div class="col-md-4 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" src="${pageContext.request.contextPath}/User Images/<%=rs.getString("user_image") %>" width="170"><span><div><%=rs.getString("username")%></div></span></div>
        </div>
        <div class="col-md-8">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="d-flex flex-row align-items-center back"><i class='bx bx-chevron-left' ></i>
                      <a href="Website.jsp"><h6>Back to home</h6></a>
                    </div>
                    <h6 class="text-right">Edit Profile</h6>
                </div>
                <div class="row mt-2">
            
                    <div class="col-md-6"><input name="firstName" type="text" class="form-control" placeholder="first Name" value="<%=rs.getString("first_name")%>"></div> 
                    <div class="col-md-6"><input name="lastName" type="text" class="form-control" placeholder="Last Name" value="<%=rs.getString("last_name")%>"></div> 
                    
                </div>
                <div class="row mt-3">
                    <div class="col-md-6"><input name="email" type="text" class="form-control" placeholder="Email" value="<%=rs.getString("email")%>"></div>
                    <div class="col-md-6"><input name="contact" type="text" class="form-control" value="<%=rs.getString("contact")%>" placeholder="Contact"></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-6"><input name="address" type="text" class="form-control" placeholder="Address" value="<%=rs.getString("address")%>"></div>
                    <div class="col-md-6"><input name="username" type="text" class="form-control" value="<%=rs.getString("username")%>" placeholder="User Name"></div>
                </div>
               
                <div class="mt-5 text-right"><button class="btn btn-primary profile-button" type="submit">Save Profile</button></div>
            </div>
        </div>
    </div>
</div>

<%}}catch(Exception e){e.printStackTrace();} %>
</form>
</body>
</html>