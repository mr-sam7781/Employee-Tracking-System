<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css"> <%@include file="css/bootstrap.css" %> </style>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.min.css"/>

<style type="text/css"> <%@include file="css/leave.css" %> </style>
</head>
<body>

  <div class="topnav">
        <a href="employeedashboard.jsp"></i> Dashboard</a>
        
        <div class="dropdown">
            <button class="dropdown-btn">Task <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="employeenewtask.jsp">New Task</a>
                <a href="employeecompletedtask.jsp">Completed Task</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropdown-btn">Task Status <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
              
                <a href="tasksubmitformemp.jsp">Upload Completed Task</a>
            </div>
        </div>

        <a href="leave.jsp"> Leave Report</a>
       
    </div>


<form name="leave" action="leave" method="post">
<div class="row">
  <div class="col-sm-5">
  
       <div class="container">
<h2 class="h2">Leave Report</h2>
	
	<div class="container1">
	<div class="group"> 
			<label for="employeename">Employee Name</label>
			<input type="text" id="employeename" name="employeename" > 
		</div>
		
		<div class="group"> 
			<label for="employeeId">Employee Department</label>
			<input type="text" id="empepartment" name="empepartment" > 
		</div>
	
	<div class="group"> 
			<label for="leavefrom">Leave From</label>
			<input type="date" id="leavefrom" name="leavefrom" > 
		</div> 
		
		<div class="group"> 
			<label for="leaveto">Leave To</label>
			<input type="date" id="leaveto" name="leaveto" > 
		</div> 
		  
		  <div class="group">
			<label for="taskDescription">Reason for Leave</label> 
			<textarea id="taskDescription" name="taskDescription" rows="6" cols="50" ></textarea>
		</div>
		
		<div class="btn1">
			<button class="btn" type="submit" name="submit" value="SUBMIT">SUBMIT</button>
		</div>
		
		  </div>


</div>
  	
  </div>
  <div class="col-sm-7">
       
       
	<div class="container3">
    <h1>All Leave Request</h1>
    
	<table>
      <thead>
        <tr>
          <th>Serial Number</th> 
          <th>Department Name</th>
          <th>Reason for Leave</th>
          <th>Leave Date From</th>
          <th>Leave Date To</th>
          <th>Current Status</th>
          
        </tr>
      </thead>
      <tbody>
       <%
       		Connection cn = null;
       		Statement st = null;
       		 
       		Class.forName("com.mysql.jdbc.Driver");
            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_tracking_system","root","root");
       		String sql ="select * from leave_report where  employee_id = '"+session.getAttribute("employee_id")+"'";
       		st=cn.createStatement();
            ResultSet rs=st.executeQuery(sql);
            
            while(rs.next())
            {
       
       
       %>
      
      <form name="cancel_leave" action="cancel_leave" method="post">
      <input type="hidden" name="leave_id" value="<%= rs.getString("leave_id") %>">
        <tr>
          <td> <%= rs.getString("leave_id") %> </td>
          
          <td> <%= rs.getString("employee_department") %> </td>
          <td> <%= rs.getString("reason_for_leave") %> </td>
          <td> <%= rs.getString("leave_from") %> </td>
          <td> <%= rs.getString("leave_to") %> </td>
          <td> <%= rs.getString("leave_status") %> </td>
          
        
        </form>
        <%} %>
      </tbody>
    </table>
    </div>
  
  </div>
</div>
   



</form>
	 
</body>
</html>