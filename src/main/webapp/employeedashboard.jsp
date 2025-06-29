<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link  rel="stylesheet" href="css/employeedashboard.css" type="text/css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.min.css"/>
<style type="text/css"> <%@include file="css/employeedashboard.css" %> </style>
</head>
<body>



 <%
   
   int no_of_newtask = 0;
   int no_of_complettask = 0;
   int no_of_leave = 0;
   
   Connection cn = null;
   Statement st=null;
   
   Class.forName("com.mysql.jdbc.Driver");
   cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_tracking_system","root","root");
   String sql ="SELECT * FROM task where employee_id='"+session.getAttribute("employee_id")+"' ";
   st=cn.createStatement();
   ResultSet rs=st.executeQuery(sql);
                     
   while (rs.next())
   {
	   no_of_newtask++;
   }


   sql ="SELECT * FROM tasksubmitformemp where employee_id='"+session.getAttribute("employee_id")+"' ";
   st=cn.createStatement();
   rs=st.executeQuery(sql);
                     
   while (rs.next())
   {
	   no_of_complettask++;
   }
   sql ="SELECT * FROM leave_report where employee_id='"+session.getAttribute("employee_id")+"' ";
   st=cn.createStatement();
   rs=st.executeQuery(sql);
                     
   while (rs.next())
   {
	   no_of_leave++;
   }
                     
                     
   %>



	  <div class="navbar">
	      <h1>EMPLOYEE TRACKING SYSTEM</h1>
	      <div class="profile">
	      <a class="p1" href="empprofile.jsp"> <img src="images/<%= session.getAttribute("employee_pic") %>" alt="emp"></a>
	      </div>
	  </div>

      <div class="sidenav">
        <a href="employeedashboard.jsp"><i class ="margin-left">Dashboard</i><i class="fa fa-home home"></i></a>
        <br>
        <button class="dropdown-btn"><i class ="margin-left">Task<i class="fa fa-address-book-o  task "></i></i>
          <i class="arrow"></i>
        </button>
        <div class="container">
          <a href="employeenewtask.jsp">New Task</a>
          <a href="employeecompletedtask.jsp">Completed Task</a>
        </div>
        <br>
        <button class="dropdown-btn"><i class ="margin-left">Task Status<i class="fa fa-pencil-square tasks "></i></i>
          <i class="arrow"></i>
        </button>
        <div class="container">
          <a href="tasksubmitformemp.jsp">Upload Completed Task</a>
        </div>
        <br>
        <a href="leave.jsp"><i class ="margin-left">Leave Report<i class="fa fa-pencil-square-o  leaver"></i></i></a>
        <br>
        <a href="homepage.jsp"><i class ="margin-left">Logout<i class="fa fa-sign-out  logouts"></i></i></a>
      </div>
      
         <div class="box1">
   <div class="user">
        <i class="fa fa-file-text-o icons2"></i> 
        <a class="p1" href="employeenewtask.jsp"> <p class="p1">New Task<br> <%= no_of_newtask %></p> </a>
      </div>
   </div>
      <div class="box2">
    <div class="department">
        <i class="fa fa-files-o icons1"></i> 
        <a class="p1" href="inprocesstaskemp.jsp"><p class="p2">Completed Task<br> <%= no_of_complettask %></p></a>
      </div>
   </div>
    <div class="box3">
    <div class="leave"> 
         <i class="fa fa-pencil-square-o icons"></i> 
         <a class="p1" href="leave.jsp"><p class="p3">Leave Reports <br> <%= no_of_leave %></p></a>
      </div>
      </div>
      <script>
        var dropdown = document.getElementsByClassName("dropdown-btn");
        var i;
    
        for (i = 0; i < dropdown.length; i++) {
          dropdown[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var dropdownContent = this.nextElementSibling;
            if (dropdownContent.style.display === "block") {
              dropdownContent.style.display = "none";
            } else {
              dropdownContent.style.display = "block";
            }
          });
        }
      </script>
</body>
</html>