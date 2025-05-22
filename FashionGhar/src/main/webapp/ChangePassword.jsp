<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.versace.databaseConnection.*"%>
<%@page import="com.versace.EncryptDecrypt.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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


	<title>Change Password</title>

  <style> 
  * 
  {
    padding-top: 5px;

  }
  </style>
  <script>
function validateForm() {
  var newPassword = document.getElementById("newPassword").value;
  var renewPassword = document.getElementById("renewPassword").value;
  if (newPassword != renewPassword) {
    alert("Passwords do not match. Please re-enter.");
    return false;
  }
}
</script>
</head>
<body>
<form onsubmit="return validateForm()" action="UpdateProfile" method="post">
<input type="hidden" name="function" value="password">

<%try{
	ResultSet rs = (ResultSet) request.getAttribute("userInfo");
	if(rs.next()){
		Class.forName("com.mysql.cj.jdbc.Driver");
	  	DatabaseConnection dc = new DatabaseConnection();
		Connection con = dc.getConnect();
		  
		 String password = rs.getString("password");
		 EncryptionDecryption AED = new  EncryptionDecryption ();
		 String decrypted_password =AED.decrypt(password);
%>
<input type="hidden" name="username" value="<%=rs.getString("username")%>">
  <div class="container rounded bg-white mt-5">
    <div class="row">
        <div class="col-md-4 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" src="${pageContext.request.contextPath}/User Images/<%=rs.getString("user_image") %>" width="170"><span><div><%=rs.getString("username") %></div></span></div>
                
        </div>
        <div class="col-md-8">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="d-flex flex-row align-items-center back"><i class='bx bx-chevron-left' ></i>
                      <a href=" "><h6>Back to home</h6></a>
                    </div>
                    <h6 class="text-right">Change Password</h6>
                </div>



                <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="password" type="text" class="form-control" id="currentPassword" value="<%=decrypted_password %>">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newpassword" type="password" class="form-control" id="newPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="renewpassword" type="password" class="form-control" id="renewPassword">
                      </div>
                    </div>
<%}}catch(Exception e){e.printStackTrace();}  %>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Change Password</button>
                    </div>
                
                </div>
            </div>
        </div>
    </div>
</div>
</form>
</body>
</html>