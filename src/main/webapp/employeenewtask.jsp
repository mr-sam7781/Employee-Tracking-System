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
<link  rel="stylesheet" href="css/employeenewtask.css" type="text/css"/>
<style type="text/css"> <%@include file="css/employeenewtask.css" %> </style>
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
                <a href="inprocesstaskemp.jsp">Upload Task Status</a>
                <a href="tasksubmitformemp.jsp">Upload Completed Task</a>
            </div>
        </div>

        <a href="leave.jsp"> Leave Report</a>
       
    </div>

  <div class="container">
    <h1>New Task</h1>
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
          <th>Task Submit Last Date</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <%
   Connection cn = null;
   Statement st=null;
   
   Class.forName("com.mysql.jdbc.Driver");
   cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_tracking_system","root","root");
   String sql ="select * from task where employee_id = '"+session.getAttribute("employee_id")+"'";
   st=cn.createStatement();
   ResultSet rs=st.executeQuery(sql);
                     
   while (rs.next())
   {
                     
                     
   %>
   <form name="employeenewtask" action="employeenewtask" method="post">
   <input type="hidden" name="task_id" value="<%= rs.getString("task_id") %>">
        <tr>
          <td> <%= rs.getString("task_title") %></td>
          <td> <%= rs.getString("task_priority") %></td>
          <td> <%= rs.getString("department_name") %></td>
          <td> <%= rs.getString("employee_name") %></td>
          <td><%= rs.getString("employee_id") %></td>
          <td><button class="view-btn" value="<%= rs.getString("task_document") %>" onclick="downloadDocument(this)"> Files </button> </td>
          <td> <%= rs.getString("task_description") %></td>
          <td> <%= rs.getString("task_submit_last_date") %></td>
          <td>
          <button name="submit" value="View" type="submit" class="view-btn">View</button>
          </td>
        </tr>
        </form>
       <%} %>
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