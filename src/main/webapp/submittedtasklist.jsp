<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link  rel="stylesheet" href="css/submittedtasklist.css" type="text/css"/>
<style type="text/css"> <%@include file="css/submittedtasklist.css" %> </style>
</head>
<body>
 <div class="container">
    <h1>Submit Task</h1>
    <table>
      <thead>
        <tr>
        <th>Task Title</th>
          <th>Department Name</th>
          <th>Employee ID</th>
          <th>Employee Name</th>
          <th>Task Completed File</th>
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
        <td> <%= rs.getString("task_title") %></td>
          <td> <%= rs.getString("department_name") %></td>
          <td><%= rs.getString("employee_id") %></td>
          <td><%= rs.getString("emp_name") %></td>
          <td><button class="view-btn" value="<%= rs.getString("task_completed_file") %>" onclick="downloadDocument(this)"> Files </button></td>
          <td><%= rs.getString("submit_date") %></td>
        </tr>
        
       <% } %>
       
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