<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link  rel="stylesheet" href="css/viewprocessing.css" type="text/css"/>
<style type="text/css"> <%@include file="css/viewprocessing.css" %> </style>
</head>
<body>
 <%
       		Connection cn = null;
       		Statement st = null;
       		 
       		Class.forName("com.mysql.jdbc.Driver");
            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_tracking_system","root","root");
       		String sql ="select * from task where task_id = '"+session.getAttribute("task_id")+"'";
       		st=cn.createStatement();
            ResultSet rs=st.executeQuery(sql);
            
            while(rs.next())
            {
       
       
       %>
      

     <div class="mydiv">

        <h2>Task Details</h2> <br><br> 

        <label class="heading">Task Title :-</label> &nbsp;&nbsp;&nbsp;&nbsp; <label> <%= rs.getString("task_title") %></label>  <br> <hr class="line"> <br>

        <label class="heading">Employee Name :- </label> &nbsp;&nbsp;&nbsp;&nbsp;<label> <%= rs.getString("employee_name") %></label> <br> <hr class="line"> <br>

        <label class="heading">Department Name :-</label>&nbsp;&nbsp;&nbsp;&nbsp; <label> <%= rs.getString("department_name") %> </label> <br> <hr class="line"> <br>
        

    </div>
    
    <br>

     <div class="yourdiv">
        <label for="progress">Progress:</label> <br>
       
        <div class="progress-bar" style="width: <%=rs.getString("percentage") %>%;">
          <div class="progress"><%=rs.getString("percentage") %>%</div>
    	</div><br> 
    	<div class="inputbox">
	  <label for="taskstatus" >Task Status:</label>
	 <div class="infogroup">
	<div class="infobox"><strong></strong> <%= rs.getString("taskstatus") %></div>

  </div>
    </div>
   <% } %>
</body>
</html>