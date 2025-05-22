<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Users - FashionGhar</title>
<meta name="description" content="FashionGhar Admin - Manage your users and customers">
<meta name="keywords" content="HTML, CSS, JavaScript, Admin, Users">
<meta name="author" content="FashionGhar">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Vendor CSS Files -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- for fonts and icons -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,300&family=Raleway:wght@300;400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="css/website.css">

<script src="js/website.js" defer></script>

<style>
/* Global Styles with Black, White & Gray Color Palette */
:root {
  --white: #ffffff;
  --light-gray: #f5f5f5;
  --mid-gray: #9e9e9e;
  --dark-gray: #333333;
  --black: #000000;
  --text: #000000;
  --text-light: #ffffff;
  --accent: #4a4a4a;
  --success: #2e7d32;
  --warning: #ff9800;
  --danger: #c62828;
  --info: #0288d1;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Montserrat', sans-serif;
  color: var(--text);
}

body {
  background-color: var(--light-gray);
}

h1, h2, h3, h4, h5 {
  font-family: 'Raleway', sans-serif;
  font-weight: 500;
}

hr {
  border-color: var(--mid-gray);
  opacity: 0.3;
  margin: 0;
}

/* Header Section Styles */
.abc {
  display: flex;
  justify-content: flex-end;
  padding: 15px 30px;
  background-color: var(--black);
}

.abc a {
  color: var(--white);
  text-decoration: none;
  font-size: 14px;
  transition: all 0.3s ease;
  margin-right: 150px;
}

.abc a:hover {
  color: var(--mid-gray);
  text-decoration: none;
}

.dropdown {
  position: absolute;
  top: 15px;
  right: 30px;
}

.dropbtn {
  background-color: var(--black);
  color: var(--white);
  padding: 8px 16px;
  font-size: 14px;
  border: 1px solid var(--white);
  cursor: pointer;
  border-radius: 4px;
  transition: all 0.3s ease;
  letter-spacing: 1px;
  text-transform: uppercase;
  font-weight: 500;
}

.dropbtn:hover, .dropbtn:focus {
  background-color: var(--white);
  color: var(--black);
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: var(--white);
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.1);
  right: 0;
  z-index: 999;
  border-radius: 4px;
}

.dropdown-content a {
  color: var(--black);
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  transition: all 0.3s ease;
}

.dropdown-content a:hover {
  background-color: var(--light-gray);
}

.show {
  display: block;
}

/* Navigation Styles */
.main {
  background-color: var(--black);
  padding: 20px 0;
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

nav.stroke {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  padding: 0 20px;
  max-width: 1400px;
  margin: 0 auto;
}

.logo {
  flex: 0 0 180px;
  margin-right: 20px;
}

.nav-links {
  flex: 1;
  display: flex;
  justify-content: center;
}

.nav-links ul {
  display: flex;
  list-style: none;
  background-color: var(--black);
  padding: 10px 20px;
  border-radius: 8px;
}

.nav-links ul li {
  margin: 0 15px;
}

.nav-links ul li a {
  text-decoration: none;
  color: var(--white);
  font-size: 20px;
  font-weight: 600;
  position: relative;
  padding: 10px 15px;
  letter-spacing: 1px;
  white-space: nowrap;
  display: block;
  font-family: 'Raleway', sans-serif;
}

.nav-links ul li a:hover {
  color: var(--mid-gray);
}

.nav-links ul li a:after {
  content: '';
  position: absolute;
  width: 0;
  height: 3px;
  display: block;
  margin-top: 5px;
  right: 0;
  background: var(--white);
  transition: width .3s ease;
}

.nav-links ul li a:hover:after {
  width: 100%;
  left: 0;
}

/* Users Management Styles */
.users-container {
  max-width: 1200px;
  margin: 40px auto;
  padding: 0 20px;
}

.users-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
}

.users-title {
  font-size: 32px;
  color: var(--black);
  position: relative;
  padding-bottom: 10px;
}

.users-title:after {
  content: "";
  position: absolute;
  bottom: 0;
  left: 0;
  width: 60px;
  height: 3px;
  background-color: var(--black);
}

.add-user-btn {
  padding: 10px 20px;
  background-color: var(--black);
  color: var(--white);
  border: none;
  border-radius: 4px;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  gap: 8px;
}

.add-user-btn:hover {
  background-color: var(--dark-gray);
}

.users-stats {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 20px;
  margin-bottom: 40px;
}

.stat-card {
  background-color: var(--white);
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  display: flex;
  flex-direction: column;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.stat-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
}

.stat-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;
}

.stat-title {
  font-size: 16px;
  color: var(--dark-gray);
}

.stat-icon {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--white);
}

.stat-icon.total {
  background-color: var(--accent);
}

.stat-icon.active {
  background-color: var(--success);
}

.stat-icon.new {
  background-color: var(--info);
}

.stat-icon.admin {
  background-color: var(--warning);
}

.stat-value {
  font-size: 28px;
  font-weight: 600;
  margin-bottom: 5px;
}

.stat-change {
  font-size: 14px;
  color: var(--success);
}

.stat-change.negative {
  color: var(--danger);
}

.filter-section {
  background-color: var(--white);
  border-radius: 8px;
  padding: 25px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  margin-bottom: 30px;
}

.filter-title {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 20px;
}

.filter-form {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 20px;
}

.form-group {
  margin-bottom: 15px;
}

.form-label {
  display: block;
  font-size: 14px;
  font-weight: 500;
  margin-bottom: 8px;
}

.form-input, .form-select {
  width: 100%;
  padding: 10px 12px;
  border: 1px solid var(--mid-gray);
  border-radius: 4px;
  font-size: 14px;
}

.form-textarea {
  width: 100%;
  padding: 10px 12px;
  border: 1px solid var(--mid-gray);
  border-radius: 4px;
  font-size: 14px;
  min-height: 100px;
  resize: vertical;
}

.form-actions {
  display: flex;
  justify-content: flex-end;
  gap: 15px;
  margin-top: 20px;
}

.reset-btn {
  padding: 10px 20px;
  background-color: var(--light-gray);
  color: var(--dark-gray);
  border: none;
  border-radius: 4px;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.apply-btn {
  padding: 10px 20px;
  background-color: var(--black);
  color: var(--white);
  border: none;
  border-radius: 4px;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.reset-btn:hover {
  background-color: var(--mid-gray);
  color: var(--white);
}

.apply-btn:hover {
  background-color: var(--dark-gray);
}

.users-table-container {
  background-color: var(--white);
  border-radius: 8px;
  padding: 25px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  margin-bottom: 40px;
  overflow-x: auto;
}

.table-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.table-title {
  font-size: 20px;
  font-weight: 600;
}

.export-btn {
  padding: 8px 16px;
  background-color: var(--black);
  color: var(--white);
  border: none;
  border-radius: 4px;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  gap: 8px;
}

.export-btn:hover {
  background-color: var(--dark-gray);
}

.users-table {
  width: 100%;
  border-collapse: collapse;
}

.users-table th {
  text-align: left;
  padding: 12px 15px;
  border-bottom: 1px solid var(--light-gray);
  font-size: 14px;
  font-weight: 600;
  color: var(--dark-gray);
}

.users-table td {
  padding: 12px 15px;
  border-bottom: 1px solid var(--light-gray);
  font-size: 14px;
}

.user-avatar {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  object-fit: cover;
}

.user-name {
  font-weight: 500;
}

.user-email {
  color: var(--dark-gray);
  font-size: 13px;
}

.role {
  display: inline-block;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 12px;
  font-weight: 500;
}

.role.admin {
  background-color: rgba(255, 152, 0, 0.1);
  color: var(--warning);
}

.role.customer {
  background-color: rgba(2, 136, 209, 0.1);
  color: var(--info);
}

.role.staff {
  background-color: rgba(74, 74, 74, 0.1);
  color: var(--accent);
}

.status {
  display: inline-block;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 12px;
  font-weight: 500;
}

.status.active {
  background-color: rgba(46, 125, 50, 0.1);
  color: var(--success);
}

.status.inactive {
  background-color: rgba(198, 40, 40, 0.1);
  color: var(--danger);
}

.status.pending {
  background-color: rgba(255, 152, 0, 0.1);
  color: var(--warning);
}

.action-btn {
  padding: 6px 12px;
  border: none;
  border-radius: 4px;
  font-size: 12px;
  cursor: pointer;
  transition: all 0.3s ease;
  margin-right: 5px;
}

.view-btn {
  background-color: var(--accent);
  color: var(--white);
}

.edit-btn {
  background-color: var(--info);
  color: var(--white);
}

.delete-btn {
  background-color: var(--danger);
  color: var(--white);
}

.action-btn:hover {
  opacity: 0.8;
}

.pagination {
  display: flex;
  justify-content: center;
  margin-top: 30px;
}

.pagination-btn {
  padding: 8px 12px;
  margin: 0 5px;
  border: 1px solid var(--mid-gray);
  background-color: var(--white);
  color: var(--dark-gray);
  border-radius: 4px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.pagination-btn.active {
  background-color: var(--black);
  color: var(--white);
  border-color: var(--black);
}

.pagination-btn:hover:not(.active) {
  background-color: var(--light-gray);
}

/* Modal Styles */
.modal {
  display: none;
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
  background-color: var(--white);
  margin: 50px auto;
  padding: 30px;
  border-radius: 8px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
  width: 90%;
  max-width: 800px;
  position: relative;
}

.close-modal {
  position: absolute;
  top: 20px;
  right: 20px;
  font-size: 24px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.close-modal:hover {
  color: var(--danger);
}

.modal-title {
  font-size: 24px;
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 2px solid var(--light-gray);
}

.user-profile {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 30px;
  margin-bottom: 30px;
}

.profile-section {
  margin-bottom: 20px;
}

.profile-header {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.profile-avatar {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  object-fit: cover;
  margin-right: 20px;
}

.profile-info {
  flex: 1;
}

.profile-name {
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 5px;
}

.profile-role {
  display: inline-block;
  margin-bottom: 5px;
}

.profile-title {
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 10px;
  padding-bottom: 5px;
  border-bottom: 1px solid var(--light-gray);
}

.profile-item {
  display: flex;
  justify-content: space-between;
  margin-bottom: 8px;
}

.profile-label {
  font-weight: 500;
  color: var(--dark-gray);
}

.profile-value {
  text-align: right;
}

.orders-section {
  margin-top: 30px;
  padding-top: 20px;
  border-top: 1px solid var(--light-gray);
}

.orders-title {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 20px;
}

.orders-table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

.orders-table th {
  text-align: left;
  padding: 10px;
  background-color: var(--light-gray);
  font-size: 14px;
}

.orders-table td {
  padding: 10px;
  border-bottom: 1px solid var(--light-gray);
  font-size: 14px;
}

.activity-section {
  margin-top: 30px;
  padding-top: 20px;
  border-top: 1px solid var(--light-gray);
}

.activity-title {
  font-size: 18px;
  font-weight: 600;
  margin-bottom: 20px;
}

.activity-item {
  display: flex;
  margin-bottom: 15px;
  position: relative;
}

.activity-item:not(:last-child):before {
  content: "";
  position: absolute;
  left: 15px;
  top: 30px;
  bottom: -15px;
  width: 2px;
  background-color: var(--light-gray);
}

.activity-icon {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  background-color: var(--light-gray);
  display: flex;
  align-items: center;
  justify-content: center;
  margin-right: 15px;
  z-index: 1;
}

.activity-icon.login {
  background-color: var(--info);
  color: var(--white);
}

.activity-icon.order {
  background-color: var(--success);
  color: var(--white);
}

.activity-icon.update {
  background-color: var(--accent);
  color: var(--white);
}

.activity-content {
  flex: 1;
}

.activity-date {
  font-size: 12px;
  color: var(--mid-gray);
  margin-bottom: 5px;
}

.activity-text {
  font-size: 14px;
}

.tabs {
  display: flex;
  border-bottom: 1px solid var(--light-gray);
  margin-bottom: 20px;
}

.tab {
  padding: 10px 20px;
  cursor: pointer;
  font-weight: 500;
  transition: all 0.3s ease;
  border-bottom: 2px solid transparent;
}

.tab.active {
  border-bottom: 2px solid var(--black);
}

.tab:hover:not(.active) {
  background-color: var(--light-gray);
}

.tab-content {
  display: none;
}

.tab-content.active {
  display: block;
}

.image-upload {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 20px;
}

.avatar-preview {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  object-fit: cover;
  margin-bottom: 10px;
  border: 2px solid var(--light-gray);
}

.upload-btn {
  padding: 8px 16px;
  background-color: var(--light-gray);
  color: var(--dark-gray);
  border: none;
  border-radius: 4px;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.upload-btn:hover {
  background-color: var(--mid-gray);
  color: var(--white);
}

.checkbox-group {
  display: flex;
  align-items: center;
  margin-bottom: 15px;
}

.checkbox-input {
  margin-right: 10px;
}

.checkbox-label {
  font-size: 14px;
}

/* Footer Styles */
.footer {
  background-color: var(--black);
  padding: 60px 0 0;
}

.inner-footer {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  padding: 0 50px;
  max-width: 1400px;
  margin: 0 auto;
}

.footer-items {
  width: 22%;
  margin-bottom: 40px;
}

.footer-items h1 {
  color: var(--white);
  font-size: 32px;
  margin-bottom: 10px;
  letter-spacing: 2px;
}

.footer-items p {
  color: var(--light-gray);
  font-size: 16px;
}

.footer-items h3 {
  color: var(--white);
  font-size: 22px;
  margin-bottom: 20px;
}

.border1 {
  height: 3px;
  width: 50px;
  background-color: var(--white);
  margin-bottom: 20px;
}

.footcss {
  list-style: none;
}

.footcss li {
  color: var(--light-gray);
  margin-bottom: 15px;
  font-size: 16px;
}

.footcss li a {
  color: var(--light-gray);
  text-decoration: none;
  transition: all 0.3s ease;
}

.footcss li a:hover {
  color: var(--white);
  text-decoration: underline;
}

.footcss li i {
  color: var(--mid-gray);
  margin-right: 10px;
}

.social-media {
  margin-top: 30px;
}

.social-media a {
  margin-right: 15px;
  font-size: 22px;
  color: var(--light-gray);
  transition: all 0.3s ease;
}

.social-media a:hover {
  color: var(--white);
}

.footer-bottom {
  background-color: var(--black);
  color: var(--mid-gray);
  text-align: center;
  padding: 20px 0;
  border-top: 1px solid var(--dark-gray);
}

/* Scroll Up Button */
.gotopbtn {
  position: fixed;
  bottom: 30px;
  right: 30px;
  width: 50px;
  height: 50px;
  background-color: var(--black);
  text-decoration: none;
  text-align: center;
  line-height: 50px;
  border-radius: 50%;
  color: var(--white);
  font-size: 22px;
  transition: all 0.3s ease;
  z-index: 999;
  border: 2px solid var(--white);
}

.gotopbtn:hover {
  background-color: var(--white);
}

.gotopbtn:hover i {
  color: var(--black);
}

.gotopbtn i {
  color: var(--white);
}

/* Responsive adjustments */
@media (max-width: 992px) {
  nav.stroke {
    flex-wrap: wrap;
  }
  
  .logo {
    flex: 0 0 100%;
    margin-bottom: 15px;
    text-align: center;
  }
  
  .nav-links {
    flex: 1 0 100%;
    margin-bottom: 15px;
  }
  
  .box {
    flex: 0 0 100%;
  }
  
  .footer-items {
    width: 45%;
  }
  
  .users-stats {
    grid-template-columns: repeat(2, 1fr);
  }
  
  .filter-form {
    grid-template-columns: repeat(2, 1fr);
  }
  
  .user-profile {
    grid-template-columns: 1fr;
  }
}

@media (max-width: 768px) {
  .nav-links ul {
    flex-wrap: wrap;
    justify-content: center;
  }
  
  .nav-links ul li {
    margin: 5px 10px;
  }
  
  .footer-items {
    width: 100%;
  }
  
  .users-stats {
    grid-template-columns: 1fr;
  }
  
  .filter-form {
    grid-template-columns: 1fr;
  }
  
  .users-header {
    flex-direction: column;
    align-items: flex-start;
    gap: 15px;
  }
  
  .add-user-btn {
    align-self: flex-start;
  }
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

// Open modal
function openModal(modalId) {
  document.getElementById(modalId).style.display = "block";
}

// Close modal
function closeModal(modalId) {
  document.getElementById(modalId).style.display = "none";
}

// Confirm delete
function confirmDelete(userId, userName) {
  return confirm("Are you sure you want to delete user " + userName + " (ID: " + userId + ")? This action cannot be undone.");
}

// Export users
function exportUsers(format) {
  alert("Exporting users as " + format + "...");
  // In a real application, this would trigger a download
}

// Update user status
function updateUserStatus(userId, newStatus) {
  alert("User ID " + userId + " status updated to: " + newStatus);
  // In a real application, this would submit to the server
  closeModal('userDetailModal');
  // Refresh the page or update the UI
  location.reload();
}

// Switch tabs
function switchTab(tabId, element) {
  // Hide all tab contents
  var tabContents = document.getElementsByClassName("tab-content");
  for (var i = 0; i < tabContents.length; i++) {
    tabContents[i].classList.remove("active");
  }
  
  // Remove active class from all tabs
  var tabs = document.getElementsByClassName("tab");
  for (var i = 0; i < tabs.length; i++) {
    tabs[i].classList.remove("active");
  }
  
  // Show the selected tab content and mark the tab as active
  document.getElementById(tabId).classList.add("active");
  element.classList.add("active");
}

// Preview uploaded image
function previewImage(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    
    reader.onload = function(e) {
      document.getElementById('avatarPreview').src = e.target.result;
    }
    
    reader.readAsDataURL(input.files[0]);
  }
}
</script>
</head>
<body>
<!-- for sign in/ log in -->
<div class="abc">
  <a href="#"><i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;Admin Portal</a>
</div>
<div class="dropdown">
  <button onclick="myFunction()" class="dropbtn">Admin</button>
  <div id="myDropdown" class="dropdown-content">
    <a href="adminProfile.jsp">Profile</a>
    <a href="changePassword.jsp">Change password</a>
    <a href="logout.jsp">Logout</a>
    <a href="adminSettings.jsp">Settings</a>
  </div>
</div>
<hr>

<!-- for navigation -->
<div class="main">
  <nav class="stroke">
    <!-- for logo -->
    <div class="logo">
      <a href="adminDashboard.jsp">
        <svg width="180" height="80" viewBox="0 0 180 80">
          <defs>
            <linearGradient id="logoGradient" x1="0%" y1="0%" x2="100%" y2="100%">
              <stop offset="0%" stop-color="#ffffff" />
              <stop offset="100%" stop-color="#cccccc" />
            </linearGradient>
          </defs>
          <!-- Background shape -->
          <rect x="-85" y="20" width="350" height="70" rx="3" fill="none" stroke="#ffffff" stroke-width="2" />

          <!-- Main text -->
          <text x="90" y="45" font-family="Raleway, sans-serif" font-size="28" font-weight="600" text-anchor="middle" fill="url(#logoGradient)">FashionGhar</text>
          
          <!-- Slogan - moved down -->
          <text x="90" y="72" font-family="Montserrat, sans-serif" font-size="10" font-style="italic" font-weight="300" text-anchor="middle" fill="#ffffff">ADMIN DASHBOARD</text>
        </svg>
      </a>
    </div>

    <!-- for navigation bar -->
    <div class="nav-links">
      <ul>
        <li><a href="adminDashboard.jsp">DASHBOARD</a></li>
        <li><a href="manageProducts.jsp">PRODUCTS</a></li>
        <li><a href="manageOrders.jsp">ORDERS</a></li>
        <li><a href="manageUsers.jsp">USERS</a></li>
        <li><a href="reports.jsp">REPORTS</a></li>
      </ul>
    </div>

    <!-- for search box -->
    <div class="box">
      <form name="search">
        <input type="text" class="input" name="txt" onmouseout="this.value = ''; this.blur();" placeholder="Search...">
      </form>
      <i class="fas fa-search"></i>
    </div>
  </nav>
</div>

<!-- Users Management Content -->
<div class="users-container">
  <div class="users-header">
    <div>
      <h1 class="users-title">Manage Users</h1>
      <p class="admin-welcome">View and manage customer accounts, staff, and admin users.</p>
    </div>
    <button class="add-user-btn" onclick="openModal('addUserModal')">
      <i class="fas fa-user-plus"></i> Add New User
    </button>
  </div>

  <!-- User Stats Cards -->
  <div class="users-stats">
    <div class="stat-card">
      <div class="stat-header">
        <span class="stat-title">Total Users</span>
        <div class="stat-icon total">
          <i class="fas fa-users"></i>
        </div>
      </div>
      <div class="stat-value">3,721</div>
      <div class="stat-change">+15% from last month</div>
    </div>

    <div class="stat-card">
      <div class="stat-header">
        <span class="stat-title">Active Users</span>
        <div class="stat-icon active">
          <i class="fas fa-user-check"></i>
        </div>
      </div>
      <div class="stat-value">3,245</div>
      <div class="stat-change">+12% from last month</div>
    </div>

    <div class="stat-card">
      <div class="stat-header">
        <span class="stat-title">New Users</span>
        <div class="stat-icon new">
          <i class="fas fa-user-plus"></i>
        </div>
      </div>
      <div class="stat-value">128</div>
      <div class="stat-change">+8% from last month</div>
    </div>

    <div class="stat-card">
      <div class="stat-header">
        <span class="stat-title">Admin Users</span>
        <div class="stat-icon admin">
          <i class="fas fa-user-shield"></i>
        </div>
      </div>
      <div class="stat-value">12</div>
      <div class="stat-change">+1 from last month</div>
    </div>
  </div>

  <!-- Filter Section -->
  <div class="filter-section">
    <h3 class="filter-title">Filter Users</h3>
    <form action="manageUsers.jsp" method="get">
      <div class="filter-form">
        <div class="form-group">
          <label class="form-label">User ID</label>
          <input type="text" class="form-input" name="userId" placeholder="e.g. USR-1234">
        </div>
        <div class="form-group">
          <label class="form-label">Name</label>
          <input type="text" class="form-input" name="name" placeholder="Enter user name">
        </div>
        <div class="form-group">
          <label class="form-label">Email</label>
          <input type="email" class="form-input" name="email" placeholder="Enter email address">
        </div>
        <div class="form-group">
          <label class="form-label">Role</label>
          <select class="form-select" name="role">
            <option value="">All Roles</option>
            <option value="admin">Admin</option>
            <option value="staff">Staff</option>
            <option value="customer">Customer</option>
          </select>
        </div>
        <div class="form-group">
          <label class="form-label">Status</label>
          <select class="form-select" name="status">
            <option value="">All Statuses</option>
            <option value="active">Active</option>
            <option value="inactive">Inactive</option>
            <option value="pending">Pending</option>
          </select>
        </div>
        <div class="form-group">
          <label class="form-label">Registration Date</label>
          <select class="form-select" name="registrationDate">
            <option value="">All Time</option>
            <option value="today">Today</option>
            <option value="yesterday">Yesterday</option>
            <option value="last7days">Last 7 Days</option>
            <option value="last30days">Last 30 Days</option>
            <option value="thisMonth">This Month</option>
            <option value="lastMonth">Last Month</option>
          </select>
        </div>
      </div>
      <div class="form-actions">
        <button type="reset" class="reset-btn">Reset Filters</button>
        <button type="submit" class="apply-btn">Apply Filters</button>
      </div>
    </form>
  </div>

  <!-- Users Table -->
  <div class="users-table-container">
    <div class="table-header">
      <h3 class="table-title">All Users</h3>
      <div>
        <button class="export-btn" onclick="exportUsers('csv')">
          <i class="fas fa-file-csv"></i> Export CSV
        </button>
      </div>
    </div>
    <table class="users-table">
      <thead>
        <tr>
          <th>User</th>
          <th>ID</th>
          <th>Contact</th>
          <th>Role</th>
          <th>Status</th>
          <th>Registered</th>
          <th>Last Login</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <div style="display: flex; align-items: center;">
              <img src="images/users/user1.jpg" alt="Rahul Sharma" class="user-avatar" style="margin-right: 10px;">
              <div>
                <div class="user-name">Rahul Sharma</div>
                <div class="user-email">rahul.sharma@example.com</div>
              </div>
            </div>
          </td>
          <td>USR-1001</td>
          <td>+91 98765 43210</td>
          <td><span class="role customer">Customer</span></td>
          <td><span class="status active">Active</span></td>
          <td>Jan 12, 2024</td>
          <td>May 15, 2025</td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('userDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="openModal('editUserModal')">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('USR-1001', 'Rahul Sharma')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>
            <div style="display: flex; align-items: center;">
              <img src="images/users/user2.jpg" alt="Priya Patel" class="user-avatar" style="margin-right: 10px;">
              <div>
                <div class="user-name">Priya Patel</div>
                <div class="user-email">priya.patel@example.com</div>
              </div>
            </div>
          </td>
          <td>USR-1002</td>
          <td>+91 87654 32109</td>
          <td><span class="role customer">Customer</span></td>
          <td><span class="status active">Active</span></td>
          <td>Feb 23, 2024</td>
          <td>May 15, 2025</td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('userDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="openModal('editUserModal')">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('USR-1002', 'Priya Patel')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>
            <div style="display: flex; align-items: center;">
              <img src="images/users/user3.jpg" alt="Amit Kumar" class="user-avatar" style="margin-right: 10px;">
              <div>
                <div class="user-name">Amit Kumar</div>
                <div class="user-email">amit.kumar@example.com</div>
              </div>
            </div>
          </td>
          <td>USR-1003</td>
          <td>+91 76543 21098</td>
          <td><span class="role admin">Admin</span></td>
          <td><span class="status active">Active</span></td>
          <td>Nov 05, 2023</td>
          <td>May 16, 2025</td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('userDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="openModal('editUserModal')">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('USR-1003', 'Amit Kumar')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>
            <div style="display: flex; align-items: center;">
              <img src="images/users/user4.jpg" alt="Neha Singh" class="user-avatar" style="margin-right: 10px;">
              <div>
                <div class="user-name">Neha Singh</div>
                <div class="user-email">neha.singh@example.com</div>
              </div>
            </div>
          </td>
          <td>USR-1004</td>
          <td>+91 65432 10987</td>
          <td><span class="role customer">Customer</span></td>
          <td><span class="status inactive">Inactive</span></td>
          <td>Mar 18, 2024</td>
          <td>Apr 02, 2025</td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('userDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="openModal('editUserModal')">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('USR-1004', 'Neha Singh')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>
            <div style="display: flex; align-items: center;">
              <img src="images/users/user5.jpg" alt="Vikram Joshi" class="user-avatar" style="margin-right: 10px;">
              <div>
                <div class="user-name">Vikram Joshi</div>
                <div class="user-email">vikram.joshi@example.com</div>
              </div>
            </div>
          </td>
          <td>USR-1005</td>
          <td>+91 54321 09876</td>
          <td><span class="role staff">Staff</span></td>
          <td><span class="status active">Active</span></td>
          <td>Dec 10, 2023</td>
          <td>May 16, 2025</td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('userDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="openModal('editUserModal')">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('USR-1005', 'Vikram Joshi')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>
            <div style="display: flex; align-items: center;">
              <img src="images/users/user6.jpg" alt="Ananya Desai" class="user-avatar" style="margin-right: 10px;">
              <div>
                <div class="user-name">Ananya Desai</div>
                <div class="user-email">ananya.desai@example.com</div>
              </div>
            </div>
          </td>
          <td>USR-1006</td>
          <td>+91 43210 98765</td>
          <td><span class="role customer">Customer</span></td>
          <td><span class="status pending">Pending</span></td>
          <td>May 14, 2025</td>
          <td>Not logged in yet</td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('userDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="openModal('editUserModal')">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('USR-1006', 'Ananya Desai')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>
            <div style="display: flex; align-items: center;">
              <img src="images/users/user7.jpg" alt="Rajesh Gupta" class="user-avatar" style="margin-right: 10px;">
              <div>
                <div class="user-name">Rajesh Gupta</div>
                <div class="user-email">rajesh.gupta@example.com</div>
              </div>
            </div>
          </td>
          <td>USR-1007</td>
          <td>+91 32109 87654</td>
          <td><span class="role customer">Customer</span></td>
          <td><span class="status active">Active</span></td>
          <td>Apr 05, 2024</td>
          <td>May 12, 2025</td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('userDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="openModal('editUserModal')">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('USR-1007', 'Rajesh Gupta')">Delete</button>
          </td>
        </tr>
        <tr>
          <td>
            <div style="display: flex; align-items: center;">
              <img src="images/users/user8.jpg" alt="Meera Kapoor" class="user-avatar" style="margin-right: 10px;">
              <div>
                <div class="user-name">Meera Kapoor</div>
                <div class="user-email">meera.kapoor@example.com</div>
              </div>
            </div>
          </td>
          <td>USR-1008</td>
          <td>+91 21098 76543</td>
          <td><span class="role staff">Staff</span></td>
          <td><span class="status active">Active</span></td>
          <td>Jan 28, 2024</td>
          <td>May 16, 2025</td>
          <td>
            <button class="action-btn view-btn" onclick="openModal('userDetailModal')">View</button>
            <button class="action-btn edit-btn" onclick="openModal('editUserModal')">Edit</button>
            <button class="action-btn delete-btn" onclick="confirmDelete('USR-1008', 'Meera Kapoor')">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
    
    <!-- Pagination -->
    <div class="pagination">
      <button class="pagination-btn"><i class="fas fa-chevron-left"></i></button>
      <button class="pagination-btn active">1</button>
      <button class="pagination-btn">2</button>
      <button class="pagination-btn">3</button>
      <button class="pagination-btn">4</button>
      <button class="pagination-btn">5</button>
      <button class="pagination-btn"><i class="fas fa-chevron-right"></i></button>
    </div>
  </div>
</div>

<!-- User Detail Modal -->
<div id="userDetailModal" class="modal">
  <div class="modal-content">
    <span class="close-modal" onclick="closeModal('userDetailModal')">&times;</span>
    <h2 class="modal-title">User Details</h2>
    
    <div class="profile-header">
      <img src="images/users/user1.jpg" alt="Rahul Sharma" class="profile-avatar">
      <div class="profile-info">
        <h3 class="profile-name">Rahul Sharma</h3>
        <span class="role customer">Customer</span>
        <p>Member since January 12, 2024</p>
      </div>
    </div>
    
    <div class="tabs">
      <div class="tab active" onclick="switchTab('profileTab', this)">Profile</div>
      <div class="tab" onclick="switchTab('ordersTab', this)">Orders</div>
      <div class="tab" onclick="switchTab('activityTab', this)">Activity</div>
      <div class="tab" onclick="switchTab('notesTab', this)">Notes</div>
    </div>
    
    <div id="profileTab" class="tab-content active">
      <div class="user-profile">
        <div>
          <div class="profile-section">
            <h4 class="profile-title">Personal Information</h4>
            <div class="profile-item">
              <span class="profile-label">Full Name:</span>
              <span class="profile-value">Rahul Sharma</span>
            </div>
            <div class="profile-item">
              <span class="profile-label">Email:</span>
              <span class="profile-value">rahul.sharma@example.com</span>
            </div>
            <div class="profile-item">
              <span class="profile-label">Phone:</span>
              <span class="profile-value">+91 98765 43210</span>
            </div>
            <div class="profile-item">
              <span class="profile-label">Date of Birth:</span>
              <span class="profile-value">April 15, 1990</span>
            </div>
            <div class="profile-item">
              <span class="profile-label">Gender:</span>
              <span class="profile-value">Male</span>
            </div>
          </div>
          
          <div class="profile-section">
            <h4 class="profile-title">Account Information</h4>
            <div class="profile-item">
              <span class="profile-label">User ID:</span>
              <span class="profile-value">USR-1001</span>
            </div>
            <div class="profile-item">
              <span class="profile-label">Role:</span>
              <span class="profile-value"><span class="role customer">Customer</span></span>
            </div>
            <div class="profile-item">
              <span class="profile-label">Status:</span>
              <span class="profile-value"><span class="status active">Active</span></span>
            </div>
            <div class="profile-item">
              <span class="profile-label">Registration Date:</span>
              <span class="profile-value">January 12, 2024</span>
            </div>
            <div class="profile-item">
              <span class="profile-label">Last Login:</span>
              <span class="profile-value">May 15, 2025 - 14:32</span>
            </div>
          </div>
        </div>
        
        <div>
          <div class="profile-section">
            <h4 class="profile-title">Address Information</h4>
            <div class="profile-item">
              <span class="profile-label">Address:</span>
              <span class="profile-value">123 Lakeside Apartments, MG Road</span>
            </div>
            <div class="profile-item">
              <span class="profile-label">City:</span>
              <span class="profile-value">Bangalore</span>
            </div>
            <div class="profile-item">
              <span class="profile-label">State:</span>
              <span class="profile-value">Karnataka</span>
            </div>
            <div class="profile-item">
              <span class="profile-label">Postal Code:</span>
              <span class="profile-value">560001</span>
            </div>
            <div class="profile-item">
              <span class="profile-label">Country:</span>
              <span class="profile-value">India</span>
            </div>
          </div>
          
          <div class="profile-section">
            <h4 class="profile-title">Shopping Information</h4>
            <div class="profile-item">
              <span class="profile-label">Total Orders:</span>
              <span class="profile-value">12</span>
            </div>
            <div class="profile-item">
              <span class="profile-label">Total Spent:</span>
              <span class="profile-value">₹24,850</span>
            </div>
            <div class="profile-item">
              <span class="profile-label">Average Order Value:</span>
              <span class="profile-value">₹2,071</span>
            </div>
            <div class="profile-item">
              <span class="profile-label">Last Purchase:</span>
              <span class="profile-value">May 15, 2025</span>
            </div>
            <div class="profile-item">
              <span class="profile-label">Wishlist Items:</span>
              <span class="profile-value">5</span>
            </div>
          </div>
        </div>
      </div>
      
      <div class="form-actions" style="margin-top: 30px;">
        <button class="reset-btn" onclick="openModal('editUserModal')"><i class="fas fa-edit"></i> Edit User</button>
        <button class="apply-btn" onclick="updateUserStatus('USR-1001', document.getElementById('newStatus').value)"><i class="fas fa-sync-alt"></i> Update Status</button>
      </div>
    </div>
    
    <div id="ordersTab" class="tab-content">
      <div class="orders-section">
        <h4 class="orders-title">Recent Orders</h4>
        <table class="orders-table">
          <thead>
            <tr>
              <th>Order ID</th>
              <th>Date</th>
              <th>Items</th>
              <th>Total</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>#ORD-5723</td>
              <td>May 15, 2025</td>
              <td>3</td>
              <td>₹9,850</td>
              <td><span class="status delivered">Delivered</span></td>
              <td><a href="viewOrder.jsp?id=5723">View</a></td>
            </tr>
            <tr>
              <td>#ORD-5645</td>
              <td>Apr 28, 2025</td>
              <td>2</td>
              <td>₹3,250</td>
              <td><span class="status delivered">Delivered</span></td>
              <td><a href="viewOrder.jsp?id=5645">View</a></td>
            </tr>
            <tr>
              <td>#ORD-5521</td>
              <td>Apr 10, 2025</td>
              <td>1</td>
              <td>₹1,450</td>
              <td><span class="status delivered">Delivered</span></td>
              <td><a href="viewOrder.jsp?id=5521">View</a></td>
            </tr>
            <tr>
              <td>#ORD-5423</td>
              <td>Mar 22, 2025</td>
              <td>4</td>
              <td>₹5,750</td>
              <td><span class="status delivered">Delivered</span></td>
              <td><a href="viewOrder.jsp?id=5423">View</a></td>
            </tr>
            <tr>
              <td>#ORD-5312</td>
              <td>Mar 05, 2025</td>
              <td>2</td>
              <td>₹4,550</td>
              <td><span class="status delivered">Delivered</span></td>
              <td><a href="viewOrder.jsp?id=5312">View</a></td>
            </tr>
          </tbody>
        </table>
        <div style="text-align: center; margin-top: 20px;">
          <a href="manageOrders.jsp?userId=USR-1001" class="view-all">View All Orders</a>
        </div>
      </div>
    </div>
    
    <div id="activityTab" class="tab-content">
      <div class="activity-section">
        <h4 class="activity-title">Recent Activity</h4>
        <div class="activity-item">
          <div class="activity-icon login">
            <i class="fas fa-sign-in-alt"></i>
          </div>
          <div class="activity-content">
            <div class="activity-date">May 15, 2025 - 14:32</div>
            <div class="activity-text">Logged in from Bangalore, India (IP: 103.25.xx.xx)</div>
          </div>
        </div>
        <div class="activity-item">
          <div class="activity-icon order">
            <i class="fas fa-shopping-bag"></i>
          </div>
          <div class="activity-content">
            <div class="activity-date">May 15, 2025 - 14:45</div>
            <div class="activity-text">Placed order #ORD-5723 for ₹9,850</div>
          </div>
        </div>
        <div class="activity-item">
          <div class="activity-icon update">
            <i class="fas fa-user-edit"></i>
          </div>
          <div class="activity-content">
            <div class="activity-date">May 10, 2025 - 10:15</div>
            <div class="activity-text">Updated shipping address</div>
          </div>
        </div>
        <div class="activity-item">
          <div class="activity-icon login">
            <i class="fas fa-sign-in-alt"></i>
          </div>
          <div class="activity-content">
            <div class="activity-date">May 10, 2025 - 10:02</div>
            <div class="activity-text">Logged in from Bangalore, India (IP: 103.25.xx.xx)</div>
          </div>
        </div>
        <div class="activity-item">
          <div class="activity-icon order">
            <i class="fas fa-shopping-bag"></i>
          </div>
          <div class="activity-content">
            <div class="activity-date">Apr 28, 2025 - 16:22</div>
            <div class="activity-text">Placed order #ORD-5645 for ₹3,250</div>
          </div>
        </div>
        <div class="activity-item">
          <div class="activity-icon login">
            <i class="fas fa-sign-in-alt"></i>
          </div>
          <div class="activity-content">
            <div class="activity-date">Apr 28, 2025 - 16:05</div>
            <div class="activity-text">Logged in from Bangalore, India (IP: 103.25.xx.xx)</div>
          </div>
        </div>
      </div>
    </div>
    
    <div id="notesTab" class="tab-content">
      <div class="profile-section">
        <h4 class="profile-title">Admin Notes</h4>
        <div style="margin-bottom: 20px;">
          <div style="margin-bottom: 15px;">
            <div style="font-weight: 500; margin-bottom: 5px;">Added by: Admin (Amit Kumar)</div>
            <div style="font-size: 13px; color: var(--mid-gray);">May 16, 2025 - 09:30</div>
            <p style="margin-top: 5px;">VIP customer, always pays on time. Prefers express shipping.</p>
          </div>
          <div style="margin-bottom: 15px;">
            <div style="font-weight: 500; margin-bottom: 5px;">Added by: Staff (Meera Kapoor)</div>
            <div style="font-size: 13px; color: var(--mid-gray);">Apr 30, 2025 - 14:15</div>
            <p style="margin-top: 5px;">Customer requested size exchanges for previous orders. Prefers phone calls over emails for communication.</p>
          </div>
        </div>
        
        <form action="addUserNote.jsp" method="post">
          <input type="hidden" name="userId" value="USR-1001">
          <div class="form-group">
            <label class="form-label">Add New Note</label>
            <textarea class="form-textarea" name="note" placeholder="Enter your note here..."></textarea>
          </div>
          <div class="form-actions" style="justify-content: flex-start;">
            <button type="submit" class="apply-btn">Add Note</button>
          </div>
        </form>
      </div>
    </div>
    
    <div style="margin-top: 30px; padding-top: 20px; border-top: 1px solid var(--light-gray);">
      <div class="form-group">
        <label class="form-label">Update User Status</label>
        <select class="form-select" id="newStatus" style="max-width: 300px;">
          <option value="active" selected>Active</option>
          <option value="inactive">Inactive</option>
          <option value="pending">Pending</option>
        </select>
      </div>
    </div>
  </div>
</div>

<!-- Add User Modal -->
<div id="addUserModal" class="modal">
  <div class="modal-content">
    <span class="close-modal" onclick="closeModal('addUserModal')">&times;</span>
    <h2 class="modal-title">Add New User</h2>
    
    <form action="addUser.jsp" method="post" enctype="multipart/form-data">
      <div class="image-upload">
        <img src="images/users/default-avatar.jpg" alt="User Avatar" id="avatarPreview" class="avatar-preview">
        <input type="file" name="avatar" id="avatarUpload" style="display: none;" accept="image/*" onchange="previewImage(this)">
        <button type="button" class="upload-btn" onclick="document.getElementById('avatarUpload').click()">Upload Photo</button>
      </div>
      
      <div class="tabs">
        <div class="tab active" onclick="switchTab('basicInfoTab', this)">Basic Info</div>
        <div class="tab" onclick="switchTab('addressTab', this)">Address</div>
        <div class="tab" onclick="switchTab('accountTab', this)">Account</div>
      </div>
      
      <div id="basicInfoTab" class="tab-content active">
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px;">
          <div class="form-group">
            <label class="form-label">First Name*</label>
            <input type="text" class="form-input" name="firstName" required>
          </div>
          <div class="form-group">
            <label class="form-label">Last Name*</label>
            <input type="text" class="form-input" name="lastName" required>
          </div>
          <div class="form-group">
            <label class="form-label">Email Address*</label>
            <input type="email" class="form-input" name="email" required>
          </div>
          <div class="form-group">
            <label class="form-label">Phone Number</label>
            <input type="tel" class="form-input" name="phone">
          </div>
          <div class="form-group">
            <label class="form-label">Date of Birth</label>
            <input type="date" class="form-input" name="dob">
          </div>
          <div class="form-group">
            <label class="form-label">Gender</label>
            <select class="form-select" name="gender">
              <option value="">Select Gender</option>
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="other">Other</option>
              <option value="prefer_not_to_say">Prefer not to say</option>
            </select>
          </div>
        </div>
      </div>
      
      <div id="addressTab" class="tab-content">
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px;">
          <div class="form-group">
            <label class="form-label">Address Line 1</label>
            <input type="text" class="form-input" name="addressLine1">
          </div>
          <div class="form-group">
            <label class="form-label">Address Line 2</label>
            <input type="text" class="form-input" name="addressLine2">
          </div>
          <div class="form-group">
            <label class="form-label">City</label>
            <input type="text" class="form-input" name="city">
          </div>
          <div class="form-group">
            <label class="form-label">State/Province</label>
            <input type="text" class="form-input" name="state">
          </div>
          <div class="form-group">
            <label class="form-label">Postal Code</label>
            <input type="text" class="form-input" name="postalCode">
          </div>
          <div class="form-group">
            <label class="form-label">Country</label>
            <select class="form-select" name="country">
              <option value="">Select Country</option>
              <option value="india">India</option>
              <option value="usa">United States</option>
              <option value="uk">United Kingdom</option>
              <option value="canada">Canada</option>
              <option value="australia">Australia</option>
              <!-- Add more countries as needed -->
            </select>
          </div>
        </div>
      </div>
      
      <div id="accountTab" class="tab-content">
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px;">
          <div class="form-group">
            <label class="form-label">Username*</label>
            <input type="text" class="form-input" name="username" required>
          </div>
          <div class="form-group">
            <label class="form-label">Password*</label>
            <input type="password" class="form-input" name="password" required>
          </div>
          <div class="form-group">
            <label class="form-label">Confirm Password*</label>
            <input type="password" class="form-input" name="confirmPassword" required>
          </div>
          <div class="form-group">
            <label class="form-label">Role*</label>
            <select class="form-select" name="role" required>
              <option value="customer">Customer</option>
              <option value="staff">Staff</option>
              <option value="admin">Admin</option>
            </select>
          </div>
          <div class="form-group">
            <label class="form-label">Status*</label>
            <select class="form-select" name="status" required>
              <option value="active">Active</option>
              <option value="inactive">Inactive</option>
              <option value="pending">Pending</option>
            </select>
          </div>
        </div>
        
        <div class="form-group" style="margin-top: 20px;">
          <label class="form-label">Additional Notes</label>
          <textarea class="form-textarea" name="notes" placeholder="Enter any additional notes about this user..."></textarea>
        </div>
        
        <div style="margin-top: 20px;">
          <div class="checkbox-group">
            <input type="checkbox" id="sendWelcomeEmail" name="sendWelcomeEmail" class="checkbox-input" checked>
            <label for="sendWelcomeEmail" class="checkbox-label">Send welcome email with login details</label>
          </div>
          <div class="checkbox-group">
            <input type="checkbox" id="requirePasswordChange" name="requirePasswordChange" class="checkbox-input" checked>
            <label for="requirePasswordChange" class="checkbox-label">Require password change on first login</label>
          </div>
          <div class="checkbox-group">
            <input type="checkbox" id="newsletter" name="newsletter" class="checkbox-input">
            <label for="newsletter" class="checkbox-label">Subscribe to newsletter</label>
          </div>
        </div>
      </div>
      
      <div class="form-actions" style="margin-top: 30px;">
        <button type="button" class="reset-btn" onclick="closeModal('addUserModal')">Cancel</button>
        <button type="submit" class="apply-btn">Create User</button>
      </div>
    </form>
  </div>
</div>

<!-- Edit User Modal -->
<div id="editUserModal" class="modal">
  <div class="modal-content">
    <span class="close-modal" onclick="closeModal('editUserModal')">&times;</span>
    <h2 class="modal-title">Edit User</h2>
    
    <form action="updateUser.jsp" method="post" enctype="multipart/form-data">
      <input type="hidden" name="userId" value="USR-1001">
      
      <div class="image-upload">
        <img src="images/users/user1.jpg" alt="User Avatar" id="editAvatarPreview" class="avatar-preview">
        <input type="file" name="avatar" id="editAvatarUpload" style="display: none;" accept="image/*" onchange="previewImage(this)">
        <button type="button" class="upload-btn" onclick="document.getElementById('editAvatarUpload').click()">Change Photo</button>
      </div>
      
      <div class="tabs">
        <div class="tab active" onclick="switchTab('editBasicInfoTab', this)">Basic Info</div>
        <div class="tab" onclick="switchTab('editAddressTab', this)">Address</div>
        <div class="tab" onclick="switchTab('editAccountTab', this)">Account</div>
      </div>
      
      <div id="editBasicInfoTab" class="tab-content active">
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px;">
          <div class="form-group">
            <label class="form-label">First Name*</label>
            <input type="text" class="form-input" name="firstName" value="Rahul" required>
          </div>
          <div class="form-group">
            <label class="form-label">Last Name*</label>
            <input type="text" class="form-input" name="lastName" value="Sharma" required>
          </div>
          <div class="form-group">
            <label class="form-label">Email Address*</label>
            <input type="email" class="form-input" name="email" value="rahul.sharma@example.com" required>
          </div>
          <div class="form-group">
            <label class="form-label">Phone Number</label>
            <input type="tel" class="form-input" name="phone" value="+91 98765 43210">
          </div>
          <div class="form-group">
            <label class="form-label">Date of Birth</label>
            <input type="date" class="form-input" name="dob" value="1990-04-15">
          </div>
          <div class="form-group">
            <label class="form-label">Gender</label>
            <select class="form-select" name="gender">
              <option value="">Select Gender</option>
              <option value="male" selected>Male</option>
              <option value="female">Female</option>
              <option value="other">Other</option>
              <option value="prefer_not_to_say">Prefer not to say</option>
            </select>
          </div>
        </div>
      </div>
      
      <div id="editAddressTab" class="tab-content">
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px;">
          <div class="form-group">
            <label class="form-label">Address Line 1</label>
            <input type="text" class="form-input" name="addressLine1" value="123 Lakeside Apartments">
          </div>
          <div class="form-group">
            <label class="form-label">Address Line 2</label>
            <input type="text" class="form-input" name="addressLine2" value="MG Road">
          </div>
          <div class="form-group">
            <label class="form-label">City</label>
            <input type="text" class="form-input" name="city" value="Bangalore">
          </div>
          <div class="form-group">
            <label class="form-label">State/Province</label>
            <input type="text" class="form-input" name="state" value="Karnataka">
          </div>
          <div class="form-group">
            <label class="form-label">Postal Code</label>
            <input type="text" class="form-input" name="postalCode" value="560001">
          </div>
          <div class="form-group">
            <label class="form-label">Country</label>
            <select class="form-select" name="country">
              <option value="">Select Country</option>
              <option value="india" selected>India</option>
              <option value="usa">United States</option>
              <option value="uk">United Kingdom</option>
              <option value="canada">Canada</option>
              <option value="australia">Australia</option>
              <!-- Add more countries as needed -->
            </select>
          </div>
        </div>
      </div>
      
      <div id="editAccountTab" class="tab-content">
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px;">
          <div class="form-group">
            <label class="form-label">Username*</label>
            <input type="text" class="form-input" name="username" value="rahul.sharma" required>
          </div>
          <div class="form-group">
            <label class="form-label">New Password</label>
            <input type="password" class="form-input" name="password" placeholder="Leave blank to keep current password">
          </div>
          <div class="form-group">
            <label class="form-label">Confirm New Password</label>
            <input type="password" class="form-input" name="confirmPassword" placeholder="Leave blank to keep current password">
          </div>
          <div class="form-group">
            <label class="form-label">Role*</label>
            <select class="form-select" name="role" required>
              <option value="customer" selected>Customer</option>
              <option value="staff">Staff</option>
              <option value="admin">Admin</option>
            </select>
          </div>
          <div class="form-group">
            <label class="form-label">Status*</label>
            <select class="form-select" name="status" required>
              <option value="active" selected>Active</option>
              <option value="inactive">Inactive</option>
              <option value="pending">Pending</option>
            </select>
          </div>
        </div>
        
        <div class="form-group" style="margin-top: 20px;">
          <label class="form-label">Additional Notes</label>
          <textarea class="form-textarea" name="notes" placeholder="Enter any additional notes about this user...">VIP customer, always pays on time. Prefers express shipping.</textarea>
        </div>
        
        <div style="margin-top: 20px;">
          <div class="checkbox-group">
            <input type="checkbox" id="editNewsletter" name="newsletter" class="checkbox-input" checked>
            <label for="editNewsletter" class="checkbox-label">Subscribe to newsletter</label>
          </div>
          <div class="checkbox-group">
            <input type="checkbox" id="editResetPassword" name="resetPassword" class="checkbox-input">
            <label for="editResetPassword" class="checkbox-label">Force password reset on next login</label>
          </div>
        </div>
      </div>
      
      <div class="form-actions" style="margin-top: 30px;">
        <button type="button" class="reset-btn" onclick="closeModal('editUserModal')">Cancel</button>
        <button type="submit" class="apply-btn">Update User</button>
      </div>
    </form>
  </div>
</div>

<!-- for scroll up button -->
<a class="gotopbtn" href=""><i class="fa fa-arrow-up" aria-hidden="true"></i></a>

<!--  FOOTER START -->
<div class="footer">
  <div class="inner-footer">
    <!--  Company info section -->
    <div class="footer-items">
      <h1>FashionGhar</h1>
      <p>Where Classic Meets Cool</p>
      <p style="margin-top: 15px; line-height: 1.6;">Premium monochromatic fashion for those who appreciate timeless elegance with a modern twist.</p>
    </div>

    <!--  Admin links section -->
    <div class="footer-items">
      <h3>Quick Links</h3>
      <div class="border1"></div>
      <ul class="footcss">
        <li><a href="adminDashboard.jsp">Dashboard</a></li>
        <li><a href="manageProducts.jsp">Products</a></li>
        <li><a href="manageOrders.jsp">Orders</a></li>
        <li><a href="manageUsers.jsp">Users</a></li>
        <li><a href="reports.jsp">Reports</a></li>
      </ul>
    </div>

    <!--  Admin tools section -->
    <div class="footer-items">
      <h3>Admin Tools</h3>
      <div class="border1"></div>
      <ul class="footcss">
        <li><a href="inventory.jsp">Inventory Management</a></li>
        <li><a href="discounts.jsp">Discount Codes</a></li>
        <li><a href="analytics.jsp">Sales Analytics</a></li>
        <li><a href="marketing.jsp">Marketing Tools</a></li>
        <li><a href="adminSettings.jsp">System Settings</a></li>
      </ul>
    </div>

    <!--  Contact us info -->
    <div class="footer-items">
      <h3>Contact us</h3>
      <div class="border1"></div>
      <ul class="footcss">
        <li><i class="fa fa-map-marker" aria-hidden="true"></i>Mahendrapool, Pokhara</li>
        <li><i class="fa fa-phone" aria-hidden="true"></i>+977 9876543210</li>
        <li><i class="fa fa-envelope" aria-hidden="true"></i>admin@fashionghar.com</li>
      </ul> 
      
      <!--   for social links -->
      <div class="social-media">
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-pinterest"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
      </div> 
    </div>
  </div>
  
  <!--   Footer Bottom start  -->
  <div class="footer-bottom">
    Copyright &copy; 2025 FashionGhar. All Rights Reserved.
  </div>
</div>
<!--   Footer Bottom end -->
<!--   FOOTER END -->

<script>
  // Display current date
  const dateElement = document.getElementById('currentDate');
  if (dateElement) {
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    const today = new Date();
    dateElement.textContent = today.toLocaleDateString('en-US', options);
  }
</script>

</body>
</html>
