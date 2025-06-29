<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link  rel="stylesheet" href="css/employeelogin.css" type="text/css"/>
<style type="text/css"> <%@include file="css/employeelogin.css" %> </style>
</head>
<body>
<form name="employeelogin" action="employeelogin" method="post">
<div class="container">
        <div class="design">
            <div class="pill-1 rotate-45"></div>
            <div class="pill-2 rotate-45"></div>
            <div class="pill-3 rotate-45"></div>
            <div class="pill-4 rotate-45"></div>
        </div>
        
        <div class="login">
        
            <h3 class="title">Employee Login</h3>
            <div class="text-input">
                
                <input type="text" name="username" placeholder="Employee I'd">
            </div>
            <div class="text-input">
               
                <input type="password" name="password" placeholder="Password">
            </div>
            
             <input class="login-btn" type="submit" name="submit" value="LOGIN"/>
             
        </div>
    </div>

 </form>
</body>
</html>