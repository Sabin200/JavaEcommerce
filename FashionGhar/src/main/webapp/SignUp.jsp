<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Add meta tag to force dark theme across all related pages -->
<meta name="color-scheme" content="dark">
<script
src="https://kit.fontawesome.com/64d58efce2.js"
crossorigin="anonymous"
></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,300&family=Raleway:wght@300;400;500;600&display=swap" rel="stylesheet">
<title>Sign Up - FashionGhar</title>

<style>
/* Global Variables - Matching Home Page */
:root {
  --white: #ffffff;
  --light-gray: #f5f5f5;
  --mid-gray: #9e9e9e;
  --dark-gray: #333333;
  --black: #000000;
  --text: #ffffff;
  --text-light: #ffffff;
  --form-bg: #1a1a1a;
  --input-bg: #2a2a2a;
  --input-border: #3a3a3a;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Montserrat', sans-serif;
}

body {
  background-color: var(--black);
  background-size: cover;
  background-position: center;
  background-attachment: fixed;
  background-repeat: no-repeat;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}

.box {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  max-width: 1200px;
  padding: 20px;
}

.container {
  background-color: var(--form-bg);
  border-radius: 10px;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.5);
  padding: 50px 40px;
  width: 550px;
  max-width: 100%;
  position: relative;
  overflow: hidden;
  border: 1px solid var(--dark-gray);
}

.container::before {
  content: "";
  position: absolute;
  top: -50px;
  left: -50px;
  width: 150px;
  height: 150px;
  border-radius: 50%;
  background-color: rgba(255, 255, 255, 0.05);
  z-index: 0;
}

.container::after {
  content: "";
  position: absolute;
  bottom: -50px;
  right: -50px;
  width: 150px;
  height: 150px;
  border-radius: 50%;
  background-color: rgba(255, 255, 255, 0.05);
  z-index: 0;
}

h1 {
  color: var(--text) !important;
  font-size: 32px;
  text-align: center;
  margin-bottom: 30px;
  font-weight: 600;
  font-family: 'Raleway', sans-serif;
  position: relative;
  z-index: 1;
  letter-spacing: 0.5px;
}

.whole {
  display: flex;
  justify-content: center;
  margin-bottom: 35px;
  position: relative;
  z-index: 1;
}

.whole span {
  display: flex;
}

.whole p {
  margin: 0;
}

.whole p:first-child {
  color: var(--mid-gray) !important;
  font-size: 16px !important;
}

.whole p:last-child {
  color: var(--text-light) !important;
  font-size: 16px !important;
  padding-left: 10px;
  font-weight: 500;
}

.whole a {
  color: var(--text-light);
  text-decoration: none;
  transition: color 0.3s;
  font-weight: 500;
}

.whole a:hover {
  color: var(--light-gray);
  text-decoration: underline;
}

.input-field {
  position: relative;
  margin-bottom: 25px;
  z-index: 1;
}

.input {
  width: 100%;
  padding: 15px 15px 15px 50px;
  border: 1px solid var(--input-border);
  border-radius: 8px;
  background-color: var(--input-bg);
  color: var(--text);
  font-size: 15px;
  box-sizing: border-box;
  transition: all 0.3s;
}

.input::placeholder {
  color: var(--mid-gray);
}

.input:focus {
  background-color: var(--input-bg);
  outline: none;
  border-color: var(--light-gray);
  box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.1);
}

.input-field i {
  position: absolute;
  left: 18px;
  top: 50%;
  transform: translateY(-50%);
  color: var(--mid-gray);
  font-size: 20px;
}

.row {
  display: flex;
  gap: 15px;
}

.input-field.half {
  flex: 1;
}

.submit {
  width: 100%;
  padding: 15px;
  background-color: var(--white);
  color: var(--black);
  border: none;
  border-radius: 8px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  z-index: 1;
  letter-spacing: 0.5px;
  text-transform: uppercase;
}

.submit:hover {
  background-color: var(--light-gray);
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(255, 255, 255, 0.1);
}

.submit:active {
  transform: translateY(0);
}

.error-message {
  color: #ff5555;
  font-size: 14px;
  text-align: center;
  margin-bottom: 20px;
  background-color: rgba(255, 0, 0, 0.1);
  padding: 10px;
  border-radius: 6px;
  border-left: 3px solid #ff5555;
}

.terms {
  margin-top: 20px;
  display: flex;
  align-items: flex-start;
}

.terms input[type="checkbox"] {
  margin-right: 10px;
  margin-top: 2px;
  accent-color: var(--white);
}

.terms label {
  font-size: 14px;
  color: var(--mid-gray);
}

.terms a {
  color: var(--text-light);
  text-decoration: none;
  font-weight: 500;
}

.terms a:hover {
  text-decoration: underline;
}

#password-error {
  margin-top: -15px;
  margin-bottom: 20px;
  font-size: 12px;
  color: #ff5555;
}

/* Success message styling */
.success-message {
  color: #4caf50;
  font-size: 14px;
  text-align: center;
  margin-bottom: 20px;
  background-color: rgba(76, 175, 80, 0.1);
  padding: 10px;
  border-radius: 6px;
  border-left: 3px solid #4caf50;
}

/* Responsive styles */
@media (max-width: 576px) {
  .container {
    padding: 40px 25px;
  }
  
  h1 {
    font-size: 28px;
  }
  
  .row {
    flex-direction: column;
    gap: 0;
  }
}

/* Navigation from Home.jsp for brand consistency */
.logo {
  display: flex;
  justify-content: center;
  margin-bottom: 30px;
}

.logo svg {
  margin-top: 0;
  padding: 20px 0;
}
</style>

<script>
function validatePassword() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    
    if (password != confirmPassword) {
        document.getElementById("password-error").innerHTML = "Passwords do not match";
        return false;
    } else {
        document.getElementById("password-error").innerHTML = "";
        return true;
    }
}
</script>

</head>
<body>
<div class="box">
<div class="container">
  <div class="logo">
    <svg width="180" height="100" viewBox="0 0 180 100">
      <defs>
        <linearGradient id="logoGradient" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" stop-color="#ffffff" />
          <stop offset="100%" stop-color="#cccccc" />
        </linearGradient>
      </defs>
      <!-- Background shape -->
     <rect x="-35" y="30" width="250" height="45" rx="3" fill="none" stroke="#ffffff" stroke-width="2" />
      <!-- Main text -->
      <text x="90" y="60" font-family="Raleway, sans-serif" font-size="28" font-weight="600" text-anchor="middle" fill="url(#logoGradient)">FashionGhar</text>
      
      <!-- Slogan - moved down -->
      <text x="90" y="87" font-family="Montserrat, sans-serif" font-size="10" font-style="italic" font-weight="300" text-anchor="middle" fill="#ffffff">WHERE CLASSIC MEETS COOL</text>
    </svg>
  </div>

  <h1>Create Your Account</h1>
  <div class="whole">
    <span><p>Already a member?</p><p><u><a href="Login.jsp">Log in</a></u></p></span>
  </div>

  <form action="SignUpController" method="post" onsubmit="return validatePassword()">

    <div class="row">
      <div class="input-field half">
        <input type="text" class="input" placeholder="First Name" name="firstName" required/>
        <i class='bx bx-user'></i>
      </div>
      
      <div class="input-field half">
        <input type="text" class="input" placeholder="Last Name" name="lastName" required/>
        <i class='bx bx-user'></i>
      </div>
    </div>

    <div class="input-field">
      <input type="text" class="input" placeholder="Username" name="username" required/>
      <i class='bx bx-user-circle'></i>
    </div>

    <div class="input-field">
      <input type="email" class="input" placeholder="Email" name="email" required/>
      <i class='bx bx-envelope'></i>
    </div>

    <div class="input-field">
      <input type="text" class="input" placeholder="Phone Number" name="phone"/>
      <i class='bx bx-phone'></i>
    </div>

    <div class="input-field">
      <input type="text" class="input" placeholder="Address" name="address"/>
      <i class='bx bx-home'></i>
    </div>

    <div class="input-field">
      <input type="password" class="input" id="password" placeholder="Password" name="password" required/>
      <i class='bx bx-lock-alt'></i>
    </div>

    <div class="input-field">
      <input type="password" class="input" id="confirmPassword" placeholder="Confirm Password" name="confirmPassword" required/>
      <i class='bx bx-check-shield'></i>
    </div>
    <div id="password-error"></div>

    <% String message = (String) request.getAttribute("message"); 
if (message != null) { 
  if (message.equals("User registered successfully")) { %>
<div class="success-message"><%= message %></div>
<% } else { %>
<div class="error-message"><%= message %></div>
<% } 
} %>

    <div class="terms">
      <input type="checkbox" id="terms" name="terms" required>
      <label for="terms">I agree to the <a href="#">Terms & Conditions</a> and <a href="#">Privacy Policy</a></label>
    </div>

    <div class="input-field">
      <input type="submit" class="submit" value="Create Account">
    </div>

  </form>
</div>
</div>
</body>
</html>