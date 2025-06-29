<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link  rel="stylesheet" href="css/showcontactus.css" type="text/css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.min.css"/>
<style type="text/css"> <%@include file="css/showcontactus.css" %> </style>
<title>showcontactus</title>
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
<h1>Contact us</h1>
   <table>
      <thead>
       <tr>
          <th>Serial Number</th>
          <th>Name</th>
         <th>Email ID</th>
         <th>Message</th>
       </tr>
</thead>
<tbody>
 <%
       		Connection cn = null;
       		Statement st = null;
       		 
       		Class.forName("com.mysql.jdbc.Driver");
            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_tracking_system","root","root");
       		String sql ="select * from contact";
       		st=cn.createStatement();
            ResultSet rs=st.executeQuery(sql);
            
            while(rs.next())
            {
            	
            	
            	 
       
       %>

 <tr>
        <td> <%= rs.getString("contact") %></td> 
        <td> <%= rs.getString("user_name") %></td>
        <td> <%= rs.getString("user_mail") %></td>
        <td> <%= rs.getString("user_massge") %></td>
    </tr>
   <% } %>

</tbody>
</table>
 </div>


</body>
</html>