<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link  rel="stylesheet" href="css/homepage.css" type="text/css"/>
	<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.css"/>
	<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.min.css"/>
	<style type="text/css"> <%@include file="css/homepage.css" %> </style>
</head>
<body>
   <header>
    <nav>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="admin_login.jsp">Admin</a></li>
        <li><a href="employeelogin.jsp">Employee</a></li>
        <li><a href="contacthome.jsp">Contact</a></li>
        <li><a href="abouthome.jsp">About</a></li>
      </ul>
    </nav>
  </header>
    <main>
    <div class="hero">
      <h1>Welcome to the Employee Tracking System</h1>
      <p>Efficiently track and manage employee information.</p>
   <div class="home2">
	   <img src="images/homehead.png" alt="emp">
   </div>
   </div>
    <div class="content">
      <div class="image-section">
        <img src="images/homepagefrist.jpg" alt="Team">
        <p>Track your team with ease</p>
      </div>
      <div class="image-section">
        <img src="images/homepagessecond.jpg" alt="Analytics">
        <p>Get detailed analytics</p>
      </div>
      <div class="image-section">
        <img src="images/homepagethred.jpg" alt="Performance"><br>
        <p>Monitor employee performance</p>
      </div>
      <div class="image-section">
        <img src="images/homepageforth.jpg" alt="Attendance">
        <p>Maintain accurate company record</p>
      </div>
    </div>
   </main>
    <footer>
    <p> 2025 Employee Tracking System</p>
  </footer>
</body>
</html>