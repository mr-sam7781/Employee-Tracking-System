<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link  rel="stylesheet" href="css/tasksubmitformemp.css" type="text/css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.css"/>
<link  rel="stylesheet" type="text/css" href="css/fa/css/font-awesome.min.css"/>

<style type="text/css"> <%@include file="css/tasksubmitformemp.css" %> </style>
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

<form  name="tasksubmitformemp" action="tasksubmitformemp" method="post">
 <div class="container">
    <h1>Submit Task</h1>
    
    
      <div class="form-group">
        <label for="department">Task Title:</label>
        <input type="text" id="tasktitle" name="tasktitle" placeholder="Enter Your Task Title" >
      </div>
      <div class="form-group">
        <label for="department">Department Name:</label>
        <input type="text" id="department" name="Department_Name" placeholder="Enter Your Department" >
      </div>
      <div class="form-group">
        <label for="employeeId">Employee ID:</label>
        <input type="text" id="employeeId" name="Employee_ID" placeholder="Enter Your ID" >
      </div>
      <div class="form-group">
        <label for="department">Employee Name:</label>
        <input type="text" id="department" name="Employee_Name" placeholder="Enter Your Name" >
      </div>
      <div class="form-group">
        <label for="taskFile">Task Completed File:</label>
        <input type="file" id="taskFile" name="Task_Completed_File" >
      </div>
      <div class="form-group">
        <label for="submitDate">Submit Date:</label>
        <input type="date" id="submitDate"  name="Submit_Date" >
      </div>
      <input type="submit" value="Submit" name="submit">
  </div>
</form>
</body>
</html>