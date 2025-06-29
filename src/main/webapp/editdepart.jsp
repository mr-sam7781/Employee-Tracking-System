<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link  rel="stylesheet" href="css/editdepart.css" type="text/css"/>
<style type="text/css"> <%@include file="css/editdepart.css" %> </style>
</head>
<body>
<form name="editdepart" action="editdepart" method="post">
	 <div class="container">
	     <div class="container1">
	         <h2>Add New Department</h2>
	               <div class="inputbox">  
	                    <label for="Add Department">Add Department</label>
	                    <input type="text" name="Add_Department" placeholder="Add Department" value="<%= session.getAttribute("add_department") %>">
	               </div>
	               
	               <br><br>
	               <input  class="sub" type="submit" name="submit" value="EDIT">
	    </div>
    </div>
</form>
</body>
</html>