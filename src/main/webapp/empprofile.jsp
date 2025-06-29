<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@page import = "java.sql.*" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link  rel="stylesheet" href="css/empprofile.css" type="text/css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.min.css"/>
<style type="text/css"> <%@include file="css/empprofile.css" %> </style>
</head>
<body>
<body>


		<%
       		Connection cn = null;
       		Statement st = null;
       		 
       		Class.forName("com.mysql.jdbc.Driver");
            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_tracking_system","root","root");
       		String sql ="select * from addemp where employee_id = '"+session.getAttribute("employee_id")+"'";
       		st=cn.createStatement();
            ResultSet rs=st.executeQuery(sql);
            
            if(rs.next())
            {
       
       
       %>

			  <div class="container">
			      <img src="images/<%= rs.getString("employee_pic") %>" alt="Employee Picture" class="employeepic">
			    	<br><br><br><br>
				    <div class="infogroup">
				      <div class="infobox"><strong>Department Name:-</strong> <%= rs.getString("department_name") %></div>
				      <div class="infobox"><strong>Employee Name:-</strong><%= rs.getString("employee_name") %> </div>
				      <div class="infobox"><strong>Employee ID:-</strong> <%= rs.getString("employee_id") %> </div>
				      <div class="infobox"><strong>Password:-</strong><%= rs.getString("employee_password") %> </div>
				      <div class="infobox"><strong>Email ID:-</strong><%= rs.getString("employee_email") %> </div>
				      <div class="infobox"><strong>Contact Number:-</strong><%= rs.getString("employee_contact") %> </div>
				      <div class="infobox"><strong>City:-</strong><%= rs.getString("employee_city") %> </div>
				      <div class="infobox"><strong>Birth Date:-</strong> <%= rs.getString("employee_dob") %> </div>
				      <div class="infobox"><strong>Joining Date:-</strong> <%= rs.getString("employee_doj") %> </div>
				      <div class="infobox"><strong>Gender:-</strong><%= rs.getString("employee_gender") %> </div>
				    </div>
			  </div>
			  
	  <% 
	  
           }
      
      %>
  
  
  
</body>
</html>