<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADMIN LOGIN</title>
<link  rel="stylesheet" href="css/admin_login.css" type="text/css"/>
</head>
<body>
<form name="admin_login" action="admin_login" method="post">
<div class="container">
        <div class="design">
            <div class="pill-1 rotate-45"></div>
            <div class="pill-2 rotate-45"></div>
            <div class="pill-3 rotate-45"></div>
            <div class="pill-4 rotate-45"></div>
        </div>
        
        <div class="login">
        
            <h3 class="title">Admin Login</h3>
            <div class="text-input">
                
                <input type="text" name="username" placeholder="Username">
            </div>
            <div class="text-input">
               
                <input type="password" name="password" placeholder="Password">
            </div>
           
           <input class="login-btn" name="submit" type="submit" value="LOGIN" >
        </div>
    </div>
   
     

 </form>
</body>
</html>