<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link  rel="stylesheet" href="css/admindash.css" type="text/css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.min.css"/>
<style type="text/css"> <%@include file="css/admindash.css" %> </style>
</head>
<body>

   <%
   
   int no_of_emp = 0;
   int no_of_dept = 0;
   int no_of_leavereq = 0;
   
   Connection cn = null;
   Statement st=null;
   
   Class.forName("com.mysql.jdbc.Driver");
   cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_tracking_system","root","root");
   String sql ="SELECT * FROM addemp; ";
   st=cn.createStatement();
   ResultSet rs=st.executeQuery(sql);
                     
   while (rs.next())
   {
	   no_of_emp++;
   }
   
   sql ="SELECT * FROM newdepart; ";
   st=cn.createStatement();
   rs=st.executeQuery(sql);
                     
   while (rs.next())
   {
	   no_of_dept++;
   }
   sql ="SELECT * FROM leave_report; ";
   st=cn.createStatement();
   rs=st.executeQuery(sql);
                     
   while (rs.next())
   {
	   no_of_leavereq++;
   }
                     
                     
   %>
   

	  <div class="navbar">
	      <h1>EMPLOYEE TRACKING SYSTEM</h1>
	      
	  </div>

      <div class="sidenav">
        <a href="admindash.jsp"><i class ="margin-left">Dashboard</i><i class="fa fa-home home"></i></a>
        <br>
        <button class="dropdown-btn" type="submit" name="submit" value="Department"><i class ="margin-left">Department <i class="fa fa-address-book-o  depart "></i></i>
          <i class="arrow"></i>
        </button>
        <div class="container">
          <a href="Newdepart.jsp">Add Department</a>
          <a href="alldepartmentlist.jsp">All Department</a>
        </div>
        <br>
        <button class="dropdown-btn" type="submit" name="submit" value="Employee"><i class ="margin-left">Employee<i class="fa fa-users emp "></i></i>
          <i class="arrow"></i>
        </button>
        <div class="container">
          <a href="AddEMP.jsp">Add Employee</a>
          <a href="allemployee.jsp">All Employee</a>
        </div>
        <br>
        <button class="dropdown-btn" type="submit" name="submit" value="Task"><i class ="margin-left">Task<i class="fa fa-pencil-square tsk "></i></i>
          <i class="arrow"></i>
        </button>
        <div class="container">
          <a href="task.jsp">Add Task</a>
          <a href="showalltask.jsp">All Task</a>
        </div>
        <br>
        <button class="dropdown-btn" type="submit" name="submit" value="Task Status"><i class ="margin-left">Task Status<i class="fa fa-tasks tskst"></i></i>
          <i class="arrow"></i>
        </button>
        <div class="container">
      <%--    <a href="viewinprocesstask.jsp">In Progress Task</a> --%>
          <a href="viewcompletetask.jsp">Completed Task</a>
          <a href="submittedtasklist.jsp">Submitted Task</a> 
        </div>
        <br>
         <a href="leaverequest.jsp"><i class ="margin-left">Leave Report<i class="fa fa-pencil-square-o  leaver"></i></i></a>
         <br>
        <a href="report.jsp"><i class ="margin-left">Report's<i class="fa fa-file-excel-o   report"></i></i></a>
        <br>
        <a href="showcontactus.jsp"><i class ="margin-left">Contact us<i class="fa fa-phone-square  contactus"></i></i></a>
        <br>
        <a href="homepage.jsp"><i class ="margin-left">Logout<i class="fa fa-sign-out  logouts"></i></i></a>
      </div>
      
      
    
    
   <div class="box1">
   <div class="user">
        <i class="fa fa-users icons2"></i> 
        <a class="p1" href="allemployee.jsp"><p class="p1">Employees <br> <%= no_of_emp %>+</p></a>
      </div>
   </div>
   <div class="box2">
    <div class="department">
        <i class="fa fa-graduation-cap icons1"></i> 
        <a class="p2" href="alldepartmentlist.jsp"><p class="p2">Departments<br><%=no_of_dept %></p></a>
      </div>
   </div>
   <div class="box3">
    <div class="leave"> 
         <i class="fa fa-pencil-square-o icons"></i> 
         <a class="p2" href="leaverequest.jsp"><p class="p3">Leave Reports <br><%=no_of_leavereq %></p></a>
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