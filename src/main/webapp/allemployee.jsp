<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.min.css"/>
<style type="text/css"> <%@include file="css/allemployee.css" %> </style>
<title>Insert title here</title>
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

<br><br><br><br><br><br>


  <div class="container">
    <h1>All Employees</h1>
    <table>
      <thead>
        <tr>
          <th>S/N</th>
          <th>Department Name</th>
          <th>Employee Id</th>
          <th>Employee Name</th>
          <th>Employee Email</th>
          <th>Employee Contact No</th>
          <th>Joining Date</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
       
       <%
       		Connection cn = null;
       		Statement st = null;
       		 
       		Class.forName("com.mysql.jdbc.Driver");
            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_tracking_system","root","root");
       		String sql ="select * from addemp";
       		st=cn.createStatement();
            ResultSet rs=st.executeQuery(sql);
            
            while(rs.next())
            {
       
       
       %>
       <form name="allemployee" action="allemployee" method="post">
       <input type="hidden" name="id" value="<%= rs.getString("AddEMP") %>">
       <input type="hidden" name="department_name" value="<%= rs.getString("department_name") %>">
       <input type="hidden" name="employee_name" value="<%= rs.getString("employee_name") %>">
       <input type="hidden" name="employee_id" value="<%= rs.getString("employee_id") %>">
       <input type="hidden" name="employee_password" value="<%= rs.getString("employee_password") %>">
       <input type="hidden" name="employee_email" value="<%= rs.getString("employee_email") %>">
       <input type="hidden" name="employee_contact" value="<%= rs.getString("employee_contact") %>">
       <input type="hidden" name="employee_city" value="<%= rs.getString("employee_city") %>">
       <input type="hidden" name="employee_dob" value="<%= rs.getString("employee_dob") %>">
       <input type="hidden" name="employee_doj" value="<%= rs.getString("employee_doj") %>">
       <input type="hidden" name="employee_pic" value="<%= rs.getString("employee_pic") %>">
      <input type="hidden" name="employee_gender" value="<%= rs.getString("employee_gender") %>">
      
       
        <tr>
          <td> <%= rs.getString("AddEMP") %> </td>
          <td> <%= rs.getString("department_name") %> </td>
          <td> <%= rs.getString("employee_id") %> </td>
          <td><%= rs.getString ("employee_name") %></td>
          <td><%= rs.getString ("employee_email") %></td>
          <td><%= rs.getString ("employee_contact") %></td>
          <td><%= rs.getString ("employee_doj") %></td>
          <td>
             <button class="edit-btn" type="submit" name="submit" value="Edit">Edit</button>
             <button class="delete-btn" type="submit" name="submit" value="Delete">Delete</button>
          </td>
        </tr>
          </form>
         
        <% } %>
        
        
      </tbody>
    </table>
  </div>

</body>
</html>