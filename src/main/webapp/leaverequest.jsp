<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.min.css"/>


<link  rel="stylesheet" href="css/leaverequest.css" type="text/css"/>
<style type="text/css"> <%@include file="css/leaverequest.css" %> </style>
</head>
<body>



<div class="topnav">
        <a href="admindash.jsp"></i> Dashboard</a>
        
        <div class="dropdown">
            <button class="dropdown-btn"></i> Department <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="Newdepart.jsp">Add Department</a>
                <a href="alldepartmentlist.jsp">All Department</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropdown-btn"></i> Employee <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="AddEMP.jsp">Add Employee</a>
                <a href="allemployee.jsp">All Employee</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropdown-btn"> Task <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="task.jsp">Add Task</a>
                <a href="showalltask.jsp">All Task</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropdown-btn"> Task Status <i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="viewinprocesstask.jsp">In Progress Task</a>
                 <a href="submittedtasklist.jsp">Submitted Task</a> 
            </div>
        </div>

        <a href="leaverequest.jsp"></i> Leave Report</a>
        
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var dropdowns = document.querySelectorAll(".dropdown");

            dropdowns.forEach(function(dropdown) {
                var btn = dropdown.querySelector(".dropdown-btn");

                btn.addEventListener("click", function() {
                    dropdowns.forEach(function(d) {
                        if (d !== dropdown) {
                            d.classList.remove("active");
                        }
                    });

                    dropdown.classList.toggle("active");
                });
            });

            document.addEventListener("click", function(e) {
                if (!e.target.closest(".dropdown")) {
                    dropdowns.forEach(function(dropdown) {
                        dropdown.classList.remove("active");
                    });
                }
            });
        });
    </script>





<div class="container">
    <h1>All Leave Request</h1>
    <table>
      <thead>
        <tr>
          <th>Serial Number</th>
          <th>Employee Name</th>
          <th>Department Name</th>
          <th>Reason for Leave</th>
          <th>Leave Date From</th>
          <th>Leave Date To</th>
          <th>Current Status</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
       <%
       		Connection cn = null;
       		Statement st = null;
       		 
       		Class.forName("com.mysql.jdbc.Driver");
            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_tracking_system","root","root");
       		String sql ="select * from leave_report";
       		st=cn.createStatement();
            ResultSet rs=st.executeQuery(sql);
            
            while(rs.next())
            {
       
       
       %>
      
      <form name="leaverequest" action="leaverequest" method="post">
      <input type="hidden" name="leave_id" value="<%= rs.getString("leave_id") %>">
        <tr>
          <td> <%= rs.getString("leave_id") %> </td>
          <td> <%= rs.getString("employee_name") %> </td>
          <td> <%= rs.getString("employee_department") %> </td>
          <td> <%= rs.getString("reason_for_leave") %> </td>
          <td> <%= rs.getString("leave_from") %> </td>
          <td> <%= rs.getString("leave_to") %> </td>
          <td> <%= rs.getString("leave_status") %> </td>
          <td>
            <button class="deny-btn" type="submit" name="submit" value="Deny">Deny</button>
            <button class="allow-btn" type="submit" name="submit" value="Allow">Allow</button>
          </td>
        
        </form>
        <%} %>
      </tbody>
    </table>
  </div>
 
</body>
</html>