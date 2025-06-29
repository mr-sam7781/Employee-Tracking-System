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
	<style type="text/css"> <%@include file="css/task.css" %> </style>
	
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
<br><br>

    <form name="task" action="task" method="post">
    <div class="container">
        <h1>Add Task</h1>
       
            <div class="row">
                <div class="subcontainer">
                    <label for="department_name">Department Name</label>
                    <input type="text" id="department_name" name="department_name" >
                </div>
                <div class="subcontainer">
                    <label for="employee_name">Employee Name</label>
                    <input type="text" id="employee_name" name="employee_name" >
                </div>
            </div>
            <div class="row">
                <div class="subcontainer">
                    <label for="employee_id">Employee ID</label>
                    <select id="task_priority" name="employee_id" class="selects" >
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
                        <option value="<%= rs.getString("employee_id") %>"> <%= rs.getString("employee_id") %></option>
                         <% } %>
                        
                    </select>
                </div>
                <div class="subcontainer">
                    <label for="task_priority">Task Priority</label>
                    <select id="task_priority" name="task_priority" class="selects" >
                        <option value="high">High</option>
                        <option value="medium">Medium</option>
                        <option value="low">Low</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="subcontainer">
                    <label for="task_title">Task Title</label>
                    <input type="text" id="task-title" name="task_title" >
                </div>
                <div class="subcontainer">
                    <label for="task_description">Task Description</label>
                    <textarea id="task_description" name="task_description" ></textarea>
                </div>
            </div>
            <div class="row">
                <div class="subcontainer">
                    <label for="task_file">Task File</label>
                    <input type="file" id="task_file" name="task_file">
                </div>
                <div class="subcontainer">
                    <label for="task_submit_date">Task Submit Date</label>
                    <input type="date" id="task_submit_date" name="task_submit_date" >
                </div>
            </div>
            <div class="subcontainer">
                <input type="submit" name="submit"  value="Add Task">
            </div>
        
    </div>

</form>
</body>
</html>