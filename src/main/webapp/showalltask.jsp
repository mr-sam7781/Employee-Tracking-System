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
<link  rel="stylesheet" href="css/showalltask.css" type="text/css"/>
<style type="text/css"> <%@include file="css/showalltask.css" %> </style>
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
    <h1>All task</h1>
    <table>
      <thead>
        <tr>
          <th>Task Title</th>
          <th>Priority</th>
          <th>Department Name</th>
          <th>Employee Name</th>
          <th>Employee ID</th>
          <th>Task File</th>
          <th>Task Description</th>
          <th>Submit Date</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
       <%
			   Connection cn = null;
			   Statement st=null;
			   
			   Class.forName("com.mysql.jdbc.Driver");
			   cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_tracking_system","root","root");
			   String sql ="select * from task";
			   st=cn.createStatement();
			   ResultSet rs=st.executeQuery(sql);
			                     
			   while (rs.next())
			   {
			                     
			                     
		%>
		<form name="showalltask" action="showalltask" method="post">
					<input type="hidden" name="id" value="<%= rs.getString("task_id") %>">
			      
			        <tr>
			          <td> <%= rs.getString("task_title") %></td>
			          <td> <%= rs.getString("task_priority") %></td>
			          <td> <%= rs.getString("department_name") %></td>
			          <td> <%= rs.getString("employee_name") %></td>
			          <td> <%= rs.getString("employee_id") %></td>
			          <td> <button type="button" class="view-btn" value="<%= rs.getString("task_document") %>" onclick="downloadDocument(this)">Download</button> </td>
			          <td> <%= rs.getString("task_description") %></td>
			          <td> <%= rs.getString("task_submit_last_date") %></td>
			          <td>
                       <button class="view-btn" type="submit" name="submit" value="View">View</button></td>
			        </tr>
			        
		</form>
       
       <% 
       		} 
       		
       %>
       
      </tbody>
    </table>
  </div>
</body>

<script type="text/javascript">
	
function downloadDocument(button) {
    var fileName = button.value;  
    var filePath = "documents/" + fileName;  

   
    var a = document.createElement('a');
    a.href = filePath;
    a.download = fileName;  

    
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
}


</script>


</html>