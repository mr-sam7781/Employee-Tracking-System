<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link  rel="stylesheet" href="css/contacthome.css" type="text/css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.min.css"/>
<style type="text/css"> <%@include file="css/contacthome.css" %> </style>
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
  
   <div class="contactdiv">
       <h2 class="h1"> Get in Touch</h2>
        <p>Feel free to drop us a line below.</p> 
        <form name="contacthome" action="contacthome" method="post">
                <input class="input1" type="text" name="name" placeholder="Your Name" ><br><br>
                 <input class="input1" type="email" name="email" placeholder="Your Email"><br><br>
                 <textarea class="input1" name="message" placeholder="Your Message" rows="5"></textarea><br><br>
                 <button class="btn" type="submit" name="submit" value="Send">Send</button>
                
            </form>  
   </div>
    <div class="contactdiv1">
     <img class="cimg" src="images/contactimg.png" alt="img">
     
   </div>
</body>
</html>