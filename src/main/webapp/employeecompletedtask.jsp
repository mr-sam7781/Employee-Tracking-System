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
<link  rel="stylesheet" href="css/employeecompletedtask.css" type="text/css"/>
<style type="text/css"> <%@include file="css/employeecompletedtask.css" %> </style>
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

 <div class="container">
    <h1>Completed Task</h1>
    <table>
      <thead>
        <tr>
          <th>Task Title</th>
          <th>Task File</th>
          <th>Submit Date</th>
        </tr>
      </thead>
       
        <%
     Connection cn = null;
     Statement st=null;
   
    Class.forName("com.mysql.jdbc.Driver");
    cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_tracking_system","root","root");
    String sql ="select * from tasksubmitformemp";
    st=cn.createStatement();
    ResultSet rs=st.executeQuery(sql);
                     
   while (rs.next())
   {
                     
                     
   %>
      <tbody>
        <tr>
          <td> <%= rs.getString("task_title") %> </td>
          <td><button class="view-btn" value="<%= rs.getString("task_completed_file") %>" onclick="downloadDocument(this)"> Download </button></td>
          <td><%= rs.getString("submit_date") %></td>
        </tr>
        
       <% } %>
       
      </tbody>
    </table>
  </div>
</body>
</html>